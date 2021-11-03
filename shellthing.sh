#!/bin/bash
CHANGED_FILES=()
git diff --name-only | while read p
do
  git diff -- "$p"
    CHANGED_FILES+=$p
done
