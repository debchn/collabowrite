class Passage < ActiveRecord::Base
	acts_as_nested_set
	belongs_to :prompt
	belongs_to :user
	validates :text, presence: true
end
