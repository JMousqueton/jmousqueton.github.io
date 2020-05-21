#!/bin/bash

# deploy.sh - A script to deploy your hugo generated web site
#
# Developped by Julien Mousqueton @JMousqueton

##### Constants


##### Functions

deploy()
{
  hugo -enableGitInfo --minify -v
  cd public
  cp ../config.toml .
  cp ../deploy.sh .
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
    echo "usage: deploy.sh [[-l] | [-d] | [-h]]"
}


##### Main

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
        * )                     usage
                                exit 1
    esac
    shift
done
# Test code to verify command line processing
