local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14 = storyboard.newScene, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14
L3_3 = L3_3()
L4_4 = WidgetTracker
L5_5 = L4_4
L4_4 = L4_4.new
L4_4 = L4_4(L5_5)
L5_5 = nil
L6_6 = nil
L7_7 = nil
L8_8 = nil
L9_9 = nil
L10_10 = nil
L11_11 = nil
L12_12 = {}
L13_13 = {}
L13_13.fileName = "res/sounds/wheel/theme.mp3"
L13_13.isStream = false
L12_12.theme = L13_13
L13_13 = {}
L13_13.fileName = "res/sounds/wheel/audienceBackground.mp3"
L13_13.isStream = false
L12_12.audienceBackground = L13_13
L12_12.audienceShock = "res/sounds/wheel/audienceShocked.mp3"
L12_12.audienceHooray = "res/sounds/wheel/audienceHooray.mp3"
L13_13 = {}
function L14_14()
	local L0_19 = storyboard.getCurrentSceneName()
	storyboard.gotoScene(_ENV.previousScene)
	local L1_20 = L1_20
	L1_20(L0_19)
	local L2_21 = L2_21
end
function showWheelText(A0_22, A1_23)
	cleanUpWheelTextTransition()
	;({}).fontName = "gameplay"
	;({}).text = A0_22
	;({}).originX = "CENTER"
	;({}).textFlow = "RIGHT"
	;({}).charBaseLine = "CENTER"
	;({}).showOrigin = false
	_ENV = TextCandy.CreateText({})
	L6_6.parent:insert(_ENV)
	_ENV.x, _ENV.y = 0, 0
	local L2_24 = L2_24
	local L3_25 = L3_25
	;({}).time = 3000
	local ({}).transition, L5_27 = easing.outInQuad, L5_27
	L5_27.alpha = 0
	function L5_27.onComplete()
		_ENV:delete()
		local L1_28 = L1_28
		L1_28 = nil
		_ENV = L1_28
		L1_28 = nil
		L7_7 = L1_28
		L1_28 = A1_23
		if L1_28 then
			L1_28 = A1_23
			L1_28()
		end
	end
	L2_24 = L2_24(L3_25, L5_27)
	L7_7 = L2_24
end
function wheelGroupRuntimeListener(A0_29)
	local L6_35 = _ENV.angularVelocity
	if L6_35 == 0 then
		L6_35 = Runtime
		L6_35 = L6_35.removeEventListener
		L6_35(L6_35, "enterFrame", wheelGroupRuntimeListener)
		L6_35 = math
		L6_35 = L6_35.abs
		L6_35 = L6_35(_ENV.rotation - _ENV.startingRotation)
		if math.abs(_ENV.rotation - _ENV.startingRotation) < 360 then
			showWheelText("ONE   FULL   ROTATION   PLEASE!")
		else
			local L4_33 = L4_33
			_FOR_ = 1
			for _FORV_6_ = _FOR_, _FOR_, _FOR_ do
				if L4_33 >= _ENV.sectors[_FORV_6_].lower and L4_33 <= _ENV.sectors[_FORV_6_].upper then
					if L10_10.gameModes[_ENV.sectors[_FORV_6_].mode].avatar then
						L11_11[L10_10.gameModes[_ENV.sectors[_FORV_6_].mode].avatar](L11_11)
					end
					if L13_13.audienceBackground then
						if L10_10.gameModes[_ENV.sectors[_FORV_6_].mode].audienceSound == "audienceShock" then
						end
						;({}).time, ({}).channel = 1000, L13_13.audienceBackground
						sound.fadeOut({})
					end
					if L13_13.theme then
						({}).channel = L13_13.theme
						;({}).time = 5000
						sound.fadeOut({})
					end
					if L10_10.gameModes[_ENV.sectors[_FORV_6_].mode].audienceSound then
						({}).onComplete = function()
							sound.dispose(_ENV[_UPVALUE1_])
							local L0_42 = L0_42
							local L1_43 = L1_43
							local L4_46 = L4_46
							L4_46.channel = L13_13[_UPVALUE1_]
							L0_42(L1_43, L4_46)
						end
						L13_13[L10_10.gameModes[_ENV.sectors[_FORV_6_].mode].audienceSound] = sound.playStream(L12_12[L10_10.gameModes[_ENV.sectors[_FORV_6_].mode].audienceSound], {})
						;({}).channel = L13_13[L10_10.gameModes[_ENV.sectors[_FORV_6_].mode].audienceSound]
						;({}).time = 10000
						sound.fadeOut({})
					end
					L10_10.selectedMode = _ENV.sectors[_FORV_6_].mode
					L10_10.gameModes[L10_10.selectedMode].active = true
					setWheelOfFortune(L10_10)
					L10_10:alert(4000)
					tombstone:addToStat("wheelspins", 1)
					tombstone:addToStat("wheelprizes.prizemode_" .. tostring(L10_10.selectedMode), 1)
					tombstone:save()
					L9_9 = timer.performWithDelay(2000, L14_14)
					return
				end
			end
		end
		L4_33 = _UPVALUE7_
		L5_34 = _ENV
		L4_33(L5_34)
	end
