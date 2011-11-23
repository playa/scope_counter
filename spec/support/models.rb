class Advice  < ActiveRecord::Base
  has_many :utilities
end

class Utility  < ActiveRecord::Base
  belongs_to :advice, :counter_cache => [:usefull, :useless]
  scope :usefull, where(:usefull => true)
  scope :useless, where(:usefull => false)
end
