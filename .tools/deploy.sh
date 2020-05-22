#!/bin/bash
#===============================================================================
#
#          FILE:  deploy.sh
#
#         USAGE:  ./deploy.sh
#
#   DESCRIPTION: A script to deploy your hugo generated web site
#
#  REQUIREMENTS:  git and hugo must be istalled
#        AUTHOR:  Julien Mousqueton @JMousqueton
#       COMPANY:  ---
#       VERSION:  1.1
#       CREATED:  05/21/2020
#===============================================================================

##### Constants

##### Functions


check()
{
  git --version 2>&1 >/dev/null
  GIT_IS_AVAILABLE=$?
  if [ $GIT_IS_AVAILABLE -ne 0 ]; then
      echo '[Error] Git must me installed'
      exit 1
  fi
  hugo version 2>&1 >/dev/null
  GIT_IS_AVAILABLE=$?
  if [ $GIT_IS_AVAILABLE -ne 0 ]; then
      echo '[Error] Git must me installed'
      exit 1
  fi
}

deploy()
{
  hugo -enableGitInfo --minify -v
  cp config.toml public/.conf
  cp deploy.sh public/.tools
  cd public
  git add .
  git commit -m "rebuilding site $(date)"
  git push
  cd ..

}   # end of deploy


server()
{
     hugo server --disableFastRender  -D
}   # end of server

usage()
{
    echo " "
    echo "usage: $0 [OPTIONS]"
    echo " "
    echo "Options:"
    echo "  -h, --help      Print this help text and exit"
    echo "  -l, --local     Launch local webserver"
    echo "  -d, --deploy    Deploy the site via git"
    echo " "
    exit 1
}


##### Main
check
if [  $# -gt 1 ]
then
  usage
  exit 1
fi
while [ "$1" != "" ]; do
    case $1 in
        -d | --deploy)          deploy
                                exit
                                ;;
        -l | --local)           server
                                exit
                                ;;
        -h | --help)           usage
                                exit
                                ;;
    esac
    shift
done
usage
exit 1
# exit
