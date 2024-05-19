require "test_helper"

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get authors_url(Author.first), headers: { "HTTP_REFERER" => "http://example.com/authors" }
    assert_response :success
  end

  test "should get new" do
    get new_author_url
    assert_response :success
  end

  test "should create author" do
    assert_difference("Author.count") do
      post authors_url, params: { author: { firstname: "firstname", lastname: "lastname", email: "email@test.com" } }, as: :json
    end

    assert_redirected_to author_url(Author.last)
  end

  test "should show author" do
    author = authors(:one)
    get author_url(@author)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_url(@author)
    assert_response :success
  end

  test "should update author" do
    author = authors(:one)
    patch author_url(@author), params: { author: { firstname: "Secondtest", email: "email123@test.com"  } }, xhr: true
    assert_redirected_to author_url(@author)
    author.reload
    assert_equal "Secondtest", author.firstname
  end

  test "should destroy author" do
    author = authors(:one)
    assert_difference("Author.count", -1) do
      delete author_url(@author)
    end

    assert_redirected_to root_path
  end
end
