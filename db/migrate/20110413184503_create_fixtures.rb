class CreateFixtures < ActiveRecord::Migration
  def self.up
    create_table :fixtures do |t|
      t.integer :player1_id
      t.integer :player2_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fixtures
  end
end
