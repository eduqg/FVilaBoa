class ArtigosController < ApplicationController
	before_action :achar_artigo, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_usuario!, except: [:index, :show]
	#se usuario quiser entrar ele nao ser redirecionado para o sign up
	def index
		if params[:categoria].blank?
			@artigos = Artigo.all.order("created_at DESC")
		else
			@categoria_id = Categoria.find_by(nome: params[:categoria]).id
			@artigos = Artigo.where(categoria_id: @categoria_id).order("created_at DESC")
		end


	end
	#se nao estiver selecionado um artigo, ira listar todos
	#se nao, ira listar apenas daquela categoria

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

	def edit
	end

	def update
		if @artigo.update(artigo_parametros)
			redirect_to @artigo
		else
			render 'edit'
		end
	end

	def destroy
		@artigo.destroy
		redirect_to root_path
	end

	def sobre
	end

	private

	def artigo_parametros
		params.require(:artigo).permit(:Título, :Conteúdo, :categoria_id)
	end

	def achar_artigo
		@artigo = Artigo.find(params[:id])
	end


end
