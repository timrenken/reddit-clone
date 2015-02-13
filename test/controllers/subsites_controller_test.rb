require 'test_helper'

class SubsitesControllerTest < ActionController::TestCase
  setup do
    @subsite = subsites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subsites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subsite" do
    assert_difference('Subsite.count') do
      post :create, subsite: { description: @subsite.description, name: @subsite.name, slug: @subsite.slug }
    end

    assert_redirected_to subsite_path(assigns(:subsite))
  end

  test "should show subsite" do
    get :show, id: @subsite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subsite
    assert_response :success
  end

  test "should update subsite" do
    patch :update, id: @subsite, subsite: { description: @subsite.description, name: @subsite.name, slug: @subsite.slug }
    assert_redirected_to subsite_path(assigns(:subsite))
  end

  test "should destroy subsite" do
    assert_difference('Subsite.count', -1) do
      delete :destroy, id: @subsite
    end

    assert_redirected_to subsites_path
  end
end
