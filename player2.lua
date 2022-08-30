player2 = Classe:extend()

function player2:new(x, y)
	--rounds--
	self.rounds = 0
	self.recomeca = 0
	--rounds--
	self.vida = 100
self.x = x + 100
self.y = y + 100
self.imagens = {}
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-idl-01.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-idl-02.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-idl-03.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-idl-04.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-run-01.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-run-02.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-run-03.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-run-04.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-run-05.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-run-06.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-atack-01.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-atack-02.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-atack-03.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-atack-01.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-pulo-00.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-pulo-00.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-pulo-00.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/subzero-defeat-00.png"))
self.esquerda = 'left'
self.direita = 'right'
self.ataque = '/'
self.img = self.imagens[1]
self.larguraIMG = 3
self.alturaIMG = 3
self.contador = 0
self.indoesquerda = 0
self.indodireita = 0
self.direcao = 0
self.jump = 'up'
self.pulando = 0
self.contadorpulo = 0
self.tpulo = 0
self.contp = 0
self.contadorataque = 0
self.conta = 0
--porrada--
self.levandop = 0
self.contporrada = 0
self.contporradaplus = 0
--pow--
self.tabelatiro = {}
--sons dos personagens
som_poder = love.audio.newSource("assets/sound/som_poder.mp3", "static")
som_andando = love.audio.newSource("assets/sound/som_run.mp3","static")
som_pulo = love.audio.newSource("assets/sound/som_pulo.mp3","static")
end

function player2:update(dt, telaa, telab)
	--hurtbox--
	self.hx = self.x + 36
	self.hy = self.y
	--ai--
	        if self.y < telaa/2 + 100 then
        self.contp = 1
        end
        if self.contp == 1 then
        self.contadorpulo = self.contadorpulo + 1
        end
            if self.contadorpulo > 25 and self.y < telaa/2 + 100 then
        self.y = self.y + 10
        end 
 			if self.y > telaa/2 + 100 or self.y == telaa/2 + 100 then
 				self.contadorpulo = 0
 			end
 if self.conta == 1 then
 	self.contadorataque = self.contadorataque + 1
 end
 if self.contadorataque > 33 then
self.contadorataque = 0
self.conta = 0
 end
	self.indoesquerda = 0
	self.indodireita = 0
	self.parado = 1
	self.larguraIMG = self.larguraIMG
self.contador= self.contador + 1
if self.contador > -1 and self.contador < 8  then
self.img = self.imagens[1]  
end
if self.contador > 8 and self.contador < 16 then
self.img = self.imagens[2]  
end
if self.contador > 16 and self.contador < 24 then
self.img = self.imagens[3]  
end
if self.contador > 24 and self.contador < 32 then
self.img = self.imagens[4]  
end
if self.contador > 32 then
	self.contador = 0
end

   if love.keyboard.isDown(self.esquerda) and self.x >-42 then
        self.x = self.x - 6
        self.indoesquerda = 1
        self.parado = 0
        self.direcao = 0
        if self.contador > -1 and self.contador < 8  then
		self.img = self.imagens[5]
		som_andando:play()  
		end
		if self.contador > 8 and self.contador < 16 then
		self.img = self.imagens[6]
		som_andando:play()  
		end
		if self.contador > 16 and self.contador < 24 then
		self.img = self.imagens[7]
		som_andando:play()  
		end
		if self.contador > 24 and self.contador < 32 then
		self.img = self.imagens[8]
		som_andando:play()  
		end
    end
   	if love.keyboard.isDown(self.direita) and self.x <732 then
   		self.parado = 0
   		self.x = self.x + 6
   		self.indodireita = 1
   		self.direcao = 1
   		if self.contador > -1 and self.contador < 8  then
		self.img = self.imagens[5]
		som_andando:play()  
		end
		if self.contador > 8 and self.contador < 16 then
		self.img = self.imagens[6]
		som_andando:play()  
		end
		if self.contador > 16 and self.contador < 24 then
		self.img = self.imagens[7]
		som_andando:play()  
		end
		if self.contador > 24 and self.contador < 32 then
		self.img = self.imagens[8]
		som_andando:play()  
		end
   	end
   	   	if love.keyboard.isDown(self.jump) then
   	   		if self.contadorpulo < 15 then
        	self.y = self.y - 15
    		end
   		if self.contador > -1 and self.contador < 8  then
		self.img = self.imagens[15]
		som_pulo:play()  
		end
		if self.contador > 8 and self.contador < 16 then
		self.img = self.imagens[16]
		som_pulo:play()  
		end
		if self.contador > 16 and self.contador < 24 then
		self.img = self.imagens[17]
		som_pulo:play()  
		end
	   end
	   if love.keyboard.isDown(self.ataque) and self.contadorataque < 6 and self.vida > 0 then
	   	if self.contadorataque == 0	then
	   	local tiro = tiro(self.x, self.y, self.direcao)
	   	table.insert(self.tabelatiro, tiro)
	   end
		   self.conta = 1
   		if self.contador > -1 and self.contador < 8  then
		self.img = self.imagens[13]
		som_poder:play()   
		end
		if self.contador > 8 and self.contador < 16 then
		self.img = self.imagens[12]
		som_poder:play()   
		end
		if self.contador > 16 and self.contador < 24 then
		self.img = self.imagens[13]
		som_poder:play()   
		end
		if self.contador > 24 and self.contador < 32 then
		self.img = self.imagens[12]
		som_poder:play()   
		end
   	end
	   	for i, tiro in pairs(self.tabelatiro) do
        tiro:update(dt)
                if tiro.x > 12000 or tiro.x < -12000 then
            	table.remove(self.tabelatiro, i)
        		end
    	end
    	--surra-
    	if self.levandop == 1 and self.contporrada < 10 then
			self.img = self.imagens[18] 
			self.contporradaplus = 1
   		end
   		if self.contporradaplus == 1 then
   			self.contporrada = self.contporrada + 1
   		end
   		if self.contporrada > 10 then
   			self.contporradaplus = 0
   			self.levandop = 0
   			self.contporrada = 0
   		end
    	--ai--
   --rounds--
   if self.recomeca == 1 then
   	self.x = telab/2 + 100
   	self.vida = 100
   	self.direcao = 0
   	self.recomeca = 0
   end
   --rounds--
end

function player2:draw()
	--love.graphics.rectangle("line", self.hx, self.hy, 30, 90)
		if self.direcao == 1 then
love.graphics.draw(self.img, self.x, self.y, 0.0, 0.7,0.7)
	end
		if self.direcao == 0 then
love.graphics.draw(self.img, self.x + 100, self.y, 0.0, -0.7,0.7)
	end
	for i, tiro in pairs(self.tabelatiro) do
        tiro:draw(dt)
    	end
end