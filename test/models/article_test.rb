require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should nnot save article without title" do
	article = Article.new
	assert_not article.save, "Saved the article without a title"
end

  test "should report error" do
	assert_raises(NameError) do
	some_undefined_variable
	assert true
end
end
end
