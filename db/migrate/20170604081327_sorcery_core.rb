# frozen_string_literal: true

class SorceryCore < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, limit: 128
      t.string :crypted_password
      t.string :salt

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
