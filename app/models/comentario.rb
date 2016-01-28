class Comentario < ActiveRecord::Base
  belongs_to :artigo
  belongs_to :usuario
end
