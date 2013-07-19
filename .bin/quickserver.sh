#!/bin/sh

### Options setup ################################################

show_help()
{
cat << EOF
usage: $0 options

This script creates a simple server using the shotgun gem. Requires ruby/gems.

OPTIONS:
   -h      Show this message
   -p      Server root password
TODO:
  Create file input
  Check for depancies
EOF
exit 0
}

OPTIND=1         # Reset in case getopts has been used previously in the shell.
# Initialize our own variables:
port=8000

# Main options loop, plus help checker
while getopts "h?p:" opt; do
    case "$opt" in
      h|\?)
          show_help
          ;;
      p)  port=$OPTARG
          ;;
    esac
done

if [[ "$@" == "help" ]]; then
  show_help
fi

# Remove arguments from leftovers
shift $((OPTIND-1))

# What's this for?
[ "$1" = "--" ] && shift

#echo "port=$port, Leftovers: $@"


### Actual script ################################################

if [ ! -f ./Gemfile ]; then
  `echo "source 'https://rubygems.org'\n" > Gemfile`
fi

Shotgun=`grep shotgun Gemfile`
if [ "$Shotgun" == "" ]; then
  `echo "gem 'shotgun'" >> Gemfile`
fi

bundle exec shotgun -p $port

# Script by Kirk Werklund
