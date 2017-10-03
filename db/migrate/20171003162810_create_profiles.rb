class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
  	create_table(:preferences) do |p|
  		p.column(:user_id, :int)
  		p.column(:subject, :varchar)
  		p.column(:level, :varchar)
  		p.column(:location, :varchar)
  		p.timestamp
  	end
  end
end
