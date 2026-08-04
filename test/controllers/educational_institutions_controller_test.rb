require "test_helper"

class EducationalInstitutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @educational_institution = educational_institutions(:one)
  end

  test "should get index" do
    get educational_institutions_url, as: :json
    assert_response :success
  end

  test "should create educational_institution" do
    assert_difference("EducationalInstitution.count") do
      post educational_institutions_url, params: { educational_institution: { cnpj: @educational_institution.cnpj, name: @educational_institution.name, tipo: @educational_institution.tipo } }, as: :json
    end

    assert_response :created
  end

  test "should show educational_institution" do
    get educational_institution_url(@educational_institution), as: :json
    assert_response :success
  end

  test "should update educational_institution" do
    patch educational_institution_url(@educational_institution), params: { educational_institution: { cnpj: @educational_institution.cnpj, name: @educational_institution.name, tipo: @educational_institution.tipo } }, as: :json
    assert_response :success
  end

  test "should destroy educational_institution" do
    assert_difference("EducationalInstitution.count", -1) do
      delete educational_institution_url(@educational_institution), as: :json
    end

    assert_response :no_content
  end
end
