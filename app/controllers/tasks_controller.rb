class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.create(task_params)
    if @task.errors.any?
      flash[:alert] = "※1字以上で入力してください。"
      redirect_to new_task_path
    else
      redirect_to tasks_path
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if @task.errors.any?
      flash[:alert] = "※1字以上で入力してください。"
      redirect_to edit_task_path
    else
      redirect_to tasks_path
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  
  private
    def task_params
      params.require(:task).permit(:title)
    end
end
