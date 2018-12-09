

local composer = require( "composer" )
local scene = composer.newScene()

local w = display.contentWidth
local h = display.contentHeight


function scene:create( event )

	local sceneGroup = self.view

	   msgx = display.newText("Parabéns !", w/2, 180) msgx:setFillColor(1,1,1)

        sceneGroup:insert(msgx)
        self.msgx = msgx

        butaosair = display.newImageRect("Exit.png",80,40)  
        butaosair.x = 240
        butaosair.y = 230

        butaosair:addEventListener("tap" ,sairr)

        sceneGroup:insert(butaosair)
        self.butaosair = butaosair


        butaojn = display.newImageRect("New.png",80,40) 
        butaojn.x = 80
        butaojn.y = 230
        

        sceneGroup:insert(butaojn)
        self.butaojn = butaojn
        

        butaomenu = display.newImageRect("Menu.png",80,40) 
        butaomenu.x = w/2
        butaomenu.y = 230
        
        sceneGroup:insert(butaomenu)
        self.butaomenu = butaomenu


        self.butaojn:addEventListener("tap", reiniciar)
        self.butaomenu:addEventListener("tap", menu)


end


function scene:destroy( event )

	 local sceneGroup = self.view
	 local phase = event.phase

        self.msgx:removeSelf()
       self.butaosair:removeSelf()
       self.butaojn:removeSelf()
       self.butaomenu:removeSelf()

end

 function sairr()
       os.exit()
    end

    function reiniciar()
	composer.removeScene("venceu")
	composer.gotoScene( "jogo" )
end

function menu()
	composer.removeScene("venceu")
	composer.gotoScene( "menu" )
end


scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )

    return scene