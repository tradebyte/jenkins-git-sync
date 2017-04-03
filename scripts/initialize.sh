#!/bin/bash

# If no argument or first arg starts with -, user is passing arguments to the jenkins executable
if [[ $# -lt 1 ]] || [[ "$1" == "-"* ]]; then
    /usr/local/bin/sync-git.sh
    exec /usr/local/bin/jenkins.sh "$@"
else
    # this is a command to run out of jenkins
    exec "$@"
fi
