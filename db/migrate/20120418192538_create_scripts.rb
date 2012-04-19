class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.text :script
      t.text :expectedResult
      t.integer :testcase_id

      t.timestamps
    end
  end
end