end
function L3_3.createScene(A0_47, A1_48)
	local _ENV, L4_51, L5_52, L6_53 = {}, L4_51, L5_52, L6_53
	L4_51 = sound
	L4_51 = L4_51.loadSoundBatch
	L5_52 = L12_12
	L4_51(L5_52)
	L4_51 = A0_47.view
	L5_52 = 200
	L6_53 = 50
	local L7_54 = L7_54
	L4_51:insert((utils.drawGreyOverlay(screenWidth, display.contentHeight)))
	utils.addHitBlockListeners((utils.drawGreyOverlay(screenWidth, display.contentHeight)))
	utils.drawGreyOverlay(screenWidth, display.contentHeight).x = screenX + screenWidth / 2
	utils.drawGreyOverlay(screenWidth, display.contentHeight).y = display.contentHeight / 2
	L2_2 = display.newGroup()
	L4_51:insert(L2_2)
	L2_2.x = screenX + screenWidth / 2
	L2_2.y = display.contentHeight / 2
	L10_10 = require("wheel"):new(11)
	local L8_55 = L8_55
	local L9_56 = L9_56
	L2_2:insert((display.newImageRect("res/wheel/WoSFbase.png", 589, 600)))
	display.newImageRect("res/wheel/WoSFbase.png", 589, 600).x = 2
	display.newImageRect("res/wheel/WoSFbase.png", 589, 600).y = -4
	local L10_57 = L10_57
	local L11_58 = L11_58
	local L12_59 = L12_59
	local L13_60 = L13_60
	sprite.add(spritesheetmanager.getSpriteSet("res/wheel/blinkinglight.png"))
	_FOR_ = L11_58
	for _FORV_17_ = _FOR_, _FOR_, _FOR_ do
		L2_2:insert((sprite.newSprite(L12_59)))
		sprite.newSprite(L12_59).currentFrame = 0 % 4 + 1
		local L21_68 = L21_68
		sprite.newSprite(L12_59).x, sprite.newSprite(L12_59).y = utils.getXYfromVector(_FORV_17_, 275)
		sprite.newSprite(L12_59).xScale, sprite.newSprite(L12_59).yScale = 0.3, 0.3
		sprite.newSprite(L12_59):play()
		local L20_67 = L20_67
	end
	L11_11 = battleAvatar.buildUi(avatar.playerAvatar(), 1, "left", false)
	L2_2:insert(L11_11)
	L11_11:scale(0.65, 0.65)
	L11_11:idleAnimation()
	L11_11:setReferencePoint(display.BottomLeftReferencePoint)
	L11_11.x, L11_11.y = 0 - screenWidth / 2, display.contentHeight / 2 + 85
	L6_6 = _UPVALUE6_()
	_UPVALUE7_(L6_6)
	L2_2:insert(L6_6)
	L6_6.x, L6_6.y = 0, 0
	local L16_63 = L16_63
	local L17_64 = L17_64
	local L16_63, L18_65 = L16_63(L17_64, "res/wheel/WoSFpointer.png", 57, 78), L18_65
	L17_64 = L10_57.x
	L18_65 = L6_6
	L18_65 = L18_65.contentHeight
	L18_65 = -L18_65
	L18_65 = L18_65 / 2
	L18_65 = L18_65 - L16_63.contentHeight / 2
	L18_65 = L18_65 + 10
	L16_63.y = L18_65
	L16_63.x = L17_64
	L17_64 = L16_63.contentHeight
	L17_64 = -L17_64
	L17_64 = L17_64 / 2
	L17_64 = L17_64 + 10
	L16_63.yReference = L17_64
	L17_64 = L6_6
	L17_64.pointer = L16_63
