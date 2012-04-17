class AddExpectedResultToTestcases < ActiveRecord::Migration
  def change
    add_column :testcases, :expected_result, :string
  end
end
