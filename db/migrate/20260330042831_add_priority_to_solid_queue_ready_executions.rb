class AddPriorityToSolidQueueReadyExecutions < ActiveRecord::Migration[8.1]
  def change
    add_column :solid_queue_ready_executions, :priority, :integer, null: false, default: 0
    add_index :solid_queue_ready_executions, :priority
  end
end