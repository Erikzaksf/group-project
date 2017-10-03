class CreatePreferences < ActiveRecord::Migration[5.1]
  def change
  	create_table(:profiles) do |p|
  		p.column(:user_id, :int)
  		p.column(:name, :varchar)
  		p.column(:birthday, :string)
  		p.column(:gender, :varchar)
  		p.column(:zip, :int)
  		p.column(:photo, :string)
  		p.timestamp
  		
  	end
  end
end
