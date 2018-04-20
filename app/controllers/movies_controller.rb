class MoviesController < ApplicationController
	def index
		@movies = Movie.all
		@client = TmdbClient.new
	end 

	def new
	end 

	def create
		@client = TmdbClient.new
		@id = @client.movie_search_by_name(params[:q])
		Movie.create(["movie_id": @id])
		redirect_to show_path(id: @id)
	end 

	def show
		@movie = Movie.where("movie_id" == params[:id].to_i)
		@client = TmdbClient.new
		@id = params[:id].to_i
	end



end
