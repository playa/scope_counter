scope_counter is a simple implementation of counter_cache functionality for models scopes with ActiveRecord

Install
--------

```shell
gem install scope_counter
```
or add the following line to Gemfile:

```ruby
gem 'scope_counter'
```
and run `bundle install` from your shell.

Usage
--------

Create columns in db according to scopes in your model ("#{scope_name}_count").
```ruby
    t.integer :usefull_count, :default => 0
    t.integer :useless_count, :default => 0
```
List in array scopes, which you want to create counter cache for, as :conter_cache option:

```ruby
class Advice  < ActiveRecord::Base
  has_many :utilities
end

class Utility  < ActiveRecord::Base
  belongs_to :advice, :counter_cache => [:usefull, :useless]
  scope :usefull, where(:usefull => true)
  scope :useless, where(:usefull => false)
end

advice = Advice.create

advice.usefull_count # => 0

advice.utilities.usefull.create

advice.usefull_count # => 1
```



