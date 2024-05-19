json.extract! author_scaffold, :id, :firstname, :lastname, :email, :created_at, :updated_at
json.url author_scaffold_url(author_scaffold, format: :json)
