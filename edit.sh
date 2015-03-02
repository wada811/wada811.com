#!/bin/bash
set -eux

if [ $# -eq 1 ]
then
    subl "content/$1"
    git commit --allow-empty -m "Rewrite: `date`"
fi