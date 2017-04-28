# THE BOOK TEMPLATE MAKEFILE
# Replace this with the base filename of your final output.
title = your-title-here
# This is a list of all the formats you wish to publish to.
formats = html pdf epub

# Global Pandoc options, applied to every format.
pandoc_options = --smart --table-of-contents --from markdown

# Location of input files.
source_dir = src
# Location of output files.
target_dir = dist
# Markdown source files.
markdown_extension = md
# Pandoc Metadata file.
metadata_filename = metadata.yml
# CSS stylesheet. Used only when outputting HTML format.
style_filename = style.css

# The path to the pandoc executable on your system.
pandoc = pandoc

# Options specific to individual formats.
# The prefix must match the format exactly.
# Note that if a format option is omitted, no special options will be applied.
html_options = --css=$(source_dir)/$(style_filename) --self-contained
pdf_options = --variable documentclass=book

################################################################################

base_output = $(target_dir)/$(title)
source := $(sort $(wildcard $(source_dir)/*.$(markdown_extension)))
metadata = $(source_dir)/$(metadata_filename)

.SUFFIXES:

.PHONY: clean all $(formats)

all: $(formats)

$(formats): %: $(base_output).%

$(addprefix $(base_output).,$(formats)): $(base_output).%: $(wildcard $(source_dir)/*) | $(target_dir)
	@$(pandoc) $(pandoc_options) $($*_options) -o $@ $(metadata) $(source)
	@echo "Wrote $@"

$(target_dir):
	@mkdir -p $(target_dir)

clean:
	@rm -f $(wildcard $(target_dir)/*)
