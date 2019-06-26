#!/bin/bash

#https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US

# Usage info
show_help() {
cat << EOF
Usage: ${0##*/} [-hvu] [-f OUTFILE] [FILE]...
Do stuff with FILE and write the result to standard output. With no FILE
or when FILE is -, read standard input.

    -h          display this help and exit
    -u          update firefox version (needs sudo)
    -f          write the result to OUTFILE instead of standard output.
    -v          verbose mode. Can be used multiple times for increased
                verbosity.
EOF
}

function download(){
    echo 'Downloading newest firefox'
    wget -O FirefoxSetup.tar.bz2 "$downloadLink"
}

function update(){
    echo 'Attempting to update firefox in place'
    tar xjf FirefoxSetup.tar.bz2 -C /opt/firefox/
    echo 'Update complete, cleaning files'
    rm ./FirefoxSetup.tar.bz2
}

function makeUpdate(){
    download
    update
    exit 0
}

# Initialize our own variables:
output_file=""
verbose=0
downloadLink="https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
OPTIND=1
isUpdate=false
# Resetting OPTIND is necessary if getopts was used previously in the script.
# It is a good idea to make OPTIND local if you process options in a function.

while getopts hvuf: opt; do
    case $opt in
        h)
            show_help
            exit 0
            ;;
        u)  makeUpdate
            exit 0
            ;;
        *)
            show_help >&2
            exit 1
            ;;
    esac
done
shift "$((OPTIND-1))"   # Discard the options and sentinel --


echo 'End of process.'
exit 0

# End of file
