class AddPhotoUrlToAgents < ActiveRecord::Migration[8.1]
  def change
    add_column :agents, :photo_url, :string
  end
end
