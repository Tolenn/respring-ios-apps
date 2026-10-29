-- Decompiled & AI-Repaired from armoryScene.lu
-- Source disassembly preserved at: disasm/armoryScene.disasm

local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26 = storyboard.newScene, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26
L1_1 = L1_1()
L2_2 = nil
L3_3 = nil
L4_4 = {}
L4_4.select = "res/sounds/weapon_select.mp3"
function L5_5(A0_31)
	return true
end
L6_6 = nil
L7_7 = nil
L8_8 = nil
L9_9 = nil
L10_10 = nil
L11_11 = nil
L12_12 = nil
L13_13 = {}
function L14_14(A0_32)
	local L7_39 = L7_39
	if _ENV then
		L7_39 = display
		L7_39 = L7_39.remove
		L7_39(_ENV)
		L7_39 = nil
		_ENV = L7_39
	end
	L7_39 = L12_12
	if A0_32 == L7_39 then
		L7_39 = nil
		L12_12 = L7_39
		L7_39 = utils
		L7_39 = L7_39.getOutlinedText
		;({}).size = 60
		;({}).fontColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
		;({}).shadowColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		L7_39 = L7_39("ALL", {})
		_ENV = L7_39
	else
		L12_12 = A0_32
		L7_39 = weaponTypes
		L7_39 = L7_39.classes
		L7_39 = L7_39[L12_12]
		;({}).size = 60
		;({}).fontColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
		;({}).shadowColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		_ENV = utils.getOutlinedText(L7_39.shortGroupName, {})
	end
	L7_39 = L0_0
	L7_39 = L7_39.view
	L7_39 = L7_39.insert
	L7_39(L7_39, _ENV)
	L7_39 = L8_8
	L7_39 = L7_39.localToContent
	local L2_34 = L2_34
	L7_39, L2_34 = L7_39(L2_34, L3_35, 0)
	L3_35 = _ENV
	L4_36 = _ENV
	L3_35.x, L4_36.y = screenCenterX - 20, L2_34
	L3_35 = 1
	L4_36 = L13_13
	L4_36 = #L4_36
	_FOR_ = 1
	for _FORV_6_ = L3_35, L4_36, _FOR_ do
		if L13_13[_FORV_6_].filterClass == L12_12 then
			L13_13[_FORV_6_].showPressed()
			break -- pseudo-goto
		end
		L13_13[_FORV_6_].showNormal()
		repeat
		until true
	end
end
function L15_15()
	sound.playSound(sound.globalSounds.button)
	storyboard.gotoScene("storeScene")
	local L1_42 = L1_42
end
function L16_16()
	local L0_43, L1_44 = L0_43, function()
		BattleControls:updateWeapon()
		print("Updated battle controls")
		storyboard.gotoScene("battlefieldScene")
		storyboard.removeScene("armoryScene")
		local L1_49 = L1_49
	end
	L0_43, L1_44 = L0_43(L1_44)
	if not L0_43 then
		local L3_46 = L3_46
		local L4_47 = L4_47
		L3_46(L4_47, L0_43, L1_44)
		local L5_48 = L5_48
		L3_46 = os
		L3_46 = L3_46.exit
		L3_46()
	end
end
function L17_17()
	if _ENV.refreshLayer then
		_ENV.refreshLayer.text = nil
	end
	_ENV.refreshLayer = nil
	if _ENV.allItemsGroup then
		display.remove(_ENV.allItemsGroup)
	end
	_ENV.allItemsGroup = nil
	local L0_50 = L0_50
	L0_50(_ENV)
	local L1_51 = L1_51
	L0_50 = _ENV
	L0_50.buttons = nil
	L0_50 = nil
	_ENV = L0_50
end
function L18_18(A0_52)
	local L1_53
	L1_53 = weaponTypes
	L1_53 = L1_53[A0_52]
	if not L1_53.cost or #L1_53.cost:canAfford() == 0 then
		L1_53.cost:pay()
		if not L1_53.cost.extraData.shotsAtCost then
		end
		L1_53.inventory:add(1)
		return true
	else
		local L2_54 = L2_54
		;({}).icon = utils.DIALOG_SUPPLYLINES_ERROR
		local L5_57 = L5_57
		local L6_58 = string.format("You cannot afford any %s.", L1_53.pluralName)
		L5_57.textLine1 = L6_58
		L5_57.textLine2 = "Visit the store for more Warbux."
		L6_58 = sound
		L6_58 = L6_58.globalSounds
		L6_58 = L6_58.button
		L5_57.confirmSound = L6_58
		L6_58 = _ENV
		L5_57.confirmFunction = L6_58
		L2_54(L5_57)
		L2_54 = false
		return L2_54
	end
