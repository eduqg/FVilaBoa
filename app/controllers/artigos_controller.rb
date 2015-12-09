class ArtigosController < ApplicationController
	before_action :achar_artigo, only: [:show]
	def index
	end

	def show
	end


	def new
		@artigo = Artigo.new
	end

	def create
		@artigo = Artigo.new(artigo_parametros)
		if @artigo.save
			redirect_to @artigo
		else
			render 'new'
		end
	end

	private

	def artigo_parametros
		params.require(:artigo).permit(:Título, :Conteúdo)
	end

	def achar_artigo
		@artigo = Artigo.find(params[:id])
	end

end
