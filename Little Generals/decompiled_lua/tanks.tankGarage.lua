local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18 = storyboard.newScene, L2_2, L3_3, L4_4, L5_5, L6_6, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18
L1_1 = L1_1()
L2_2 = {}
L2_2.select = "res/sounds/weapon_select.mp3"
L3_3 = nil
L4_4 = 1
L5_5 = 1
L6_6 = nil
L9_9 = nil
L10_10 = require
L11_11 = "tanks.tankUpgrade"
L10_10 = L10_10(L11_11)
function L11_11()
	storyboard.gotoScene("tanks.tankDepot")
	storyboard.removeScene("tanks.tankGarage")
	local L1_23 = L1_23
end
L12_12 = nil
L13_13 = nil
L14_14 = nil
L15_15 = nil
L16_16 = {}
function L17_17(A0_24)
	local L7_31 = L7_31
	if _ENV then
		L7_31 = display
		L7_31 = L7_31.remove
		L7_31(_ENV)
		L7_31 = nil
		_ENV = L7_31
	end
	L7_31 = L15_15
	if A0_24 == L7_31 then
		L7_31 = nil
		L15_15 = L7_31
		L7_31 = utils
		L7_31 = L7_31.getOutlinedText
		;({}).size = 60
		;({}).fontColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
		;({}).shadowColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		L7_31 = L7_31("ALL TANKS", {})
		_ENV = L7_31
	else
		L15_15 = A0_24
		L7_31 = tankModels
		L7_31 = L7_31.tankClasses
		L7_31 = L7_31[L15_15]
		;({}).size = 60
		;({}).fontColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
		;({}).shadowColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		_ENV = utils.getOutlinedText(L7_31.groupName, {})
	end
	L7_31 = L0_0
	L7_31 = L7_31.view
	L7_31 = L7_31.insert
	L7_31(L7_31, _ENV)
	L7_31 = L12_12
	L7_31 = L7_31.localToContent
	local L2_26 = L2_26
	L7_31, L2_26 = L7_31(L2_26, L3_27, 0)
	L3_27 = _ENV
	L4_28 = _ENV
	L3_27.x, L4_28.y = screenX + screenWidth / 2, L2_26
	L3_27 = 1
	L4_28 = L16_16
	L4_28 = #L4_28
	_FOR_ = 1
	for _FORV_6_ = L3_27, L4_28, _FOR_ do
		if L16_16[_FORV_6_].filterClass == L15_15 then
			L16_16[_FORV_6_].showPressed()
			break -- pseudo-goto
		end
		L16_16[_FORV_6_].showNormal()
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
	local L0_34 = L0_34
	L0_34(_ENV)
	local L1_35 = L1_35
	L0_34 = nil
	_ENV = L0_34
