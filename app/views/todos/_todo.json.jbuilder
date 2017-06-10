# frozen_string_literal: true

json.extract! todo, :id, :user_id, :title, :note, :due_date, :repeat, :urgent,
              :created_at, :updated_at
json.url todo_url(todo, format: :json)
