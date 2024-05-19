require "test_helper"

class UserFlowTest < ActionDispatch::IntegrationTest
   test "can create user" do
	get "/authors/new"
	assert_response :success

#test account creation
   post "/authors",
	params: {author: { firstname: "firstname", lastname: "lastname", email: "test@testmail.com"} }
	assert_response :redirect
	follow_redirect!
	assert_response :success

	assert_select "table" do
	assert_select "tr" do
	assert_select "th", "First name"
	assert_select "th", "Last name"
	assert_select "th", "email"
end

	assert_select "tr" do
        assert_select "td", "firstname"
        assert_select "td", "lastname"
        assert_select "td", "test@testmail.com"

end
end

#after redirect to the "Author list" and ensure the account exists
   get "/authors"
	assert_response :success
	assert_select "li", text: "firstname"
end

#create and edit personal data
   test "edit personal data" do
	author = Author.create(firstname: "firstname", lastname: "lastname", email: "test@testmail.com")

   get "/authors/#{author.id}/edit"
	assert_response :success

	patch "/authors/#{author.id}",
		params: {author: { firstname: "Secondname", lastname: "Trubkin", email: "test23@testmail.com"} }
	assert_response :redirect
	follow_redirect!
	assert_response :success

	assert_select "table" do
        assert_select "tr" do
        assert_select "th", "First name"
        assert_select "th", "Last name"
        assert_select "th", "email"
end

        assert_select "tr" do
        assert_select "td", "Secondname"
        assert_select "td", "Trubkin"
        assert_select "td", "test23@testmail.com"

end
end
end

#create and delete the author
	test "remove the author" do
	author = Author.create(firstname: "firstname", lastname: "lastname", email: "test@testmail.com")
	
	delete "/authors/#{author.id}"
	assert_response :redirect

	get "/authors"
	assert_response :success
	assert_select "li", text: "firstname", count: 0	
end
end
