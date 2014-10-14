class Prompt < ActiveRecord::Base
	validates :text, presence: true
end
