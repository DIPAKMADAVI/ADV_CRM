require "test_helper"

class CreativityControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get creativity_index_url
    assert_response :success
  end

  test "should get creativity_progress" do
    get creativity_creativity_progress_url
    assert_response :success
  end

  test "should get export_publishing" do
    get creativity_export_publishing_url
    assert_response :success
  end

  test "should get design_graphics" do
    get creativity_design_graphics_url
    assert_response :success
  end

  test "should get dept_Collaboration" do
    get creativity_dept_Collaboration_url
    assert_response :success
  end
end
