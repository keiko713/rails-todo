class TodosController < ApplicationController
  before_action :set_todo, only: [:finish, :destroy]

  # GET /todos
  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  # GET /todos/1
  def finish
    @todo.update(finished: true)
    redirect_to :todos
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)
    @todo.finished = false

    @todo.save
    redirect_to :todos
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    redirect_to :todos
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:name, :finished)
    end
end
