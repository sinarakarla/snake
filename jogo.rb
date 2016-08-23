require 'gosu'
require_relative 'Jogador'
require_relative 'Maca'

class Cobrinha < Gosu::Window

  def initialize 
    super(1770,1300,false)
    self.caption = "Cobrinha"
	
	@maca = Maca.new(self)
	@jogador = Jogador.new(self, @maca)
	@imagem_fundo = Gosu::Image.new(self, "fundo.jpg", true)
	@cont = 0
	@m = ""
  end
  
  def update
	if @cont == 7 then
			@cont = 0
			if @m == "cima"  then
				@jogador.cima
			elsif  @m == "baixo" then
				@jogador.baixo
			elsif @m == "esquerda" then
				@jogador.esquerda
			elsif @m == "direita" then
				@jogador.direita
			end

			if Gosu::distance(@jogador.getPos_x, @jogador.getPos_y, @maca.getX, @maca.getY) < 30 then
				@maca.comer
				@jogador.crescer
			end	
			if (button_down?(Gosu::Button::KbRight)) then
				if @m != "esquerda"then
					@m = "direita"    
				end
			elsif (button_down?(Gosu::Button::KbLeft)) then
				if @m != "direita" then
					@m = "esquerda"
				end
			elsif (button_down?(Gosu::Button::KbDown)) then
				if @m != "cima" then
					@m = "baixo"
				end  
			elsif (button_down?(Gosu::Button::KbUp)) then
				if @m != "baixo" then
					@m = "cima"
				end
			end
	end
		@cont = @cont+1
  end

  def draw
    @imagem_fundo.draw(0, 0, 0)
    @jogador.draw
	@maca.draw
  end 

  def mudar
    @m = "cima"
  end 
end
jogo = Cobrinha.new
jogo.show
