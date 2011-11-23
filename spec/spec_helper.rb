require 'scope_counter'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", 
                                       :database => File.dirname(__FILE__) + "/scope_counter.sqlite3")
load File.dirname(__FILE__) + '/support/schema.rb'
load File.dirname(__FILE__) + '/support/models.rb'
