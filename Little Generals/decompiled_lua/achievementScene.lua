local L3_3, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15 = L3_3, "widgetTracker", L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15
L3_3(L6_6)
L3_3 = require
L6_6 = "avatar"
L3_3(L6_6)
L3_3 = require
L6_6 = "battleAvatar"
L3_3(L6_6)
L3_3 = require
L6_6 = "achievementList"
L3_3(L6_6)
L3_3 = require
L6_6 = "gamecenterSupport"
L3_3(L6_6)
L3_3 = "postAchievementsToTwitter"
L6_6 = "postAchievementsToFacebook"
L7_7 = storyboard
L7_7 = L7_7.newScene
L7_7 = L7_7()
L8_8 = nil
L9_9 = WidgetTracker
L10_10 = L9_9
L9_9 = L9_9.new
L9_9 = L9_9(L10_10)
L10_10 = nil
L11_11 = nil
L12_12 = nil
L13_13 = nil
L14_14 = nil
L15_15 = nil
function L7_7.showUpdate(A0_20)
	if _ENV and _ENV.parent then
		_ENV:removeSelf()
	end
	_UPVALUE1_ = _UPVALUE2_()
	if _UPVALUE1_ then
		print("Update", _UPVALUE1_.description)
		if _UPVALUE1_.title then
			L13_13.text = _UPVALUE1_.title
		else
			L13_13.text = ""
		end
		if _UPVALUE1_.description then
			L14_14.text = _UPVALUE1_.description
		else
			L14_14.text = ""
		end
		utils.scaleTo(L13_13, _UPVALUE5_.contentWidth - 40)
		utils.scaleTo(L14_14, _UPVALUE5_.contentWidth - 40)
		if _UPVALUE1_:hasImage() then
			_ENV = _UPVALUE1_:createImage()
			if _ENV then
				local L1_21 = L1_21
				L1_21(_ENV, display.CenterReferencePoint)
				L1_21 = _ENV
				L1_21 = L1_21.width
				if not _UPVALUE1_.hideGloss then
					_ENV:scale(L12_12.width / L1_21 * 2 / 3, L12_12.width / L1_21 * 2 / 3)
					local L6_26 = L6_26
				end
				L6_26 = _ENV
				L6_26.x = L12_12.x
				L6_26 = _ENV
				L6_26.y = L12_12.y
				L6_26 = _UPVALUE1_
				L6_26 = L6_26.hideGloss
				if not L6_26 then
					L6_26 = graphics
					L6_26 = L6_26.newMask
					L6_26 = L6_26("res/achievements/circleMask.png")
					_ENV:setMask(L6_26)
					repeat
						L12_12:toFront()
						do break end -- pseudo-goto
						L6_26 = L12_12
						L6_26 = L6_26.toBack
						L6_26(L6_26)
					until true
				end
				L6_26 = utils
				L6_26 = L6_26.parentWidget
				local L3_23 = L3_23
				L6_26(L3_23, L10_10)
				local L4_24 = L4_24
			end
		end
	end
end
function L7_7.closeSelfAndLast(A0_27)
	local L4_31 = storyboard.getCurrentSceneName
	L4_31 = L4_31()
	local L2_29 = L2_29
	local L3_30 = L3_30
	L2_29(L3_30, function()
		if _ENV.previousScene and _ENV.previousScene ~= "campaignMapScene" then
			storyboard.removeScene(_ENV.previousScene)
		end
		storyboard.removeScene(L1_28)
		local L1_32 = L1_32
	end)
