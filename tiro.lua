tiro = Classe:extend()

function tiro:new(x, y, direcao)
self.direcao = direcao
self.x = x
self.y = y + 50
    self.largura = 2
    self.altura = 15
    self.imagens = {}
    table.insert(self.imagens, love.graphics.newImage("assets/img/personagem1/poder.png"))
    self.img = self.imagens[1]
end

function tiro:update(dt)
if self.direcao == 1 then
     self.x = self.x + 10
end
if self.direcao == 0 then
     self.x = self.x - 10
end
end

function tiro:draw()
	--love.graphics.rectangle("fill", self.x, self.y, self.largura, self.altura)
	if self.direcao == 1 then
	love.graphics.draw(self.img, self.x, self.y - 30, 0.0, 0.7,0.7)
	end
	if self.direcao == 0 then
	love.graphics.draw(self.img, self.x, self.y - 30, 0.0, -0.7,0.7)
	end
end