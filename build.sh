#!/usr/bin/env sh

# Get the absolute path to the bash script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

function build_var_fonts {

	dsgnsp_file=$DIR/$1.designspace
	otf_file=$DIR/$1.otf
	ttf_file=$DIR/$1.ttf

	buildmasterotfs --mkot -omitMacNames -d $dsgnsp_file
	buildcff2vf --omit-mac-names -d $dsgnsp_file

        # Subroutinize the 'CFF2' table
        tx -cff2 +S $otf_file $1.cff2

        # Splice in the subroutinized 'CFF2' table, along with the
        # customized 'OS/2' and 'cmap' tables
	sfntedit -a CFF2=$1.cff2,OS/2=OS2.bin,cmap=cmap.bin $otf_file
        rm $1.cff2

	# The fontTools.feaLib does not yet support the 'vhea' and 'vmtx'
	# tables, so the TrueType font must be built without their features
	# file override code
	fontmake -m $dsgnsp_file -o variable --output-path $ttf_file

	# Copy 'GSUB', 'OS/2', 'STAT', 'VVAR', 'cmap', 'name', 'vhea', and
        # 'vmtx' tables from OTF to TTF
	sfntedit -x GSUB=.tb_GSUB,OS/2=.tb_OS2,STAT=.tb_STAT,VVAR=.tb_VVAR,cmap=.tb_cmap,name=.tb_name,vhea=.tb_vhea,vmtx=.tb_vmtx $otf_file
	sfntedit -a GSUB=.tb_GSUB,OS/2=.tb_OS2,STAT=.tb_STAT,VVAR=.tb_VVAR,cmap=.tb_cmap,name=.tb_name,vhea=.tb_vhea,vmtx=.tb_vmtx $ttf_file

	# Nuke the build artifacts
	rm .tb_*

	# Build WOFF2 versions of the OTF and TTF
	woff2_compress $otf_file
	mv $1.woff2 $otf_file.woff2
	woff2_compress $ttf_file
	mv $1.woff2 $ttf_file.woff2

}

build_var_fonts WidthAndVWidthVF

# EOF
