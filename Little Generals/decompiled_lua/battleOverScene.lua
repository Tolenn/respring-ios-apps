-- Decompiled & AI-Repaired from battleOverScene.lu
-- Source disassembly preserved at: disasm/battleOverScene.disasm

local L2_2 = L2_2
L2_2("widgetTracker")
L2_2 = require
L2_2("avatar")
L2_2 = require
L2_2("battleAvatar")
L2_2 = require
L2_2("achievementList")
L2_2 = require
L2_2("gamecenterSupport")
L2_2 = storyboard
L2_2 = L2_2.newScene
L2_2 = L2_2()
local L3_3, L4_4 = L3_3, L4_4
function L2_2.createScene(A0_9, A1_10)
	local L2_11
	L2_11 = A0_9.view
	local L5_14, L6_15, L7_16, L8_17 = spritesheetmanager, L6_15, L7_16, L8_17
	L5_14 = L5_14.getSpriteSet
	L6_15 = UI_SPRITE_SHEET
	L5_14, L6_15 = L5_14(L6_15)
	L7_16 = 200
	L8_17 = 50
	local L9_18 = L9_18
	L2_11:insert((utils.drawGreyOverlay(screenWidth, display.contentHeight)))
	utils.drawGreyOverlay(screenWidth, display.contentHeight).x = screenX + screenWidth / 2
	utils.drawGreyOverlay(screenWidth, display.contentHeight).y = display.contentHeight / 2
	_ENV = display.newGroup()
	local L10_19 = L10_19
	_ENV:insert((display.newImage("res/ui/winlose_popup_box.png", 0, 0, true)))
	L4_4 = battleAvatar.buildUi(avatar.playerAvatar(), 1, "left", false)
	_ENV:insert(L4_4)
	L4_4:setReferencePoint(display.BottomCenterReferencePoint)
	L4_4:scale(0.65, 0.65)
	L4_4:laughAnimation()
	local L11_20, L12_21 = L11_20, L12_21
	L4_4.x, L4_4.y = L12_21.contentBounds.xMin + 110, L12_21.contentBounds.yMax - 7
	if not activeCountry.won then
		L4_4.wounded = true
		L4_4:idleAnimation()
	else
		if getCurrentBattle and getCurrentBattle().isMultiplayer then
			({}).mp_kills = 1
		else
			({}).kills = 1
		end
		L4_4:laughAnimation()
	end
	achievementList.updateStatistics({})
	settings:save()
	campaignSettings:save()
	missions:saveAllMissionData()
	local L13_22 = L13_22
	if missions:checkActiveMissionsForCompletion() >= missions:numActiveMissions() and missions:numAvailableMissions() == 0 then
		achievementList.unlockAchievement(achievementList.miscAchievements.MISSION_NOT_IMPOSSIBLE)
		tombstone:addToStat("missionsCompleted", 1)
	end
	local L14_23 = L14_23
	local L18_27 = L18_27
	utils.newButton(L5_14, L6_15, "accept_normal_btn.png", "accept_select_btn.png", function()
		local L3_42 = sound.playSound
		L3_42(sound.globalSounds.button)
		L3_42 = storyboard
		L3_42 = L3_42.getCurrentSceneName
		L3_42 = L3_42()
		if #achievementList.unacknowledgedUpdates == 0 then
			if 0 < _ENV then
				timer.performWithDelay(1, function()
					storyboard.removeScene(_ENV)
					local L1_43 = L1_43
				end)
				storyboard.gotoScene("missionsCompletedScene")
			else
				timer.performWithDelay(1, function()
					storyboard.removeScene(_ENV.previousScene)
					storyboard.removeScene(L0_39)
					local L1_44 = L1_44
				end)
				storyboard.gotoScene("campaignMapScene")
			end
		else
			timer.performWithDelay(1, function()
				storyboard.removeScene(_ENV)
				local L1_45 = L1_45
			end)
			local L1_40 = L1_40
			L1_40("achievementScene")
			local L2_41 = L2_41
		end
		L1_40 = true
		return L1_40
	end).x = L12_21.width - utils.newButton(L5_14, L6_15, "accept_normal_btn.png", "accept_select_btn.png", function()
		local L3_49 = sound.playSound
		L3_49(sound.globalSounds.button)
		L3_49 = storyboard
		L3_49 = L3_49.getCurrentSceneName
		L3_49 = L3_49()
		if #achievementList.unacknowledgedUpdates == 0 then
			if 0 < _ENV then
				timer.performWithDelay(1, function()
					storyboard.removeScene(_ENV)
					local L1_50 = L1_50
				end)
				storyboard.gotoScene("missionsCompletedScene")
			else
				timer.performWithDelay(1, function()
					storyboard.removeScene(_ENV.previousScene)
					storyboard.removeScene(L0_39)
					local L1_51 = L1_51
				end)
				storyboard.gotoScene("campaignMapScene")
			end
		else
			timer.performWithDelay(1, function()
				storyboard.removeScene(_ENV)
				local L1_52 = L1_52
			end)
			local L1_47 = L1_47
			L1_47("achievementScene")
			local L2_48 = L2_48
		end
		L1_47 = true
		return L1_47
	end).width
	utils.newButton(L5_14, L6_15, "accept_normal_btn.png", "accept_select_btn.png", function()
		local L3_56 = sound.playSound
		L3_56(sound.globalSounds.button)
		L3_56 = storyboard
		L3_56 = L3_56.getCurrentSceneName
		L3_56 = L3_56()
		if #achievementList.unacknowledgedUpdates == 0 then
			if 0 < _ENV then
				timer.performWithDelay(1, function()
					storyboard.removeScene(_ENV)
					local L1_57 = L1_57
				end)
				storyboard.gotoScene("missionsCompletedScene")
			else
				timer.performWithDelay(1, function()
					storyboard.removeScene(_ENV.previousScene)
					storyboard.removeScene(L0_39)
					local L1_58 = L1_58
				end)
				storyboard.gotoScene("campaignMapScene")
			end
		else
			timer.performWithDelay(1, function()
				storyboard.removeScene(_ENV)
				local L1_59 = L1_59
			end)
			local L1_54 = L1_54
			L1_54("achievementScene")
			local L2_55 = L2_55
		end
		L1_54 = true
		return L1_54
	end).y = L12_21.height / 2
	local L16_25 = L16_25
	utils.parentWidget(utils.newButton(L5_14, L6_15, "accept_normal_btn.png", "accept_select_btn.png", function()
		local L3_63 = sound.playSound
		L3_63(sound.globalSounds.button)
		L3_63 = storyboard
		L3_63 = L3_63.getCurrentSceneName
		L3_63 = L3_63()
		if #achievementList.unacknowledgedUpdates == 0 then
			if 0 < _ENV then
				timer.performWithDelay(1, function()
					storyboard.removeScene(_ENV)
					local L1_64 = L1_64
				end)
				storyboard.gotoScene("missionsCompletedScene")
			else
				timer.performWithDelay(1, function()
					storyboard.removeScene(_ENV.previousScene)
					storyboard.removeScene(L0_39)
					local L1_65 = L1_65
				end)
				storyboard.gotoScene("campaignMapScene")
			end
		else
			timer.performWithDelay(1, function()
				storyboard.removeScene(_ENV)
				local L1_66 = L1_66
			end)
			local L1_61 = L1_61
			L1_61("achievementScene")
			local L2_62 = L2_62
		end
		L1_61 = true
		return L1_61
	end), _ENV)
	local L17_26 = L17_26
	L17_26 = activeCountry
	if not L17_26 then
		L17_26 = {}
		L17_26.won = true
	end
	if L17_26.won then
		warbux:credit((getCurrentBattle().getPot()))
	else
	end
	getCurrentBattle().destroyBattle()
	display.newText("You lose!", 0, 0, "SingleSleeve", 120):setTextColor(LITTLE_GENERALS_BROWN_DARK())
	display.newText("You have not acquired this land!", 0, 0, "SingleSleeve", 35):setTextColor(LITTLE_GENERALS_BROWN_DARK())
	_ENV:insert((display.newText("You lose!", 0, 0, "SingleSleeve", 120)))
	_ENV:insert((display.newText("You have not acquired this land!", 0, 0, "SingleSleeve", 35)))
	display.newText("You lose!", 0, 0, "SingleSleeve", 120).x = L12_21.width / 2
	display.newText("You lose!", 0, 0, "SingleSleeve", 120).y = 170
	display.newText("You have not acquired this land!", 0, 0, "SingleSleeve", 35).y = 240
	display.newText("You have not acquired this land!", 0, 0, "SingleSleeve", 35).x = L12_21.width / 2
	sound.stop()
	if sound.shouldPlayMusic() then
		({}).onComplete = function(A0_67)
			if A0_67.completed then
				sound.dispose("res/sounds/battleover_lose.mp3")
				local L2_68 = L2_68
			end
		end
		sound.playStream("res/sounds/battleover_lose.mp3", {})
	end
	if display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35) then
		display.newRect(0, 0, display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).contentWidth + 20, display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).contentHeight):setFillColor(249, 237, 219)
		_ENV:insert((display.newRect(0, 0, display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).contentWidth + 20, display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).contentHeight)))
		_ENV:insert((display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35)))
		display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35):setTextColor(LITTLE_GENERALS_BROWN_DARK())
		display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).x = display.newText("You have not acquired this land!", 0, 0, "SingleSleeve", 35).x
		display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).y = display.newText("You have not acquired this land!", 0, 0, "SingleSleeve", 35).y + display.newText("You have not acquired this land!", 0, 0, "SingleSleeve", 35).contentHeight / 2 + display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).contentHeight / 2 + 5
		display.newRect(0, 0, display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).contentWidth + 20, display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).contentHeight).x, display.newRect(0, 0, display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).contentWidth + 20, display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).contentHeight).y = display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).x, display.newText("You earned " .. tostring((getCurrentBattle().getPot())) .. " warbux", 0, 0, "SingleSleeve", 35).y
	end
	local L19_28 = L19_28
	;({}).width = 200
	;({}).onComplete = function()
		sound.playSound(sound.globalSounds.button)
		storyboard.gotoScene("storeScene")
		local L1_69 = L1_69
	end
	utils.getBasicButton({}).x = L12_21.x - L12_21.width / 4
	utils.getBasicButton({}).y = L12_21.height - 45
	utils.parentWidget(utils.getBasicButton({}), _ENV)
	local L20_29 = L20_29
	utils.newImageFromSpriteSet(L5_14, L6_15, "warbux_icon.png"):scale(0.7, 0.7)
	utils.parentWidget(utils.newImageFromSpriteSet(L5_14, L6_15, "warbux_icon.png"), _ENV)
	utils.newImageFromSpriteSet(L5_14, L6_15, "warbux_icon.png").x = utils.getBasicButton({}).x - utils.getBasicButton({}).contentWidth / 2 + utils.newImageFromSpriteSet(L5_14, L6_15, "warbux_icon.png").contentWidth / 2 + 15
	utils.newImageFromSpriteSet(L5_14, L6_15, "warbux_icon.png").y = utils.getBasicButton({}).y
	local L21_30 = L21_30
	display.newText(utils.comma_value(tostring(warbux.balance)), 0, 0, "SingleSleeve", 43):setReferencePoint(display.CenterRightReferencePoint)
	display.newText(utils.comma_value(tostring(warbux.balance)), 0, 0, "SingleSleeve", 43).x = utils.getBasicButton({}).x + utils.getBasicButton({}).contentWidth / 2 - 15
	display.newText(utils.comma_value(tostring(warbux.balance)), 0, 0, "SingleSleeve", 43).y = utils.newImageFromSpriteSet(L5_14, L6_15, "warbux_icon.png").y - 2
	display.newText(utils.comma_value(tostring(warbux.balance)), 0, 0, "SingleSleeve", 43):setTextColor(LITTLE_GENERALS_BROWN_DARK())
	utils.parentWidget(display.newText(utils.comma_value(tostring(warbux.balance)), 0, 0, "SingleSleeve", 43), _ENV)
	if utils.isIOSDevice() then
		({}).width = 200
		;({}).onComplete = function()
			sound.playSound(sound.globalSounds.button)
			local L2_71 = L2_71
			L2_71(require("achievementList").HIGHSCORE_KILLS)
		end
		utils.getBasicButton({}).x = L12_21.x + L12_21.width / 4
		utils.getBasicButton({}).y = L12_21.height - 45
		utils.parentWidget(utils.getBasicButton({}), _ENV)
		utils.newImageFromSpriteSet(L5_14, L6_15, "gamecenter_icon.png"):scale(0.7, 0.7)
		utils.parentWidget(utils.newImageFromSpriteSet(L5_14, L6_15, "gamecenter_icon.png"), _ENV)
		utils.newImageFromSpriteSet(L5_14, L6_15, "gamecenter_icon.png").x = utils.getBasicButton({}).x - utils.getBasicButton({}).contentWidth / 2 + utils.newImageFromSpriteSet(L5_14, L6_15, "gamecenter_icon.png").contentWidth / 2 + 15
		utils.newImageFromSpriteSet(L5_14, L6_15, "gamecenter_icon.png").y = utils.getBasicButton({}).y
		local L28_37 = L28_37
		local L29_38 = L29_38
		display.newText("WINS: " .. tostring(achievementList.playerKills()), 0, 0, "SingleSleeve", 43):setTextColor(LITTLE_GENERALS_BROWN_DARK())
		display.newText("WINS: " .. tostring(achievementList.playerKills()), 0, 0, "SingleSleeve", 43):setReferencePoint(display.CenterRightReferencePoint)
		display.newText("WINS: " .. tostring(achievementList.playerKills()), 0, 0, "SingleSleeve", 43).x = utils.getBasicButton({}).x + utils.getBasicButton({}).contentWidth / 2 - 15
		display.newText("WINS: " .. tostring(achievementList.playerKills()), 0, 0, "SingleSleeve", 43).y = utils.newImageFromSpriteSet(L5_14, L6_15, "gamecenter_icon.png").y - 2
		utils.parentWidget(display.newText("WINS: " .. tostring(achievementList.playerKills()), 0, 0, "SingleSleeve", 43), _ENV)
		break -- pseudo-goto
	end
	display.newText("WINS: " .. tostring(achievementList.playerKills()), 0, 0, "SingleSleeve", 43):setTextColor(LITTLE_GENERALS_BROWN_DARK())
	display.newText("WINS: " .. tostring(achievementList.playerKills()), 0, 0, "SingleSleeve", 43):setReferencePoint(display.CenterRightReferencePoint)
	display.newText("WINS: " .. tostring(achievementList.playerKills()), 0, 0, "SingleSleeve", 43).x = L12_21.x + L12_21.width / 4
	display.newText("WINS: " .. tostring(achievementList.playerKills()), 0, 0, "SingleSleeve", 43).y = L12_21.height - 45
	utils.parentWidget(display.newText("WINS: " .. tostring(achievementList.playerKills()), 0, 0, "SingleSleeve", 43), _ENV)
	repeat
	until true
	_ENV.y = display.contentHeight / 2 - _ENV.height / 2
	_ENV:insert(L14_23)
	L14_23.x = 311
	L14_23.y = 61
	L2_11:insert(_ENV)
	tombstone:save()
end
function L2_2.enterScene(A0_72, A1_73)
	local L6_78, L7_79 = storyboard.getPrevious, L7_79
	L6_78 = L6_78()
	A0_72.previousScene = L6_78
	L6_78 = print
	L7_79 = "entering battleOver"
	L6_78(L7_79, A0_72.previousScene)
	L6_78 = display
	L6_78 = L6_78.getCurrentStage
	L6_78 = L6_78()
	L7_79 = L6_78
	L6_78 = L6_78.setFocus
	L6_78(L7_79, nil)
	L6_78 = physics
	L6_78 = L6_78.pause
	L6_78()
	L6_78 = A0_72.view
	L7_79 = L6_78.toFront
	L7_79(L6_78)
	L7_79 = storyboard
	L7_79 = L7_79.getScene
	L7_79 = L7_79(A0_72.previousScene)
	if L7_79 then
		L7_79.view.isVisible = true
		L7_79.view:toBack()
		local L4_76, L5_77 = L4_76, L5_77
	end
	L4_76 = _ENV
	L5_77 = screenX
	L5_77 = L5_77 + (screenWidth - _ENV.width) / 2
	L4_76.x = L5_77
end


-- [End of decompiled block; see disassembly for inner stripped closures]
