class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
  	change_column :meetups, :date, :string
  end
end
