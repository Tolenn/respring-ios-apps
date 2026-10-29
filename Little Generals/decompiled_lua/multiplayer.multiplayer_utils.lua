local L0_0, L3_3, L4_4, L5_5, L6_6, L7_7, L21_21, L22_22, L23_23, L24_24, L25_25 = L0_0, "multiplayer.match", L4_4, L5_5, L6_6, L7_7, L21_21, L22_22, L23_23, L24_24, L25_25
L0_0 = L0_0(L3_3)
L3_3 = require
L4_4 = "tutorial"
L3_3 = L3_3(L4_4)
L4_4 = 50
L5_5 = {}
function L6_6()
	local L0_26
	L0_26 = {}
	L3_29 = pairs
	L4_30 = orderedWeaponTypes
	L3_29, L4_30, L5_31 = L3_29(L4_30)
	for _FORV_4_, _FORV_5_ in L3_29, L4_30, L5_31 do
		if type(_FORV_5_) == "number" then
			table.insert(L0_26, _FORV_5_)
			local L8_34 = L8_34
		end
	end
	return L0_26
end
L7_7 = {}
L7_7.ALL_WEAPONS = 1
L7_7.BABY_MISSILES_ONLY = 2
L7_7.LIGHT_WEAPONS = 3
L7_7.MISSILES_N_DRILLS = 4
L7_7.LASER_TAG = 5
L7_7.TERRAFORM = 6
L21_21 = {}
L22_22 = {}
L23_23 = L7_7.ALL_WEAPONS
L24_24 = L7_7.BABY_MISSILES_ONLY
L25_25 = L7_7.MISSILES_N_DRILLS
L22_22[1] = L23_23
L22_22[2] = L24_24
L22_22[3] = L25_25
L22_22[4] = L7_7.LIGHT_WEAPONS
L22_22[5] = L7_7.LASER_TAG
L22_22[6] = L7_7.TERRAFORM
L21_21.availableTypes = L22_22
L22_22 = L7_7.BABY_MISSILES_ONLY
L23_23 = {}
L23_23.name = "Baby Missiles Only"
L24_24 = {}
L25_25 = weaponTypes
L25_25 = L25_25.BABY_MISSILE
L24_24[1] = L25_25
L23_23.weapons = L24_24
L21_21[L22_22] = L23_23
L22_22 = L7_7.LIGHT_WEAPONS
L23_23 = {}
L23_23.name = "Light Weapons"
L24_24 = {}
L25_25 = weaponTypes
L25_25 = L25_25.BABY_MISSILE
L24_24[1] = L25_25
L24_24[2] = weaponTypes.MISSILE
L24_24[3] = weaponTypes.BABY_ROLLER
L24_24[4] = weaponTypes.BIG_ROLLER
L24_24[5] = weaponTypes.GRENADE
L24_24[6] = weaponTypes.DRILL
L24_24[7] = weaponTypes.SAND_WEDGE
L24_24[8] = weaponTypes.ICECREAM
L24_24[9] = weaponTypes.PUMPKIN
L24_24[10] = weaponTypes.DRAGON_FIRE
L24_24[11] = weaponTypes.SANTA
L23_23.weapons = L24_24
L21_21[L22_22] = L23_23
L22_22 = L7_7.MISSILES_N_DRILLS
L23_23 = {}
L23_23.name = "Missiles 'n' Drills"
L24_24 = {}
L25_25 = weaponTypes
L25_25 = L25_25.BABY_MISSILE
L24_24[1] = L25_25
L24_24[2] = weaponTypes.MISSILE
L24_24[3] = weaponTypes.DRILL
L24_24[4] = weaponTypes.ICECREAM
L24_24[5] = weaponTypes.PUMPKIN
L24_24[6] = weaponTypes.DRAGON_FIRE
L24_24[7] = weaponTypes.SANTA
L23_23.weapons = L24_24
L21_21[L22_22] = L23_23
L22_22 = L7_7.LASER_TAG
L23_23 = {}
L23_23.name = "Laser Tag"
L24_24 = {}
L25_25 = weaponTypes
L25_25 = L25_25.BABY_MISSILE
L24_24[1] = L25_25
L24_24[2] = weaponTypes.LASER
L23_23.weapons = L24_24
L21_21[L22_22] = L23_23
L22_22 = L7_7.TERRAFORM
L23_23 = {}
L23_23.name = "Terraform"
L24_24 = {}
L25_25 = weaponTypes
L25_25 = L25_25.BABY_MISSILE
L24_24[1] = L25_25
L24_24[2] = weaponTypes.DRILL
L24_24[3] = weaponTypes.SAND_WEDGE
L24_24[4] = weaponTypes.SAND_BOMB
L23_23.weapons = L24_24
L21_21[L22_22] = L23_23
L22_22 = L7_7.ALL_WEAPONS
L23_23 = {}
L23_23.name = "All Weapons"
L24_24 = L6_6
L24_24 = L24_24()
L23_23.weapons = L24_24
L21_21[L22_22] = L23_23
L22_22 = {}
L22_22.NORMAL = 1
L22_22.HEALTH_2X = 2
L22_22.HEALTH_4X = 3
L23_23 = {}
L24_24 = {}
L25_25 = L22_22.NORMAL
L24_24[1] = L25_25
L24_24[2] = L22_22.HEALTH_2X
L24_24[3] = L22_22.HEALTH_4X
L23_23.availableTypes = L24_24
L24_24 = L22_22.NORMAL
L25_25 = {}
L25_25.name = "Normal"
L25_25.healthX = 1
L23_23[L24_24] = L25_25
L24_24 = L22_22.HEALTH_2X
L25_25 = {}
L25_25.name = "2x Health"
L25_25.healthX = 2
L23_23[L24_24] = L25_25
L24_24 = L22_22.HEALTH_4X
L25_25 = {}
L25_25.name = "4x Health"
L25_25.healthX = 4
L23_23[L24_24] = L25_25
L24_24 = {}
L24_24.NONE = 1
L24_24.LIGHT = 2
L24_24.MEDIUM = 3
L24_24.STRONG = 4
L24_24.RANDOM = 5
L25_25 = {}
local L13_13 = L13_13
local L14_14 = L14_14
local L15_15 = L15_15
L13_13[1] = L14_14
L13_13[2] = L15_15
L13_13[3] = L24_24.LIGHT
L13_13[4] = L24_24.MEDIUM
local L13_13[5], L16_16 = L24_24.STRONG, L16_16
L25_25.availableTypes = L13_13
L13_13 = L24_24.NONE
L14_14 = {}
L14_14.name = "None"
function L15_15()
	local L1_35
	L1_35 = 0
	return L1_35
end
L14_14.wind = L15_15
L25_25[L13_13] = L14_14
L13_13 = L24_24.LIGHT
L14_14 = {}
L14_14.name = "Light"
function L15_15()
	local L0_36 = L0_36
	L0_36 = L0_36(1, 30)
	L0_36 = L0_36 / 10
	local L1_37 = L1_37
	local L2_38 = L2_38
	local L1_37, L3_39 = L1_37(L2_38, 10), L3_39
	if L1_37 <= 5 then
		L0_36 = L0_36 * -1
	end
	return L0_36
