#!/bin/bash

#declaring big extension to confuse.
declare -a extension=("O" "S" "D" "_" "C" "T" "F" "{" "T" "a" "l" "k" "I" "s" "C" "h" "e" "a" "p" "!" "}")

# first zip with the flag
echo "OSD_CTF{@Str355C0mpr355}" > flag.txt
zip -P hi5rockyou flag.zip flag.txt
rm flag.txt
mv flag.zip flag.#

# initialising the no. of loops of compression (loops should be < 24)
loops=20

#variable to take care of extension of files decompressed
next=flag.#

# gunzipping
i=0
while [ $i -le $loops ]
do
  gzip < $next > "$next${extension[$i]}"
  rm -f $next
  next="$next${extension[$i]}"
  i=$[$i+1]
done

# XZ compression
i=$loops
while [ $i -ge 0 ]
do
  xz $next
  mv "$next.xz" "$next${extension[$i]}"
  next="$next${extension[$i]}"
  i=$[$i-1]
done


# bunzipping the files
i=0
while [ $i -le $loops ]
do
  bzip2 $next
  mv "$next.bz2" "$next${extension[$i]}"
  next="$next${extension[$i]}"
  i=$[$i+1]
done

# zipping the files.
   i=0
while [ $i -le $loops ]
do
  zip -m "$next.zip" $next
  mv "$next.zip" "$next${extension[$i]}"
  next="$next${extension[$i]}"
  i=$[$i+1]
done