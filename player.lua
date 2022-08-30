player = Classe:extend()

function player:new(x, y)
	--rounds--
	self.rounds = 0
	self.recomeca = 0
	--rounds--
	self.vida = 100
self.x = x - 250
self.y = y + 100
self.imagens = {}
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-idle-2-00.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-idle-2-01.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-idle-2-02.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-idle-2-03.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-run-00.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-run-01.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-run-02.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-run-03.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-run-04.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-run-05.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-attack1-01.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-attack1-02.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-attack1-03.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-attack1-04.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-crnr-jmp-00.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-crnr-jmp-01.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-crnr-jmp-02.png"))
table.insert(self.imagens, love.graphics.newImage("assets/img/adventurer-hurt-00.png"))
self.esquerda = 'a'
self.direita = 'd'
self.ataque = 'f'
self.img = self.imagens[1]
self.larguraIMG = 3
self.alturaIMG = 3
self.contador = 0
self.indoesquerda = 0
self.indodireita = 0
self.direcao = 1
self.jump = 'w'
self.pulando = 0
self.contadorpulo = 0
self.tpulo = 0
self.contp = 0
self.contadorataque = 0
self.conta = 0
--levando porrada--
self.levandop = 0
self.contporrada = 0
self.contporradaplus = 0
--levou
--sons dos personagens
som_ataque = love.audio.newSource("assets/sound/som_hit.mp3", "static")
som_andando = love.audio.newSource("assets/sound/som_run.mp3","static")
som_pulo = love.audio.newSource("assets/sound/som_pulo.mp3","static")
end

function player:update(dt, telaa, telab)
	--hitbox--
	self.ya = self.y + 50
	if self.direcao == 1 then
		self.xa = self.x + 146
	end
	if self.direcao == 0 then
		self.xa = self.x + 10
	end
	--hitbox--
	--hurtbox--
	self.hx = self.x + 65
	self.hy = self.y + 20
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

   if love.keyboard.isDown(self.esquerda) and self.x > -72 then
        self.x = self.x - 6
        self.indoesquerda = 1
        self.parado = 0
        self.direcao = 0
        som_andando:play()
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
   	if love.keyboard.isDown(self.direita) and self.x < 712 then
   		self.parado = 0
   		self.x = self.x + 6
   		self.indodireita = 1
   		self.direcao = 1
   		som_andando:play()
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
   	   		som_pulo:play() 
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
	   if love.keyboard.isDown(self.ataque) and self.contadorataque < 6  and self.vida > 0 then
		   self.conta = 1
   		if self.contador > -1 and self.contador < 8  then
		self.img = self.imagens[13]
		som_ataque:play()   
		end
		if self.contador > 8 and self.contador < 16 then
		self.img = self.imagens[12]
		som_ataque:play()   
		end
		if self.contador > 16 and self.contador < 24 then
		self.img = self.imagens[13]
		som_ataque:play()   
		end
		if self.contador > 24 and self.contador < 32 then
		self.img = self.imagens[12]
		som_ataque:play()   
		end
   	end
   	--surra--
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
   --surra--
   --rounds--
   if self.recomeca == 1 then
   	self.x = telab/2 - 250
   	self.vida = 100
   	self.direcao = 1
   	self.recomeca = 0
   end
   --rounds--

end

function player:draw()
	--love.graphics.rectangle("fill", self.xa, self.ya, self.larguraIMG, self.alturaIMG)
	--love.graphics.rectangle("line", self.hx, self.hy, 30, 80)
		if self.direcao == 1 then
love.graphics.draw(self.img, self.x, self.y, 0.0, self.larguraIMG,self.alturaIMG)
	end
		if self.direcao == 0 then
love.graphics.draw(self.img, self.x + 160, self.y, 0.0, -self.larguraIMG,self.alturaIMG)
	end
end