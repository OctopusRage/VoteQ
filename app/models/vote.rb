class Vote < ActiveRecord::Base	
	belongs_to :user
	has_many :vote_options
	has_many :users, through: :user_votes

	validates :title, presence: true
	validates :user_id, presence:true
	validates :status, :inclusion => {:in => [true, false]}
	scope :desc, -> {order(created_at: :desc)}

	def generate_vote_options(options)
		options.each do |option|
			vote_option = self.vote_options.build(title: option)
			vote_option.save
		end 
	end

	def as_json(options={})     
	    {
	      id: id,
	      title: title,  
	      user_id: user_id,
	      status: status,
	      created_at: created_at, 
	      updated_at: updated_at,   
	      options: vote_options
	    }
  	end
end
