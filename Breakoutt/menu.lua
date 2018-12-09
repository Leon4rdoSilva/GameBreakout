
local composer = require( "composer" )
local scene = composer.newScene()


local w = display.contentWidth
local h = display.contentHeight


function scene:create( event )

	local sceneGroup = self.view

local logo = display.newImageRect("logoimg.png",250,70)

logo.x =  w/2
logo.y = 70 

sceneGroup:insert(logo)
self.logo = logo


local butaoplay = display.newImageRect("PlayButton.jpg" ,220,50)


butaoplay.x =  w/2
butaoplay.y = h/2

sceneGroup:insert(butaoplay)
self.butaoplay = butaoplay

local butaoraking = display.newImageRect("RakingButton.jpg" ,220,50)


butaoraking.x =  w/2
butaoraking.y = 300

sceneGroup:insert(butaoraking)
self.butaoraking = butaoraking

local butaoexit = display.newImageRect("ExitButton.jpg" ,220,50)

butaoexit.x =  w/2
butaoexit.y = 360

sceneGroup:insert(butaoexit)
self.butaoexit = butaoexit

self.butaoplay:addEventListener("tap", play)
self.butaoraking:addEventListener("tap", raking)
self.butaoexit:addEventListener("tap", sairr)
	
end

function scene:destroy( event )

	local sceneGroup = self.view
    local phase = event.phase
 
     self.logo:removeSelf()
      self.butaoplay:removeSelf()
       self.butaoraking:removeSelf()
        self.butaoexit:removeSelf()
    
end


function play()
	composer.gotoScene( "jogo" )
end

function raking()
	composer.gotoScene( "raking" )
end

function sairr()
       os.exit()
    end


scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )

return scene

