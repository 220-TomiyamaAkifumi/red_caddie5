class Todo < ApplicationRecord
  def self.search(todo_search)
    @todos = Todo.all
    @todos = @todos
      .where(due_date: todo_search.due_date_from..todo_search.due_date_to)
    @todos = @todos
      .where(completed_on: todo_search.completed_on_from..todo_search.completed_on_to)
  end
end
