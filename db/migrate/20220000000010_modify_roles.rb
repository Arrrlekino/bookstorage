class ModifyRoles < ActiveRecord::Migration[6.0]
  def change
    add_index :roles, :alias, unique: true
      Role.create :alias => "manageadmin", :title => "Manage admin"
      Role.create :alias => "manageauthor", :title => "Manage author"
      Role.create :alias => "managebook", :group => "Manage book"
      Role.create :alias => "managetopic", :group => "Manage topic"
  end
end