class Vote < ActiveRecord::Base	
	belongs_to :user
	has_many :vote_options
	has_many :users, through: :user_votes

	validates :title, presence: true

	def generate_vote_options(options)
		options.each do |option|
			vote_option = self.vote_options.build(title: option)
			vote_option.save
		end 
	end
end