end
L14_14.wind = L15_15
L25_25[L13_13] = L14_14
L13_13 = L24_24.MEDIUM
L14_14 = {}
L14_14.name = "Medium"
function L15_15()
	local L0_40 = L0_40
	L0_40 = L0_40(0, 35)
	L0_40 = L0_40 / 10
	L0_40 = 3 + L0_40
	local L1_41 = L1_41
	local L2_42 = L2_42
	local L1_41, L3_43 = L1_41(L2_42, 10), L3_43
	if L1_41 <= 5 then
		L0_40 = L0_40 * -1
	end
	return L0_40
end
L14_14.wind = L15_15
L25_25[L13_13] = L14_14
L13_13 = L24_24.STRONG
L14_14 = {}
L14_14.name = "Strong"
function L15_15()
	local L0_44 = L0_44
	L0_44 = L0_44(0, 35)
	L0_44 = L0_44 / 10
	L0_44 = 6.5 + L0_44
	local L1_45 = L1_45
	local L2_46 = L2_46
	local L1_45, L3_47 = L1_45(L2_46, 10), L3_47
	if L1_45 <= 5 then
		L0_44 = L0_44 * -1
	end
	return L0_44
end
L14_14.wind = L15_15
L25_25[L13_13] = L14_14
L13_13 = L24_24.RANDOM
L14_14 = {}
L14_14.name = "Random"
function L15_15()
	local L0_48 = L0_48
	local L1_49 = L1_49
	local L0_48, L2_50 = L0_48(L1_49, 100), L2_50
	L0_48 = L0_48 / 10
	return L0_48
end
L14_14.wind = L15_15
L25_25[L13_13] = L14_14
function L13_13(A0_51)
	local L1_52
	if A0_51 and not (A0_51 < 1) then
		L1_52 = _ENV
		L1_52 = #L1_52
		if not (A0_51 > L1_52) then
			goto lbl_10
		end
	end
	A0_51 = 1
	::lbl_10::
	L1_52 = _ENV
	L1_52 = L1_52[A0_51]
	L1_52 = L1_52.healthX
	return L1_52
end
L5_5.getHealthX = L13_13
function L14_14(A0_53)
	if not A0_53 or A0_53 < 1 or A0_53 > #_ENV then
		A0_53 = 1
	end
	do return _ENV[A0_53].wind() end
	local L1_54 = L1_54
end
L5_5.getWindVal = L14_14
function L15_15(A0_55)
	local L1_56
	L1_56 = _ENV
	L1_56 = L1_56[A0_55]
	L1_56 = L1_56.name
	return L1_56
end
L5_5.getMatchTypeName = L15_15
function L16_16(A0_57, A1_58)
	local L2_59 = display.newGroup()
	if A1_58.readOnly and A1_58.readOnlyLabel ~= nil then
		display.newText(L2_59, A1_58.readOnlyLabel, 0, 0, "SingleSleeve", _ENV):setTextColor(LITTLE_GENERALS_BROWN_DARK())
		display.newText(L2_59, A1_58.readOnlyLabel, 0, 0, "SingleSleeve", _ENV).x, display.newText(L2_59, A1_58.readOnlyLabel, 0, 0, "SingleSleeve", _ENV).y = 0, 0
	else
		if L8_8[A0_57].displayName then
			display.newText(L2_59, L8_8[A0_57].displayName[1], 0, 0, "SingleSleeve", _ENV):setTextColor(LITTLE_GENERALS_BROWN_DARK())
			display.newText(L2_59, L8_8[A0_57].displayName[1], 0, 0, "SingleSleeve", _ENV).x, display.newText(L2_59, L8_8[A0_57].displayName[1], 0, 0, "SingleSleeve", _ENV).y = 0, -display.newText(L2_59, L8_8[A0_57].displayName[1], 0, 0, "SingleSleeve", _ENV).contentHeight / 2 + 5
			local L10_67 = L10_67
			display.newText(L2_59, L8_8[A0_57].displayName[2], 0, 0, "SingleSleeve", _ENV):setTextColor(LITTLE_GENERALS_BROWN_DARK())
			display.newText(L2_59, L8_8[A0_57].displayName[2], 0, 0, "SingleSleeve", _ENV).x, display.newText(L2_59, L8_8[A0_57].displayName[2], 0, 0, "SingleSleeve", _ENV).y = 0, display.newText(L2_59, L8_8[A0_57].displayName[2], 0, 0, "SingleSleeve", _ENV).contentHeight / 2 - 5
			break -- pseudo-goto
		end
		L10_67 = display
		L10_67 = L10_67.newText
		local L4_61 = L4_61
		local L5_62 = L5_62
		local L7_64 = L7_64
		local L8_65 = L8_65
		local L10_67, L9_66 = L10_67(L4_61, L5_62, L7_64, L8_65, "SingleSleeve", _ENV), L9_66
		L5_62 = L10_67
		L4_61 = L10_67.setTextColor
		L7_64 = LITTLE_GENERALS_BROWN_DARK
		L7_64, L8_65, L9_66 = L7_64()
		repeat
			L4_61(L5_62, L7_64, L8_65, L9_66, L7_64())
			L4_61 = 0
			L10_67.y = 0
			L10_67.x = L4_61
		until true
	end
	return L2_59
end
function L5_5.getMatchTypeChooser(A0_68)
	local L3_71 = spritesheetmanager.getSpriteSet
	local L3_71, L2_70 = L3_71(UI_SPRITE_SHEET)
	if not A0_68 then
		A0_68 = {}
	end
	if not A0_68.matchTypeId then
	end
	local L4_72 = L4_72
	local L5_73 = L5_73
	local L6_74 = L6_74
	_ENV(L4_72, A0_68).x, _ENV(L4_72, A0_68).y = 0, 0
	L6_74:insert((_ENV(L4_72, A0_68)))
	local L7_75, L8_76 = L7_75, L8_76
	L8_76(L5_73, L6_74)
	L5_73.chosenType = L7_75
	L8_76 = 1
	L9_77 = 1
	_FOR_ = 1
	for _FORV_11_ = L9_77, _FOR_, _FOR_ do
		if L8_8.availableTypes[_FORV_11_] == L4_72 then
			L8_76 = _FORV_11_
			break
		end
	end
	L5_73.selectedIndex = L8_76
	L9_77 = 100
	local L10_78 = L10_78
	local L16_84 = L16_84
	;({}).color = utils.pack(LITTLE_GENERALS_BACKGROUND_LIGHT())
	;({}).padLeft = 140
	;({}).extraHitArea, ({}).alpha = {}, 1
	L16_84 = L16_84(L3_71, L2_70, "arrow_normal.png", "arrow_select.png", function()
		local L0_90 = L0_90
		L0_90(-1)
		local L1_91 = L1_91
		L0_90 = true
		return L0_90
	end, nil, {})
	L16_84:scale(0.5, 0.5)
	L5_73:insert(L16_84)
	L16_84.x = -150
	if A0_68.readOnly then
		L16_84.alpha = 0
		L16_84.isHitTestable = false
	end
	local L17_85 = L17_85
	local L21_89 = L21_89
	;({}).color = utils.pack(LITTLE_GENERALS_BACKGROUND_LIGHT())
	;({}).padRight = 140
	;({}).extraHitArea, ({}).alpha = {}, 1
	L17_85 = L17_85(L21_89, L2_70, "arrow_normal.png", "arrow_select.png", function()
		local L0_92 = L0_92
		L0_92(1)
		local L1_93 = L1_93
		L0_92 = true
		return L0_92
	end, nil, {})
	L21_89 = L17_85.normal
	L21_89.xScale = -1
	L21_89 = L17_85.pressed
	L21_89.xScale = -1
	L21_89 = L17_85.scale
	L21_89(L17_85, 0.5, 0.5)
	L21_89 = L5_73.insert
	L21_89(L5_73, L17_85)
	L17_85.x = 150
	L21_89 = A0_68.readOnly
	if L21_89 then
		L17_85.alpha = 0
		L17_85.isHitTestable = false
	end
	L21_89 = L10_78
	L21_89(0)
	return L5_73
