# Width & Vertical Width VF

*Width & Vertical Width VF* is a special-purpose Variable Font that is intended to simulate compression and expansion in horizontal and vertical layout via the '[wdth](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxistag_wdth)' (*Width*) and 'VWID' (*Vertical Width*) design-variation axes. The URL listed next to the project name provides more information about the layout model that this Variable Font is intended to support.

GIDs 1 through 256 represent Western glyphs that are hollow rectangles, and map from 785,553 code points that are assigned the [UAX #50](https://www.unicode.org/reports/tr50/) <em>Vertical_Orientation</em> ("vo") property value of "R" or "Tr." Their default horizontal advance is 600 units, and can compress and expand 25%, meaning from 450 to 750 units. GIDs 257 through 512 represent CJK glyphs that are solid rectangles, and map from 326,445 code points that are assigned the "vo" property value of "U" or "Tu." Their default horizontal advance is 1000 units, and can compress and expand 25%, meaning from 750 to 1250 units. In other words, all 1,111,998 Unicode code points map to one of two glyphs, each of which include 256 instances for more efficient 'cmap' table mappings.

GID+513 is a Western glyph that is half the width of the CJK glyphs, which substitutes the Western glyphs (GIDs 1 through 256) via the '[hwid](https://docs.microsoft.com/en-us/typography/opentype/spec/features_fj#tag-hwid)' (*Half Widths*) GSUB feature, and is intended to be used for TCY (*Tate Chu Yoko*) purposes.

This Variable Font includes two design-variation axes, '[wdth](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxistag_wdth)' (*Width*) and 'VWID' (*Vertical Width*). The default value for both axes is 500, which corresponds to a 600-unit horizontal advance for the Western glyphs, and 1000-unit advances for the CJK glyphs. Both axes have a setting range from 1 through 1000, which corresponds to the maximum compression and expansion settings, respectively.

## Building the font from source

### Requirements

To build the Variable Font from source, you need to have installed the [Adobe Font Development Kit for OpenType](https://github.com/adobe-type-tools/afdko/) (AFDKO) tools. The AFDKO tools are widely used for font development today, and are part of most font editor apps.

### Building the font

In this repository, all necessary files are in place for building the Variable Font in both OpenType/CFF2 and TrueType formats, and the *build.sh* file can simply be executed.

## Getting Involved

For any suggestions for changes, please [create a new issue](https://github.com/adobe-fonts/width-and-vertical-width-vf/issues) for consideration.

