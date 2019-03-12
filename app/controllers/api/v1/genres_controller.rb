class Api::V1::GenresController < ApplicationController

	eval(IO.read('doc/api_doc/genres/index.html'), binding)
	def index
    @genres = Genre.all
    render json: {status: 200, data: { :genres => @genres.as_json}, :message =>"All Genres"}
  end
end
