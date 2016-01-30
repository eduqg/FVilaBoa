class ComentariosController < ApplicationController
	def create
		@artigo = Artigo.find(params[:artigo_id])
		@comentario = @artigo.comentarios.create(params[:comentario].permit(:comentario))

		@comentario.usuario_id = current_usuario.id if current_usuario
		@comentario.save

		if @comentario.save
			redirect_to artigo_path(@artigo)
		else
			render 'new'
		end
	end

	def destroy
		@artigo = Artigo.find(params[:artigo_id])
		@comentario = @artigo.comentarios.find(params[:id])
		@comentario.destroy
		redirect_to artigo_path(@artigo)
	end

	def edit
		@artigo = Artigo.find(params[:artigo_id])
		@comentario = @artigo.comentarios.find(params[:id])
	end

	def update
		@artigo = Artigo.find(params[:artigo_id])
		@comentario = @artigo.comentarios.find(params[:id])
	
		if @comentario.update(params[:comentario].permit(:comentario))
			redirect_to artigo_path(@artigo)
		else
			render 'edit'
		end
	end
end

