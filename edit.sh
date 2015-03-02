#!/bin/bash
set -eux

if [ $# -eq 1 ]
    git commit --allow-empty -m "Rewrite: `date`"
end