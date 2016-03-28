class ProjectsController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects if current_user
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = current_user.projects.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /projects/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.js
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.js
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Confirms the correct user.
    def correct_user
      @project = current_user.projects.find_by(id: params[:id])
      redirect_to root_path if @project.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title)
    end
end
