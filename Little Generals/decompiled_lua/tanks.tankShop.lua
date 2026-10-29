local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18 = storyboard.newScene, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18
L3_3 = L3_3()
L4_4 = require
L5_5 = "tanks.tankUpgrade"
L4_4 = L4_4(L5_5)
L5_5 = {}
L5_5.select = "res/sounds/weapon_select.mp3"
L6_6 = nil
L7_7 = 1
L8_8 = 1
L9_9 = nil
function L10_10()
	storyboard.gotoScene("tanks.tankDepot")
	storyboard.removeScene("tanks.tankShop")
	local L1_23 = L1_23
end
L11_11 = nil
L12_12 = nil
L13_13 = nil
L14_14 = nil
L15_15 = {}
function L16_16(A0_24, A1_25)
	if A1_25 and A1_25.id and A0_24 and A0_24 == "Unknown $" then
		local L2_26 = L2_26
		local L2_26, L3_27 = L2_26(A1_25.id), L3_27
		A0_24 = L2_26
	end
	return A0_24
end
function L17_17(A0_28)
	local L7_35 = L7_35
	if _ENV then
		L7_35 = display
		L7_35 = L7_35.remove
		L7_35(_ENV)
		L7_35 = nil
		_ENV = L7_35
	end
	L7_35 = L14_14
	if A0_28 == L7_35 then
		L7_35 = nil
		L14_14 = L7_35
		L7_35 = utils
		L7_35 = L7_35.getOutlinedText
		;({}).size = 60
		;({}).fontColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
		;({}).shadowColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		L7_35 = L7_35("ALL TANKS", {})
		_ENV = L7_35
	else
		L14_14 = A0_28
		L7_35 = tankModels
		L7_35 = L7_35.tankClasses
		L7_35 = L7_35[L14_14]
		;({}).size = 60
		;({}).fontColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
		;({}).shadowColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		_ENV = utils.getOutlinedText(L7_35.groupName, {})
	end
	L7_35 = L0_0
	L7_35 = L7_35.view
	L7_35 = L7_35.insert
	L7_35(L7_35, _ENV)
	L7_35 = L11_11
	L7_35 = L7_35.localToContent
	local L2_30 = L2_30
	L7_35, L2_30 = L7_35(L2_30, L3_31, 0)
	L3_31 = _ENV
	L4_32 = _ENV
	L3_31.x, L4_32.y = screenX + screenWidth / 2, L2_30
	L3_31 = 1
	L4_32 = L15_15
	L4_32 = #L4_32
	_FOR_ = 1
	for _FORV_6_ = L3_31, L4_32, _FOR_ do
		if L15_15[_FORV_6_].filterClass == L14_14 then
			L15_15[_FORV_6_].showPressed()
			break -- pseudo-goto
		end
		L15_15[_FORV_6_].showNormal()
		repeat
		until true
	end
end
function L18_18()
	if _ENV.refreshLayer then
		_ENV.refreshLayer.text = nil
	end
	_ENV.refreshLayer = nil
	if _ENV.allItemsGroup then
		display.remove(_ENV.allItemsGroup)
	end
	_ENV.allItemsGroup = nil
	local L0_38 = L0_38
	L0_38(_ENV)
	local L1_39 = L1_39
	L0_38 = _ENV
	L0_38.buttons = nil
	L0_38 = nil
	_ENV = L0_38