end
function L19_19(A0_59)
	if #A0_59.cost:canAfford() == 0 then
		if A0_59.canBuy() then
			A0_59.cost:pay()
			A0_59.onBuySuccess()
			return true
		else
			A0_59.showCantBuyMsg()
			return false
		end
	else
		local L1_60 = L1_60
		;({}).icon = utils.DIALOG_SUPPLYLINES_ERROR
		local L4_63 = L4_63
		local L5_64 = string.format("You cannot afford any %s.", A0_59.pluralName)
		L4_63.textLine1 = L5_64
		L4_63.textLine2 = "Visit the store for more Warbux."
		L5_64 = sound
		L5_64 = L5_64.globalSounds
		L5_64 = L5_64.button
		L4_63.confirmSound = L5_64
		L5_64 = _ENV
		L4_63.confirmFunction = L5_64
		L1_60(L4_63)
		L1_60 = false
		return L1_60
	end
end
function L20_20(A0_65)
	local L1_66
	L1_66 = weaponTypes
	L1_66 = L1_66[A0_65]
	local L2_67 = getWheelOfFortune()
	if L2_67 then
		if L2_67:isActive("babyMisslesOnlyForPlayer") and A0_65 ~= weaponTypes.BABY_MISSILE then
			L2_67:alert()
			return true
		elseif (A0_65 == weaponTypes.BABY_SHIELD or A0_65 == weaponTypes.BIG_SHIELD) and L2_67:isActive("noShields") then
			L2_67:alert()
			return true
		end
	end
	if L1_66.isInfinite or L1_66.inventory and L1_66.inventory:getQuantity() > 0 then
		local L3_68 = L3_68
		L3_68(_ENV.select)
		L3_68 = L2_2
		L3_68 = L3_68.weaponType
		L2_2.weaponType = A0_65
		Weapon.loadWeapon(L2_2.weaponType)
		settings:set("defaultWeapon", A0_65)
		local L7_72 = L7_72
		L7_72 = timer
		L7_72 = L7_72.performWithDelay
		local L5_70 = L5_70
		L7_72(L5_70, L16_16)
		local L6_71 = L6_71
		L7_72 = true
		return L7_72
	end
	L3_68 = false
	return L3_68
end
function L21_21(A0_73)
	local L1_74, L2_75, L3_76
	L1_74 = A0_73.width
	if not L1_74 then
		L1_74 = 170
	end
	L2_75 = A0_73.height
	if not L2_75 then
		L2_75 = 170
	end
	L3_76 = A0_73.borderColor
	local L4_77 = L4_77
	;({}).width = L1_74
	;({}).height = L2_75
	;({}).innerFillColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
	;({}).innerBorderColor = L3_76
	;({}).outerBorderColor = L3_76
	L4_77 = L4_77({})
	local L5_78 = L5_78
	L5_78 = L5_78(L4_77, 0, 0, L4_77.innerRect.contentWidth - L4_77.borderWidth * 2, 40)
	L5_78.x, L5_78.y = 0, -L4_77.innerRect.contentHeight / 2 + L4_77.borderWidth + L5_78.contentHeight / 2
	L5_78:setFillColor(LITTLE_GENERALS_BROWN())
	local L6_79 = L6_79
	local L10_83 = L10_83
	local L11_84 = L11_84
	local L6_79, L12_85 = L6_79(L10_83, L11_84, 0, 0, "SingleSleeve", 36), L12_85
	L10_83 = 0
	L11_84 = L5_78.y
	L6_79.y = L11_84
	L6_79.x = L10_83
	L10_83 = utils
	L10_83 = L10_83.scaleTo
	L11_84 = L6_79
	L12_85 = L5_78.contentWidth
	L12_85 = L12_85 - 10
	L10_83(L11_84, L12_85)
	return L4_77
