class User < ActiveRecord::Base
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, length: { minimum: 3 }
	has_secure_password
end
