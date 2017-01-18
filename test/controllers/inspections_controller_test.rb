require 'test_helper'

class InspectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inspections_index_url
    assert_response :success
  end

  test "should get new" do
    get inspections_new_url
    assert_response :success
  end

  test "should get destroy" do
    get inspections_destroy_url
    assert_response :success
  end

end
