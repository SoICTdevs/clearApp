require 'test_helper'

class Admin::ApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_applications_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_applications_update_url
    assert_response :success
  end

  test "should get index" do
    get admin_applications_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_applications_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_applications_destroy_url
    assert_response :success
  end

end