end
function L5_5.getMatchHealthChooser(A0_94)
	local L3_97 = spritesheetmanager.getSpriteSet
	local L3_97, L2_96 = L3_97(UI_SPRITE_SHEET)
	if not A0_94 then
		A0_94 = {}
	end
	if not A0_94.healthTypeId then
	end
	local L4_98 = L4_98
	local L5_99 = L5_99
	local L6_100 = L6_100
	_ENV(L4_98, A0_94).x, _ENV(L4_98, A0_94).y = 0, 0
	L6_100:insert((_ENV(L4_98, A0_94)))
	local L7_101, L8_102 = L7_101, L8_102
	L8_102(L5_99, L6_100)
	L5_99.chosenType = L7_101
	L8_102 = 1
	L9_103 = 1
	_FOR_ = 1
	for _FORV_11_ = L9_103, _FOR_, _FOR_ do
		if L10_10.availableTypes[_FORV_11_] == L4_98 then
			L8_102 = _FORV_11_
			break
		end
	end
	L5_99.selectedIndex = L8_102
	L9_103 = 100
	local L10_104 = L10_104
	local L16_110 = L16_110
	;({}).color = utils.pack(LITTLE_GENERALS_BACKGROUND_LIGHT())
	;({}).padLeft = 140
	;({}).extraHitArea, ({}).alpha = {}, 1
	L16_110 = L16_110(L3_97, L2_96, "arrow_normal.png", "arrow_select.png", function()
		local L0_116 = L0_116
		L0_116(-1)
		local L1_117 = L1_117
		L0_116 = true
		return L0_116
	end, nil, {})
	L16_110:scale(0.5, 0.5)
	L5_99:insert(L16_110)
	L16_110.x = -150
	if A0_94.readOnly then
		L16_110.alpha = 0
		L16_110.isHitTestable = false
	end
	local L17_111 = L17_111
	local L21_115 = L21_115
	;({}).color = utils.pack(LITTLE_GENERALS_BACKGROUND_LIGHT())
	;({}).padRight = 140
	;({}).extraHitArea, ({}).alpha = {}, 1
	L17_111 = L17_111(L21_115, L2_96, "arrow_normal.png", "arrow_select.png", function()
		local L0_118 = L0_118
		L0_118(1)
		local L1_119 = L1_119
		L0_118 = true
		return L0_118
	end, nil, {})
	L21_115 = L17_111.normal
	L21_115.xScale = -1
	L21_115 = L17_111.pressed
	L21_115.xScale = -1
	L21_115 = L17_111.scale
	L21_115(L17_111, 0.5, 0.5)
	L21_115 = L5_99.insert
	L21_115(L5_99, L17_111)
	L17_111.x = 150
	L21_115 = A0_94.readOnly
	if L21_115 then
		L17_111.alpha = 0
		L17_111.isHitTestable = false
	end
	L21_115 = L10_104
	L21_115(0)
	return L5_99
end
function L5_5.getMatchWindChooser(A0_120)
	local L3_123 = spritesheetmanager.getSpriteSet
	local L3_123, L2_122 = L3_123(UI_SPRITE_SHEET)
	if not A0_120 then
		A0_120 = {}
	end
	if not A0_120.windTypeId then
	end
	local L4_124 = L4_124
	local L5_125 = L5_125
	local L6_126 = L6_126
	_ENV(L4_124, A0_120).x, _ENV(L4_124, A0_120).y = 0, 0
	L6_126:insert((_ENV(L4_124, A0_120)))
	local L7_127, L8_128 = L7_127, L8_128
	L8_128(L5_125, L6_126)
	L5_125.chosenType = L7_127
	L8_128 = 1
	L9_129 = 1
	_FOR_ = 1
	for _FORV_11_ = L9_129, _FOR_, _FOR_ do
		if L12_12.availableTypes[_FORV_11_] == L4_124 then
			L8_128 = _FORV_11_
			break
		end
	end
	L5_125.selectedIndex = L8_128
	L9_129 = 100
	local L10_130 = L10_130
	local L16_136 = L16_136
	;({}).color = utils.pack(LITTLE_GENERALS_BACKGROUND_LIGHT())
	;({}).padLeft = 140
	;({}).extraHitArea, ({}).alpha = {}, 1
	L16_136 = L16_136(L3_123, L2_122, "arrow_normal.png", "arrow_select.png", function()
		local L0_142 = L0_142
		L0_142(-1)
		local L1_143 = L1_143
		L0_142 = true
		return L0_142
	end, nil, {})
	L16_136:scale(0.5, 0.5)
	L5_125:insert(L16_136)
	L16_136.x = -150
	if A0_120.readOnly then
		L16_136.alpha = 0
		L16_136.isHitTestable = false
	end
	local L17_137 = L17_137
	local L21_141 = L21_141
	;({}).color = utils.pack(LITTLE_GENERALS_BACKGROUND_LIGHT())
	;({}).padRight = 140
	;({}).extraHitArea, ({}).alpha = {}, 1
	L17_137 = L17_137(L21_141, L2_122, "arrow_normal.png", "arrow_select.png", function()
		local L0_144 = L0_144
		L0_144(1)
		local L1_145 = L1_145
		L0_144 = true
		return L0_144
	end, nil, {})
	L21_141 = L17_137.normal
	L21_141.xScale = -1
	L21_141 = L17_137.pressed
	L21_141.xScale = -1
	L21_141 = L17_137.scale
	L21_141(L17_137, 0.5, 0.5)
	L21_141 = L5_125.insert
	L21_141(L5_125, L17_137)
	L17_137.x = 150
	L21_141 = A0_120.readOnly
	if L21_141 then
		L17_137.alpha = 0
		L17_137.isHitTestable = false
	end
	L21_141 = L10_130
	L21_141(0)
	return L5_125
