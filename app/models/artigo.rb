class Artigo < ActiveRecord::Base

	belongs_to :usuario
	belongs_to :categoria
	
	has_many :comentarios


end
