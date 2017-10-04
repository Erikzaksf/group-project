class User < ActiveRecord::Base
	validates :user_name, uniqueness: true
	validates :user_name, presence: true
	validates :password, presence: true
	validates :email, presence: true
	has_one(:profile)
	has_one(:preference)
end
