  class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
    VALID_GENDER = %w(male female)

  	devise :database_authenticatable, :registerable,
   		   :recoverable, :rememberable, :trackable, :validatable

  	validates :auth_token, uniqueness: true, :on => :create
    validates :email, presence: true, :on => :create
    validates :password, presence: true, :on => :create
  	validates :gender, inclusion: { in: VALID_GENDER },
    allow_blank: true, case_sensitive: false
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

    def as_json_forgot
      {
        id: id,
        email: email,
        forgot_code: forgot_code
      }
    end

    def as_json_credential(options={})
      {
        id: id, 
        email: email, 
        fullname: fullname, 
        dateofbirth: dateofbirth,
        bio: bio,
        latitude: latitude, 
        longitude: longitude,
        auth_token: auth_token
      }      
    end

    def as_json(options={})
      {
        id: id, 
        email: email, 
        fullname: fullname, 
        dateofbirth: dateofbirth,
        bio: bio,
        latitude: latitude, 
        longitude: longitude
      }      
    end
end