end
function L22_22(A0_86, A1_87)
	local L2_88, L3_89
	local L6_92 = L6_92
	if not A1_87 then
		L2_88 = {}
		A1_87 = L2_88
	end
	L2_88 = weaponTypes
	L2_88 = L2_88[A0_86]
	L3_89 = L2_88.name
	A1_87.name = L3_89
	L3_89 = A1_87.borderColor
	L6_92 = _ENV
	L6_92 = L6_92(A1_87)
	local L5_91 = getWeaponSpriteSet()
	local L7_93 = L7_93
	L6_92:insert((utils.newImageFromSpriteSet(L5_91, L7_93, L2_88.listImage .. ".png")))
	if not weaponTypes[player.weaponType].listImageYoffset then
	end
	utils.newImageFromSpriteSet(L5_91, L7_93, L2_88.listImage .. ".png").x, utils.newImageFromSpriteSet(L5_91, L7_93, L2_88.listImage .. ".png").y = 0, 25 + 0
	if L2_88.iconText then
		local L8_94 = L8_94
		;({}).size = L2_88.iconTextSize
		local L12_98 = L12_98
		local L13_99 = L13_99
		L14_100.shadowColor, ({})[1] = {}, 0
		L14_100.shadowColor, ({})[2] = {}, 0
		local L14_100.shadowColor, ({})[3], L14_100 = {}, 0, L14_100
		L12_98 = L12_98(L13_99, L14_100)
		L14_100 = L6_92
		L13_99 = L6_92.insert
		L13_99(L14_100, L12_98)
		L13_99 = L8_94.x
		L14_100 = L8_94.y
		L12_98.y = L14_100
		L12_98.x = L13_99
	end
	return L6_92
end
function L23_23(A0_101, A1_102)
	local L2_103
	local L5_106 = L5_106
	if not A1_102 then
		L2_103 = {}
		A1_102 = L2_103
	end
	L2_103 = A0_101.name
	A1_102.name = L2_103
	L2_103 = A1_102.borderColor
	L5_106 = _ENV
	local L5_106, L4_105 = L5_106(A1_102), L4_105
	L4_105 = nil
	if A0_101.spriteSheet then
		L4_105 = spritesheetmanager.getSpriteSet(A0_101.spriteSheet)
	else
		L4_105 = getWeaponSpriteSet()
	end
	local L6_107 = L6_107
	local L10_111 = L10_111
	L10_111 = L10_111(L4_105, L6_107, A0_101.image .. ".png")
	local L8_109 = L8_109
	L8_109(L5_106, L10_111)
	local L9_110 = L9_110
	L8_109 = 0
	L10_111.y = 25
	L10_111.x = L8_109
	return L5_106
