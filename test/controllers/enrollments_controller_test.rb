require "test_helper"

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrollment = enrollments(:one)
  end

  test "should get index" do
    get enrollments_url, as: :json
    assert_response :success
  end

  test "should create enrollment" do
    assert_difference("Enrollment.count") do
      post enrollments_url, params: { enrollment: { course_name: @enrollment.course_name, course_total_value: @enrollment.course_total_value, due_date: @enrollment.due_date, educational_institution_id: @enrollment.educational_institution_id, max_payments: @enrollment.max_payments, student_id: @enrollment.student_id } }, as: :json
    end

    assert_response :created
  end

  test "should show enrollment" do
    get enrollment_url(@enrollment), as: :json
    assert_response :success
  end

  test "should update enrollment" do
    patch enrollment_url(@enrollment), params: { enrollment: { course_name: @enrollment.course_name, course_total_value: @enrollment.course_total_value, due_date: @enrollment.due_date, educational_institution_id: @enrollment.educational_institution_id, max_payments: @enrollment.max_payments, student_id: @enrollment.student_id } }, as: :json
    assert_response :success
  end

  test "should destroy enrollment" do
    assert_difference("Enrollment.count", -1) do
      delete enrollment_url(@enrollment), as: :json
    end

    assert_response :no_content
  end
end
