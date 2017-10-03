class CreateUsers < ActiveRecord::Migration[5.1]
  def change
  	create_table(:users) do | u|
  		u.column(:user_name, :varchar)
  		u.column(:password, :varchar)
  		u.timestamp()
  	end
  end
end