end
function L24_24(A0_112, A1_113)
	local L2_114
	repeat
		if not A1_113 then
			L2_114 = {}
			A1_113 = L2_114
		end
		L2_114 = A1_113.onDismiss
		local L3_115 = L3_115
		local L3_115, L4_116 = L3_115(UI_SPRITE_SHEET)
		local L5_117 = L5_117
		;({}).width = 700
		;({}).height = 200
		;({}).showTitle = false
		L5_117 = L5_117({})
		function L5_117.preRemoveFunction()
			if _ENV then
				L3_136 = _ENV
				L3_136 = L3_136.buttons
				if L3_136 then
					L3_136 = 1
					_FOR_ = 1
					for _FORV_3_ = L3_136, _FOR_, _FOR_ do
						if _ENV.buttons[_FORV_3_] and _ENV.buttons[_FORV_3_].refreshInventoryAmount then
							_ENV.buttons[_FORV_3_]:refreshInventoryAmount()
							local L6_139 = L6_139
						end
					end
				end
			end
			L3_136 = L2_114
			if L3_136 then
				L3_136 = L2_114
				L3_136()
			end
		end
		local L6_118 = L6_118
		;({}).width = L5_117.innerRect.height - L5_117.innerRect.strokeWidth
		;({}).height = L5_117.innerRect.height - L5_117.innerRect.strokeWidth
		L6_118 = L6_118(A0_112, {})
		L5_117:insert(L6_118)
		L6_118.x, L6_118.y = -L5_117.innerRect.contentWidth / 2 + L6_118.contentWidth / 2, -L5_117.innerRect.contentHeight / 2 + L6_118.contentHeight / 2
		local L7_119 = L7_119
		L7_119 = L7_119(L5_117, A0_112.name, 0, 0, "SingleSleeve", 60)
		L7_119:setReferencePoint(display.TopLeftReferencePoint)
		L7_119:setTextColor(LITTLE_GENERALS_BROWN_DARK())
		L7_119.x, L7_119.y = -L5_117.innerRect.contentWidth / 2 + L6_118.outerRect.contentWidth + 20, -L5_117.innerRect.contentHeight / 2 + 15
		local L8_120 = L8_120
		L8_120 = L8_120(L5_117, weaponTypes.classes[A0_112.weaponClass].name, 0, 0, "SingleSleeve", 36)
		L8_120:setReferencePoint(display.TopLeftReferencePoint)
		L8_120:setTextColor(LITTLE_GENERALS_BROWN_DARK())
		L8_120.x, L8_120.y = L7_119.x, L7_119.y + L7_119.contentHeight
		local L9_121 = L9_121
		L9_121 = L9_121(L3_115, L4_116, "emptycircle.png")
		L6_118:insert(L9_121)
		L9_121.x, L9_121.y = -L6_118.innerRect.contentWidth / 2 + 5, L6_118.innerRect.contentHeight / 2 - 5
		if not A0_112.unlockable or A0_112.unlockable.unlockState then
			display.newText(L6_118, A0_112.getQuantity(), 0, 0, "SingleSleeve", 48):setTextColor(LITTLE_GENERALS_BROWN_DARK())
			display.newText(L6_118, A0_112.getQuantity(), 0, 0, "SingleSleeve", 48).x, display.newText(L6_118, A0_112.getQuantity(), 0, 0, "SingleSleeve", 48).y = L9_121.x, L9_121.y
			utils.scaleTo(display.newText(L6_118, A0_112.getQuantity(), 0, 0, "SingleSleeve", 48), L9_121.contentWidth - 20)
			;({}).normalBorderWidth = L6_118.borderWidth
			;({}).pressedBorderWidth = L6_118.borderWidth
			;({}).pressedBorderColor = utils.pack(LITTLE_GENERALS_BROWN_DARK())
			;({}).buttonText = "BUY!"
			;({}).onComplete = function()
				sound.playSound(sound.globalSounds.button)
				local L0_140 = L0_140
				L0_140 = L0_140(A0_112)
				_UPVALUE2_.text = A0_112.getQuantity()
				_UPVALUE2_.xScale, _UPVALUE2_.yScale = 1, 1
				local L2_142 = L2_142
				L2_142(_UPVALUE2_, L9_121.contentWidth - 20)
				local L3_143 = L3_143
				if not L0_140 then
					L2_142 = L5_117
					L2_142 = L2_142.close
					L2_142()
				end
			end
			L5_117:insert((utils.getBasicButton({})))
			utils.getBasicButton({}).x, utils.getBasicButton({}).y = L5_117.innerRect.contentWidth / 2 - utils.getBasicButton({}).contentWidth / 2, L5_117.innerRect.contentHeight / 2 - utils.getBasicButton({}).contentHeight / 2
			;({}).width = L5_117.innerRect.contentWidth - utils.getBasicButton({}).contentWidth - L6_118.outerRect.contentWidth + L6_118.borderWidth
			;({}).borderWidth = L6_118.borderWidth
			;({}).topColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
			;({}).bottomColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
			L5_117:insert((utils.getTwoToneBox({})))
			utils.getTwoToneBox({}):setReferencePoint(display.CenterRightReferencePoint)
			utils.getTwoToneBox({}).x, utils.getTwoToneBox({}).y = utils.getBasicButton({}).x - utils.getBasicButton({}).contentWidth / 2 + L6_118.borderWidth, utils.getBasicButton({}).y
			utils.newImageFromSpriteSet(L3_115, L4_116, "warbux_icon.png"):setReferencePoint(display.TopLeftReferencePoint)
			L5_117:insert((utils.newImageFromSpriteSet(L3_115, L4_116, "warbux_icon.png")))
			utils.newImageFromSpriteSet(L3_115, L4_116, "warbux_icon.png").x, utils.newImageFromSpriteSet(L3_115, L4_116, "warbux_icon.png").y = utils.getTwoToneBox({}).x - utils.getTwoToneBox({}).contentWidth - 6, utils.getTwoToneBox({}).y - utils.getTwoToneBox({}).contentHeight / 2 - 6
			local L18_130 = L18_130
			local L19_131 = L19_131
			local L20_132 = L20_132
			display.newText(L5_117, tostring(A0_112.cost.extraData.shotsAtCost) .. " for " .. utils.comma_value(A0_112.cost.warbux), 0, 0, "SingleSleeve", 43):setReferencePoint(display.CenterRightReferencePoint)
			display.newText(L5_117, tostring(A0_112.cost.extraData.shotsAtCost) .. " for " .. utils.comma_value(A0_112.cost.warbux), 0, 0, "SingleSleeve", 43):setTextColor(LITTLE_GENERALS_BROWN_DARK())
			display.newText(L5_117, tostring(A0_112.cost.extraData.shotsAtCost) .. " for " .. utils.comma_value(A0_112.cost.warbux), 0, 0, "SingleSleeve", 43):setReferencePoint(display.CenterRightReferencePoint)
			display.newText(L5_117, tostring(A0_112.cost.extraData.shotsAtCost) .. " for " .. utils.comma_value(A0_112.cost.warbux), 0, 0, "SingleSleeve", 43).x = L20_132.x - 15
			display.newText(L5_117, tostring(A0_112.cost.extraData.shotsAtCost) .. " for " .. utils.comma_value(A0_112.cost.warbux), 0, 0, "SingleSleeve", 43).y = L20_132.y - 3
			break -- pseudo-goto
		end
		L18_130 = utils
		L18_130 = L18_130.newImageFromSpriteSet
		L19_131 = L3_115
		L20_132 = L4_116
		L18_130 = L18_130(L19_131, L20_132, "locked_icon.png")
		L20_132 = L6_118
		L19_131 = L6_118.insert
		L19_131(L20_132, L18_130)
		L19_131 = L9_121.x
		L20_132 = L9_121.y
		L18_130.y = L20_132
		L18_130.x = L19_131
		L19_131 = display
		L19_131 = L19_131.newText
		L20_132 = L5_117
		local L16_128 = L16_128
		local L19_131, L17_129 = L19_131(L20_132, L16_128, 0, 0, "SingleSleeve", 36), L17_129
		L16_128 = L19_131
		L20_132 = L19_131.setTextColor
		L17_129 = LITTLE_GENERALS_BROWN_DARK
		L17_129 = L17_129()
		L20_132(L16_128, L17_129, L17_129())
		L16_128 = L19_131
		L20_132 = L19_131.setReferencePoint
		L17_129 = display
		L17_129 = L17_129.CenterLeftReferencePoint
		L20_132(L16_128, L17_129)
		L20_132 = L7_119.x
		L16_128 = L5_117.innerRect
		L16_128 = L16_128.contentHeight
		L16_128 = L16_128 / 2
		L17_129 = L19_131.contentHeight
		L17_129 = L17_129 / 2
		L16_128 = L16_128 - L17_129
		L16_128 = L16_128 - 10
		L19_131.y = L16_128
		L19_131.x = L20_132
	until true
