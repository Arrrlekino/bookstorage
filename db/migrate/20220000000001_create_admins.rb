class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.belongs_to :role, null: false, foreign_key: true, default: Role.first.id

      t.timestamps
    end
  end
end
