class ArtigosController < ApplicationController

	def index
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

end
