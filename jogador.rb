require 'gosu'
require_relative 'Maca'
 
class Jogador

	def initialize (janela, maca)
		@maca = maca		
		@janela = janela
		@jogador = []
		@jogador[0] = Gosu::Image.new(@janela,"c.jpg",true)
		@jogador[1] = Gosu::Image.new(@janela,"c.jpg",true)
		@jogador[2] = Gosu::Image.new(@janela,"c.jpg",true)
		@jogador[3] = Gosu::Image.new(@janela,"c.jpg",true)
		@pos_x = []
		@pos_y = []
		@pos_x[0] = @janela.width / 2 - @jogador[0].width / 2 
		@pos_y[0] = @janela.height / 2 - @jogador[0].height / 2
		@pos_x[1] = @pos_x[0]
		@pos_y[1] = @pos_y[0]+30
		@pos_x[2] = @pos_x[0]
		@pos_y[2] = @pos_y[1]+30
		@pos_x[3] = @pos_x[0]
		@pos_y[3] = @pos_y[2]+30
		
		@d1 = []
		@d2 = []

		@d1[0] = "cima"
		@d1[1] = "cima"
		@d1[2] = "cima"
		@d1[3] = "cima"

		@d2[0] = "cima"
		@d2[1] = "cima"
		@d2[2] = "cima"
		@d2[3] = "cima"
	end
	
	def draw
		for i in 0..@jogador.size-1
			@jogador[i].draw(@pos_x[i], @pos_y[i], 1)
		end
	end
	
	def direita
		@d2[0] = @d1[0]
		@d1[0] = "direita"
		swing
		mover
	end
	
	def esquerda
		@d2[0] = @d1[0]
		@d1[0] = "esquerda"
		swing
		mover
	end
	def cima
		@d2[0] = @d1[0]
		@d1[0] = "cima"
		swing
		mover	
	end
	
	def baixo
		@d2[0] = @d1[0]
		@d1[0] = "baixo"
		swing
		mover
	end
	
	def swing
		for i in 1..@d1.size-1
			@d2[i] = @d1[i]
		end

		for i in 1..@d1.size-1
			@d1[i] = @d2[i-1]
		end
	end

	def mover
		parar = 0
		for i in 0..@jogador.size-1			
			if @d1[i] == "cima" then
				@pos_y[i] = @pos_y[i] - 30
				if i==0 then
					if @pos_y[0] < 0 then
						@pos_y[i] = @pos_y[i]+30						
						initialize(@janela,@maca)
						@janela.mudar
						@maca.comer
						parar = 1
						break
					end
				elsif	parar ==1 then
					@pos_y[i] = @pos_y[i]+30					
				end
				
			elsif	@d1[i] == "baixo" then
				@pos_y[i] = @pos_y[i] + 30
				if i==0 then
					if @pos_y[0] > 1270 then
						@pos_y[i] = @pos_y[i]-30						
						initialize(@janela,@maca)
						@janela.mudar
						@maca.comer
						parar = 1
						break
					end
				elsif	 parar == 1 then
					@pos_y[i] = @pos_y[i]-30					
				end
				
			elsif	@d1[i] == "esquerda" then
				@pos_x[i] = @pos_x[i] - 30 	
				if i==0 then
					if @pos_x[0] < -30 then
						@pos_x[i] = @pos_x[i]+30						
						initialize(@janela,@maca)
						@janela.mudar
						@maca.comer
						parar = 1
						break
					end
				elsif parar ==1 then
					@pos_x[i] = @pos_x[i]+30					
				end
				
			elsif	@d1[i] == "direita" then
				@pos_x[i] = @pos_x[i] + 30 	
				if i==0 then
					if @pos_x[0] > 1740 then
						@pos_x[i] = @pos_x[i]-30						
						initialize(@janela,@maca)
						@janela.mudar
						@maca.comer
						parar = 1
						break
					end
				elsif	parar ==1 then
					@pos_x[i] = @pos_x[i]-30
				end				
			end
			
			if i > 0 then	
				if Gosu::distance(@pos_x[0], @pos_y[0],@pos_x[i] , @pos_y[i]) < 20 then							
					initialize(@janela,@maca)
					@janela.mudar
					@maca.comer
					break
				end				
			end
		end	
		
	end

	def getPos_x
		return @pos_x[0]
	end

	def getPos_y
		return @pos_y[0]
	end

	def crescer
		@jogador[@jogador.size] = Gosu::Image.new(@janela,"c.jpg",true)
		
		if @d1[@d1.size-1] == "direita" then
			@pos_x[@pos_x.size] = @pos_x[@pos_x.size-1]-30
			@pos_y[@pos_y.size] = @pos_y[@pos_y.size-1]
		
		elsif @d1[@d1.size-1] == "esquerda" then	
			@pos_x[@pos_x.size] = @pos_x[@pos_x.size-1]+30
			@pos_y[@pos_y.size] = @pos_y[@pos_y.size-1]

		elsif @d1[@d1.size-1] == "baixo" then
			@pos_x[@pos_x.size] = @pos_x[@pos_x.size-1]
			@pos_y[@pos_y.size] = @pos_y[@pos_y.size-1]-30
		else			
			@pos_x[@pos_x.size] = @pos_x[@pos_x.size-1]
			@pos_y[@pos_y.size] = @pos_y[@pos_y.size-1]+30
		end

		@d1[@d1.size] = @d1[@d1.size-1]
		@d2[@d2.size] = @d2[@d2.size-1]
	end	

end