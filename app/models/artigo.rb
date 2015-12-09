class Artigo < ActiveRecord::Base

	belongs_to :usuario
	belongs_to :categoria


end
