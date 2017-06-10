class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :title
      t.text :note
      t.date :due_date
      t.integer :repeat
      t.boolean :urgent

      t.timestamps
    end
  end
end
