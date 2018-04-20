class Movie < ApplicationRecord
	validates :movie_id, uniqueness: true
end
