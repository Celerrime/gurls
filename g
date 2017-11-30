#!/bin/bash
# go - takes a file with urls in each line and opens them
# usage: g < urls

while read url; do
   open -g "$url" 
done
