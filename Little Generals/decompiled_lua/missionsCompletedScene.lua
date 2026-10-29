local L3_3, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20 = L3_3, "widgetTracker", L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20
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
L16_16 = nil
L17_17 = nil
L18_18 = nil
L19_19 = {}
L19_19.stamp = "res/sounds/stamp.mp3"
L19_19.whoosh = "res/sounds/whoosh.mp3"
function L20_20(A0_25, A1_26)
	local L2_27 = display.newGroup()
	if A1_26 then
		missions.getMissionIcon(A1_26):scale(0.75, 0.75)
		L2_27:insert((missions.getMissionIcon(A1_26)))
		missions.getMissionIcon(A1_26):setReferencePoint(display.TopLeftReferencePoint)
		missions.getMissionIcon(A1_26).x, missions.getMissionIcon(A1_26).y = 0, 0
		display.newText(L2_27, A1_26.name, 0, 0, "SingleSleeve", 40):setReferencePoint(display.TopLeftReferencePoint)
		display.newText(L2_27, A1_26.name, 0, 0, "SingleSleeve", 40):setTextColor(LITTLE_GENERALS_BROWN_DARK())
		display.newText(L2_27, A1_26.name, 0, 0, "SingleSleeve", 40).x, display.newText(L2_27, A1_26.name, 0, 0, "SingleSleeve", 40).y = missions.getMissionIcon(A1_26).x + missions.getMissionIcon(A1_26).contentWidth + 5, 0
		if A1_26.getRemainder then
			if A1_26.desc2 then
			else
			end
		end
		display.newText(L2_27, A1_26.desc .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30):setReferencePoint(display.TopLeftReferencePoint)
		display.newText(L2_27, A1_26.desc .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30):setTextColor(LITTLE_GENERALS_BROWN_DARK())
		display.newText(L2_27, A1_26.desc .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30).x, display.newText(L2_27, A1_26.desc .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30).y = display.newText(L2_27, A1_26.name, 0, 0, "SingleSleeve", 40).x, display.newText(L2_27, A1_26.name, 0, 0, "SingleSleeve", 40).y + display.newText(L2_27, A1_26.name, 0, 0, "SingleSleeve", 40).contentHeight - 10
		if A1_26.desc2 .. " " .. A1_26.getRemainder(missions) .. " left!" then
			display.newText(L2_27, A1_26.desc .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30).y = display.newText(L2_27, A1_26.desc .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30).y - 5
			local L12_37 = L12_37
			local L13_38 = L13_38
			local L14_39 = L14_39
			display.newText(L2_27, A1_26.desc2 .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30):setReferencePoint(display.TopLeftReferencePoint)
			display.newText(L2_27, A1_26.desc2 .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30):setTextColor(LITTLE_GENERALS_BROWN_DARK())
			display.newText(L2_27, A1_26.desc2 .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30).x, display.newText(L2_27, A1_26.desc2 .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30).y = display.newText(L2_27, A1_26.desc .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30).x, display.newText(L2_27, A1_26.desc .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30).y + display.newText(L2_27, A1_26.desc .. " " .. A1_26.getRemainder(missions) .. " left!", 0, 0, "SingleSleeve", 30).contentHeight - 10
		end
		display.newImageRect("res/missions/completed.png", 255, 86).rotation = math.random(-3, 3)
		display.newImageRect("res/missions/completed.png", 255, 86).x, display.newImageRect("res/missions/completed.png", 255, 86).y = 350, L2_27.contentHeight / 2
		L2_27:insert((display.newImageRect("res/missions/completed.png", 255, 86)))
		L2_27.completedStamp = display.newImageRect("res/missions/completed.png", 255, 86)
		display.newImageRect("res/missions/completed.png", 255, 86).alpha = 0
		L12_37.y = 10
		break -- pseudo-goto
	end
	L12_37 = display
	L12_37 = L12_37.newText
	L13_38 = L2_27
	L14_39 = "More missions coming soon!"
	L12_37 = L12_37(L13_38, L14_39, 0, 0, "SingleSleeve", 40)
	repeat
		L14_39 = L12_37
		L13_38 = L12_37.setReferencePoint
		L13_38(L14_39, display.TopLeftReferencePoint)
		L14_39 = L12_37
		L13_38 = L12_37.setTextColor
		L13_38(L14_39, LITTLE_GENERALS_BROWN_DARK())
		L13_38 = 100
		L12_37.y = 25
		L12_37.x = L13_38
	until true
	L12_37 = A0_25 - 1
	L12_37 = L12_37 * 91
	L2_27.index = A0_25
	L13_38 = 0
	L2_27.y = L12_37
	L2_27.x = L13_38
	L13_38 = _ENV
	L14_39 = L13_38
	L13_38 = L13_38.insert
	L13_38(L14_39, L2_27)
	if A1_26 then
		L13_38 = _ENV
		L13_38 = L13_38.missionRows
		L14_39 = tostring
		L14_39 = L14_39(A1_26.id)
		L13_38[L14_39] = L2_27
	else
		L13_38 = _ENV
		L13_38 = L13_38.missionRows
		L14_39 = "nomission_"
		local L7_32 = tostring(A0_25)
		L14_39 = L14_39 .. L7_32
		L13_38[L14_39] = L2_27
	end
	return L2_27
