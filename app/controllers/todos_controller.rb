class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # POST /todos/search
  def search
    @todo_search = Forms::TodoSearch.new(search_params)
    @todos = Todo.where(search_params)
    # redirect_to todos_path
    render :index
  end

  # GET /todos
  def index
    @todo_search = Forms::TodoSearch.new
    @todos = Todo.all
  end

  # GET /todos/1
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo, notice: 'Todo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: 'Todo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:user_id, :title, :note, :due_date, :completed_on, :repeat, :urgent)
    end

    def search_params
      params.require(:forms_todo_search)
        .permit(:user_id, :title, :note, :due_date, :completed_on, :repeat, :urgent).reject { |_k, v| v.blank? }
    end
end