end
function L7_7.createScene(A0_33, A1_34)
	local L2_35, L5_38, L6_39, L7_40, L8_41 = L2_35, "avatar", L6_39, L7_40, L8_41
	L2_35(L5_38)
	L2_35 = A0_33.view
	L5_38 = spritesheetmanager
	L5_38 = L5_38.getSpriteSet
	L6_39 = "res/achievements/achievement.png"
	L5_38, L6_39 = L5_38(L6_39)
	L7_40 = 200
	L8_41 = 50
	local L9_42 = L9_42
	L2_35:insert((utils.drawGreyOverlay(screenWidth, display.contentHeight)))
	utils.drawGreyOverlay(screenWidth, display.contentHeight).x, utils.drawGreyOverlay(screenWidth, display.contentHeight).y = screenX + screenWidth / 2, display.contentHeight / 2
	utils.addHitBlockListeners((utils.drawGreyOverlay(screenWidth, display.contentHeight)))
	_ENV = display.newGroup()
	_UPVALUE1_ = display.newImage("res/achievements/achievement_box.png", 0, 0, true)
	L11_11 = battleAvatar.buildUi(avatar.playerAvatar(), 1, "left", false)
	_ENV:insert(_UPVALUE1_)
	_ENV:insert(L11_11)
	L11_11:setReferencePoint(display.BottomLeftReferencePoint)
	L11_11:scale(0.65, 0.65)
	L11_11:laughAnimation()
	L11_11:setReferencePoint(display.BottomLeftReferencePoint)
	L11_11.x, L11_11.y = _UPVALUE1_.x - _UPVALUE1_.contentWidth / 2, 519
	local L10_43 = L10_43
	display.newGroup().x = _UPVALUE1_.width / 2
	local L11_44 = L11_44
	local L13_46 = L13_46
	display.newGroup():insert((utils.newButton(L5_38, L6_39, "share_text.png")))
	local L14_47 = L14_47
	L2_2.twitterIcon = _UPVALUE3_(L5_38, L6_39, "twitter_normal_btn.png", "twitter_select_btn.png", settings:get(L0_0, false), function()
		sound.playSound(sound.globalSounds.button)
		require("twitterSupport")
		local L1_58 = L1_58
		L1_58 = twitterSupport
		L1_58 = L1_58.twitterEnabled
		if not L1_58 then
			L1_58 = twitterSupport
			L1_58 = L1_58.init
			L1_58()
		end
	end)
	display.newGroup():insert((_UPVALUE3_(L5_38, L6_39, "twitter_normal_btn.png", "twitter_select_btn.png", settings:get(L0_0, false), function()
		sound.playSound(sound.globalSounds.button)
		require("twitterSupport")
		local L1_59 = L1_59
		L1_59 = twitterSupport
		L1_59 = L1_59.twitterEnabled
		if not L1_59 then
			L1_59 = twitterSupport
			L1_59 = L1_59.init
			L1_59()
		end
	end)))
	local L15_48 = L15_48
	L2_2.facebookIcon = _UPVALUE3_(L5_38, L6_39, "facebook_normal_btn.png", "facebook_select_btn.png", settings:get(L1_1, false), function()
		sound.playSound(sound.globalSounds.button)
		require("facebookSupport")
		local L1_60 = L1_60
		L1_60 = facebookSupport
		L1_60 = L1_60.facebookEnabled
		if not L1_60 then
			L1_60 = facebookSupport
			L1_60 = L1_60.init
			L1_60()
		end
	end)
	local L16_49 = L16_49
	L15_48:insert((_UPVALUE3_(L5_38, L6_39, "facebook_normal_btn.png", "facebook_select_btn.png", settings:get(L1_1, false), function()
		sound.playSound(sound.globalSounds.button)
		require("facebookSupport")
		local L1_61 = L1_61
		L1_61 = facebookSupport
		L1_61 = L1_61.facebookEnabled
		if not L1_61 then
			L1_61 = facebookSupport
			L1_61 = L1_61.init
			L1_61()
		end
	end)))
	_UPVALUE3_(L5_38, L6_39, "facebook_normal_btn.png", "facebook_select_btn.png", settings:get(L1_1, false), function()
		sound.playSound(sound.globalSounds.button)
		require("facebookSupport")
		local L1_62 = L1_62
		L1_62 = facebookSupport
		L1_62 = L1_62.facebookEnabled
		if not L1_62 then
			L1_62 = facebookSupport
			L1_62 = L1_62.init
			L1_62()
		end
	end).x = _UPVALUE3_(L5_38, L6_39, "twitter_normal_btn.png", "twitter_select_btn.png", settings:get(L0_0, false), function()
		sound.playSound(sound.globalSounds.button)
		require("twitterSupport")
		local L1_63 = L1_63
		L1_63 = twitterSupport
		L1_63 = L1_63.twitterEnabled
		if not L1_63 then
			L1_63 = twitterSupport
			L1_63 = L1_63.init
			L1_63()
		end
	end).width + (L14_47.width - _UPVALUE3_(L5_38, L6_39, "twitter_normal_btn.png", "twitter_select_btn.png", settings:get(L0_0, false), function()
		sound.playSound(sound.globalSounds.button)
		require("twitterSupport")
		local L1_64 = L1_64
		L1_64 = twitterSupport
		L1_64 = L1_64.twitterEnabled
		if not L1_64 then
			L1_64 = twitterSupport
			L1_64 = L1_64.init
			L1_64()
		end
	end).width - _UPVALUE3_(L5_38, L6_39, "facebook_normal_btn.png", "facebook_select_btn.png", settings:get(L1_1, false), function()
		sound.playSound(sound.globalSounds.button)
		require("facebookSupport")
		local L1_65 = L1_65
		L1_65 = facebookSupport
		L1_65 = L1_65.facebookEnabled
		if not L1_65 then
			L1_65 = facebookSupport
			L1_65 = L1_65.init
			L1_65()
		end
	end).width) / 2
	L13_46:insert(L15_48)
	L15_48:setReferencePoint(display.TopCenterReferencePoint)
	L15_48.x = 0
	L15_48.y = L14_47.contentBounds.yMax + 5
	_ENV:insert(L13_46)
	L13_46:setReferencePoint(display.CenterReferencePoint)
	L13_46.x = _UPVALUE1_.width / 2
	L13_46.y = _UPVALUE1_.height - 86
	local L17_50 = L17_50
	local L18_51 = L18_51
	utils.newButton(L5_38, L6_39, "check_normal_btn.png", "check_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		if _ENV.selected then
			_UPVALUE1_.updateTwitter = true
		end
		settings:set(L0_0, _ENV.selected)
		if L18_51.selected then
			_UPVALUE1_.updateFacebook = true
		end
		settings:set(L1_1, L18_51.selected)
		local L3_69 = L3_69
		L3_69 = table
		L3_69 = L3_69.insert
		L3_69(_UPVALUE5_, _UPVALUE1_)
		L3_69 = achievementList
		L3_69 = L3_69.unacknowledgedUpdates
		L3_69 = #L3_69
		if L3_69 == 0 then
			L3_69 = _UPVALUE6_
			if 0 < L3_69 then
				L3_69 = timer
				L3_69 = L3_69.performWithDelay
				L3_69(1, function()
					storyboard.removeScene("achievementScene")
					local L1_70 = L1_70
				end)
				L3_69 = storyboard
				L3_69 = L3_69.gotoScene
				L3_69("missionsCompletedScene")
			else
				L3_69 = A0_33
				L3_69 = L3_69.closeSelfAndLast
				L3_69(L3_69)
				L3_69 = storyboard
				L3_69 = L3_69.gotoScene
				L3_69("campaignMapScene")
			end
		else
			L3_69 = A0_33
			L3_69 = L3_69.showUpdate
			L3_69(L3_69)
			local L1_67 = L1_67
		end
		L3_69 = true
		return L3_69
	end):setReferencePoint(display.CenterReferencePoint)
	utils.newButton(L5_38, L6_39, "check_normal_btn.png", "check_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		if _ENV.selected then
			_UPVALUE1_.updateTwitter = true
		end
		settings:set(L0_0, _ENV.selected)
		if L18_51.selected then
			_UPVALUE1_.updateFacebook = true
		end
		settings:set(L1_1, L18_51.selected)
		local L3_74 = L3_74
		L3_74 = table
		L3_74 = L3_74.insert
		L3_74(_UPVALUE5_, _UPVALUE1_)
		L3_74 = achievementList
		L3_74 = L3_74.unacknowledgedUpdates
		L3_74 = #L3_74
		if L3_74 == 0 then
			L3_74 = _UPVALUE6_
			if 0 < L3_74 then
				L3_74 = timer
				L3_74 = L3_74.performWithDelay
				L3_74(1, function()
					storyboard.removeScene("achievementScene")
					local L1_75 = L1_75
				end)
				L3_74 = storyboard
				L3_74 = L3_74.gotoScene
				L3_74("missionsCompletedScene")
			else
				L3_74 = A0_33
				L3_74 = L3_74.closeSelfAndLast
				L3_74(L3_74)
				L3_74 = storyboard
				L3_74 = L3_74.gotoScene
				L3_74("campaignMapScene")
			end
		else
			L3_74 = A0_33
			L3_74 = L3_74.showUpdate
			L3_74(L3_74)
			local L1_72 = L1_72
		end
		L3_74 = true
		return L3_74
	end).x = _UPVALUE1_.width - utils.newButton(L5_38, L6_39, "check_normal_btn.png", "check_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		if _ENV.selected then
			_UPVALUE1_.updateTwitter = true
		end
		settings:set(L0_0, _ENV.selected)
		if L18_51.selected then
			_UPVALUE1_.updateFacebook = true
		end
		settings:set(L1_1, L18_51.selected)
		local L3_79 = L3_79
		L3_79 = table
		L3_79 = L3_79.insert
		L3_79(_UPVALUE5_, _UPVALUE1_)
		L3_79 = achievementList
		L3_79 = L3_79.unacknowledgedUpdates
		L3_79 = #L3_79
		if L3_79 == 0 then
			L3_79 = _UPVALUE6_
			if 0 < L3_79 then
				L3_79 = timer
				L3_79 = L3_79.performWithDelay
				L3_79(1, function()
					storyboard.removeScene("achievementScene")
					local L1_80 = L1_80
				end)
				L3_79 = storyboard
				L3_79 = L3_79.gotoScene
				L3_79("missionsCompletedScene")
			else
				L3_79 = A0_33
				L3_79 = L3_79.closeSelfAndLast
				L3_79(L3_79)
				L3_79 = storyboard
				L3_79 = L3_79.gotoScene
				L3_79("campaignMapScene")
			end
		else
			L3_79 = A0_33
			L3_79 = L3_79.showUpdate
			L3_79(L3_79)
			local L1_77 = L1_77
		end
		L3_79 = true
		return L3_79
	end).width
	utils.newButton(L5_38, L6_39, "check_normal_btn.png", "check_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		if _ENV.selected then
			_UPVALUE1_.updateTwitter = true
		end
		settings:set(L0_0, _ENV.selected)
		if L18_51.selected then
			_UPVALUE1_.updateFacebook = true
		end
		settings:set(L1_1, L18_51.selected)
		local L3_84 = L3_84
		L3_84 = table
		L3_84 = L3_84.insert
		L3_84(_UPVALUE5_, _UPVALUE1_)
		L3_84 = achievementList
		L3_84 = L3_84.unacknowledgedUpdates
		L3_84 = #L3_84
		if L3_84 == 0 then
			L3_84 = _UPVALUE6_
			if 0 < L3_84 then
				L3_84 = timer
				L3_84 = L3_84.performWithDelay
				L3_84(1, function()
					storyboard.removeScene("achievementScene")
					local L1_85 = L1_85
				end)
				L3_84 = storyboard
				L3_84 = L3_84.gotoScene
				L3_84("missionsCompletedScene")
			else
				L3_84 = A0_33
				L3_84 = L3_84.closeSelfAndLast
				L3_84(L3_84)
				L3_84 = storyboard
				L3_84 = L3_84.gotoScene
				L3_84("campaignMapScene")
			end
		else
			L3_84 = A0_33
			L3_84 = L3_84.showUpdate
			L3_84(L3_84)
			local L1_82 = L1_82
		end
		L3_84 = true
		return L3_84
	end).y = _UPVALUE1_.height - 86
	utils.parentWidget(utils.newButton(L5_38, L6_39, "check_normal_btn.png", "check_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		if _ENV.selected then
			_UPVALUE1_.updateTwitter = true
		end
		settings:set(L0_0, _ENV.selected)
		if L18_51.selected then
			_UPVALUE1_.updateFacebook = true
		end
		settings:set(L1_1, L18_51.selected)
		local L3_89 = L3_89
		L3_89 = table
		L3_89 = L3_89.insert
		L3_89(_UPVALUE5_, _UPVALUE1_)
		L3_89 = achievementList
		L3_89 = L3_89.unacknowledgedUpdates
		L3_89 = #L3_89
		if L3_89 == 0 then
			L3_89 = _UPVALUE6_
			if 0 < L3_89 then
				L3_89 = timer
				L3_89 = L3_89.performWithDelay
				L3_89(1, function()
					storyboard.removeScene("achievementScene")
					local L1_90 = L1_90
				end)
				L3_89 = storyboard
				L3_89 = L3_89.gotoScene
				L3_89("missionsCompletedScene")
			else
				L3_89 = A0_33
				L3_89 = L3_89.closeSelfAndLast
				L3_89(L3_89)
				L3_89 = storyboard
				L3_89 = L3_89.gotoScene
				L3_89("campaignMapScene")
			end
		else
			L3_89 = A0_33
			L3_89 = L3_89.showUpdate
			L3_89(L3_89)
			local L1_87 = L1_87
		end
		L3_89 = true
		return L3_89
	end), _ENV)
	L13_13 = display.newText("Congratulations!", 0, 0, "SingleSleeve", 120)
	L13_13:setTextColor(LITTLE_GENERALS_BROWN_DARK())
	_ENV:insert(L13_13)
	L13_13.x = _UPVALUE1_.width / 2
	L13_13.y = 185
	utils.parentWidget(L13_13, _ENV)
	local L23_56 = L23_56
	local L24_57 = L24_57
	L14_14 = display.newText("", 0, 0, "SingleSleeve", 40)
	L14_14.x = _UPVALUE1_.width / 2
	L14_14.y = L13_13.contentBounds.yMax + 5
	L14_14:setTextColor(LITTLE_GENERALS_BROWN_DARK())
	utils.parentWidget(L14_14, _ENV)
	L12_12 = utils.newButton(L5_38, L6_39, "icon_overlay.png")
	L12_12:setReferencePoint(display.CenterReferencePoint)
	L12_12.x = _UPVALUE1_.width / 2
	L12_12.y = _UPVALUE1_.contentBounds.yMin + L12_12.height / 2 + 13
	utils.parentWidget(L12_12, _ENV)
	_ENV.y = display.contentHeight / 2 - _ENV.height / 2
	L2_35:insert(_ENV)
	local L21_54 = L21_54
