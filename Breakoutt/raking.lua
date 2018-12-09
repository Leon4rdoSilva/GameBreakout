

local composer = require( "composer" )
local scene = composer.newScene()

local w = display.contentWidth
local h = display.contentHeight


function scene:create( event )

	local sceneGroup = self.view
  

	    local linhaV1 = display.newLine(1,0,1,265)
      local linhaV2 = display.newLine(w-1,0,w-1,265)
      local linhaV3 = display.newLine(w/2,0,w/2,265)
      local linhaH1 = display.newLine(0,0,w,0)
      local linhaH2 = display.newLine(0,30,w,30)
      local linhaH3 = display.newLine(0,70,w,70)
      local linhaH4 = display.newLine(0,120,w,120)
      local linhaH5 = display.newLine(0,170,w,170)
      local linhaH6 = display.newLine(0,215,w,215)
      local linhaH7 = display.newLine(0,265,w,265)

        sceneGroup:insert(linhaV1)
        self.linhaV1 = linhaV1

        sceneGroup:insert(linhaV2)
        self.linhaV2 = linhaV2

        sceneGroup:insert(linhaV3)
        self.linhaV3 = linhaV3

        sceneGroup:insert(linhaH1)
        self.linhaH1 = linhaH1

        sceneGroup:insert(linhaH2)
        self.linhaH2 = linhaH2

        sceneGroup:insert(linhaH3)
        self.linhaH3 = linhaH3

        sceneGroup:insert(linhaH4)
        self.linhaH4 = linhaH4

        sceneGroup:insert(linhaH5)
        self.linhaH5 = linhaH5

        sceneGroup:insert(linhaH6)
        self.linhaH6 = linhaH6

        sceneGroup:insert(linhaH7)
        self.linhaH7 = linhaH7


        butaomenu = display.newImageRect("Menu.png",80,40) 
        butaomenu.x = w/2
        butaomenu.y = 330
        
        sceneGroup:insert(butaomenu)
        self.butaomenu = butaomenu


        self.butaomenu:addEventListener("tap", menu)

        rankigText = display.newText("Ranking",display.contentCenterX*0.5,15)
        pontuacaoText = display.newText("Pontuação",display.contentCenterX*1.5,15)

       -- local mostrarId = bd:pegarId()
        local mostrarPontuacao = bd:pegarPontuacao()

        local y = 50

        for n=1,5 do

            rankigValor = display.newText(n.."º",display.contentCenterX*0.5,y)
            
            sceneGroup:insert(rankigValor)
            self.rankigValor = rankigValor
          y = y + 50
        end


        local y1 = 50

        for k,v in pairs(mostrarPontuacao) do
          for k1,v1 in pairs(v) do

            pontuacaoValor = display.newText(v1,display.contentCenterX*1.5,y1)
            print(k1,v1)
            sceneGroup:insert(pontuacaoValor)
            self.pontuacaoValor = pontuacaoValor
          end
          y1 = y1 + 50
        end

        sceneGroup:insert(pontuacaoText)
        self.pontuacaoText = pontuacaoText

        sceneGroup:insert(rankigText)
        self.rankigText = rankigText


end


function scene:destroy( event )

	 local sceneGroup = self.view
	 local phase = event.phase

       
       self.linhaV1:removeSelf()
       self.linhaV2:removeSelf()
       self.linhaV3:removeSelf()
       self.linhaH1:removeSelf()
       self.linhaH2:removeSelf()
       self.linhaH3:removeSelf()
       self.linhaH4:removeSelf()
       self.linhaH5:removeSelf()
       self.linhaH6:removeSelf()
       self.linhaH7:removeSelf()
       self.butaomenu:removeSelf()
       self.pontuacaoText:removeSelf()
       self.pontuacaoValor:removeSelf()
       self.rankigText:removeSelf()
       self.rankigValor:removeSelf()
       

end


function menu()
	composer.removeScene("gameover")
	composer.gotoScene( "menu" )
end


scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )

    return scene