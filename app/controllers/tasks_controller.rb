class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]
  def home; end

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to task_path(@task)
  end

  def show; end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.delete
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
