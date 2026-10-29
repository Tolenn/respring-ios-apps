local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25 = storyboard.newScene, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25
L3_3 = L3_3()
L4_4 = require
L5_5 = "tanks.tankUpgrade"
L4_4 = L4_4(L5_5)
L5_5 = L4_4.availableTankUpgradesInOrder
L6_6 = L4_4.tankUpgradeTypes
L7_7 = {}
L7_7.select = "res/sounds/weapon_select.mp3"
L8_8 = nil
L9_9 = 1
L10_10 = 1
L11_11 = nil
L12_12 = false
L13_13 = nil
L14_14 = nil
function L15_15()
	if _ENV then
		local ({}).params, ({}).focusOnTankType, L4_34 = {}, L13_13, L4_34
		L4_34("tanks.tankGarage", {})
		repeat
			do break end -- pseudo-goto
			L4_34 = storyboard
			L4_34 = L4_34.gotoScene
			L4_34("tanks.tankDepot")
		until true
	end
	L4_34 = storyboard
	L4_34 = L4_34.removeScene
	L4_34("tanks.tankUpgradeShop")
	local L1_31 = L1_31
end
L16_16 = nil
L17_17 = nil
L18_18 = nil
L19_19 = nil
L20_20 = {}
function L21_21(A0_35, A1_36)
	local L2_37, L3_38, L4_39, L5_40, L6_41
	L2_37 = _ENV
	if not L2_37 then
		L2_37 = {}
	end
	_ENV = L2_37
	L2_37 = 1
	L3_38 = _ENV
	L3_38 = #L3_38
	L4_39 = 1
	for L5_40 = L2_37, L3_38, L4_39 do
		L6_41 = _ENV
		L6_41 = L6_41[L5_40]
		L6_41 = L6_41.type
		if L6_41 == A1_36 then
			L6_41 = true
			return L6_41
		end
	end
	L2_37 = false
	return L2_37
end
function L22_22(A0_42, A1_43)
	if not _ENV(A0_42, A1_43) then
		local L5_47 = L5_47
		L5_47(L14_14, L1_1.createTankUpgrade(A1_43))
		L5_47 = L1_1
		L5_47 = L5_47.saveUpgradesForTankType
		local L3_45 = L3_45
		L5_47(L3_45, L14_14)
		local L4_46 = L4_46
	end
end
function L23_23(A0_48, A1_49)
	L5_53 = L5_53(A0_48, A1_49)
	if L5_53 then
		L5_53 = L14_14
		L5_53 = #L5_53
		_FOR_ = -1
		for _FORV_5_ = L5_53, _FOR_, _FOR_ do
			if L14_14[_FORV_5_].type == A1_49 then
				table.remove(L14_14, _FORV_5_)
			end
		end
		L5_53 = L1_1
		L5_53 = L5_53.saveUpgradesForTankType
		L6_54 = A0_48
		L7_55 = L14_14
		L5_53(L6_54, L7_55)
	end
end
function L24_24(A0_57)
	local L7_64 = L7_64
	if _ENV then
		L7_64 = display
		L7_64 = L7_64.remove
		L7_64(_ENV)
		L7_64 = nil
		_ENV = L7_64
	end
	L7_64 = L19_19
	if A0_57 == L7_64 then
		L7_64 = nil
		L19_19 = L7_64
		L7_64 = utils
		L7_64 = L7_64.getOutlinedText
		;({}).size = 60
		;({}).fontColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
		;({}).shadowColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		L7_64 = L7_64("ALL UPGRADES", {})
		_ENV = L7_64
	else
		L19_19 = A0_57
		L7_64 = L6_6
		L7_64 = L7_64.classes
		L7_64 = L7_64[L19_19]
		;({}).size = 60
		;({}).fontColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
		;({}).shadowColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		_ENV = utils.getOutlinedText(L7_64.groupName, {})
	end
	L7_64 = L0_0
	L7_64 = L7_64.view
	L7_64 = L7_64.insert
	L7_64(L7_64, _ENV)
	L7_64 = L16_16
	L7_64 = L7_64.localToContent
	local L2_59 = L2_59
	L7_64, L2_59 = L7_64(L2_59, L3_60, 0)
	L3_60 = _ENV
	L4_61 = _ENV
	L3_60.x, L4_61.y = screenX + screenWidth / 2, L2_59
	L3_60 = 1
	L4_61 = L20_20
	L4_61 = #L4_61
	_FOR_ = 1
	for _FORV_6_ = L3_60, L4_61, _FOR_ do
		if L20_20[_FORV_6_].filterClass == L19_19 then
			L20_20[_FORV_6_].showPressed()
			break -- pseudo-goto
		end
		L20_20[_FORV_6_].showNormal()
		repeat
		until true
	end
