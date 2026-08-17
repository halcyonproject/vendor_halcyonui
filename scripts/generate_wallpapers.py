#!/usr/bin/env python3
"""
Generate multi-DPI default wallpapers for Android framework overlay.

Usage:
  python3 vendor/halcyonui/scripts/generate_wallpapers.py [--input SOURCE_IMAGE] [--output-dir RES_DIR]

Default source image:
  vendor/halcyonui/overlay/common/frameworks/base/core/res/res/drawable-nodpi/default_wallpaper.png

Default res directory:
  vendor/halcyonui/overlay/common/frameworks/base/core/res/res
"""

import argparse
import os
import sys
from PIL import Image

DEFAULT_INPUT = "vendor/halcyonui/overlay/common/frameworks/base/core/res/res/drawable-nodpi/default_wallpaper.png"
DEFAULT_RES_DIR = "vendor/halcyonui/overlay/common/frameworks/base/core/res/res"

# Standard target resolutions (width, height)
# Scaled for phone density buckets (baseline 4x = 2160x4096)
# and tablet smallest-width buckets.
TARGET_RESOLUTIONS = {
    "drawable-mdpi": (540, 1024),
    "drawable-hdpi": (810, 1536),
    "drawable-xhdpi": (1080, 2048),
    "drawable-xxhdpi": (1620, 3072),
    "drawable-xxxhdpi": (2160, 4096),
    "drawable-nodpi": (1080, 2048),
    "drawable-sw600dp-nodpi": (1728, 1920),
    "drawable-sw720dp-nodpi": (2160, 2400),
}


def resize_and_crop(img: Image.Image, target_size: tuple[int, int]) -> Image.Image:
    target_w, target_h = target_size
    src_w, src_h = img.size

    src_ratio = src_w / src_h
    target_ratio = target_w / target_h

    # If aspect ratio matches closely, direct resize
    if abs(src_ratio - target_ratio) < 0.05:
        return img.resize(target_size, Image.Resampling.LANCZOS)

    # Center crop for different aspect ratios (e.g. tablet 9:10 vs phone 9:17)
    if src_ratio > target_ratio:
        # Source is wider than target: crop left and right
        crop_w = int(src_h * target_ratio)
        crop_h = src_h
        left = (src_w - crop_w) // 2
        top = 0
    else:
        # Source is taller than target: crop top and bottom
        crop_w = src_w
        crop_h = int(src_w / target_ratio)
        left = 0
        top = (src_h - crop_h) // 2

    cropped = img.crop((left, top, left + crop_w, top + crop_h))
    return cropped.resize(target_size, Image.Resampling.LANCZOS)


def main():
    parser = argparse.ArgumentParser(description="Generate multi-DPI default wallpapers.")
    parser.add_argument(
        "-i", "--input", default=DEFAULT_INPUT, help="Path to input high-resolution wallpaper image"
    )
    parser.add_argument(
        "-o", "--output-dir", default=DEFAULT_RES_DIR, help="Path to framework res directory"
    )

    args = parser.parse_args()

    input_path = os.path.abspath(args.input)
    res_dir = os.path.abspath(args.output_dir)

    if not os.path.exists(input_path):
        print(f"Error: Input file '{input_path}' not found.", file=sys.stderr)
        sys.exit(1)

    print(f"Loading source image: {input_path}")
    source_img = Image.open(input_path)
    print(f"Source size: {source_img.size[0]}x{source_img.size[1]}, mode: {source_img.mode}")

    # Convert RGBA to RGB if alpha channel is not transparent
    if source_img.mode == "RGBA":
        extrema = source_img.getextrema()
        if extrema[3] == (255, 255):
            print("Image is RGBA but fully opaque. Converting to RGB to optimize size.")
            source_img = source_img.convert("RGB")

    for folder_name, (target_w, target_h) in TARGET_RESOLUTIONS.items():
        out_folder = os.path.join(res_dir, folder_name)
        os.makedirs(out_folder, exist_ok=True)
        out_path = os.path.join(out_folder, "default_wallpaper.png")

        print(f"Generating {folder_name}/default_wallpaper.png ({target_w}x{target_h})...")
        resized = resize_and_crop(source_img, (target_w, target_h))
        resized.save(out_path, format="PNG", optimize=True)

        size_kb = os.path.getsize(out_path) / 1024
        print(f"  -> Saved {out_path} ({size_kb:.1f} KB)")

    print("\nWallpaper resize complete!")


if __name__ == "__main__":
    main()