end
function L7_7.createScene(A0_40, A1_41)
	local L2_42
	L2_42 = A0_40.view
	local L5_45 = L5_45
	L5_45(settings, "missionsSeen", true)
	local L6_46 = L6_46
	L5_45 = settings
	L6_46 = L5_45
	L5_45 = L5_45.save
	L5_45(L6_46)
	L5_45 = {}
	_ENV = L5_45
	L5_45 = 200
	L6_46 = 50
	sound.loadSoundBatch(L19_19)
	local L7_47 = L7_47
	L2_42:insert((utils.drawGreyOverlay(screenWidth, display.contentHeight)))
	utils.drawGreyOverlay(screenWidth, display.contentHeight).x, utils.drawGreyOverlay(screenWidth, display.contentHeight).y = screenX + screenWidth / 2, display.contentHeight / 2
	utils.addHitBlockListeners((utils.drawGreyOverlay(screenWidth, display.contentHeight)))
	L10_10 = display.newGroup()
	local L11_51 = L11_51
	local L12_52 = L12_52
	local L13_53 = display.newImage(L10_10, "res/missions/mission_box.png", 0, 0, true)
	dialogBack = L13_53
	L13_53 = dialogBack
	L13_53.x, dialogBack.y = 0, 0
	L13_53 = L10_10
	L13_53.y = display.contentHeight / 2
	L13_53 = L10_10
	L13_53.x = screenX + screenWidth / 2
	L13_53 = L2_42.insert
	L13_53(L2_42, L10_10)
end
function L7_7.enterScene(A0_54, A1_55)
	local L8_62, L9_63 = storyboard.getCurrentSceneName, L9_63
	L8_62 = L8_62()
	A0_54.previousScene = L8_62
	L8_62 = A0_54.view
	L9_63 = storyboard
	L9_63 = L9_63.getScene
	L9_63 = L9_63("battlefieldScene")
	if L9_63 then
		L9_63.view.isVisible = true
		L9_63.view:toBack()
	end
	A0_54.view:toFront()
	local L4_58 = display.newGroup()
	L8_62:insert(L4_58)
	if _ENV then
		display.remove(_ENV)
		_ENV = nil
	end
	_ENV = display.newGroup()
	_ENV.missionRows = {}
	L4_58:insert(_ENV)
	_ENV.x = -dialogBack.contentWidth / 2 + 55
	_ENV.y = -dialogBack.contentHeight / 2 + 142
	if missions:numActiveMissions() == 0 then
		L20_20(1, nil)
	else
		_UPVALUE2_()
	end
	L4_58.x = screenX + screenWidth / 2
	L4_58.y = display.contentHeight / 2
	L12_12 = missions:getCompletedActiveMissions()
	if 0 < #L12_12 then
		_FOR_, _FOR_, _FOR_ = pairs(L12_12)
		for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
			missions:markMissionCompleted(_FORV_9_.id)
		end
		L10_64 = missions
		L11_65 = L10_64
		L10_64 = L10_64.removeCompletedActiveMissions
		L10_64(L11_65)
		L10_64 = missions
		L11_65 = L10_64
		L10_64 = L10_64.fillActiveMissions
		L10_64 = L10_64(L11_65)
		L14_14 = L10_64
		L10_64 = missions
		L11_65 = L10_64
		L10_64 = L10_64.saveAllMissionData
		L10_64(L11_65)
	end
	L10_64 = {}
	L13_13 = L10_64
	L10_64 = timer
	L10_64 = L10_64.performWithDelay
	L11_65 = 500
	L12_66 = _UPVALUE7_
	L10_64 = L10_64(L11_65, L12_66)
	L17_17 = L10_64
end
function L7_7.exitScene(A0_67, A1_68)
	local L2_69 = L2_69
	L2_69 = L2_69("battlfieldScene")
	if L2_69 then
		L2_69.view.isVisible = false
	end
	if _ENV then
		local L3_70 = L3_70
		L3_70(_ENV)
		local L4_71 = L4_71
	end
end
function L7_7.destroyScene(A0_72, A1_73)
	local L2_74
	L2_74 = A0_72.view
	L5_77 = sound
	L5_77 = L5_77.disposeSoundBatch
	L6_78 = _ENV
	L5_77(L6_78)
	L5_77 = nil
	_ENV = L5_77
	L5_77 = L15_15
	L5_77 = #L5_77
	L6_78 = 1
	_FOR_ = -1
	for _FORV_6_ = L5_77, L6_78, _FOR_ do
		L15_15[_FORV_6_]:delete()
		table.remove(L15_15, _FORV_6_)
		local L9_81 = L9_81
	end
	L5_77 = nil
	L15_15 = L5_77
end
L7_7:addEventListener("createScene", L7_7)
L7_7:addEventListener("enterScene", L7_7)
L7_7:addEventListener("exitScene", L7_7)
local L21_21, L22_22 = L21_21, L22_22
local L23_23 = L23_23
L7_7:addEventListener("destroyScene", L7_7)
local L24_24 = L24_24
return L7_7
