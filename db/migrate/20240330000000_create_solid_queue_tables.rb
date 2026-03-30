class CreateSolidQueueTables < ActiveRecord::Migration[7.1]
  def change
    create_table :solid_queue_jobs do |t|
      t.string :queue_name, null: false
      t.string :class_name, null: false
      t.jsonb :arguments, null: false, default: []
      t.datetime :scheduled_at
      t.datetime :finished_at
      t.string :state, null: false, default: "pending"
      t.timestamps
    end

    create_table :solid_queue_processes do |t|
      t.string :kind, null: false
      t.string :hostname, null: false
      t.integer :pid, null: false
      t.datetime :last_heartbeat_at, null: false
      t.timestamps
    end

    create_table :solid_queue_scheduled_executions do |t|
      t.references :job, null: false, foreign_key: { to_table: :solid_queue_jobs }
      t.datetime :run_at, null: false
      t.timestamps
    end

    create_table :solid_queue_failed_executions do |t|
      t.references :job, null: false, foreign_key: { to_table: :solid_queue_jobs }
      t.text :error_message
      t.text :error_backtrace
      t.timestamps
    end
  end
end