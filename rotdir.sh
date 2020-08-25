#!/bin/sh

# When I open an image from the file manager in sxiv (the image viewer), I want
# to be able to press the next/previous keys to key through the rest of the
# images in the same directory. This script "rotates" the content of a
# directory based on the first chosen file, so that if I open the 15th image,
# if I press next, it will go to the 16th etc. Autistic, I know, but this is
# one of the reasons that sxiv is great for being able to read standard input.

[ -z "$1" ] && echo "usage: rotdir regex 2>&1" && exit 1
base="$(basename "$1")"
 ls "$PWD" | awk "BEGIN { lines = \"\"; m = 0; } /^$base$/ { m = 1; } { if (!m) { if (lines) { lines = lines\"\n\"; } lines = lines\"\"\$0; } else { print \$0; } } END { print lines; }"

