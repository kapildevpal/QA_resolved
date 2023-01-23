require "test_helper"

class EmpCompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get emp_companies_index_url
    assert_response :success
  end
end
