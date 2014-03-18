# ILLiad templates

[![Build Status](http://jenkins.library.nyu.edu/buildStatus/icon?job=ILLiad Production Deploy)](http://jenkins.library.nyu.edu/job/ILLiad%20Production%20Deploy/)
[![Dependency Status](https://gemnasium.com/NYULibraries/illiad-templates.png)](https://gemnasium.com/NYULibraries/illiad-templates)

This project contains the logic for templating ILLiad (Interlibrary Loan software) with Mustache, stylesheets in SASS and scripts in CoffeeScript.

* Uses [https://github.com/barnabyalter/microservice_precompiler](https://github.com/barnabyalter/microservice_precompiler) to render, compile and compress this project.
* Uses [Capistrano](https://github.com/capistrano/capistrano) and [LFTP](http://lftp.yar.ru/) to deploy after compile to Windows NT servers.

## Documented Changes

* Changed NVTGC value in NewAuthRegistration from ILL to ZYU. [Change log](https://github.com/NYULibraries/illiad-templates/commit/c43c9debea9056c3da046edbcbd422a79ba2f7ca)
