class AddQueueNameToSolidQueueReadyExecutions < ActiveRecord::Migration[8.1]
  def change
    add_column :solid_queue_ready_executions, :queue_name, :string, null: false, default: "default"
    add_index :solid_queue_ready_executions, :queue_name
  end
end