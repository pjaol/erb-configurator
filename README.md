erb-process
================================
![alt gissearch.com](http://www.gissearch.com/files/zen_classic_logo.gif)

Simple little script to separate out variables from erbs
in a manor that suits multiple environments

Usage
--------
* erb-process 
	*	yaml file containing key: environment: value
	*	erb file
	*	optional environment value (defaults to dev)

example

* erb-process test/config.yml test/example_config.erb prod > my_prod_config 
	
	-- (direct standard output to your config file)

Installation
--------
gem install erb-process

Configuration File
--------
The purpose of this script is to provide separate out variables from templates
and also to ensure variables for different environments are contained together
e.g.
A configuration yaml file containing a hostname for dev, qa, prod would look like:
test/config.yml

    hostname:
	    dev: http://dev.epals.com
	    qa: http://qa.epals.com
	    prod: http://prod.epals.com

	foo:
	    dev: http://dev.foo.com
	    qa: http://qa.foo.com
	    prod: http://prod.foo.com

The advantage of this is keeping everything in one place, and it's easy to see when something is missing.
That and the code warns you when a particular environment piece is missing.
Sometimes that's acceptable, so it only warns to standard error
e.g.

    erb-process test/config.yml test/example_config.erb madieUppy >/dev/null 
     WARNING: test/config.yml does not have a foo for environment madieUppy
     WARNING: test/config.yml does not have a hostname for environment madieUppy

The ERB template can now access these variables 
test/example_config.erb

    host: <%= config["hostname"]%>
	bar: <%= config['foo']%>

	