end
function L5_5.getTankChooser(A0_146)
	local L1_147
	L1_147 = 0.75
	local L4_150, L5_151, L6_152 = spritesheetmanager, L5_151, L6_152
	L4_150 = L4_150.getSpriteSet
	L5_151 = UI_SPRITE_SHEET
	L4_150, L5_151 = L4_150(L5_151)
	if not A0_146 then
		L6_152 = {}
		A0_146 = L6_152
	end
	L6_152 = A0_146.selectedTankId
	if not L6_152 then
		L6_152 = nil
	end
	_FOR_ = 1
	for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
		if tankTypes[availableTankTypesInOrder[_FORV_9_]].unlockable then
		end
		if not not tankTypes[availableTankTypesInOrder[_FORV_9_]].unlockable.unlockState then
			table.insert({}, availableTankTypesInOrder[_FORV_9_])
		end
	end
	if L6_152 then
		_FOR_, _FOR_, _FOR_ = pairs({})
		for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
			if L6_152 == _FORV_12_ then
				break
			end
		end
		if not true then
			L6_152 = nil
		end
	end
	if L6_152 == nil then
		L6_152 = ({})[1]
	end
	local L7_153 = L7_153
	local L8_154 = L8_154
	local L9_155 = L9_155
	tankAvatar.getTankAvatar(L6_152).xScale, tankAvatar.getTankAvatar(L6_152).yScale = L1_147, L1_147
	display.newGroup():insert((tankAvatar.getTankAvatar(L6_152)))
	local L10_156, L11_157 = L10_156, L11_157
	L9_155:insert((display.newGroup()))
	L9_155.chosenTank = L11_157
	L9_155.selectedTankId = L6_152
	local L12_158 = L12_158
	local L18_164 = L18_164
	;({}).color = utils.pack(LITTLE_GENERALS_BACKGROUND_NORMAL())
	;({}).padLeft = 100
	;({}).extraHitArea, ({}).alpha = {}, 1
	L9_155:insert((utils.newButton(L4_150, L5_151, "arrow_normal.png", "arrow_select.png", function()
		local L0_170 = L0_170
		L0_170(-1)
		local L1_171 = L1_171
		L0_170 = true
		return L0_170
	end, nil, {})))
	utils.newButton(L4_150, L5_151, "arrow_normal.png", "arrow_select.png", function()
		local L0_172 = L0_172
		L0_172(-1)
		local L1_173 = L1_173
		L0_172 = true
		return L0_172
	end, nil, {}).x = -125
	local L17_163 = L17_163
	local L19_165 = L19_165
	local L23_169 = L23_169
	;({}).color = utils.pack(LITTLE_GENERALS_BACKGROUND_NORMAL())
	;({}).padRight = 100
	;({}).extraHitArea, ({}).alpha = {}, 1
	L19_165 = L19_165(L23_169, L5_151, "arrow_normal.png", "arrow_select.png", function()
		local L0_174 = L0_174
		L0_174(1)
		local L1_175 = L1_175
		L0_174 = true
		return L0_174
	end, nil, {})
	L23_169 = L9_155.insert
	L23_169(L9_155, L19_165)
	L23_169 = L19_165.normal
	L23_169.xScale = -1
	L23_169 = L19_165.pressed
	L23_169.xScale = -1
	L19_165.x = 125
	L23_169 = L18_164
	L23_169(0)
	return L9_155