end
function L25_25()
	if _ENV.refreshLayer then
		_ENV.refreshLayer.text = nil
	end
	_ENV.refreshLayer = nil
	if _ENV.allItemsGroup then
		display.remove(_ENV.allItemsGroup)
	end
	_ENV.allItemsGroup = nil
	local L0_67 = L0_67
	L0_67(_ENV)
	local L1_68 = L1_68
	L0_67 = _ENV
	L0_67.buttons = nil
	L0_67 = nil
	_ENV = L0_67
end
function L3_3.populateScroller(A0_69, A1_70)
	_ENV(A1_70)
	if L18_18 then
		display.remove(L18_18)
	end
	if L8_8 then
		L25_25()
	end
	;({}).width = 740
	;({}).height = 400
	;({}).maskFile = "res/mask1000x400.png"
	;({}).bgColor, ({})[1] = {}, 255
	;({}).bgColor, ({})[2] = {}, 255
	;({}).bgColor, ({})[3] = {}, 255
	;({}).bgColor, ({})[4] = {}, 0
	;({}).listener = utils.scrollViewListener
	L8_8 = require("widget").newScrollView({})
	L8_8.buttons = {}
	L8_8:setReferencePoint(display.TopCenterReferencePoint)
	A0_69:insert(L8_8)
	L8_8.x = screenX + screenWidth / 2
	L8_8.y = 120
	local L2_71 = display.newGroup()
	local L3_72, L4_73 = L3_72, L4_73
	L3_72(L4_73, L2_71)
	L3_72 = L8_8
	L3_72 = L3_72.content
	L3_72.verticalScrollDisabled = true
	L3_72 = L8_8
	L3_72.allItemsGroup = L2_71
	L3_72 = 0
	L4_73 = 50
	L5_74 = 1
	_FOR_ = 1
	for _FORV_8_ = L5_74, _FOR_, _FOR_ do
		if L6_6[L2_2[_FORV_8_]].unlockable then
		end
		if (not L19_19 or L6_6[L2_2[_FORV_8_]].class == L19_19) and (not L12_12 or L12_12 and not not L6_6[L2_2[_FORV_8_]].unlockable.unlockState) then
			_UPVALUE8_(L2_2[_FORV_8_]).x = _UPVALUE8_(L2_2[_FORV_8_]).itemBox.outerRect.contentWidth * math.floor(L3_72 / 2)
			if 0 < math.floor(L3_72 / 2) then
				_UPVALUE8_(L2_2[_FORV_8_]).x = _UPVALUE8_(L2_2[_FORV_8_]).x + L4_73 * math.floor(L3_72 / 2)
			end
			if L3_72 % 2 == 0 then
				_UPVALUE8_(L2_2[_FORV_8_]).y = L8_8.contentHeight / 2 - _UPVALUE8_(L2_2[_FORV_8_]).itemBox.outerRect.contentHeight / 2 - 10
			else
				_UPVALUE8_(L2_2[_FORV_8_]).y = L8_8.contentHeight / 2 + _UPVALUE8_(L2_2[_FORV_8_]).itemBox.outerRect.contentHeight / 2 + 10
			end
			local L14_83, L15_84 = L14_83, L15_84
			L2_71:insert((_UPVALUE8_(L2_2[_FORV_8_])))
			local L16_85 = L16_85
			L3_72 = L3_72 + 1
		end
	end
	L5_74 = L19_19
	if L5_74 then
		L5_74 = L6_6
		L5_74 = L5_74.classes
		L10_79 = L19_19
		L5_74 = L5_74[L10_79]
		if L3_72 == 0 then
			L10_79 = utils
			L10_79 = L10_79.getOutlinedText
			L11_80 = "NO "
			L13_82 = L5_74.groupName
			L14_83 = " AVAILABLE"
			L11_80 = L11_80 .. L13_82 .. L14_83
			L13_82 = {}
			L13_82.size = 50
			L10_79 = L10_79(L11_80, L13_82)
			L18_18 = L10_79
			L11_80 = A0_69
			L10_79 = A0_69.insert
			L13_82 = L18_18
			L10_79(L11_80, L13_82)
			L10_79 = L18_18
			L11_80 = screenX
			L13_82 = screenWidth
			L13_82 = L13_82 / 2
			L11_80 = L11_80 + L13_82
			L10_79.x = L11_80
			L10_79 = L18_18
			L11_80 = display
			L11_80 = L11_80.contentHeight
			L11_80 = L11_80 / 2
			L10_79.y = L11_80
		end
	end