end
L1_1.getMiscItemInfoBox = L24_24
function L24_24(A0_144)
	repeat
		local L1_145 = L1_145
		local L1_145, L2_146 = L1_145(UI_SPRITE_SHEET)
		local L3_147 = L3_147
		;({}).width = 700
		;({}).height = 200
		;({}).showTitle = false
		local L3_147, L4_148 = L3_147({}), L4_148
		function L4_148()
			local L0_165, L1_166, L2_167, L3_168, L4_169
			L0_165 = _ENV
			if L0_165 then
				L0_165 = _ENV
				L0_165 = L0_165.buttons
				if L0_165 then
					L0_165 = 1
					L1_166 = _ENV
					L1_166 = L1_166.buttons
					L1_166 = #L1_166
					L2_167 = 1
					for L3_168 = L0_165, L1_166, L2_167 do
						L4_169 = _ENV
						L4_169 = L4_169.buttons
						L4_169 = L4_169[L3_168]
						if L4_169 and L4_169.refreshInventoryAmount then
							L4_169:refreshInventoryAmount()
							local L5_170, L6_171 = L5_170, L6_171
						end
					end
				end
			end
		end
		L3_147.preRemoveFunction = L4_148
		L4_148 = weaponTypes
		L4_148 = L4_148[A0_144]
		local L5_149 = L5_149
		;({}).width = L3_147.innerRect.height - L3_147.innerRect.strokeWidth
		;({}).height = L3_147.innerRect.height - L3_147.innerRect.strokeWidth
		L5_149 = L5_149(A0_144, {})
		L3_147:insert(L5_149)
		L5_149.x, L5_149.y = -L3_147.innerRect.contentWidth / 2 + L5_149.contentWidth / 2, -L3_147.innerRect.contentHeight / 2 + L5_149.contentHeight / 2
		local L6_150 = L6_150
		L6_150 = L6_150(L3_147, L4_148.name, 0, 0, "SingleSleeve", 60)
		L6_150:setReferencePoint(display.TopLeftReferencePoint)
		L6_150:setTextColor(LITTLE_GENERALS_BROWN_DARK())
		L6_150.x, L6_150.y = -L3_147.innerRect.contentWidth / 2 + L5_149.outerRect.contentWidth + 20, -L3_147.innerRect.contentHeight / 2 + 15
		local L7_151 = L7_151
		L7_151 = L7_151(L3_147, weaponTypes.classes[L4_148.weaponClass].name, 0, 0, "SingleSleeve", 36)
		L7_151:setReferencePoint(display.TopLeftReferencePoint)
		L7_151:setTextColor(LITTLE_GENERALS_BROWN_DARK())
		L7_151.x, L7_151.y = L6_150.x, L6_150.y + L6_150.contentHeight
		local L8_152 = L8_152
		L8_152 = L8_152(L1_145, L2_146, "emptycircle.png")
		L5_149:insert(L8_152)
		L8_152.x, L8_152.y = -L5_149.innerRect.contentWidth / 2 + 5, L5_149.innerRect.contentHeight / 2 - 5
		if not L4_148.unlockable or L4_148.unlockable.unlockState then
			if L4_148.inventory then
				display.newText(L5_149, L4_148.inventory:getQuantity(), 0, 0, "SingleSleeve", 48):setTextColor(LITTLE_GENERALS_BROWN_DARK())
				utils.scaleTo(display.newText(L5_149, L4_148.inventory:getQuantity(), 0, 0, "SingleSleeve", 48), L8_152.contentWidth - 20)
			else
			end
			display.newImage(L5_149, "res/ui/infinity.png", 0, 0).x, display.newImage(L5_149, "res/ui/infinity.png", 0, 0).y = L8_152.x, L8_152.y
			;({}).normalBorderWidth = L5_149.borderWidth
			;({}).pressedBorderWidth = L5_149.borderWidth
			;({}).pressedBorderColor = utils.pack(LITTLE_GENERALS_BROWN_DARK())
			;({}).buttonText = "BUY!"
			;({}).onComplete = function()
				sound.playSound(sound.globalSounds.button)
				local L0_172 = L0_172
				L0_172 = L0_172(A0_144)
				_UPVALUE2_.text = L4_148.inventory:getQuantity()
				_UPVALUE2_.xScale, _UPVALUE2_.yScale = 1, 1
				local L2_174 = L2_174
				L2_174(_UPVALUE2_, L8_152.contentWidth - 20)
				local L3_175 = L3_175
				if not L0_172 then
					L2_174 = L3_147
					L2_174 = L2_174.close
					L2_174()
				end
			end
			L3_147:insert((utils.getBasicButton({})))
			utils.getBasicButton({}).x, utils.getBasicButton({}).y = L3_147.innerRect.contentWidth / 2 - utils.getBasicButton({}).contentWidth / 2, L3_147.innerRect.contentHeight / 2 - utils.getBasicButton({}).contentHeight / 2
			if not L4_148.cost then
				utils.getBasicButton({}).alpha = 0
				utils.getBasicButton({}).isHitTestable = false
			end
			;({}).width = L3_147.innerRect.contentWidth - utils.getBasicButton({}).contentWidth - L5_149.outerRect.contentWidth + L5_149.borderWidth
			;({}).borderWidth = L5_149.borderWidth
			;({}).topColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
			;({}).bottomColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
			L3_147:insert((utils.getTwoToneBox({})))
			utils.getTwoToneBox({}):setReferencePoint(display.CenterRightReferencePoint)
			utils.getTwoToneBox({}).x, utils.getTwoToneBox({}).y = utils.getBasicButton({}).x - utils.getBasicButton({}).contentWidth / 2 + L5_149.borderWidth, utils.getBasicButton({}).y
			utils.newImageFromSpriteSet(L1_145, L2_146, "warbux_icon.png"):setReferencePoint(display.TopLeftReferencePoint)
			L3_147:insert((utils.newImageFromSpriteSet(L1_145, L2_146, "warbux_icon.png")))
			utils.newImageFromSpriteSet(L1_145, L2_146, "warbux_icon.png").x, utils.newImageFromSpriteSet(L1_145, L2_146, "warbux_icon.png").y = utils.getTwoToneBox({}).x - utils.getTwoToneBox({}).contentWidth - 6, utils.getTwoToneBox({}).y - utils.getTwoToneBox({}).contentHeight / 2 - 6
			if L4_148.cost then
			else
				local L17_161 = L17_161
				local L18_162 = L18_162
				local L19_163 = L19_163
				local L20_164 = L20_164
			end
			display.newText(L3_147, "FREE", 0, 0, "SingleSleeve", 43):setReferencePoint(display.CenterRightReferencePoint)
			display.newText(L3_147, "FREE", 0, 0, "SingleSleeve", 43):setTextColor(LITTLE_GENERALS_BROWN_DARK())
			display.newText(L3_147, "FREE", 0, 0, "SingleSleeve", 43):setReferencePoint(display.CenterRightReferencePoint)
			display.newText(L3_147, "FREE", 0, 0, "SingleSleeve", 43).x = L19_163.x - 15
			display.newText(L3_147, "FREE", 0, 0, "SingleSleeve", 43).y = L19_163.y - 3
			break -- pseudo-goto
		end
		L17_161 = utils
		L17_161 = L17_161.newImageFromSpriteSet
		L18_162 = L1_145
		L19_163 = L2_146
		L20_164 = "locked_icon.png"
		L17_161 = L17_161(L18_162, L19_163, L20_164)
		L19_163 = L5_149
		L18_162 = L5_149.insert
		L20_164 = L17_161
		L18_162(L19_163, L20_164)
		L18_162 = L8_152.x
		L19_163 = L8_152.y
		L17_161.y = L19_163
		L17_161.x = L18_162
		L18_162 = display
		L18_162 = L18_162.newText
		L19_163 = L3_147
		L20_164 = tostring
		L20_164 = L20_164(L4_148.unlockable.message())
		local L18_162, L16_160 = L18_162(L19_163, L20_164, 0, 0, "SingleSleeve", 36), L16_160
		L20_164 = L18_162
		L19_163 = L18_162.setTextColor
		L16_160 = LITTLE_GENERALS_BROWN_DARK
		L16_160 = L16_160()
		L19_163(L20_164, L16_160, L16_160())
		L20_164 = L18_162
		L19_163 = L18_162.setReferencePoint
		L16_160 = display
		L16_160 = L16_160.CenterLeftReferencePoint
		L19_163(L20_164, L16_160)
		L19_163 = L6_150.x
		L20_164 = L3_147.innerRect
		L20_164 = L20_164.contentHeight
		L20_164 = L20_164 / 2
		L16_160 = L18_162.contentHeight
		L16_160 = L16_160 / 2
		L20_164 = L20_164 - L16_160
		L20_164 = L20_164 - 10
		L18_162.y = L20_164
		L18_162.x = L19_163
	until true
