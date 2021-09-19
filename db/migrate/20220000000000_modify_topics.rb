class ModifyTopics < ActiveRecord::Migration[6.0]
  def change
    add_index :topics, :alias, unique: true
      Topic.create :alias => "management", :title => "Менеджмент"
      Topic.create :alias => "fentesy", :title => "Фентези"
      Topic.create :alias => "programming", :title => "Программирование"

  end
end