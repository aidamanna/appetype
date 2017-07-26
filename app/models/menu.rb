class Menu < ActiveRecord::Base
  validates :week, presence: true
end
