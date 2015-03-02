#!/bin/bash
set -eux

if [ $# -eq 1 ]
    hugo new "$1"
    git commit --allow-empty -m "Write: $1"
end