# THE BOOK TEMPLATE MAKEFILE
# Replace this with the base filename of your final output.
title = your-title-here

# This is a list of all the formats you wish to publish to.
formats = html pdf epub

# Location of input files.
source_dir = src

# Location of output files.
target_dir = dist

# Extensions of source files to include.
# Note that they will all be interpreted the same, however.
input_extensions = md txt

# Format of source files.
# All input files will be interpreted with this format regardless of extension.
input_format = markdown

# Pandoc Metadata file.
metadata_filename = metadata.yml

# CSS stylesheet. Used only when outputting HTML format.
style_filename = style.css

# The path to the pandoc executable on your system.
pandoc = pandoc

# Global Pandoc options, applied to every format.
pandoc_options = --smart --table-of-contents --from $(input_format)

# Options specific to individual formats.
# The prefix must match the format exactly.
# Note that if a format option is omitted, no special options will be applied.
html_options = --css=$(source_dir)/$(style_filename) --self-contained
pdf_options = --variable documentclass=book

################################################################################

base_output = $(target_dir)/$(title)
output_files = $(addprefix $(base_output).,$(formats))
source := $(sort $(wildcard $(addprefix $(source_dir)/*.,$(input_extensions))))
metadata = $(source_dir)/$(metadata_filename)

.SUFFIXES:
.PHONY: clean all $(formats) count

all: $(formats)

$(formats): %: $(base_output).%

$(output_files): $(base_output).%: $(wildcard $(source_dir)/*) | $(target_dir)
	@$(pandoc) $(pandoc_options) $($*_options) -o $@ $(metadata) $(source)
	@echo "Wrote $@"

$(target_dir):
	@mkdir -p $(target_dir)

clean:
	@rm -f $(wildcard $(target_dir)/*)

count: $(source)
	@$(pandoc) $^ --to plain | wc -w
