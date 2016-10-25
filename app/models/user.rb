class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  VALID_GENDER = %w(male female)
  DEFAULT_DATE_OF_BIRTH = "1970-01-01T07:00:00Z"

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

  validates :auth_token, uniqueness: true, :on => :create
  validates :email, presence: true, :on => :create
  validates :fullname, presence: true
  validates :password, presence: true, :on => :create
  validates :gender, inclusion: { in: VALID_GENDER },
  allow_blank: true, case_sensitive: false
  before_create :generate_authentication_token!, :set_lower_email
  has_many :votes
  has_many :user_votes
  #has_many :votes, :through => :user_votes
  #has_many :user_votes

  def generate_authentication_token!
    begin
        self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def dob
    (dateofbirth.present?)? (dateofbirth+0.hours).iso8601 : DEFAULT_DATE_OF_BIRTH
  end

  def set_lower_email
    self.email = self.email.downcase  
  end  

  def as_json_forgot
    {
      id: id,
      email: email,
      forgot_code: forgot_code
    }
  end

  def age(dob)
    now = Time.now.utc.to_date
    if dob
      now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end
  end

  def as_simple
    {
      id: id, 
      email: email,
      fullname: fullname
    }
  end

  def credential_as_json
    {
      id: id, 
      email: email, 
      fullname: fullname, 
      dateofbirth: dateofbirth,
      age: age(dateofbirth) || 0,
      gender: gender,
      bio: bio,
      latitude: latitude, 
      longitude: longitude,
      phone_number:phone_number,
      job: job, 
      city: city,
      verified: verified,
      auth_token: auth_token
    }      
  end

  def as_json(options={})
    {
      id: id, 
      email: email, 
      fullname: fullname, 
      dateofbirth: dateofbirth,
      age: age(dateofbirth) || 0,
      gender: gender,
      bio: bio,
      latitude: latitude, 
      longitude: longitude,
      phone_number:phone_number,
      job: job, 
      city: city,
      verified: verified
    }      
  end
end
