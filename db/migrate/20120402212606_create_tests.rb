class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :purpose
      t.text :steps
      t.string :TcId
      t.text :script

      t.timestamps
    end
  end
end