end
function L3_3.enterScene(A0_69, A1_70)
	A0_69.previousScene = storyboard.getPrevious()
	print("entering wheelScene", A0_69.previousScene)
	Runtime:removeEventListener("enterFrame", weaponManualPhysics)
	if not _ENV.sectors or #_ENV.sectors == 0 then
		print("No Wheel options available")
		setWheelOfFortune(L10_10)
		L14_14()
		return
	end
	if sound.shouldPlayMusic() then
		({}).loops = -1
		;({}).fadein = 2000
		;({}).onComplete = function()
			sound.dispose(_ENV.theme.fileName)
			local L0_79 = L0_79
			local L1_80 = L1_80
			local ({}).channel, L3_82 = L13_13.theme, L3_82
			L0_79(L1_80, L3_82)
		end
		L13_13.theme = sound.playStream(L12_12.theme.fileName, {})
		;({}).channel = L13_13.theme
		audio.setVolume(0, {})
	end
	;({}).loops = -1
	;({}).fadein = 2000
	;({}).onComplete = function()
		sound.dispose(_ENV.audienceBackground.fileName)
		local L0_83 = L0_83
		local L1_84 = L1_84
		local ({}).channel, L3_86 = L13_13.audienceBackground, L3_86
		L0_83(L1_84, L3_86)
	end
	L13_13.audienceBackground = sound.playStream(L12_12.audienceBackground.fileName, {})
	;({}).channel = L13_13.audienceBackground
	audio.setVolume(0.25, {})
	local L2_71 = L2_71
	L2_71(Runtime, "enterFrame", _UPVALUE5_)
	L2_71 = A0_69.view
	L2_71:toFront()
	local L3_72 = L3_72
	L3_72 = L3_72(A0_69.previousScene)
	if L3_72 then
		L3_72.view.isVisible = true
		L3_72.view:toBack()
	end
	local L4_73 = L4_73
	local L4_73, L5_74 = L4_73("firstWheel"), L5_74
	if not L4_73 then
		L4_73 = screenX
		L5_74 = screenWidth
		L4_73 = L4_73 + L5_74
		L4_73 = L4_73 - 100
		L5_74 = display
		L5_74 = L5_74.contentHeight
		L5_74 = L5_74 / 2
		L5_74 = L5_74 + 150
		local L6_75 = L6_75
		;({}).id = "firstWheel"
		;({}).x = L4_73
		;({}).y = L5_74
		;({}).rotation = 120
		local L8_77 = L8_77
		local ({})[1], L9_78 = L2_71, L9_78
		L8_77.controls = L9_78
		L6_75 = L6_75(L8_77)
		mapTutorial = L6_75
	end
end
function cleanUpWheelTextTransition()
	if _ENV then
		transition.cancel(_ENV)
		_ENV = nil
	end
	if L8_8 then
		L8_8:delete()
		local L1_87 = L1_87
		L1_87 = nil
		L8_8 = L1_87
	end
end
function L3_3.exitScene(A0_88, A1_89)
	Runtime:removeEventListener("enterFrame", _ENV)
	local L4_92 = L4_92
	L4_92(Runtime, "enterFrame", weaponManualPhysics)
	local L5_93 = L5_93
	L4_92 = cleanUpWheelTextTransition
	L4_92()
	L4_92 = L6_6
	if L4_92 then
		L4_92 = L6_6
		L4_92 = L4_92.pointerTransition
		if L4_92 then
			L4_92 = transition
			L4_92 = L4_92.cancel
			L5_93 = L6_6
			L5_93 = L5_93.pointerTransition
			L4_92(L5_93)
			L4_92 = L6_6
			L4_92.pointerTransition = nil
		end
		L4_92 = L6_6
		L4_92.pointer = nil
	end
end
function L3_3.destroyScene(A0_94, A1_95)
	if _ENV then
		L5_99 = timer
		L5_99 = L5_99.cancel
		L6_100 = _ENV
		L5_99(L6_100)
	end
	L5_99 = nil
	_ENV = L5_99
	L5_99 = pairs
	L6_100 = L10_10
	L6_100 = L6_100.gameModes
	L5_99, L6_100, _FOR_ = L5_99(L6_100)
	for _FORV_5_, _FORV_6_ in L5_99, L6_100, _FOR_ do
		spritesheetmanager.disposeSpriteSet(_FORV_6_.spriteSheet)
	end
	L5_99 = A0_94.view
	L6_100 = L11_11
	L7_101 = L6_100
	L6_100 = L6_100.dispose
	L6_100(L7_101)
	L6_100 = nil
	L11_11 = L6_100
	L6_100 = L1_1
	L7_101 = L6_100
	L6_100 = L6_100.destroy
	L6_100(L7_101)
	L6_100 = utils
	L6_100 = L6_100.memDelta
	L7_101 = _G
	L6_100(L7_101)
end
L3_3:addEventListener("createScene", L3_3)
L3_3:addEventListener("enterScene", L3_3)
L3_3:addEventListener("exitScene", L3_3)
local L15_15, L16_16 = L15_15, L16_16
local L17_17 = L17_17
L3_3:addEventListener("destroyScene", L3_3)
local L18_18 = L18_18
return L3_3
