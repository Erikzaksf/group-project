class CreateSubjectsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table(:subjects_users) do |t|
      t.column(:subject_id, :int)
      t.column(:user_id, :int)


      t.timestamps()
    end
  end
end
