#!/bin/bash
set -eux

if [ $# -eq 1 ]
then
    hugo new "post/$1.md"
    subl "content/post/$1.md"
    git commit --allow-empty -m "Write: $1"
fi