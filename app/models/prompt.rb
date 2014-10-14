class Prompt < ActiveRecord::Base
	has_many :passages
	belongs_to :user
	validates :text, presence: true
end
