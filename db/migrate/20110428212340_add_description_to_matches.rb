class AddDescriptionToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :description, :text
  end

  def self.down
    remove_column :matches, :description
  end
end
