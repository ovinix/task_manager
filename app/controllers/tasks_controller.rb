class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user
  before_action :set_task, except: [:create]

  def index
  end

  def show
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @task = @list.tasks.build(task_params)
    @task.user_id = current_user.id
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.js
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete
    respond_to do |format|
      if @task.update_attribute(:completed_at, @task.completed? ? nil : Time.now)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.js
      else
        format.html
        format.js
      end
    end   
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Task was successfully destroyed.' }
      format.js
    end
  end

  private
    def correct_user
      @list = current_user.lists.find_by(id: params[:list_id])
      redirect_to root_path if @list.nil?
    end

    def set_task
      @task = @list.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:content)
    end
end
