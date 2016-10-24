class VoteCategory < ActiveRecord::Base
  validates :category , presence: true
end
