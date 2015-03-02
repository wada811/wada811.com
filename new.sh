#!/bin/bash
set -eux

if [ $# -eq 1 ]
then
    hugo new "$1"
    subl "content/$1"
    git commit --allow-empty -m "Write: $1"
fi