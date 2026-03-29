class InstallSolidQueueSchema < ActiveRecord::Migration[8.1]
  def change
    create_table "solid_queue_jobs", force: :cascade do |t|
      t.string "queue_name", null: false
      t.string "class_name", null: false
      t.text "arguments", null: false
      t.integer "priority", default: 0, null: false
      t.string "active_job_id"
      t.string "concurrency_key"
      t.datetime "scheduled_at"
      t.datetime "finished_at"
      t.string "state", default: "pending", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "solid_queue_ready_executions", force: :cascade do |t|
      t.bigint "job_id", null: false
      t.datetime "created_at", null: false
    end

    create_table "solid_queue_blocked_executions", force: :cascade do |t|
      t.bigint "job_id", null: false
      t.string "concurrency_key", null: false
      t.datetime "created_at", null: false
    end

    create_table "solid_queue_scheduled_executions", force: :cascade do |t|
      t.bigint "job_id", null: false
      t.datetime "scheduled_at", null: false
    end

    create_table "solid_queue_failed_executions", force: :cascade do |t|
      t.bigint "job_id", null: false
      t.string "error_class"
      t.text "error_message"
      t.text "error_backtrace"
      t.datetime "created_at", null: false
    end

    create_table "solid_queue_processes", force: :cascade do |t|
      t.string "kind", null: false
      t.string "hostname", null: false
      t.integer "pid", null: false
      t.datetime "last_heartbeat_at", null: false
      t.datetime "created_at", null: false
    end
  end
end