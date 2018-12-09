

local composer = require( "composer" )
local scene = composer.newScene()


local physics = require("physics")
physics.start()
--physics.setDrawMode("hybrid")

local w = display.contentWidth
local h = display.contentHeight

blocos = {}

local pontuacao = 0


function criarBola()

    local bola = display.newCircle(w/2,350,7)
    bola:setFillColor(0.7)
    physics.addBody(bola, "dynamic", {density=1.0,  bounce=1, radius=8})
    impulsionarBola(bola)
    return bola

end

function criarBarra()

    local barra = display.newRect(w/2,352,100,15)
    barra:setFillColor(0.4)
    physics.addBody(barra, "static", {friction=0, bounce=1})
    barra.isFixedRotation = true
    return barra
    
end

 function colisao(event)

    print("entrou na funcao da colisao")

    display.remove(event.target)
    pontuacao = pontuacao + 10
    atualizaPontuacao(pontuacao)
    print("Pontuação= "..pontuacao)

    if pontuacao == 300 then

        venceu()

    end
    

    
end


function criarBlocos()

    for i=1,3 do

        for j=1,10 do



            local bloco = display.newRect(30,60,25,15)
            bloco:setFillColor(1,1,1)
            bloco.x = bloco.x * j
            bloco.y = bloco.y * i
            physics.addBody(bloco, "static", {friction=1, bounce=1})
            bloco:addEventListener("collision", colisao)
            table.insert(blocos, bloco);
        end

    end



end


function impulsionarBola(bola)

    local forca = math.random ( - 3 , 3 )

    if forca == 0 then
        forca = 1
    end

    bola:applyLinearImpulse (forca, 2 , bola.x , bola.y )
end



function scene:create( event )

    print("entrou no creat")

    local sceneGroup = self.view

    local bakground2 = display.newImageRect("background1.jpg",310,360)


    bakground2.x = w/2
    bakground2.y = 180
    
    sceneGroup:insert(bakground2)
    self.bakground2 = bakground2


    local l1 = display.newLine(1,1,1,h)
    local l2 = display.newLine(w-1,0,w-1,h)
    local l3 = display.newLine(1,1,w-1,1)
    local l4 = display.newLine(1,h,w-1,h)
    local l5 = display.newLine(1,h-120,w-1,h-120)
    local pontos = display.newText("Pontos: ",40,10)


    physics.setGravity(0,0)

    physics.addBody(l1, "static", {friction=1})
    physics.addBody(l2, "static", {friction=1})
    physics.addBody(l3, "static", {friction=1})
    physics.addBody(l4, "static", {friction=1})
    physics.addBody(l5, "static", {friction=1})

    sceneGroup:insert(l1)
    sceneGroup:insert(l2)
    sceneGroup:insert(l3)
    sceneGroup:insert(l4)
    sceneGroup:insert(l5)


    self.l1 = l1
    self.l2 = l2
    self.l3 = l3
    self.l4 = l4
    self.l5 = l5
    
    butaoe = display.newImageRect("butao.png",50,50)
    butaoe.x = 120
    butaoe.y = 420
    butaoe.rotation = 180
    
    sceneGroup:insert(butaoe)
    self.butaoe = butaoe

    butaod = display.newImageRect("butao.png",50,50)
    butaod.x = 200
    butaod.y = 420

    sceneGroup:insert(butaod)
    self.butaod = butaod

        criarBlocos()


    barra = criarBarra()

    sceneGroup:insert(barra)
    self.barra = barra

    
   bola = criarBola()

    

    sceneGroup:insert(bola)
    sceneGroup:insert(pontos)


    self.bola = bola

    physics.setGravity(0,0)

     self.butaoe:addEventListener("touch", movimentaresquerda)
            self.butaod:addEventListener("touch", movimentardireita)

            self.l5:addEventListener("collision", gameover)

    function atualizaPontuacao(argPontuacao)
        pontos.text = "Pontos: " .. argPontuacao
    end

end


    function movimentaresquerda(event)

        if event.phase == "began" or event.phase == "hold" then
            if barra.x > display.actualContentWidth/5.3 then
                barra.x = barra.x - 50
            end
        end
    end

    function movimentardireita(event)

        if event.phase == "began" or event.phase == "hold" then
            if barra.x < display.actualContentWidth/1.5 then
                barra.x = barra.x + 50
            end
        end
    end


   function gameover()


     composer.removeScene("jogo")
     composer.gotoScene( "gameover" )
     bd:inserir(pontuacao)

 end

 function venceu()


     composer.removeScene("jogo")
     composer.gotoScene( "venceu" )
     bd:inserir(pontuacao)


 end

 function scene:destroy( event )
     


     local sceneGroup = self.view
        local phase = event.phase



       

            self.bola:removeSelf()
            self.bola = nil

            self.barra:removeSelf()
            self.barra = nil
        
            self.bakground2:removeSelf()

            self.butaoe:removeSelf()
            self.butaod:removeSelf()

            -- display.remove(bola)
            print(#blocos)
            for i=1,#blocos do
                print("apagou")
                if blocos[i] ~= nil then
                    display.remove(blocos[i])
                    
                end
            end

        

   
 end





scene:addEventListener( "create", scene )
--scene:addEventListener( "show", scene )
--scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
