  class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
   		   :recoverable, :rememberable, :trackable, :validatable

  	validates :auth_token, uniqueness: true, :on => :create
    validates :email, presence: true, :on => :create
    validates :password, presence: true, :on => :create
  	before_create :generate_authentication_token!
    has_many :votes
    has_many :user_votes
    #has_many :votes, :through => :user_votes
    #has_many :user_votes

  	def generate_authentication_token!
    	begin
      		self.auth_token = Devise.friendly_token
    	end while self.class.exists?(auth_token: auth_token)
  	end
end
