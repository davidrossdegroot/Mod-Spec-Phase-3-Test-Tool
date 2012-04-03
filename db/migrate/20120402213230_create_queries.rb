class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :DirectAddress
      t.boolean :pass
      t.references :test

      t.timestamps
    end
    add_index :queries, :test_id
  end
end
