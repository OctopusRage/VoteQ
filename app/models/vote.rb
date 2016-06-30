class Vote < ActiveRecord::Base
  	belongs_to :user
  	has_many :vote_options
  	has_many :users, through: :user_votes
end