end
function L5_5.showEndBattleDialog(A0_176)
	local L3_179, L4_180, L5_181, L6_182, L8_184, L9_185, L10_186, L11_187, L15_191, L16_192 = spritesheetmanager.getSpriteSet, L4_180, L5_181, L6_182, L8_184, L9_185, L10_186, L11_187, L15_191, L16_192
	L4_180 = UI_SPRITE_SHEET
	L3_179, L4_180 = L3_179(L4_180)
	L5_181 = A0_176.match
	L6_182 = L5_181.parameters
	L6_182 = L6_182.surrender
	L8_184 = A0_176.onAcknowledgement
	L9_185 = A0_176.playback
	L10_186 = getCurrentBattle
	L10_186 = L10_186()
	L11_187 = "YOU LOSE!"
	if L6_182 then
		L11_187 = "YOU SURRENDERED!"
	end
	L15_191 = nil
	L16_192 = "YOUR OPPONENT WON"
	local L14_190 = L14_190
	if L5_181.player1.alias == players[2].alias then
	end
	if require("multiplayer.match").self(L5_181).id == L5_181.winner then
		function L8_184()
			if _ENV then
				_ENV()
			end
		end
		L11_187 = "YOU WIN!"
		if L6_182 then
			L11_187 = "OPPONENT SURRENDERED!"
			L15_191 = 0.65
		end
		L16_192 = "YOU WIN"
		L14_190 = true
	end
	local L17_193 = L17_193
	;({}).title = L11_187
	;({}).newTitleScale = L15_191
	;({}).closeable = false
	;({}).width = 680
	;({}).height = 387
	;({}).onShow = function()
		sound.stop()
	end
	local L18_194 = L18_194
	if L14_190 then
		utils.getDrawnDialogBox({}):insert((display.newImageRect("res/ui/win_laurel.png", 366, 197)))
		display.newImageRect("res/ui/win_laurel.png", 366, 197).x, display.newImageRect("res/ui/win_laurel.png", 366, 197).y = 0, 25
		Particles.CreateEmitter("emitter" .. tostring((utils.getDrawnDialogBox({}))), 0, 0, 0, false, false, true)
		FXLibrary.AttachWarbux("emitter" .. tostring((utils.getDrawnDialogBox({}))))
		Particles.SetEmitterScale("emitter" .. tostring((utils.getDrawnDialogBox({}))), 0.75)
		utils.getDrawnDialogBox({}):insert((Particles.GetEmitter("emitter" .. tostring((utils.getDrawnDialogBox({}))))))
		Particles.GetEmitter("emitter" .. tostring((utils.getDrawnDialogBox({})))).x, Particles.GetEmitter("emitter" .. tostring((utils.getDrawnDialogBox({})))).y = 0, 40
		Particles.StartEmitter("emitter" .. tostring((utils.getDrawnDialogBox({}))))
	elseif L6_182 then
		sprite.add(spritesheetmanager.getSpriteSet("res/ui/whiteflag.png"))
		utils.getDrawnDialogBox({}):insert((sprite.newSprite(spritesheetmanager.getSpriteSet("res/ui/whiteflag.png"))))
		sprite.newSprite(spritesheetmanager.getSpriteSet("res/ui/whiteflag.png")):prepare("flagwave")
		sprite.newSprite(spritesheetmanager.getSpriteSet("res/ui/whiteflag.png")):play()
		sprite.newSprite(spritesheetmanager.getSpriteSet("res/ui/whiteflag.png")).x, sprite.newSprite(spritesheetmanager.getSpriteSet("res/ui/whiteflag.png")).y = 0, 22
		if L5_181.winner == L5_181.player2.id then
			sprite.newSprite(spritesheetmanager.getSpriteSet("res/ui/whiteflag.png")).xScale = -1
		end
	else
		utils.getDrawnDialogBox({}):insert((display.newImageRect("res/ui/lose_crater.png", 305, 218)))
		display.newImageRect("res/ui/lose_crater.png", 305, 218).x, display.newImageRect("res/ui/lose_crater.png", 305, 218).y = 0, 22
		;({}).x = display.newImageRect("res/ui/lose_crater.png", 305, 218).x - 125
		;({}).y = display.newImageRect("res/ui/lose_crater.png", 305, 218).y + 100
		;({}).x = display.newImageRect("res/ui/lose_crater.png", 305, 218).x - 75
		;({}).y = display.newImageRect("res/ui/lose_crater.png", 305, 218).y + 90
		;({}).x = display.newImageRect("res/ui/lose_crater.png", 305, 218).x - 65
		;({}).y = display.newImageRect("res/ui/lose_crater.png", 305, 218).y + 80
		;({}).x = display.newImageRect("res/ui/lose_crater.png", 305, 218).x - 55
		;({}).y = display.newImageRect("res/ui/lose_crater.png", 305, 218).y + 70
		;({}).x = display.newImageRect("res/ui/lose_crater.png", 305, 218).x + 60
		;({}).y = display.newImageRect("res/ui/lose_crater.png", 305, 218).y + 65
		;({}).x = display.newImageRect("res/ui/lose_crater.png", 305, 218).x + 80
		;({}).y = display.newImageRect("res/ui/lose_crater.png", 305, 218).y + 65
		;({}).x = display.newImageRect("res/ui/lose_crater.png", 305, 218).x + 90
		;({}).y = display.newImageRect("res/ui/lose_crater.png", 305, 218).y + 85
		;({}).x = display.newImageRect("res/ui/lose_crater.png", 305, 218).x + 120
		;({}).y = display.newImageRect("res/ui/lose_crater.png", 305, 218).y + 75
		;({}).x = display.newImageRect("res/ui/lose_crater.png", 305, 218).x + 130
		;({}).y = display.newImageRect("res/ui/lose_crater.png", 305, 218).y + 85
		;({})[1] = {}
		;({})[2] = {}
		;({})[3] = {}
		;({})[4] = {}
		;({})[5] = {}
		;({})[6] = {}
		;({})[7] = {}
		;({})[8] = {}
		;({})[9] = {}
		_FOR_ = 1
		for _FORV_24_ = _FOR_, _FOR_, _FOR_ do
			({}).weaponType = weaponTypes.NAPALM
			;({}).parentGroup, ({}).displayOnly = utils.getDrawnDialogBox({}), true
			;({}).manualDestroy = true
			;({})[napalm.createBlob({}, nil, ({})[_FORV_24_].x, ({})[_FORV_24_].y, weaponTypes.NAPALM, nil, nil, nil, {})] = napalm.createBlob({}, nil, ({})[_FORV_24_].x, ({})[_FORV_24_].y, weaponTypes.NAPALM, nil, nil, nil, {})
		end
		utils.getDrawnDialogBox({}).napalms = {}
		display.newImageRect("res/ui/lose_crater.png", 305, 218):toFront()
		Particles.CreateEmitter("emitter" .. tostring((utils.getDrawnDialogBox({}))), 0, 0, 0, false, false, true)
		FXLibrary.AttachBlastDebris("emitter" .. tostring((utils.getDrawnDialogBox({}))))
		Particles.SetEmitterScale("emitter" .. tostring((utils.getDrawnDialogBox({}))), 0.75)
		utils.getDrawnDialogBox({}):insert((Particles.GetEmitter("emitter" .. tostring((utils.getDrawnDialogBox({}))))))
		Particles.GetEmitter("emitter" .. tostring((utils.getDrawnDialogBox({})))).x, Particles.GetEmitter("emitter" .. tostring((utils.getDrawnDialogBox({})))).y = -100, 50
		Particles.StartEmitter("emitter" .. tostring((utils.getDrawnDialogBox({}))))
		math.randomseed(system.getTimer())
		Particles.CreateEmitter(("emitter" .. tostring((utils.getDrawnDialogBox({})))) .. "_2", 0, 0, 0, false, false, true)
		FXLibrary.AttachBlastDebris(("emitter" .. tostring((utils.getDrawnDialogBox({})))) .. "_2")
		Particles.SetEmitterScale(("emitter" .. tostring((utils.getDrawnDialogBox({})))) .. "_2", 0.75)
		utils.getDrawnDialogBox({}):insert((Particles.GetEmitter(("emitter" .. tostring((utils.getDrawnDialogBox({})))) .. "_2")))
		Particles.GetEmitter(("emitter" .. tostring((utils.getDrawnDialogBox({})))) .. "_2").x, Particles.GetEmitter(("emitter" .. tostring((utils.getDrawnDialogBox({})))) .. "_2").y = 100, 50
		Particles.StartEmitter(("emitter" .. tostring((utils.getDrawnDialogBox({})))) .. "_2")
	end
	local L19_195 = L19_195
	;({}).size = 50
	utils.getDrawnDialogBox({}):insert((utils.getOutlinedText(L16_192, {})))
	utils.getOutlinedText(L16_192, {}).x, utils.getOutlinedText(L16_192, {}).y = 0, utils.getDrawnDialogBox({}).titleBar.y + utils.getDrawnDialogBox({}).titleBar.contentHeight / 2 + utils.getOutlinedText(L16_192, {}).contentHeight / 2 - 5
	local L20_196 = L20_196
	;({}).size = 50
	utils.getDrawnDialogBox({}):insert((utils.getOutlinedText(string.format("%d WARBUX", L10_186.getPot()), {})))
	utils.getOutlinedText(string.format("%d WARBUX", L10_186.getPot()), {}).x, utils.getOutlinedText(string.format("%d WARBUX", L10_186.getPot()), {}).y = utils.getOutlinedText(string.format("%d WARBUX", L10_186.getPot()), {}).x, utils.getOutlinedText(L16_192, {}).y + utils.getOutlinedText(L16_192, {}).contentHeight - 15
	local L21_197 = L21_197
	display.newRect(utils.getDrawnDialogBox({}), 0, 0, utils.getDrawnDialogBox({}).innerRect.contentWidth - 12, 60):setFillColor(LITTLE_GENERALS_BACKGROUND_LIGHT())
	display.newRect(utils.getDrawnDialogBox({}), 0, 0, utils.getDrawnDialogBox({}).innerRect.contentWidth - 12, 60).x, display.newRect(utils.getDrawnDialogBox({}), 0, 0, utils.getDrawnDialogBox({}).innerRect.contentWidth - 12, 60).y = 0, utils.getDrawnDialogBox({}).innerRect.contentHeight / 2 - display.newRect(utils.getDrawnDialogBox({}), 0, 0, utils.getDrawnDialogBox({}).innerRect.contentWidth - 12, 60).contentHeight / 2 - 6
	local L22_198 = L22_198
	display.newRect(utils.getDrawnDialogBox({}), 0, 0, 290, display.newRect(utils.getDrawnDialogBox({}), 0, 0, utils.getDrawnDialogBox({}).innerRect.contentWidth - 12, 60).contentHeight):setFillColor(LITTLE_GENERALS_BROWN_DARK())
	display.newRect(utils.getDrawnDialogBox({}), 0, 0, 290, display.newRect(utils.getDrawnDialogBox({}), 0, 0, utils.getDrawnDialogBox({}).innerRect.contentWidth - 12, 60).contentHeight).x, display.newRect(utils.getDrawnDialogBox({}), 0, 0, 290, display.newRect(utils.getDrawnDialogBox({}), 0, 0, utils.getDrawnDialogBox({}).innerRect.contentWidth - 12, 60).contentHeight).y = display.newRect(utils.getDrawnDialogBox({}), 0, 0, utils.getDrawnDialogBox({}).innerRect.contentWidth - 12, 60).x, display.newRect(utils.getDrawnDialogBox({}), 0, 0, utils.getDrawnDialogBox({}).innerRect.contentWidth - 12, 60).y
	local L23_199 = L23_199
	;({}).buttonText = "NEXT MATCH"
	;({}).onComplete = function()
		if _ENV.delete then
			storyboard.gotoScene("multiplayer.multiplayerSelectScene")
		else
			sound.playSound(sound.globalSounds.button)
			local L2_233 = L2_233
			if L7_183 then
				L7_183()
			end
		end
		L22_198.close()
	end
	local L24_200 = L24_200
	L22_198:insert((utils.getBasicButton({})))
	utils.getBasicButton({}).x = 0
	utils.getBasicButton({}).y = L22_198.innerRect.contentHeight / 2 - utils.getBasicButton({}).contentHeight / 2 - 6
	local L25_201 = L25_201
	local L26_202 = L26_202
	battleAvatar.buildUi(require("currentBattle").getAvatars()[1], 1, "left", false):scale(0.7, 0.7)
	local L27_203 = L27_203
	display.newGroup():insert((battleAvatar.buildUi(require("currentBattle").getAvatars()[1], 1, "left", false)))
	L22_198:insert((display.newGroup()))
	display.newGroup():setReferencePoint(display.BottomLeftReferencePoint)
	display.newGroup().x, display.newGroup().y = -L22_198.contentWidth / 2, L26_202.y - L26_202.contentHeight / 2 + 17
	if L5_181.winner == L19_195.id then
		battleAvatar.buildUi(require("currentBattle").getAvatars()[1], 1, "left", false):laughAnimation()
	else
		battleAvatar.buildUi(require("currentBattle").getAvatars()[1], 1, "left", false).wounded = true
		battleAvatar.buildUi(require("currentBattle").getAvatars()[1], 1, "left", false):shameAnimation()
		local L28_204 = L28_204
	end
	if L19_195.alias:len() > 10 then
	end
	local L29_205 = L29_205
	L22_198:insert((display.newGroup()))
	local L30_206 = L30_206
	local L31_207 = L31_207
	local L32_208 = L32_208
	display.newText(display.newGroup(), L19_195.alias:sub(1, 12) .. "...", 0, 0, utils.getFontForString(L19_195.alias:sub(1, 12) .. "...")).x, display.newText(display.newGroup(), L19_195.alias:sub(1, 12) .. "...", 0, 0, utils.getFontForString(L19_195.alias:sub(1, 12) .. "...")).y = 0, 0
	display.newText(display.newGroup(), L19_195.alias:sub(1, 12) .. "...", 0, 0, utils.getFontForString(L19_195.alias:sub(1, 12) .. "...")):setTextColor(LITTLE_GENERALS_BROWN_DARK())
	local L33_209 = L33_209
	display.newGroup():setReferencePoint(display.CenterLeftReferencePoint)
	display.newGroup().x = -L22_198.contentWidth / 2 + 20
	display.newGroup().y = L26_202.y
	if not L19_195.wins then
	end
	if L5_181.winner == L19_195.id and (not L9_185 or L14_190 and L17_193.id == L19_195.id) then
	end
	L19_195.finalWins = 0 + 1
	local L34_210 = L34_210
	L22_198:insert((L29_205(0 + 1)))
	L29_205(0 + 1):setReferencePoint(display.TopLeftReferencePoint)
	L29_205(0 + 1).x, L29_205(0 + 1).y = L27_203.x - L27_203.contentWidth / 2 + 3, L27_203.y - L27_203.contentHeight / 2 - 2
	local L35_211 = L35_211
	battleAvatar.buildUi(L30_206[2], 1, "right", false):scale(0.7, 0.7)
	local L36_212 = L36_212
	display.newGroup():insert((battleAvatar.buildUi(L30_206[2], 1, "right", false)))
	L22_198:insert((display.newGroup()))
	display.newGroup():setReferencePoint(display.BottomRightReferencePoint)
	display.newGroup().x, display.newGroup().y = L22_198.contentWidth / 2, L32_208.y
	if L5_181.winner == L20_196.id then
		battleAvatar.buildUi(L30_206[2], 1, "right", false):laughAnimation()
	else
		battleAvatar.buildUi(L30_206[2], 1, "right", false).wounded = true
		battleAvatar.buildUi(L30_206[2], 1, "right", false):shameAnimation()
		local L37_213 = L37_213
	end
	if L20_196.alias:len() > 10 then
	end
	local L38_214 = L38_214
	L22_198:insert((display.newGroup()))
	local L39_215 = L39_215
	local L40_216 = L40_216
	local L41_217 = L41_217
	display.newText(display.newGroup(), L20_196.alias:sub(1, 12) .. "...", 0, 0, utils.getFontForString(L20_196.alias:sub(1, 12) .. "...")).x, display.newText(display.newGroup(), L20_196.alias:sub(1, 12) .. "...", 0, 0, utils.getFontForString(L20_196.alias:sub(1, 12) .. "...")).y = 0, 0
	display.newText(display.newGroup(), L20_196.alias:sub(1, 12) .. "...", 0, 0, utils.getFontForString(L20_196.alias:sub(1, 12) .. "...")):setTextColor(LITTLE_GENERALS_BROWN_DARK())
	local L42_218 = L42_218
	display.newGroup():setReferencePoint(display.CenterRightReferencePoint)
	display.newGroup().x = L22_198.contentWidth / 2 - 20
	display.newGroup().y = L26_202.y
	if not L20_196.wins then
	end
	if L5_181.winner == L20_196.id and (not L9_185 or L14_190 and L17_193.id == L20_196.id) then
	end
	L20_196.finalWins = 0 + 1
	local L43_219 = L43_219
	L22_198:insert((L29_205(0 + 1)))
	local L44_220, L45_221 = L44_220, L45_221
	L29_205(0 + 1):setReferencePoint(display.TopRightReferencePoint)
	L29_205(0 + 1).x, L29_205(0 + 1).y = L27_203.x + L27_203.contentWidth / 2 - 3, L27_203.y - L27_203.contentHeight / 2 - 2
	if L14_190 then
		local L46_222 = L46_222
		local L47_223 = L47_223
		;({}).width = 100
		;({}).onComplete, ({}).buttonText = function(A0_234)
			local L1_235, L2_236, L3_237
			L1_235 = _ENV
			if L1_235 then
				return
			end
			L1_235 = nil
			L2_236 = nil
			L3_237 = nil
			if math.round(math.random(0, 1)) == 0 then
				L1_235 = L17_193
				L2_236 = require("trashTalk").WIN:random(1, true)
			else
				L1_235 = L18_194
				L2_236 = require("trashTalk").LOSS:random(1, true)
			end
			L2_236 = string.format("When asked for comment, %s replied: \"%s\"", L1_235.alias, L2_236)
			if L17_193.finalWins > L18_194.finalWins then
				if L17_193.finalWins == 1 or not "s" then
				end
				L3_237 = string.format("%s leads the series %d game%s to %d.", L17_193.alias, L17_193.finalWins, "", L18_194.finalWins)
			elseif L17_193.finalWins > L18_194.finalWins then
				if L18_194.finalWins == 1 or not "s" then
				end
				local L9_243 = string.format("%s leads the series %d game%s to %d.", L18_194.alias, L18_194.finalWins, "", L17_193.finalWins)
				repeat
					L3_237 = L9_243
					do break end -- pseudo-goto
					L9_243 = string
					L9_243 = L9_243.format
					L9_243 = L9_243("The series is tied at %d all", L18_194.finalWins)
					L3_237 = L9_243
				until true
			end
			L9_243 = print
			local L6_240 = L6_240
			local L7_241 = L7_241
			L9_243(L6_240, L7_241, L2_236, L3_237)
			local L8_242 = L8_242
			L9_243 = facebookSupport
			L9_243 = L9_243.init
			function L6_240(A0_244)
				local L1_245 = L1_245
				local L2_246 = L2_246
				local L5_249 = L5_249
				local L6_250 = L6_250
				local L6_250, L7_251 = L6_250("%s has defeated %s in a Little Generals Battle!", _ENV.alias, L18_194.alias), L7_251
				L5_249.name = L6_250
				L6_250 = utils
				L6_250 = L6_250.getExternalStoreLink
				L6_250 = L6_250()
				L5_249.link = L6_250
				L6_250 = L18_194
				L6_250 = L6_250.facebookId
				L5_249.to = L6_250
				L6_250 = L3_237
				L5_249.caption = L6_250
				L6_250 = L2_236
				L5_249.description = L6_250
				function L6_250(A0_252)
					if not A0_252.response then
						return
					end
					local L3_255 = string.find(A0_252.response, "post_id")
					if L3_255 then
						L3_255 = true
						_ENV = L3_255
						L3_255 = A0_234
						L3_255 = L3_255.parent
						L3_255 = L3_255.removeSelf
						L3_255(L3_255)
						L3_255 = utils
						L3_255 = L3_255.getDialog
						;({}).textLine1 = "Bragging Successful!"
						L3_255({})
						local L2_254 = L2_254
					end
				end
				L1_245(L2_246, L5_249, L6_250)
			end
			L9_243(L6_240)
		end, "BRAG"
		display.newGroup():insert((utils.getBasicButton({})))
		local L48_224 = L48_224
		do
			local L49_225 = L49_225
			local L50_226 = L50_226
			local L55_231 = L55_231
			utils.newButton(spritesheetmanager.getSpriteSet(UI_SPRITE_SHEET)):scale(0.5, 0.5)
			L55_231:insert((utils.newButton(spritesheetmanager.getSpriteSet(UI_SPRITE_SHEET))))
			utils.newButton(spritesheetmanager.getSpriteSet(UI_SPRITE_SHEET)).x, utils.newButton(spritesheetmanager.getSpriteSet(UI_SPRITE_SHEET)).y = utils.getBasicButton({}).contentWidth - 20, utils.getBasicButton({}).y
			L55_231:setReferencePoint(display.CenterRightReferencePoint)
			L55_231.x, L55_231.y = L22_198.contentWidth / 2 - 20, L22_198.titleBar.y
			L22_198:insert(L55_231)
			if not _ENV.isTutorialComplete("brag") then
				local L52_228 = L52_228
				timer.performWithDelay(1000, function()
					local L5_261 = _ENV.localToContent
					local L1_257 = L1_257
					L5_261, L1_257 = L5_261(L1_257, 0, 0)
					local L2_258 = L2_258
					;({}).id = "brag"
					;({}).x = L5_261 - _ENV.contentWidth / 2
					;({}).y = L1_257
					;({}).rotation = -45
					L2_258 = L2_258({})
					local L3_259 = L3_259
					local L4_260 = L4_260
					L3_259(L4_260, function()
						_ENV:complete()
						local L1_262 = L1_262
					end)
				end)
			end
			function L49_225()
				L3_266 = _ENV
				L2_265 = _ENV.stopAnimation
				L2_265(L3_266)
				L2_265 = L40_216
				L3_266 = L2_265
				L2_265 = L2_265.stopAnimation
				L2_265(L3_266)
				L2_265 = L6_182
				if L2_265 then
					L2_265 = spritesheetmanager
					L2_265 = L2_265.disposeSpriteSet
					L3_266 = "res/ui/whiteflag.png"
					L2_265(L3_266)
				end
				L2_265 = L22_198
				L2_265 = L2_265.napalms
				if L2_265 then
					L2_265 = pairs
					L3_266 = L22_198
					L3_266 = L3_266.napalms
					L2_265, L3_266, L4_267 = L2_265(L3_266)
					for _FORV_3_, _FORV_4_ in L2_265, L3_266, L4_267 do
						_FORV_4_.destroy()
						L22_198.napalms[_FORV_3_] = nil
					end
					L2_265 = L22_198
					L2_265.napalms = nil
				end
			end
			L22_198.preRemoveFunction = L49_225
		end
	end
