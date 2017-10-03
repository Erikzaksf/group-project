class User < ActiveRecord::Base
  validates :first_name, length: { minimum: 2, maximum: 15}
  validates :last_name, length: { minimum: 2, maximum: 15}
  validates :password, length: { minimum: 8, maximum: 25}

# validates :email, :presence => true,
#              :length => {:minimum => 3, :maximum => 254},
#              :uniqueness => true,
#              :email => true


end
