require "application_system_test_case"

class AuthorsTest < ApplicationSystemTestCase
    test "visiting the index" do
      visit authors_url
      assert_selector "h1", text: "Author List"
   end

    test "should create account" do
	visit root_path
	click_on "Subscribe to make post!"

	fill_in "Firstname", with: "Firstname"
	fill_in "Lastname", with: "Lastname"
	fill_in "Email", with: "test@email.com"

	click_on "Create Author"

	visit root_path
	click_on "New Article"
	
	fill_in "Title", with: "Test Title for a test"
	fill_in "Body", with: "Creat a body for a test"
	select "Firstname", from: "Author"
	
	click_on "Creat Article"

	visit root_path
	assert_selector "h1", text: "Articles"
end
end
