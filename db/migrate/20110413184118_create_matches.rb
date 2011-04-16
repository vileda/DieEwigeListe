class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.integer :score1
      t.integer :score2
      t.integer :fixture_id

      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
