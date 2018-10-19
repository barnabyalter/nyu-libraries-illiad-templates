# ILLiad templates

[![Build Status](http://jenkins.library.nyu.edu/buildStatus/icon?job=ILLiad_Production_Deploy)](http://jenkins.library.nyu.edu:8080/view/ILLiad/job/ILLiad_Production_Deploy/)

This project contains the logic for templating ILLiad (Interlibrary Loan software) with Mustache, stylesheets in SASS and scripts in CoffeeScript.

* Uses [https://github.com/barnabyalter/microservice_precompiler](https://github.com/barnabyalter/microservice_precompiler) to render, compile and compress this project.
* Uses [Capistrano](https://github.com/capistrano/capistrano) and [LFTP](http://lftp.yar.ru/) to deploy after compile to Windows Servers.

## Usage

### Compile and deploy

Assuming credentials are configured by Figs the following will build the distribution and deploy to the staging ILLiad:

```
bundle exec cap development deploy:ftp
```

### Compile without deploy

If you just want to build the distribution without attempting to ftp remotely:

```
bundle exec cap deploy:compile -S local=true
```

## Read the [wiki](https://github.com/NYULibraries/illiad-templates/wiki) for more information
