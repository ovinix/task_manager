class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = current_user.lists if current_user
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = current_user.lists.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /lists/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = current_user.lists.build(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.js
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.js
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Confirms the correct user.
    def correct_user
      @list = current_user.lists.find_by(id: params[:id])
      redirect_to root_path if @list.nil?
    end

    def list_params
      params.require(:list).permit(:title)
    end
end
