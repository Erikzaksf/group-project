class User < ActiveRecord::Base
  validates :first_name, length: { minimum: 2, maximum: 15}
  validates :last_name, length: { minimum: 2, maximum: 15}
  validates :password, length: { minimum: 1, maximum: 25}

end
