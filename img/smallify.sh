#!/bin/bash
for f in *.jpg;
do
    /usr/bin/gm convert "$f" -resize 50%  "${f%.jpg}-small.jpg";
done;