end
function L3_3.createScene(A0_40, A1_41)
	local L7_47 = spritesheetmanager.getSpriteSet
	local L7_47, L3_43 = L7_47(UI_SPRITE_SHEET)
	local L4_44 = L4_44
	L4_44 = L4_44("tankAvatar")
	tankAvatar = L4_44
	L4_44 = nil
	previousTankType = L4_44
	L4_44 = A0_40.view
	local L5_45 = L5_45
	;({}).group = L4_44
	;({}).title = "TANK SHOP"
	;({}).showBottomBar = true
	;({}).onClose = function()
		sound.playSound(sound.globalSounds.button)
		local L1_59 = L1_59
		L1_59 = _ENV
		L1_59()
	end
	L5_45 = L5_45({})
	L6_46 = 1
	_FOR_ = 1
	for _FORV_9_ = L6_46, _FOR_, _FOR_ do
		if not tankTypes[availableTankTypesInOrder[_FORV_9_]].maxHealth then
			tankTypes[availableTankTypesInOrder[_FORV_9_]].maxHealth = tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].maxHealth
		end
		if not tankTypes[availableTankTypesInOrder[_FORV_9_]].name then
			tankTypes[availableTankTypesInOrder[_FORV_9_]].name = tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].name
		end
		if not tankTypes[availableTankTypesInOrder[_FORV_9_]].desc then
			tankTypes[availableTankTypesInOrder[_FORV_9_]].desc = tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].desc
		end
		if not tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].speedForceInt then
		end
		if tankTypes[availableTankTypesInOrder[_FORV_9_]].maxHealth > L7_7 then
			L7_7 = tankTypes[availableTankTypesInOrder[_FORV_9_]].maxHealth
		end
		if tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].speedForceExt > L8_8 then
			L8_8 = tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].speedForceExt
		end
	end
	L6_46 = 67
	L11_11 = nil
	L15_15 = {}
	_FOR_ = 1
	for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
		({}).width = L6_46
		;({}).height = L6_46
		;({}).normalTopColor = utils.pack(LITTLE_GENERALS_LIGHT_GREY())
		;({}).normalBottomColor = utils.pack(LITTLE_GENERALS_MED_GREY())
		;({}).normalBorderColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		;({}).pressedBorderColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		;({}).onComplete = function()
			local L1_60 = L1_60
			L1_60(L0_0.view, _UPVALUE2_)
			local L2_61 = L2_61
		end
		utils.getBasicButton({}).filterClass = tankModels.orderedTankClasses[_FORV_11_]
		table.insert(L15_15, (utils.getBasicButton({})))
		if not L11_11 then
			L11_11 = utils.getBasicButton({})
		end
		utils.getBasicButton({}):insert((utils.newImageFromSpriteSet(L7_47, L3_43, tankModels.tankClasses[tankModels.orderedTankClasses[_FORV_11_]].filterImage)))
		utils.newImageFromSpriteSet(L7_47, L3_43, tankModels.tankClasses[tankModels.orderedTankClasses[_FORV_11_]].filterImage).x, utils.newImageFromSpriteSet(L7_47, L3_43, tankModels.tankClasses[tankModels.orderedTankClasses[_FORV_11_]].filterImage).y = 0, 0
		L5_45:insert((utils.getBasicButton({})))
		local L18_58 = L18_58
		utils.getBasicButton({}).x, utils.getBasicButton({}).y = screenWidth / 2 - utils.getBasicButton({}).contentWidth / 2 - L6_46 * (#tankModels.orderedTankClasses - _FORV_11_) - 5, L18_58
	end
	;({}).width = 250
	;({}).height = L6_46
	;({}).onComplete = function()
		sound.playSound(sound.globalSounds.button)
		storyboard.gotoScene("storeScene")
		local L1_62 = L1_62
	end
	L5_45:insert((utils.getBasicButton({})))
	utils.getBasicButton({}).x = -screenWidth / 2 + utils.getBasicButton({}).contentWidth / 2 + 5
	utils.getBasicButton({}).y = L18_58
	local L9_49 = L9_49
	utils.newImageFromSpriteSet(L7_47, L3_43, "warbux_icon.png"):setReferencePoint(display.TopLeftReferencePoint)
	L5_45:insert((utils.newImageFromSpriteSet(L7_47, L3_43, "warbux_icon.png")))
	utils.newImageFromSpriteSet(L7_47, L3_43, "warbux_icon.png").x, utils.newImageFromSpriteSet(L7_47, L3_43, "warbux_icon.png").y = L9_49.x - L9_49.contentWidth / 2 - 6, L9_49.y - L9_49.contentHeight / 2 - 6
	local L10_50 = L10_50
	local L14_54 = L14_54
	local L15_55 = L15_55
	local L14_54, L16_56 = L14_54(L15_55, utils.comma_value(tostring(warbux.balance)), 0, 0, "SingleSleeve", 48), L16_56
	L9_9 = L14_54
	function L14_54()
		local L0_63, L1_64 = L0_63, L1_64
		L0_63(L1_64, display.CenterRightReferencePoint)
		local L2_65 = L2_65
		L0_63 = _ENV
		L1_64 = L9_49
		L1_64 = L1_64.x
		L2_65 = L9_49
		L2_65 = L2_65.contentWidth
		L2_65 = L2_65 / 2
		L1_64 = L1_64 + L2_65
		L1_64 = L1_64 - 15
		L0_63.x = L1_64
		L0_63 = _ENV
		L1_64 = L9_49
		L1_64 = L1_64.y
		L1_64 = L1_64 - 3
		L0_63.y = L1_64
	end
	L15_55 = L14_54
	L15_55()
	L15_55 = L9_9
	L16_56 = L15_55
	L15_55 = L15_55.setTextColor
	L15_55(L16_56, LITTLE_GENERALS_BROWN_DARK())
	L15_55 = L9_9
	function L16_56(A0_66)
		local L3_69 = L3_69
		local L4_70 = L4_70
		L4_70 = L4_70(tostring(warbux.balance))
		L3_69.text = L4_70
		L3_69 = L14_54
		L3_69()
	end
	L15_55.warbuxListener = L16_56
	L15_55 = warbux
	L16_56 = L15_55
	L15_55 = L15_55.addBalanceListener
	L15_55(L16_56, L9_9.warbuxListener)
end
function L3_3.enterScene(A0_71, A1_72)
	local L2_73
	L2_73 = A0_71.view
	if _ENV == nil then
		local L6_77 = L6_77
		_ENV = tankModels[tankTypes[tankAvatar.getPlayerAvatarType()].tankModel].tankClass
	end
	L6_77 = _UPVALUE1_
	local L4_75 = L4_75
	L6_77(L4_75, _ENV)
	local L5_76 = L5_76
end
function L3_3.exitScene(A0_78, A1_79)
	local L2_80
	L2_80 = A0_78.view
	if _ENV then
		L18_18()
		local L3_81 = L3_81
	end
end
function L3_3.destroyScene(A0_82, A1_83)
	local L2_84
	L2_84 = A0_82.view
	_ENV = nil
	local L3_85, L4_86 = L3_85, L4_86
	L3_85(L4_86, L9_9.warbuxListener)
	local L5_87 = L5_87
	L3_85 = nil
	L15_15 = L3_85
end
L3_3:addEventListener("createScene", L3_3)
L3_3:addEventListener("enterScene", L3_3)
L3_3:addEventListener("exitScene", L3_3)
local L19_19, L20_20 = L19_19, L20_20
local L21_21 = L21_21
L3_3:addEventListener("destroyScene", L3_3)
local L22_22 = L22_22
return L3_3
