class AddTestcaseIdToQuery < ActiveRecord::Migration
  def change
    add_column :queries, :testcase_id, :integer
    add_index :queries, :testcase_id
  end
end
