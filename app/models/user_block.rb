class UserBlock < ActiveRecord::Base
  attr_accessible :blockee, :blocker
end
