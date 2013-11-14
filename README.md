[![Build Status](https://travis-ci.org/rainforestapp/rainforest-ruby.png?branch=master)](https://travis-ci.org/rainforestapp/rainforest-ruby)

# Installation

Install the gem:

```
gem install rainforest
```

Import the Rainforest client in your application:

```ruby
require 'rainforest'
```

# Requirements

* Ruby 1.9.3 or above.
* rest-client, multi_json


# Examples

```ruby
require 'rainforest'
Rainforest.api_key = "985de0ba7d0820912a33aa696a77319d"

# Get all of your tests
tests = Rainforest::Test.all


# Get all of your runs
runs = Rainforest::Run.all

run = Rainforest::Run.retrieve(2181) # retrieve a run
run.delete # abort a run


# Kick off a run with all tests
new_run = Rainforest::Run.create(tests: ["all"])
```

# Docs

You can find the Rainforest docs here: https://docs.rainforestqa.com/


# Development

Test cases can be run with: `bundle exec rake test`
