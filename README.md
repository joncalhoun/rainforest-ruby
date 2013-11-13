Installation
------------

Install the gem:

```
gem install rainforest
```

Import the Rainforest client in your application:

```
require 'rainforest'
```

Requirements
------------

* Ruby 1.8.7 or above. (Ruby 1.8.6 may work if you load
  ActiveSupport.)
* rest-client, multi_json

Development
-----------

Test cases can be run with: `bundle exec rake test`


Examples
--------

```ruby
require 'rainforest'
Rainforest.api_key = '...'


```