end
function L7_7.enterScene(A0_91, A1_92)
	A0_91.previousScene = storyboard.getCurrentSceneName()
	local L2_93 = L2_93
	L2_93("entering achievementScene", A0_91.previousScene)
	L2_93 = A0_91.view
	local L3_94 = L3_94
	L3_94 = L3_94("battlfieldScene")
	if L3_94 then
		L3_94.view.isVisible = true
		L3_94.view:toBack()
	end
	local L7_98 = L7_98
	L7_98.x = screenX + (screenWidth - _ENV.width) / 2
	L7_98 = _UPVALUE1_
	if not L7_98 then
		L7_98 = A0_91.showUpdate
		L7_98(A0_91)
	end
	L7_98 = A0_91.view
	L7_98 = L7_98.toFront
	L7_98(L7_98)
	L7_98 = require
	L7_98("twitterSupport")
	L7_98 = L2_2
	L7_98 = L7_98.twitterIcon
	L7_98 = L7_98.selected
	if L7_98 then
		L7_98 = twitterSupport
		L7_98 = L7_98.twitterEnabled
		if not L7_98 then
			L7_98 = L2_2
			L7_98 = L7_98.twitterIcon
			L7_98.selected = false
			L7_98 = L2_2
			L7_98 = L7_98.twitterIcon
			L7_98 = L7_98.updateSelection
			L7_98()
		end
	end
	L7_98 = require
	L7_98("facebookSupport")
	L7_98 = L2_2
	L7_98 = L7_98.facebookIcon
	L7_98 = L7_98.selected
	if L7_98 then
		L7_98 = facebookSupport
		L7_98 = L7_98.facebookEnabled
		if not L7_98 then
			L7_98 = L2_2
			L7_98 = L7_98.facebookIcon
			L7_98.selected = false
			L7_98 = L2_2
			L7_98 = L7_98.facebookIcon
			L7_98 = L7_98.updateSelection
			L7_98()
		end
	end
