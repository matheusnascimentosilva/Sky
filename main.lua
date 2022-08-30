function love.load()
	Classe = require("classic")
	require("game")
 	require("player")
 	require("player2")
 	require("tiro")
	game = game()
end

function love.update(dt)
	game:update(dt)
end

function love.draw()
		game:draw()
end
function love.keypressed(tecla)
	if tecla == 'escape' then
		love.event.push('quit')
	end
end
