class TasksController < ApplicationController
  def index
    @tasks = Tasks.all
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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.name = params[:task][:name]
    task.done = params[:task][:done]
    task.save
    redirect_to '/'
  end
end
