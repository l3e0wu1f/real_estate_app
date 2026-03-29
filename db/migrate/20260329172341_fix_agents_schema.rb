class FixAgentsSchema < ActiveRecord::Migration[7.1]
  def change
    add_column :agents, :photo_url, :string unless column_exists?(:agents, :photo_url)
    add_column :agents, :fullname, :string unless column_exists?(:agents, :fullname)
  end
end