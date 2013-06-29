![Unifaun Logo](https://raw.github.com/futhr/spree-unifaun/master/unifaun.png)

# Spree Unifaun Packsoft ERPConnect

[![Build Status](https://secure.travis-ci.org/futhr/spree-unifaun.png?branch=master)](http://travis-ci.org/futhr/spree-unifaun)
[![Dependency Status](https://gemnasium.com/futhr/spree-unifaun.png)](https://gemnasium.com/futhr/spree-unifaun)
[![Coverage Status](https://coveralls.io/repos/futhr/spree-unifaun/badge.png?branch=master)](https://coveralls.io/r/futhr/spree-unifaun)

## Features

### Unifaun ERPConnect – XML Posting

A variant of *Unifaun ERPConnect*, but does not require any locally installed software. You connect *Spree Commerce* with *Unifaun Online* or *Pacsoft Online* and the order files are posted directly to the *Unifaun Online* or *Pacsoft Online* account. You can then edit or supplement the information from your account or directly print the transport documents. Supplement with *Unifaun Embed&Link* to improve workflow and print directly from your main system.

### Unifaun Embed&Link

To get improved performance and a fully integrated workflow, you can supplement *XMLPosting* with the *Embed&Link* function. You can then see the *Unifaun Online* interface embedded in the e-shop, which means that you don’t need to log in to *Unifaun Online* to print out shipping labels and send EDI to the carrier.

### Unifaun PickUpLocator

*Unifaun PickUpLocator* is a web service that allows you to look up the delivery point or let the customer choose when they place an order in the e-shop.

### Unifaun Discard

With the online service *Unifaun Discard*, you can cancel incorrectly printed orders directly from the e-shop.

### Unifaun TrackBack

*Unifaun TrackBack* is the online service that enables you to continuously and automatically retrieve package and/or shipment IDs to the e-shop.

### Unifaun Track&Trace

*Unifaun Track&Trace* enables you to create a URL address showing a shipment's tracking information, regardless of carrier, via the order or reference number.

### Link to print

This service enables you to automatically, via the e-shop, send an email with a link to a printout. The function can be advantageously used to give an e-shop customer a link for printing a return shipping label. The EDI to the carrier is not created until the link is activated, which makes it secure to use.

### Unifaun OneDoc

*Unifaun OneDoc* is the service that enables the user to print out transport labels as an integrated document. You can print dispatch and return labels in combination with invoices or packing slips, as well as return instructions, advertising messages or other information. The document is printed out on a laser printer with a duplex function to print on both the front and back sides.

Contact [Unifaun][1] to learn more about their integrated services and what it takes to get them up and running.

## Installation

* Add `gem 'spree_unifaun', github: 'futhr/spree-unifaun'` to your Gemfile
* Run `bundle`
* Run `rails g spree_unifaun:install`
* Run `rake db:migrate`

## Contributing

In the spirit of [free software][2], **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using prerelease versions
* by reporting [bugs][3]
* by suggesting new features
* by writing [translations][5]
* by writing or editing documentation
* by writing specifications
* by writing code (*no patch is too small*: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by resolving [issues][3]
* by reviewing patches

Starting point:

* Fork the repo
* Clone your repo
* Run `bundle install`
* Run `bundle exec rake test_app` to create the test application in `spec/test_app`
* Make your changes
* Ensure specs pass by running `bundle exec rspec spec`
* Submit your pull request

Copyright (c) 2013 Tobias Bohwalli, released under the [New BSD License][4]

[1]: http://en.unifaun.se
[2]: http://www.fsf.org/licensing/essays/free-sw.html
[3]: https://github.com/futhr/spree-unifaun/issues
[4]: https://github.com/futhr/spree-unifaun/tree/master/LICENSE
[5]: http://www.localeapp.com/projects/4937
