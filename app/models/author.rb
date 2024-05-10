class Author < ApplicationRecord	
	has_many :articles, dependent: :destroy
	
	validates :firstname, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
