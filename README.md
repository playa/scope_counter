scope_counter is a simple implementation of counter_cache functionality for models scopes with ActiveRecord

Install
--------

```ruby
gem 'scope_counter'
```
and run `bundle install` from your shell.

Usage
--------

Create columns in db according to scopes in your model ("#{scope_name}_#{table_name}_count"):

```ruby
t.integer :usefull_utilities_count, :default => 0
t.integer :useless_utilities_count, :default => 0
t.integer :utilities_count, :default => 0
```

List in array scopes, which you want to create counter cache for, as :conter_cache option (if you want to add a default behavior just add :all in array):

```ruby
class Advice  < ActiveRecord::Base
  has_many :utilities
end

class Utility  < ActiveRecord::Base
  belongs_to :advice, :counter_cache => [:all,:usefull, :useless]
  scope :usefull, where(:usefull => true)
  scope :useless, where(:usefull => false)
end

advice = Advice.create

advice.usefull_utilities_count # => 0

advice.utilities.usefull.create

advice.usefull_utilities_count # => 1

advice.utilities_count # => 1
```



