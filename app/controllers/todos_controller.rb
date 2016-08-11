class TodosController < ApplicationController
  before_filter :authenticate
  
  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    current_user.todos.create(todo_params)
    redirect_to todos_path
  end

  def complete!
    current_user.todos.find(params[:todo_id]).touch :completed_at
  end

  private 

  def todo_params
      params.require(:todo).permit(:title)
  end

end
