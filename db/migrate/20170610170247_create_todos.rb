class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :title
      t.text :note
      t.date :due_date
      t.date :completed_on
      t.integer :repeat
      t.boolean :urgent

      t.timestamps
    end

    add_index :todos, [:user_id, :due_date], order: { due_date: :asc }
  end
end
