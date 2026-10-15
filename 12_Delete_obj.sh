#!/usr/bin/env bash

set -u

ROOT="${1:-.}"

find "$ROOT" -type f \( \
    -name '*.obj' -o \
    -name '*.lst' -o \
    -size 0 \
\) -print -delete
