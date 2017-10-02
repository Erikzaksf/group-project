class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table(:users) do |t|
      t.column(:name, :string)
      t.column(:email, :varchar)
      t.column(:password, :string)

      t.timestamps()
    end
  end
end
