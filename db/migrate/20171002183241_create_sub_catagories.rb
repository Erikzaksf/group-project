class CreateSubCatagories < ActiveRecord::Migration[5.1]
  def change
    create_table(:sub_catagories) do |t|
      t.column(:title, :string)
      t.column(:description, :string)

      t.timestamps()
    end
  end
end
