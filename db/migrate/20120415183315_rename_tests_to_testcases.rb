class RenameTestsToTestcases < ActiveRecord::Migration
  def self.up
    rename_table :tests, :testcases
  end

  def self.down
    rename_table :testcases, :tests
  end
end
