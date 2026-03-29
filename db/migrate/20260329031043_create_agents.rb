class CreateAgents < ActiveRecord::Migration[8.1]
  def change
    create_table :agents do |t|
      t.string :fullname
      t.string :phone
      t.string :bio

      t.timestamps
    end
  end
end
