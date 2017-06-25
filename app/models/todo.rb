class Todo < ApplicationRecord
  def self.search(todo_search)
    @todos = Todo.all
    @todos = @todos
      .where(user_id: todo_search.user_id) if todo_search.user_id.present?
    @todos = @todos
      .where('title like ?', "#{todo_search.title}%") if todo_search.title.present?
    @todos = @todos
      .where('note like ?', "%#{todo_search.note}%") if todo_search.note.present?
    @todos = @todos
      .where(due_date: todo_search.due_date_from..todo_search.due_date_to)
    @todos = @todos
      .where(completed_on: todo_search.completed_on_from..todo_search.completed_on_to)
    @todos = @todos
      .where(repeat: todo_search.repeat) if todo_search.repeat.present?
    @todos = @todos
      .where(urgent: todo_search.urgent) # if todo_search.urgent.present?
    @todos
  end
end
