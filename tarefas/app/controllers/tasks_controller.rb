class TasksController < ApplicationController
  def index
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new
    task.name = params[:task][:name]
    task.done = false
    task.save
    redirect_to '/'
  end
end
