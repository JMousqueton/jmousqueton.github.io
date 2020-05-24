# 🏡&nbsp; [jmousqueton.github.io](https://cv.jmousqueton.github.io/)

[![Netlify Status](https://img.shields.io/netlify/c9d7352c-8658-4ea3-a239-3be8e2f9dd16)](https://app.netlify.com/sites/jmousqueton/deploys)
[![View website](https://img.shields.io/badge/open%20site-jmousqueton.github.io-green)](https://jmousqueton.github.io/)
[![Hugo v0.7.0](https://img.shields.io/badge/hugo-v0.7.0-orange)](https://github.com/gohugoio/hugo)
[![License](https://img.shields.io/github/license/jmousqueton/jmousqueton.github.io?color=red)](LICENSE.md)
[![Twitter Follow](https://img.shields.io/twitter/follow/jmousqueton?label=Follow&style=social)](https://twitter.com/intent/user?screen_name=jmousqueton)

Resume of [@jmousqueton](https://github.com/jmousqueton), created and deployed using the following:

- [Hugo Extended](https://github.com/gohugoio/hugo)
- [Resume](https://github.com/jmousqueton/resume) - The Hugo template for my resume


## 👍🏻Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

## :cd: Installation

Check my [blog post](https://www.julienmousqueton.fr/comment-creer-son-cv-sur-github/) (in French :fr:)

#### In summary
- create the Hugo project : `hugo init jmousqueton.github.io`
- add my theme : `cd jmousqueton.github.io/themes ;; git clone https://github.com/jmousqueton/resunme`
- Copy and modify the file [config.toml](.conf/config.toml)

## Running a local testing server

Run `hugo server -D` then open [http://localhost:1313/](http://localhost:1313/). Pages will live-refresh when source files are changed.
Or use my [deploy.sh](.tools/deploy.sh) script ➡️ `deploy.sh local`

## Generated and deploy my resume

I've create a script to help deployement : [deploy.sh](.tools/deploy.sh)  ➡️ `deploy.sh deploy -c "My first Commit"`

check the usage ➡️ `deploy -h`

## Authors

* **Julien Mousqueton** - [Blog](https://www.julienmousqueton.fr)

See also the list of [contributors](https://github.com/JMousqueton/jmousqueton.github.io/contributors) who participated in this project.


## Licenses

MIT

## Acknowledgments
