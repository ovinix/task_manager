require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:first)
    # sign_in @user
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", new_user_registration_path
    assert_select "a[href=?]", new_user_session_path
    
    sign_in @user

    get :index
    assert_response :success
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", destroy_user_session_path
    assert_select "a[href=?]", edit_user_registration_path
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_redirected_to new_user_session_path

    sign_in @user

    get :new
    assert_response :success

    post :new, format: :js
    assert_match CGI::escapeHTML('Add New Project'), response.body
  end

  test "should create project" do
    assert_no_difference('@user.projects.count') do
      post :create, project: { title: @project.title, user_id: @project.user_id }
    end

    sign_in @user

    assert_difference('@user.projects.count') do
      post :create, project: { title: @project.title, user_id: @project.user_id }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_redirected_to new_user_session_path

    sign_in @user

    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_redirected_to new_user_session_path

    sign_in @user

    get :edit, id: @project
    assert_response :success

    post :edit, format: :js, id: @project
    assert_match CGI::escapeHTML('Edit Project Title'), response.body
    assert_match @project.title.to_s, response.body
  end

  test "should update project" do
    patch :update, id: @project, project: { title: @project.title, user_id: @project.user_id }
    assert_redirected_to new_user_session_path

    sign_in @user

    patch :update, id: @project, project: { title: @project.title, user_id: @project.user_id }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_no_difference('@user.projects.count') do
      delete :destroy, id: @project
    end

    sign_in @user

    assert_difference('@user.projects.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
