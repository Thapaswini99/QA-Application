class Question < ApplicationRecord
	belongs_to :user
	has_many :answers
	validates :qtext, presence: true, length: {minimum: 5}
end
