ActiveRecord::Schema.define do
  self.verbose = false

  create_table :advices, :force => true do |t|
    t.string :text
    t.integer :utilities_count, :default => 0
    t.integer :usefull_utilities_count, :default => 0
    t.integer :useless_utilities_count, :default => 0
  end

  create_table :utilities, :force => true do |t|
    t.boolean :usefull
    t.integer :advice_id
  end

end