end
function L3_3.createScene(A0_86, A1_87)
	local L4_90, L5_91, L6_92, L9_95, L10_96 = spritesheetmanager.getSpriteSet, L5_91, L6_92, L9_95, L10_96
	L5_91 = UI_SPRITE_SHEET
	L4_90, L5_91 = L4_90(L5_91)
	L6_92 = A0_86.view
	L9_95 = A1_87.params
	if not L9_95 then
		L9_95 = {}
	end
	L10_96 = L9_95.isMyUpgrades
	if not L10_96 then
		L10_96 = false
	end
	_ENV = L10_96
	L10_96 = L9_95.tankType
	if not L10_96 then
		L10_96 = nil
	end
	L13_13 = L10_96
	L10_96 = "UPGRADE SHOP"
	if _ENV then
		L10_96 = "MY UPGRADES"
		L14_14 = L1_1.getUpgradesForTankType(L13_13)
	end
	;({}).group = L6_92
	;({}).title = L10_96
	;({}).showBottomBar = true
	;({}).onClose = function()
		sound.playSound(sound.globalSounds.button)
		local L1_108 = L1_108
		L1_108 = _ENV
		L1_108()
	end
	L16_16 = nil
	L20_20 = {}
	_FOR_ = 1
	for _FORV_14_ = _FOR_, _FOR_, _FOR_ do
		({}).height, ({}).width = 67, 67
		;({}).normalTopColor = utils.pack(LITTLE_GENERALS_LIGHT_GREY())
		;({}).normalBottomColor = utils.pack(LITTLE_GENERALS_MED_GREY())
		;({}).normalBorderColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		;({}).pressedBorderColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		;({}).onComplete = function()
			local L1_109 = L1_109
			L1_109(_ENV.view, _UPVALUE1_)
			local L2_110 = L2_110
		end
		utils.getBasicButton({}).filterClass = L1_1.tankUpgradeTypes.orderedClasses[_FORV_14_]
		table.insert(L20_20, (utils.getBasicButton({})))
		if not L16_16 then
			L16_16 = utils.getBasicButton({})
		end
		utils.getBasicButton({}):insert((utils.newImageFromSpriteSet(L4_90, L5_91, L1_1.tankUpgradeTypes.classes[L1_1.tankUpgradeTypes.orderedClasses[_FORV_14_]].filterImage)))
		utils.newImageFromSpriteSet(L4_90, L5_91, L1_1.tankUpgradeTypes.classes[L1_1.tankUpgradeTypes.orderedClasses[_FORV_14_]].filterImage).x, utils.newImageFromSpriteSet(L4_90, L5_91, L1_1.tankUpgradeTypes.classes[L1_1.tankUpgradeTypes.orderedClasses[_FORV_14_]].filterImage).y = 0, 0
		utils.drawBasicSceneBackground({}):insert((utils.getBasicButton({})))
		local L21_107 = L21_107
		utils.getBasicButton({}).x, utils.getBasicButton({}).y = screenWidth / 2 - utils.getBasicButton({}).contentWidth / 2 - 67 * (#L1_1.tankUpgradeTypes.orderedClasses - _FORV_14_) - 5, display.contentHeight / 2 - 67 / 2
	end
	if _ENV then
		({}).height, ({}).width = 67, #tankModels.orderedTankClasses * 67
		if nonConsumableContent:getRestoreButton({}) then
			nonConsumableContent:getRestoreButton({}):setReferencePoint(display.BottomLeftReferencePoint)
			nonConsumableContent:getRestoreButton({}).x, nonConsumableContent:getRestoreButton({}).y = screenX + 5, display.contentHeight
			L0_0.view:insert((nonConsumableContent:getRestoreButton({})))
		end
	else
		({}).height, ({}).width = 67, 250
		;({}).onComplete = function()
			sound.playSound(sound.globalSounds.button)
			storyboard.gotoScene("storeScene")
			local L1_111 = L1_111
		end
		L21_107:insert((utils.getBasicButton({})))
		utils.getBasicButton({}).y, utils.getBasicButton({}).x = display.contentHeight / 2 - 67 / 2, -screenWidth / 2 + utils.getBasicButton({}).contentWidth / 2 + 5
		local L12_98 = L12_98
		utils.newImageFromSpriteSet(L4_90, L5_91, "warbux_icon.png"):setReferencePoint(display.TopLeftReferencePoint)
		L21_107:insert((utils.newImageFromSpriteSet(L4_90, L5_91, "warbux_icon.png")))
		utils.newImageFromSpriteSet(L4_90, L5_91, "warbux_icon.png").x, utils.newImageFromSpriteSet(L4_90, L5_91, "warbux_icon.png").y = utils.getBasicButton({}).x - utils.getBasicButton({}).contentWidth / 2 - 6, utils.getBasicButton({}).y - utils.getBasicButton({}).contentHeight / 2 - 6
		local L13_99 = L13_99
		local L17_103 = L17_103
		do
			local L18_104 = L18_104
			local L19_105 = L19_105
			L11_11 = display.newText(L21_107, utils.comma_value(tostring(warbux.balance)), 0, 0, "SingleSleeve", 48)
			;(function()
				local L0_112, L1_113 = L0_112, L1_113
				L0_112(L1_113, display.CenterRightReferencePoint)
				local L2_114 = L2_114
				L0_112 = _ENV
				L1_113 = L18_104
				L1_113 = L1_113.x
				L2_114 = L18_104
				L2_114 = L2_114.contentWidth
				L2_114 = L2_114 / 2
				L1_113 = L1_113 + L2_114
				L1_113 = L1_113 - 15
				L0_112.x = L1_113
				L0_112 = _ENV
				L1_113 = L18_104
				L1_113 = L1_113.y
				L1_113 = L1_113 - 3
				L0_112.y = L1_113
			end)()
			L11_11:setTextColor(LITTLE_GENERALS_BROWN_DARK())
			function L11_11.warbuxListener(A0_115)
				local L3_118 = L3_118
				local L4_119 = L4_119
				L4_119 = L4_119(tostring(warbux.balance))
				L3_118.text = L4_119
				L3_118 = _UPVALUE1_
				L3_118()
			end
			warbux:addBalanceListener(L11_11.warbuxListener)
		end
	end
end
function L3_3.enterScene(A0_120, A1_121)
	local L2_122
	L2_122 = A0_120.view
	local L3_123 = L3_123
	local L4_124 = L4_124
	L3_123(L4_124, nil)
	local L5_125 = L5_125
end
function L3_3.exitScene(A0_126, A1_127)
	local L2_128
	L2_128 = A0_126.view
	if _ENV then
		L25_25()
		local L3_129 = L3_129
	end
end
function L3_3.destroyScene(A0_130, A1_131)
	local L2_132
	L2_132 = A0_130.view
	_ENV = nil
	if L11_11 then
		local L3_133, L4_134 = L3_133, L4_134
		L3_133(L4_134, L11_11.warbuxListener)
		local L5_135 = L5_135
	end
	L3_133 = nil
	L20_20 = L3_133
end
L3_3:addEventListener("createScene", L3_3)
L3_3:addEventListener("enterScene", L3_3)
L3_3:addEventListener("exitScene", L3_3)
local L26_26, L27_27 = L26_26, L27_27
local L28_28 = L28_28
L3_3:addEventListener("destroyScene", L3_3)
local L29_29 = L29_29
return L3_3
