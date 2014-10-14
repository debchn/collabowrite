class User < ActiveRecord::Base
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #courtesy of https://www.railstutorial.org/book/modeling_users
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }
	has_secure_password
end
