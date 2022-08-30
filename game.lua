game = Classe:extend()

function game:new()
    largura_tela = love.graphics.getWidth()
    altura_tela = love.graphics.getHeight()
    player1 = player(largura_tela/2, altura_tela/2)
    player2 = player2(largura_tela/2, altura_tela/2)
    round = {}
    table.insert(round, love.graphics.newImage("assets/gui/Round.png"))
    table.insert(round, love.graphics.newImage("assets/gui/1.png"))
    table.insert(round, love.graphics.newImage("assets/gui/2.png"))
    table.insert(round, love.graphics.newImage("assets/gui/3.png"))
    ponto = {}
    ponto.img = love.graphics.newImage("assets/gui/ponto.png")
    --round--
    round1 = round[1]
    numeroround = round[2]
    quantround = 1
    contround = 0
    --finish him--
    fundo_jogo = {}
    fundo_jogo.img = love.graphics.newImage("assets/img/fundo2.jpg")
    --fundo_jogo.y = -20
        --barra de vida
    barra_de_vida_esquerda = {}
    barra_de_vida_esquerda.img = love.graphics.newImage("assets/img/barra de vida/barra_de_vida_esquerda.png")
    barra_de_vida_direita = {}
    barra_de_vida_direita.img = love.graphics.newImage("assets/img/barra de vida/barra_de_vida_direita.png")
    barra_de_vida_interna = {}
    barra_de_vida_interna.img = love.graphics.newImage("assets/img/barra de vida/barra_vida_interna.png")
    --fim de jogo
    fim_de_jogo_guerreiro = {}
    fim_de_jogo_guerreiro.img = love.graphics.newImage("assets/img/fim_de_jogo_guerreiro.jpg")
    fim_de_jogo_ninja = {}
    fim_de_jogo_ninja.img = love.graphics.newImage("assets/img/fim_de_jogo_ninja.jpg")
    -- fundo musical do jogo
    fundoMusical1 = love.audio.newSource("assets/sound/dororo.mp3", "stream")
    fundoMusical2 = love.audio.newSource("assets/sound/JoJo.mp3", "stream")
    fundoMusical3 = love.audio.newSource("assets/sound/kimetsu.mp3", "stream")
    fundoMusical4 = love.audio.newSource("assets/sound/Dr. Stone.mp3", "stream")
    final = love.audio.newSource("assets/sound/final_luta.mp3","stream")
    --sons dos rounds
    r1 = love.audio.newSource("assets/sound/som_round1.mp3", "static")
    r2 = love.audio.newSource("assets/sound/som_round2.mp3", "static")
        --fonte do jogo
    fonte = love.graphics.newFont("assets/font/font.ttf", 25)
    love.graphics.setFont(fonte)
       rand = love.math.random(1, 4)
       --ums = 5
end


function game:update(dt)
    --round--
    contround = contround + 1
    --eta porrada--
    --ums = ums + 1
    --if ums > 4 then
    if rand == 1 then
        fundoMusical1:play()
    end
    if rand == 2 then
        fundoMusical2:play()
    end
    if rand == 3 then
        fundoMusical3:play()
    end
    if rand == 4 then
        fundoMusical4:play()
    end
    player1:update(dt, altura_tela, largura_tela)
    player2:update(dt, altura_tela, largura_tela)
    for j, tiro in pairs(player2.tabelatiro) do
        if player1.hx < tiro.x and (player1.hx + 30) > tiro.x and player1.hy < tiro.y and (player1.hy + 80) > tiro.y then
        table.remove(player2.tabelatiro, j)
        player1.vida = player1.vida - 10
        player1.levandop = 1
        end
        if tiro.x < ((largura_tela/2) - 400) or tiro.x > ((largura_tela/2) + 400) then
          table.remove(player2.tabelatiro, j)
        end 
    end
    if player1.conta == 1 and player1.contadorataque == 0 then
    if player1.xa + 20 > player2.hx and player1.xa - 20 < (player2.hx + 36) and player1.ya > player2.hy and player1.ya < (player2.hy + 120) then
        player2.vida = player2.vida - 10
        player2.levandop = 1
    end
end
--rounds--
 if(player1.vida > 0 and player2.vida < 0) and player1.rounds < 2 and player2.rounds < 2 then
    player1.rounds = player1.rounds + 1
    quantround = quantround + 1
    contround = 0
    player1.recomeca = 1
    player2.recomeca = 1
    end
    if(player2.vida > 0 and player1.vida < 0)and player1.rounds < 2 and player2.rounds < 2 then
        player2.rounds = player2.rounds + 1
           quantround = quantround + 1
           contround = 0
        player1.recomeca = 1
        player2.recomeca = 1
    end
--rounds-- 
--ums = 0
 if quantround == 1 then
    numeroround = round[2]
 end
 if quantround == 2 then
    numeroround = round[3]
 end
 if quantround == 3 then
    numeroround = round[4]
 end
end

function game:draw()
    love.graphics.draw(fundo_jogo.img, 0, fundo_jogo.y)
    player1:draw()
    player2:draw()
        --mostra a barra de vida
    love.graphics.draw(barra_de_vida_interna.img,43,20,0,0.2 * (0.01 * player1.vida),0.2)
    love.graphics.draw(barra_de_vida_interna.img,590,20,0,0.2 * (0.01 * player2.vida),0.2)
    love.graphics.draw(barra_de_vida_esquerda.img,10,2,0,0.2,0.2)
    love.graphics.draw(barra_de_vida_direita.img,590,2,0,0.2,0.2)
    if contround < 40 then
    love.graphics.draw(round1,220,90,0,1.6,1.6)
    love.graphics.draw(numeroround,560,90,0,1,1)
    end
    if player1.rounds == 1 then
    love.graphics.draw(ponto.img,10,90,0,0.3,0.3)
    end
    if player2.rounds == 1 then
    love.graphics.draw(ponto.img,740,90,0,0.3,0.3)
    end
    --mostra o nome dos jogadores na tela
    love.graphics.print("Guerreiro", 20,60)
    love.graphics.print("Ninja", 700,60)
    --mostra os jogadores na tela
    if player1.rounds == 2 then
        fundoMusical1:stop()
        fundoMusical2:stop()
        fundoMusical3:stop()
        fundoMusical4:stop()
        final:play()
        love.graphics.draw(fim_de_jogo_guerreiro.img,0,0,0,0.6,0.6)
        love.graphics.print("O Jogador: Guerreiro Venceu",200,200)
        player1:draw()
    else if player2.rounds == 2  then
        fundoMusical1:stop()
        fundoMusical2:stop()
        fundoMusical3:stop()
        fundoMusical4:stop()
        final:play()
        love.graphics.draw(fim_de_jogo_ninja.img,0,0,0,1,1)
        love.graphics.print("O Jogador: Ninja Venceu",200,200)
        player2:draw()
    end
    end
end