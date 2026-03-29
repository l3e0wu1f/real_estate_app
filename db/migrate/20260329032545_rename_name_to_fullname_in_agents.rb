class RenameNameToFullnameInAgents < ActiveRecord::Migration[7.1]
  def change
    rename_column :agents, :name, :fullname
  end
end