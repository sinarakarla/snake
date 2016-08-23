require 'gosu'
 
class Maca
	def initialize(janela)
		@janela = janela
		@maca = Gosu::Image.new(@janela,"comida.jpg",true)
		@pos_x = 500
		@pos_y = 500
	end
		
	def draw
		@maca.draw(@pos_x, @pos_y, 0)
	end
	
	def comer
		@pos_x = Random.rand(1200)
		@pos_y = Random.rand(1200)
	end

	def getX
		return @pos_x
	end

	def getY
		return @pos_y
	end
end