end
function L1_1.createScene(A0_36, A1_37)
	local L2_38 = L2_38
	local L2_38, L3_39 = L2_38(UI_SPRITE_SHEET)
	local L4_40 = L4_40
	L4_40 = L4_40("tankAvatar")
	tankAvatar = L4_40
	L4_40 = nil
	previousTankType = L4_40
	L4_40 = A0_36.view
	local L5_41 = L5_41
	;({}).group = L4_40
	;({}).title = "My GARAGE"
	;({}).showBottomBar = true
	;({}).onClose = function()
		sound.playSound(sound.globalSounds.button)
		local L1_55 = L1_55
		L1_55 = _ENV
		L1_55()
	end
	L5_41 = L5_41({})
	L6_42 = 1
	_FOR_ = 1
	for _FORV_9_ = L6_42, _FOR_, _FOR_ do
		if not tankTypes[availableTankTypesInOrder[_FORV_9_]].maxHealth then
			tankTypes[availableTankTypesInOrder[_FORV_9_]].maxHealth = tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].maxHealth
		end
		if not tankTypes[availableTankTypesInOrder[_FORV_9_]].name then
			tankTypes[availableTankTypesInOrder[_FORV_9_]].name = tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].name
		end
		if not tankTypes[availableTankTypesInOrder[_FORV_9_]].desc then
			tankTypes[availableTankTypesInOrder[_FORV_9_]].desc = tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].desc
		end
		if not tankTypes[availableTankTypesInOrder[_FORV_9_]].upgradeSlots then
			tankTypes[availableTankTypesInOrder[_FORV_9_]].upgradeSlots = tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].upgradeSlots
		end
		if not tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].speedForceInt then
		end
		if tankTypes[availableTankTypesInOrder[_FORV_9_]].maxHealth > L4_4 then
			L4_4 = tankTypes[availableTankTypesInOrder[_FORV_9_]].maxHealth
		end
		if tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].speedForceExt > L5_5 then
			L5_5 = tankModels[tankTypes[availableTankTypesInOrder[_FORV_9_]].tankModel].speedForceExt
		end
	end
	L6_42 = 67
	L11_47 = nonConsumableContent
	L12_48 = L11_47
	L11_47 = L11_47.getRestoreButton
	L13_49 = {}
	L13_49.width = #tankModels.orderedTankClasses * L6_42
	L13_49.height = L6_42
	L11_47 = L11_47(L12_48, L13_49)
	if L11_47 then
		L13_49 = L11_47
		L12_48 = L11_47.setReferencePoint
		L12_48(L13_49, display.BottomLeftReferencePoint)
		L12_48 = screenX
		L12_48 = L12_48 + 5
		L13_49 = display
		L13_49 = L13_49.contentHeight
		L11_47.y = L13_49
		L11_47.x = L12_48
		L12_48 = L0_0
		L12_48 = L12_48.view
		L13_49 = L12_48
		L12_48 = L12_48.insert
		L12_48(L13_49, L11_47)
	end
	L12_48 = nil
	L12_12 = L12_48
	L12_48 = {}
	L16_16 = L12_48
	L12_48 = 1
	L13_49 = tankModels
	L13_49 = L13_49.orderedTankClasses
	L13_49 = #L13_49
	L10_46 = 1
	for _FORV_11_ = L12_48, L13_49, L10_46 do
		({}).width = L6_42
		;({}).height = L6_42
		;({}).normalTopColor = utils.pack(LITTLE_GENERALS_LIGHT_GREY())
		;({}).normalBottomColor = utils.pack(LITTLE_GENERALS_MED_GREY())
		;({}).normalBorderColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		;({}).onComplete = function()
			local L1_56 = L1_56
			L1_56(L0_0.view, _UPVALUE2_)
			local L2_57 = L2_57
		end
		utils.getBasicButton({}).filterClass = tankModels.orderedTankClasses[_FORV_11_]
		table.insert(L16_16, (utils.getBasicButton({})))
		if not L12_12 then
			L12_12 = utils.getBasicButton({})
		end
		do
			local L15_51 = L15_51
			utils.getBasicButton({}):insert((utils.newImageFromSpriteSet(L2_38, L3_39, tankModels.tankClasses[tankModels.orderedTankClasses[_FORV_11_]].filterImage)))
			utils.newImageFromSpriteSet(L2_38, L3_39, tankModels.tankClasses[tankModels.orderedTankClasses[_FORV_11_]].filterImage).x, utils.newImageFromSpriteSet(L2_38, L3_39, tankModels.tankClasses[tankModels.orderedTankClasses[_FORV_11_]].filterImage).y = 0, 0
			local L16_52, L17_53 = L16_52, L17_53
			L5_41:insert((utils.getBasicButton({})))
			local L18_54 = L18_54
			L17_53.x, L17_53.y = screenWidth / 2 - L17_53.contentWidth / 2 - L6_42 * (#tankModels.orderedTankClasses - _FORV_11_) - 5, display.contentHeight / 2 - L17_53.contentHeight / 2
		end
	end
end
function L1_1.enterScene(A0_58, A1_59)
	local L2_60, L3_61
	L2_60 = A0_58.view
	L3_61 = A1_59.params
	if not L3_61 then
		L3_61 = {}
	end
	if not L3_61.focusOnTankType then
	end
	_ENV = tankAvatar.getPlayerAvatarType()
	L7_7 = nil
	local L4_62 = L4_62
	local L5_63 = L5_63
	L4_62(L5_63, L15_15)
	local L6_64 = L6_64
	L4_62 = L7_7
	if L4_62 then
		L4_62 = L7_7
		L5_63 = L3_3
		L5_63 = L5_63.content
		L5_63 = L5_63.x
		L6_64 = screenWidth
		L5_63 = L5_63 + L6_64
		if L4_62 > L5_63 then
			L4_62 = L3_3
			L4_62 = L4_62.content
			L5_63 = L7_7
			L5_63 = -L5_63
			L6_64 = screenWidth
			L6_64 = L6_64 / 2
			L5_63 = L5_63 + L6_64
			L4_62.x = L5_63
		end
	end
end
function L1_1.exitScene(A0_65, A1_66)
	local L2_67
	L2_67 = A0_65.view
	if _ENV then
		L18_18()
		local L3_68 = L3_68
	end
end
function L1_1.destroyScene(A0_69, A1_70)
	local L2_71, L3_72
	L2_71 = A0_69.view
	L3_72 = nil
	_ENV = L3_72
end
L1_1:addEventListener("createScene", L1_1)
L1_1:addEventListener("enterScene", L1_1)
L1_1:addEventListener("exitScene", L1_1)
local L19_19, L20_20 = L19_19, L20_20
local L21_21 = L21_21
L1_1:addEventListener("destroyScene", L1_1)
local L22_22 = L22_22
return L1_1
