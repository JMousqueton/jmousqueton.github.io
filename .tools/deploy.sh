#!/bin/bash
#===============================================================================
#
#          FILE:  deploy.sh
#
#         USAGE:  ./deploy.sh [deploy|local] [-c <comment>|-h]
#
#   DESCRIPTION: A script to deploy your hugo generated web site
#
#  REQUIREMENTS:  git and hugo must be installed
#        AUTHOR:  Julien Mousqueton @JMousqueton
#       COMPANY:  ---
#       VERSION:  1.2
#       CREATED:  05/21/2020
#===============================================================================

##### Constants

PUBLIC_DIR=./public
CONF_DIR=./public/.conf
#!# SCRIPT_DIR=./public/.tools
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"

##### Functions


check()
{
  { git --version > /dev/null; } 2>&1
  GIT_IS_AVAILABLE=$?
  if [ $GIT_IS_AVAILABLE -ne 0 ]; then
      echo -e "${RED}[Error]${NOCOLOR} Git must me installed"
      exit 1
  fi

  { hugo version > /dev/null; } 2>&1
  HUGO_IS_AVAILABLE=$?
  if [ $HUGO_IS_AVAILABLE -ne 0 ]; then
      echo -e "${RED}[Error]${NOCOLOR} Hugo must me installed"
      exit 1
  fi
}  # end of check

deploy()
{
  home=$(pwdc)
  hugo -enableGitInfo --minify -v
  cp config.toml $CONF_DIR
#!#   cp deploy.sh $SCRIPT_DIR
  cd $PUBLIC_DIR  || exit 1
  git add .
  if [ -z "$comment" ]; then
    comment="rebuilding site $(date)"
  fi
  git commit -m "$comment"
  git push
  cd "$home" || exit 1

}   # end of deploy


server()
{
     { echo "http://127.0.0.1:1313" | pbcopy > /dev/null; } 2>&1
     PBCOPY_IS_AVAILABLE=$?
     if [ $PBCOPY_IS_AVAILABLE -eq 0 ]; then
       echo -e "${GREEN}[HINT]${NOCOLOR} We copy the URL in the clipboard for you !!!"
    fi
     hugo server --disableFastRender  -D
}   # end of server

usage()
{
    echo " "
    echo "usage: $0 [deploy|local] [-c <comment>|-h]"
    echo " "
    echo "Action:"
    echo "  deploy          Generate and deploy the site"
    echo "  local           Launch local webserver (auto refresh)"
    echo " "
    echo "Options:"
    echo "  -h              Print this help text and exit"
    echo "  -c              Add specific comment on commit"
    echo " "
    echo "Example :"
    echo "  $0 deploy -c \"update script\""
    echo " "
    exit 1
}   # end of usage


##### Main
check
while getopts ":h" opt; do
  case ${opt} in
    h )
     usage
    exit 0
      ;;
   \? )
     echo "Invalid Option: -$OPTARG" 1>&2
     usage
     exit 1
     ;;
  esac
done
shift $((OPTIND -1))

subcommand=$1; shift  # Remove '$0' from the argument list
case "$subcommand" in
  # Parse options to the deploy sub command
  deploy)
    # Process package options
    while getopts ":c:" opt; do
      case ${opt} in
        c )
          comment=$OPTARG
          ;;
        \? )
          echo "Invalid Option: -$OPTARG" 1>&2
          usage
          exit 1
          ;;
        : )
          echo "Invalid Option: -$OPTARG requires an argument" 1>&2
          usage
          exit 1
          ;;
      esac
    done
    shift $((OPTIND -1))
    deploy
    exit 0
    ;;

    local)
      server
      exit 0
      ;;
esac

usage
exit 0
# exit
