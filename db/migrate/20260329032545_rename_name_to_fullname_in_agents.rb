class RenameNameToFullnameInAgents < ActiveRecord::Migration[7.1]
  def change
    if column_exists?(:agents, :name)
      rename_column :agents, :name, :fullname
    end
  end
end