end
function L25_25(A0_176)
	local L4_180, L5_181, L6_182 = spritesheetmanager.getSpriteSet, L5_181, L6_182
	L5_181 = UI_SPRITE_SHEET
	L4_180, L5_181 = L4_180(L5_181)
	L6_182 = display
	L6_182 = L6_182.newGroup
	L6_182 = L6_182()
	if A0_176 == _ENV.weaponType then
		({})[1] = 255
		;({})[2] = 0
		;({})[3] = 0
	end
	local L7_183 = L7_183
	local L8_184 = L8_184
	;({}).borderColor = L8_184
	local L9_185 = L9_185
	;({}).ignoreFocus = true
	;({}).onComplete = function()
		if not _ENV then
			L24_24(A0_176)
		elseif not L20_20(A0_176) then
			repeat
				if not L7_183.cost or #L7_183.cost:canAfford() == 0 then
					function confirmFunction()
						_ENV(A0_176)
						L20_20(A0_176)
						local L1_201 = L1_201
					end
					if L7_183.cost then
						({}).icon = utils.DIALOG_QUESTION
						local L5_200 = L5_200
						;({}).textLine1 = string.format("You are out of %s.", L7_183.pluralName)
						;({}).textLine2 = "Buy more?" .. L5_200
						;({}).confirmSound = sound.globalSounds.button
						;({}).cancelSound = sound.globalSounds.button
						;({}).confirmFunction = confirmFunction
						

-- [End of decompiled block; see disassembly for inner stripped closures]
