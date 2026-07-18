#!/bin/sh
PROJECTS="$HOME/git/*"
for proj in  $PROJECTS
do
    echo "-------------------------------------------------------------------";
    echo "checking for untracked files in: $proj";
    echo "-------------------------------------------------------------------";
    cd $proj; git status;
    echo
done
