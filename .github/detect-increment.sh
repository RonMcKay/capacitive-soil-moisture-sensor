#!/bin/bash

if grep -E '^###\s*[^ ]*\s*Breaking Changes$' $1 &> /dev/null; then
    echo "MAJOR"
elif grep -E '^###\s*[^ ]*\s*Features$' $1 &> /dev/null; then
    echo "MINOR"
elif grep -E '^###\s*[^ ]*\s*Fixes$' $1 &> /dev/null; then
    echo "PATCH"
else
    echo "##### Can not detect any version increment! #####"
    exit 1
fi