class CreateToDoLists < ActiveRecord::Migration[7.2]
  def change
    create_table :to_do_lists do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.time :due_time
      t.integer :priority, default: 0
      t.integer :statuses, default: 0
      t.integer :category, default: 0
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