end
function L5_5.getSetupBattleDialog(A0_269)
	local L1_270, L2_271, L3_272, L4_273, L5_274, L6_275, L7_276, L8_277, L9_278, L10_279
	local L13_282 = L13_282
	if not A0_269 then
		L1_270 = {}
		A0_269 = L1_270
	end
	L1_270 = A0_269.challenge
	L2_271 = A0_269.title
	L3_272 = A0_269.closable
	L4_273 = A0_269.onComplete
	L5_274 = A0_269.postOnComplete
	L6_275 = A0_269.readOnlyMatchType
	if not L6_275 then
		L6_275 = false
	end
	L7_276 = A0_269.readOnlyLabel
	L8_277 = A0_269.allowDecline
	if not L8_277 then
		L8_277 = false
	end
	L9_278 = A0_269.onDecline
	L10_279 = A0_269.recordMatchStart
	if not L10_279 then
		L10_279 = false
	end
	L13_282 = spritesheetmanager
	L13_282 = L13_282.getSpriteSet
	local L13_282, L12_281 = L13_282(UI_SPRITE_SHEET)
	local L14_283 = L14_283
	if _ENV.self(L1_270) and _ENV.self(L1_270).tank then
		L14_283.selectedTankId = _ENV.self(L1_270).tank.id
	end
	local L15_284 = L15_284
	;({}).title = L2_271
	;({}).readOnly = L6_275
	;({}).readOnlyLabel = L7_276
	;({}).matchTypeId = L1_270.parameters.matchTypeId
	;({}).healthTypeId = L1_270.parameters.healthTypeId
	;({}).windTypeId = L1_270.parameters.windTypeId
	;({}).selectedTankId = L14_283.selectedTankId
	;({}).closable = L3_272
	local L16_285 = L16_285
	;({}).buttonText = "ACCEPT"
	;({}).onComplete = function()
		local L3_292, L4_293, L5_294 = sound.playSound, L4_293, L5_294
		L4_293 = sound
		L4_293 = L4_293.globalSounds
		L4_293 = L4_293.button
		L3_292(L4_293)
		L3_292 = _ENV
		L3_292 = L3_292.delete
		if L3_292 then
			L4_293 = storyboard
			L4_293 = L4_293.gotoScene
			L5_294 = "multiplayer.multiplayerSelectScene"
			L4_293(L5_294)
			L4_293 = L16_285
			L4_293 = L4_293.close
			L4_293()
			return
		end
		L4_293 = L16_285
		L4_293 = L4_293.tankChooser
		L4_293 = L4_293.selectedTankId
		L5_294 = L8_8
		L5_294 = L5_294.availableTypes
		L5_294 = L5_294[L16_285.matchTypeChooser.selectedIndex]
		if ALLOW_WIND.MULTIPLAYER then
			local L6_295 = L6_295
		end
		if not readOnly and not _ENV.parameters.prevMatch then
			_ENV.parameters.prevMatch = {}
			_ENV.parameters.prevMatch.matchTypeId = _ENV.parameters.matchTypeId
			_ENV.parameters.prevMatch.healthTypeId = _ENV.parameters.healthTypeId
			_ENV.parameters.prevMatch.windTypeId = _ENV.parameters.windTypeId
			_ENV.parameters.prevMatch.windVal = _ENV.parameters.windVal
		end
		_ENV.parameters.matchTypeId = L5_294
		_ENV.parameters.healthTypeId = L6_295
		_ENV.parameters.availableWeapons = L8_8[L5_294].weapons
		_ENV.parameters.windTypeId = L12_12.availableTypes[L16_285.matchWindChooser.selectedIndex]
		_ENV.parameters.windVal = L12_12[L12_12.availableTypes[L16_285.matchWindChooser.selectedIndex]].wind()
		if not L4_273 then
		end
		if L10_279 then
			local L10_299 = L10_299
			utils.logEvent("MP Battle - " .. L15_15(L5_294))
			utils.logEvent("MP Battle")
			local L9_298 = L9_298
		end
		L16_285.close(function()
			_ENV(L1_290)
			local L1_300 = L1_300
			L1_300 = L5_274
			if L1_300 then
				L1_300 = L5_274
				L1_300()
			end
		end)
	end
	L16_285:insert((utils.getBasicButton({})))
	utils.getBasicButton({}).x = 0
	utils.getBasicButton({}).y = L16_285.innerRect.contentHeight / 2 - utils.getBasicButton({}).contentHeight / 2 - 20
	if L8_277 then
		utils.getBasicButton({}).x = 100
		;({}).buttonText = "DECLINE"
		;({}).onComplete = function()
			repeat
				if require("multiplayer.dataServer").testConnection() then
					sound.playSound(sound.globalSounds.button)
					local L1_301 = L1_301
					L1_301(L1_270, true)
					local L2_302 = L2_302
					L1_301 = L16_285
					L1_301 = L1_301.close
					L1_301()
					L1_301 = L9_278
					if not L1_301 then
						goto lbl_31
					end
					L1_301 = L9_278
					L1_301()
					break -- pseudo-goto
				end
				L1_301 = utils
				L1_301 = L1_301.displayNoNetworkConnection
				L1_301()
			until true
			::lbl_31::
		end
		local L17_286, L18_287 = L17_286, L18_287
		L18_287(L16_285, (utils.getBasicButton({})))
		local L19_288 = L19_288
		L17_286.x = -100
		L18_287 = L16_285.innerRect
		L18_287 = L18_287.contentHeight
		L18_287 = L18_287 / 2
		L19_288 = L17_286.contentHeight
		L19_288 = L19_288 / 2
		L18_287 = L18_287 - L19_288
		L18_287 = L18_287 - 20
		L17_286.y = L18_287
	end
