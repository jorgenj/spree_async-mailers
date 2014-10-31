SpreeAsync-mailers
==================

SpreeAsync-mailers is an extension to move spree's mailers to use sidekiq queues for delivery. This speeds up alot of operations that kick off sending mail since the view templating time is taken out of your controller's response time.

This gem can be used in conjunction with devise-async to make all of spree's mailers async.

Requirements
------------

Spree (~2.1.7)
Sidekiq (2.3+) or DelayedJob
Devise-Async (included)


Todo
----

Allow multiple async backends like Devise-Async provides.
Write tests


Installation
------------

Add spree_async-mailers to your Gemfile:

```ruby
gem 'spree_async-mailers', github: 'jorgenj/spree_async-mailers', :branch => '2-1-stable'
```



Copyright (c) 2014 Justin McNally, released under the New BSD License
