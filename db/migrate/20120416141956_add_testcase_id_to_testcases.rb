class AddTestcaseIdToTestcases < ActiveRecord::Migration
  def change
    add_column :testcases, :testcase_id, :integer

  end
end