end
function L7_7.exitScene(A0_99, A1_100)
	local L2_101 = L2_101
	L2_101 = L2_101("battlfieldScene")
	print("EXIT", L2_101, A0_99.previousScene)
	if L2_101 then
		L3_102(L4_103, L5_104, false)
		L3_102 = L2_101.view
		L3_102.isVisible = false
	end
	L3_102 = 1
	L4_103 = _ENV
	L4_103 = #L4_103
	L5_104 = 1
	for L6_105 = L3_102, L4_103, L5_104 do
		_ENV[L6_105]:acknowledge()
		local L7_106, L8_107 = L7_106, L8_107
	end
end
function L7_7.destroyScene(A0_108, A1_109)
	local L2_110
	L2_110 = A0_108.view
	_ENV:dispose()
	_ENV = nil
	L5_5:destroy()
	local L3_111 = L3_111
	L3_111("res/achievements/achievement.png")
	local L4_112 = L4_112
end
L7_7:addEventListener("createScene", L7_7)
L7_7:addEventListener("enterScene", L7_7)
L7_7:addEventListener("exitScene", L7_7)
local L16_16, L17_17 = L16_16, L17_17
local L18_18 = L18_18
L7_7:addEventListener("destroyScene", L7_7)
local L19_19 = L19_19
return L7_7
