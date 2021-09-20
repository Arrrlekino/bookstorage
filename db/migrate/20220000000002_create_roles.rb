class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :alias
      t.string :group

      t.timestamps
    end
  end
end
