# ILLiad templates

[![Build Status](http://jenkins.library.nyu.edu/buildStatus/icon?job=ILLiad_Production_Deploy)](http://jenkins.library.nyu.edu:8080/view/ILLiad/job/ILLiad_Production_Deploy/)
[![Dependency Status](https://gemnasium.com/NYULibraries/illiad-templates.png)](https://gemnasium.com/NYULibraries/illiad-templates)

This project contains the logic for templating ILLiad (Interlibrary Loan software) with Mustache, stylesheets in SASS and scripts in CoffeeScript.

* Uses [https://github.com/barnabyalter/microservice_precompiler](https://github.com/barnabyalter/microservice_precompiler) to render, compile and compress this project.
* Uses [Capistrano](https://github.com/capistrano/capistrano) and [LFTP](http://lftp.yar.ru/) to deploy after compile to Windows NT servers.

## Read the [wiki](wiki) for more information
