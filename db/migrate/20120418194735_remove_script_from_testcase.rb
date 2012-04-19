class RemoveScriptFromTestcase < ActiveRecord::Migration
  def up
    remove_column :testcases, :script
  end

  def down
    add_column :testcases, :script, :string
  end
end
