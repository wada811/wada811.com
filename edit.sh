#!/bin/bash
set -eux

if [ $# -eq 1 ]
then
    subl "$1"
    git commit --allow-empty -m "Rewrite: $1"
fi