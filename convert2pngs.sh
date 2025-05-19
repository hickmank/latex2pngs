#!/bin/bash

# Split a `standalone` latex document of only 1 equation-per-page to
# multiple pdfs and then convert each of those to a png for use in
# powerpoint.

# `pdfseparate` is in the `poppler` package, `brew install poppler`

# `convert` is in the `imagemagick` package, `brew install imagemagick`

# Split pdf
pdfseparate latex_math_equations.pdf %02d.pdf

for k in {1..35}
do
    # Convert to png
    convert -density 1240 \
	    -quality 95 \
	    -colorspace RGB \
	    `printf "%02d" $k`.pdf `printf "%02d" $k`.png
done
