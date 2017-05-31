#!/bin/bash

project_name=sample
reciever_email=sample@gmail.com
email_subject="Alert. Git contains modified files"

if git diff-index --name-status --exit-code HEAD; then
    echo Git working copy is clean...;
else
    git_output="$(git diff-index --name-status --exit-code HEAD)"
    message=$(printf "project name - $project_name \n$(date +%d-%m-%Y) \n$git_output")
    mail -s "$email_subject" $reciever_email <<< "$message"
#    echo "$message"
fi;