end
function L5_5.getProposeBattleDialogBox(A0_303)
	local L1_304, L2_305, L3_306, L4_307, L5_308, L6_309
	L1_304 = A0_303.friendData
	if not L1_304 then
		L1_304 = nil
	end
	L2_305 = A0_303.challengeIssuedCallback
	if not L2_305 then
		L2_305 = nil
	end
	L3_306 = A0_303.matchFoundCallback
	if not L3_306 then
		L3_306 = nil
	end
	L4_307 = A0_303.challengeFailedCallback
	if not L4_307 then
		L4_307 = nil
	end
	L5_308 = A0_303.onChallengePress
	if not L5_308 then
		L5_308 = nil
	end
	L6_309 = A0_303.onCancelPress
	if not L6_309 then
		L6_309 = nil
	end
	local L7_310 = L7_310
	L7_310 = L7_310("multiplayer.match")
	local L8_311 = L8_311
	local L8_311, L9_312 = L8_311(UI_SPRITE_SHEET)
	local L10_313 = L10_313
	;({}).title = "NEW MATCH"
	;({}).readOnly = readOnlyMatchType
	;({}).readOnlyLabel = readOnlyLabel
	;({}).matchTypeId = nil
	;({}).healthTypeId = nil
	;({}).windTypeId = nil
	;({}).selectedTankId = A0_303.selectedTankId
	L10_313 = L10_313({})
	local L11_314 = L11_314
	;({}).buttonText = "CHALLENGE"
	;({}).onComplete = function()
		local L2_320, L3_321, L4_322, L5_323, L8_326 = sound.playSound, L3_321, L4_322, L5_323, L8_326
		L3_321 = sound
		L3_321 = L3_321.globalSounds
		L3_321 = L3_321.button
		L2_320(L3_321)
		L2_320 = _ENV
		if L2_320 then
			L2_320 = _ENV
			L2_320()
		end
		L2_320 = L10_313
		L2_320 = L2_320.tankChooser
		L2_320 = L2_320.selectedTankId
		L3_321 = L8_8
		L3_321 = L3_321.availableTypes
		L4_322 = L10_313
		L4_322 = L4_322.matchTypeChooser
		L4_322 = L4_322.selectedIndex
		L3_321 = L3_321[L4_322]
		L4_322 = L8_8
		L4_322 = L4_322[L3_321]
		L4_322 = L4_322.weapons
		L5_323 = L10_10
		L5_323 = L5_323.availableTypes
		L8_326 = L10_313
		L8_326 = L8_326.matchHealthChooser
		L8_326 = L8_326.selectedIndex
		L5_323 = L5_323[L8_326]
		L8_326 = nil
		if ALLOW_WIND.MULTIPLAYER then
			L8_326 = L12_12.availableTypes[L10_313.matchWindChooser.selectedIndex]
		end
		local L7_325 = L7_325
		L10_313.close(function()
			if require("multiplayer.dataServer").testConnection() then
				if _ENV then
					({}).friendData = _ENV
					;({}).tankData, ({}).id = {}, L0_318
					;({}).matchType = L7_310.FO_REAL
					;({}).matchTypeId = L3_321
					;({}).availableWeapons = L4_322
					;({}).healthTypeId = L5_323
					;({}).windTypeId = L6_324
					;({}).matchParameters, ({}).windVal = {}, L7_325
					;({}).callback = function(A0_330)
						_ENV(A0_330)
						local L2_331 = L2_331
					end
					;({}).authorative = _ENV.gamecenterId ~= nil or utils.isCorona()
					L7_310.challenge({})
				else
					repeat
						({}).matchType = L7_310.FO_REAL
						;({}).tankData, ({}).id = {}, L0_318
						;({}).matchTypeId = L3_321
						;({}).availableWeapons = L4_322
						;({}).healthTypeId = L5_323
						;({}).windTypeId = L6_324
						;({}).matchParameters, ({}).windVal = {}, L7_325
						;({}).callback = function(A0_332)
							_ENV(A0_332)
							local L2_333 = L2_333
						end
						local L1_328 = L1_328
						L7_310.broadcastChallenge({})
						local L2_329 = L2_329
						do break end -- pseudo-goto
						L1_328 = utils
						L1_328 = L1_328.displayNoNetworkConnection
						L1_328()
					until true
				end
			end
		end)
	end
	L11_314 = L11_314({})
	local L12_315, L13_316 = L12_315, L13_316
	L12_315(L13_316, L11_314)
	local L14_317 = L14_317
	L11_314.x = 0
	L12_315 = L10_313.innerRect
	L12_315 = L12_315.contentHeight
	L12_315 = L12_315 / 2
	L13_316 = L11_314.contentHeight
	L13_316 = L13_316 / 2
	L12_315 = L12_315 - L13_316
	L12_315 = L12_315 - 20
	L11_314.y = L12_315
end
return L5_5
