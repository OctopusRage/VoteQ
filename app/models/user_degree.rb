class UserDegree < ActiveRecord::Base
	validates :degree, presence: true
end
