class RemoveDescriptionFromFixtures < ActiveRecord::Migration
  def self.up
    remove_column :fixtures, :description
  end

  def self.down
    add_column :fixtures, :description, :text
  end
end
