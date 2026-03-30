class RebuildSolidQueueSchema < ActiveRecord::Migration[8.1]
  def change
    change_table :solid_queue_jobs do |t|
      t.string   :active_job_id
      t.integer  :priority, default: 0, null: false
      t.string   :concurrency_key
      t.datetime :scheduled_at
      t.datetime :finished_at
      t.string   :state, null: false, default: "pending"
      t.text     :arguments, null: false, default: "--- []\n"
    end

    add_index :solid_queue_jobs, :active_job_id
    add_index :solid_queue_jobs, :priority
    add_index :solid_queue_jobs, :concurrency_key
  end
end