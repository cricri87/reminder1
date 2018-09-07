class RenameOldTableToNewTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :fullname, :last_name
  end
end
