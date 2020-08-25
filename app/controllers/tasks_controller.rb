class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(strong_params)
    if @task.save
      redirect_to task_path(@task.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(strong_params)
      redirect_to task_path(@task.id)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def strong_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
