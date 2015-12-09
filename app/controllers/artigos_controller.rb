class ArtigosController < ApplicationController
	before_action :achar_artigo, only: [:show]
	before_action :authenticate_usuario!, except: [:index, :show]
	#se usuario quiser entrar ele nao ser redirecionado para o sign up
	def index
		@artigos = Artigo.all.order("created_at DESC")
	end

	def show
	end


	def new
		@artigo = current_usuario.artigos.build
	end

	def create
		@artigo = current_usuario.artigos.build(artigo_parametros)
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
