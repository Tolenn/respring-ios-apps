-- Decompiled & AI-Repaired from achievementsCompletedScene.lu
-- Source disassembly preserved at: disasm/achievementsCompletedScene.disasm

local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9 = storyboard.newScene, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
L1_1 = L1_1()
L2_2 = 100
L3_3 = nil
L4_4 = nil
L5_5 = nil
L6_6 = nil
function L7_7(A0_14, A1_15)
	local L2_16 = display.newGroup()
	local L3_17 = L3_17
	local L7_21 = L7_21
	local L8_22 = L8_22
	local L3_17, L9_23 = L3_17(L7_21, L8_22, 0, 0, "SingleSleeve", 60), L9_23
	L8_22 = L3_17
	L7_21 = L3_17.setTextColor
	L9_23 = LITTLE_GENERALS_BROWN_DARK
	L9_23 = L9_23()
	L7_21(L8_22, L9_23, L9_23())
	L8_22 = L2_16
	L7_21 = L2_16.setReferencePoint
	L9_23 = display
	L9_23 = L9_23.TopCenterReferencePoint
	L7_21(L8_22, L9_23)
	L7_21 = 0
	L8_22 = A0_14.contentHeight
	L2_16.y = L8_22
	L2_16.x = L7_21
	L8_22 = A0_14
	L7_21 = A0_14.insert
	L9_23 = L2_16
	L7_21(L8_22, L9_23)
	return L2_16
end
function L8_8(A0_24, A1_25, A2_26, A3_27)
	local L4_28 = display.newGroup()
	local L5_29 = L5_29
	L5_29 = L5_29(A1_25)
	if not L5_29 then
		L5_29 = display.newGroup()
		_FOR_ = 20
		for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
			display.newCircle(0, 0, 3).strokeWidth = 3
			display.newCircle(0, 0, 3):setStrokeColor(LITTLE_GENERALS_BROWN_DARK())
			display.newCircle(0, 0, 3).alpha = 0.5
			L5_29:insert((display.newCircle(0, 0, 3)))
			display.newCircle(0, 0, 3).x, display.newCircle(0, 0, 3).y = utils.getXYfromVector(_FORV_9_, 60)
		end
	end
	L5_29:scale(0.5, 0.5)
	L4_28:insert(L5_29)
	L5_29:setReferencePoint(display.TopLeftReferencePoint)
	L5_29.x, L5_29.y = 0, 0
	local L6_30 = L6_30
	;({}).size = 40
	L6_30 = L6_30(A2_26, {})
	L4_28:insert(L6_30)
	L6_30:setReferencePoint(display.TopLeftReferencePoint)
	L6_30.x, L6_30.y = L5_29.contentWidth + 10, -7
	local L7_31 = L7_31
	local L11_35 = L11_35
	local L12_36 = L12_36
	local L7_31, L13_37 = L7_31(L11_35, L12_36, 0, 0, "SingleSleeve", 30), L13_37
	L12_36 = L7_31
	L11_35 = L7_31.setReferencePoint
	L13_37 = display
	L13_37 = L13_37.TopLeftReferencePoint
	L11_35(L12_36, L13_37)
	L12_36 = L7_31
	L11_35 = L7_31.setTextColor
	L13_37 = LITTLE_GENERALS_BROWN_DARK
	L13_37 = L13_37()
	L11_35(L12_36, L13_37, L13_37())
	L11_35 = L6_30.x
	L12_36 = L6_30.contentHeight
	L12_36 = L12_36 - 15
	L7_31.y = L12_36
	L7_31.x = L11_35
	L12_36 = L4_28
	L11_35 = L4_28.setReferencePoint
	L13_37 = display
	L13_37 = L13_37.TopLeftReferencePoint
	L11_35(L12_36, L13_37)
	L11_35 = 0
	L12_36 = A0_24.contentHeight
	L4_28.y = L12_36
	L4_28.x = L11_35
	L12_36 = A0_24
	L11_35 = A0_24.insert
	L13_37 = L4_28
	L11_35(L12_36, L13_37)
	return L4_28
