#!/bin/bash

if git diff-index --name-status --exit-code HEAD
then
    echo Git working copy is clean...;
else
    echo ;
    echo ERROR: Git working copy is dirty!;
    echo Commit your changes and try again.;

    mail -s "Alert git copy isn't clear" address@gmail.com <<< "$(git diff-index --name-status --exit-code HEAD)"

fi;