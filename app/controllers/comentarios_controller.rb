class ComentariosController < ApplicationController
	def create
		@artigo = Artigo.find(params[:artigo_id])
		@comentario = @artigo.comentarios.create(params[:comentario].permit(:comentario))

		if @comentario.save
			redirect_to artigo_path(@artigo)
		else
			render 'new'
		end
	end
end