end
function L9_9()
	local L11_49, L12_50 = display.newGroup, L12_50
	L11_49 = L11_49()
	L12_50 = display
	L12_50 = L12_50.newRect
	L12_50 = L12_50(0, 0, 10, 10)
	L12_50:setFillColor(253, 209, 152)
	local L2_40 = L2_40
	L2_40(L11_49, L12_50)
	L2_40 = {}
	L2_40[1] = achievementList.miscAchievements
	L2_40[2] = achievementList.terrainAchievements
	L2_40[3] = achievementList.battleAchievements
	L2_40[4] = achievementList.campaignAchievements
	_FOR_, _FOR_, _FOR_ = pairs(L2_40)
	for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
		_FOR_, _FOR_, _FOR_ = pairs(_FORV_7_)
		for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
			if type(_FORV_12_) == "number" then
				if achievementList.achievementIsComplete(_FORV_12_, _FORV_7_) then
				end
			end
		end
	end
	L8_46 = L7_7
	L9_47 = L11_49
	L10_48 = "RANKS"
	L8_46 = L8_46(L9_47, L10_48)
	L9_47 = L11_49.contentWidth
	L9_47 = L9_47 / 2
	L8_46.x = L9_47
	L9_47 = achievementList
	L9_47 = L9_47.ranks
	L9_47 = L9_47.rankData
	L10_48 = achievementList
	L10_48 = L10_48.playerKills
	L10_48 = L10_48()
	L19_57 = pairs
	L19_57, L7_45, _FOR_ = L19_57(L9_47)
	for _FORV_9_, _FORV_10_ in L19_57, L7_45, _FOR_ do
		({})[1] = "Accumulate"
		;({})[2] = "Rack up"
		;({})[3] = "Score"
		;({})[4] = "Tally up"
		if L10_48 >= _FORV_10_.rewardLevel then
		else
		end
		local L16_54 = L16_54
		local L17_55 = L17_55
		local L18_56 = L18_56
	end
	return L11_49
end
function L1_1.createScene(A0_58, A1_59)
	local L2_60
	L2_60 = A0_58.view
	local L3_61 = L3_61
	;({}).group = L2_60
	;({}).title = "ACHIEVEMENTS"
	;({}).showBottomBar = false
	;({}).onClose = function()
		storyboard.gotoScene("missionsScene")
		storyboard.removeScene("achievementsCompletedScene")
		local L1_69 = L1_69
	end
	L3_61 = L3_61({})
	;({}).width = 740
	;({}).height = 483
	;({}).maskFile = "res/mask740x483.png"
	local L8_66 = L8_66
	local L9_67 = L9_67
	;({})[1] = 255
	;({})[2] = 255
	;({})[3] = 255
	local ({})[4], L10_68 = 0, L10_68
	L9_67.bgColor = L10_68
	L8_66 = L8_66(L9_67)
	_ENV = L8_66
	L8_66 = _ENV
	L9_67 = L8_66
	L8_66 = L8_66.setReferencePoint
	L10_68 = display
	L10_68 = L10_68.TopLeftReferencePoint
	L8_66(L9_67, L10_68)
	L9_67 = L2_60
	L8_66 = L2_60.insert
	L10_68 = _ENV
	L8_66(L9_67, L10_68)
	L8_66 = _ENV
	L8_66.x = 30
	L8_66 = _ENV
	L8_66.y = 113
	L8_66 = L9_9
	L8_66 = L8_66()
	L9_67 = _ENV
	L10_68 = L9_67
	L9_67 = L9_67.insert
	L9_67(L10_68, L8_66)
	local L7_65 = L7_65
end
function L1_1.enterScene(A0_70, A1_71)
	local L2_72
	L2_72 = A0_70.view
end


-- [End of decompiled block; see disassembly for inner stripped closures]
