json.extract! todo, :id, :user_id, :title, :note, :due_date, :completed_on, :repeat, :urgent, :created_at, :updated_at
json.url todo_url(todo, format: :json)
