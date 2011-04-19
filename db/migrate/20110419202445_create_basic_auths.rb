class CreateBasicAuths < ActiveRecord::Migration
  def self.up
    create_table :basic_auths do |t|
      t.string :user
      t.string :secret

      t.timestamps
    end
  end

  def self.down
    drop_table :basic_auths
  end
end
