#!/bin/bash
for f in *.JPG;
do
    /usr/bin/gm convert "$f" -resize 50%  "${f%.JPG}.jpg";
done;

