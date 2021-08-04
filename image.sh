#!/bin/bash
if [[ $# -eq 0 ]]
 then
    flist=`find . -iname \*.jpg`
 else
    flist=`cat $1`
fi

#echo $flist
#exit 1


for f in $flist
do
#file exists
if [[ ! -e "$f" ]]; then continue; fi
#file is not thumbnail
if [[ ${f} = *__thumbnail."${f##*.}" ]]; then continue; fi
#file is jpeg
if [[ ! $(file -b "$f" | awk '{print $1}') == "JPEG" ]] ; then continue; fi
#file no have thumbnail
if [ ! -f "${f%.*}"__thumbnail."${f##*.}" ]; then \

     echo "processing sample ${f}"; \
     convert "$f" -resize "360>" "${f%.*}"__thumbnail."${f##*.}"
    fi;
#  ls "$f"
done
