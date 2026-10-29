-- Decompiled & AI-Repaired from weapons.sandwedge.lu
-- Source disassembly preserved at: disasm/weapons.sandwedge.disasm

local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10
function L0_0(A0_19, A1_20)
	local L2_21, L3_22, L4_23, L5_24, L6_25
	L2_21 = 125
	L3_22 = A1_20 / L2_21
	L4_23 = A0_19 * L3_22
	L5_24 = L4_23
	L6_25 = L3_22
	return L5_24, L6_25
end
function L1_1(A0_26, A1_27)
	local L2_28 = L2_28
	local L3_29 = L3_29
	local L2_28, L3_29, L4_30 = L2_28(L3_29, A1_27)
	L4_30 = {}
	local L5_31 = L5_31
	local L6_32 = L6_32
	local L7_33 = L7_33
	local L8_34 = L8_34
	L4_30[1] = L5_31
	L4_30[2] = L6_32
	L4_30[3] = L7_33
	L4_30[4] = L8_34
	local L4_30[5], L9_35 = 30 / L3_29, L9_35
	L5_31 = L4_30
	L6_32 = L2_28
	return L5_31, L6_32
end
function L2_2(A0_36, A1_37, A2_38, A3_39)
	local L4_40 = L4_40
	local L5_41 = L5_41
	local L4_40, L5_41, L6_42 = L4_40(L5_41, A3_39)
	if A0_36 < L4_40 then
		L6_42 = true
		return L6_42
	end
	L6_42 = false
	return L6_42
end
function L3_3(A0_43, A1_44)
	local L2_45, L3_46, L4_47, L5_48
	L2_45 = A0_43.player
	local L3_46, L15_58 = A0_43.x, L15_58
	L4_47 = A0_43.y
	L5_48 = {}
	L15_58 = {}
	L15_58.x = L3_46
	L15_58.y = L4_47
	L5_48[1] = L15_58
	L15_58 = _ENV
	local L7_50 = L7_50
	L15_58, L7_50 = L15_58(L7_50, A0_43.power)
	_FOR_ = 1
	for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
		L3_46, L4_47 = utils.getXYfromVector(L2_45.rotation + A0_43.angle + L15_58[_FORV_11_], L7_50)
		L3_46, L4_47 = L3_46 + L5_48[1].x, L4_47 + L5_48[1].y
		;({}).x = L3_46
		;({}).y = L4_47
		table.insert(L5_48, {})
	end
	A0_43.bombSprite.currentFrame = 5
	local L8_51 = L8_51
	local L9_52 = L9_52
	L8_51 = L8_51(L9_52, L5_48[2].y, L5_48[#L5_48 - 1].x, L5_48[#L5_48 - 1].y)
	L9_52 = A0_43.width
	L9_52 = L8_51 / L9_52
	A0_43.bombSprite.currentFrame = 1
	local L10_53 = L10_53
	local L11_54 = L11_54
	L10_53, L11_54 = L10_53(L11_54, L7_50 - 40 * L9_52)
	L10_53, L11_54 = L10_53 + L5_48[1].x, L11_54 + L5_48[1].y
	local L12_55 = L12_55
	local L13_56 = L13_56
	;({}).time = 300
	;({}).xScale = L9_52
	;({}).yScale = L9_52
	;({}).alpha = 0.5
	;({}).x = L10_53
	;({}).y = L11_54
	;({}).onComplete = function()
		if _ENV then
			display.remove(A0_43)
			local L1_59 = L1_59
		end
	end
	L12_55(L13_56, {})
	local L14_57 = L14_57
end
sandWedgeVisuals = L3_3
function L3_3(A0_60)
	local L1_61, L4_64, L9_69, L10_70, L11_71 = L1_61, weaponTypes, L9_69, L10_70, L11_71
	L9_69 = weaponTypes
	L9_69 = L9_69.SAND_WEDGE
	L4_64 = L4_64[L9_69]
	L4_64 = L4_64.blastRadius
	L9_69 = A0_60.power
	L1_61, L4_64 = L1_61(L4_64, L9_69)
	L9_69 = 80
	L10_70 = A0_60.power
	L11_71 = Tank
	L11_71 = L11_71.MIN_POWER
	L10_70 = L10_70 - L11_71
	L11_71 = Tank
	L11_71 = L11_71.MAX_POWER
	L11_71 = L11_71 - Tank.MIN_POWER
	L10_70 = L10_70 / L11_71
	L11_71 = A0_60.getPointOnCannonPath
	local L11_71, L7_67 = L11_71(A0_60, 20 - L9_69 * (1 - L10_70))
	;({}).x = L11_71
	;({}).y = L7_67
	local ({})[1], L8_68 = {}, L8_68
	_FOR_ = 1
	for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
		L11_71, L7_67 = utils.getXYfromVector(A0_60.rotation + A0_60.angle + L1_61[_FORV_11_], L4_64)
		L11_71, L7_67 = L11_71 + L8_68[1].x, L7_67 + L8_68[1].y
		;({}).x = L11_71
		;({}).y = L7_67
		table.insert(L8_68, {})
	end
	return L8_68
end
function L4_4(A0_75, A1_76)
	local L2_77 = L2_77
	L2_77(A0_75.player)
	L2_77 = A0_75.player
	local L3_78 = L3_78
	local L4_79 = L4_79
	L3_78, L4_79 = L3_78(L4_79, L2_77.power)
	local L5_80 = L5_80
	L5_80 = L5_80(L2_77)
	A0_75.bombSprite.currentFrame = 5
	local L6_81 = L6_81
	local L7_82 = L7_82
	L6_81 = L6_81(L7_82, L5_80[2].y, L5_80[#L5_80 - 1].x, L5_80[#L5_80 - 1].y)
	L7_82 = A0_75.width
	L7_82 = L6_81 / L7_82
	A0_75.bombSprite.currentFrame = 1
	local L8_83 = L8_83
	local L9_84 = L9_84
	L8_83, L9_84 = L8_83(L9_84, L4_79 - 40 * L7_82)
	L8_83, L9_84 = L8_83 + L5_80[1].x, L9_84 + L5_80[1].y
	local L10_85 = L10_85
	;({}).time = 300
	;({}).xScale = L7_82
	;({}).yScale = L7_82
	;({}).alpha = 0.5
	;({}).x = L8_83
	;({}).y = L9_84
	;({}).onComplete = function()
		display.remove(_ENV)
		local L1_97 = L1_97
	end
	L10_85(A0_75, {})
	L10_85 = nil
	local L11_86 = L11_86
	L11_86 = L11_86(EXPLOSIONS, L8_83, L9_84, L4_79)
	L11_86.alpha = 0
	if false then
		L11_86.alpha = 0.5
		L10_85 = display.newLine(EXPLOSIONS, L5_80[1].x, L5_80[1].y, L5_80[2].x, L5_80[2].y)
		L10_85:setColor(255, 0, 0)
		L10_85.width = 10
		L10_85.alpha = 0.5
		_FOR_ = 1
		for _FORV_15_ = _FOR_, _FOR_, _FOR_ do
			L10_85:append(L5_80[_FORV_15_].x, L5_80[_FORV_15_].y)
		end
		local L12_87 = L12_87
		L12_87(L10_85, L5_80[1].x, L5_80[1].y)
	end
	L12_87 = {}
	_FOR_ = 1
	for _FORV_16_ = _FOR_, _FOR_, _FOR_ do
		table.insert(L12_87, L5_80[_FORV_16_].x)
		table.insert(L12_87, L5_80[_FORV_16_].y)
	end
	table.insert(L12_87, L5_80[1].x)
	table.insert(L12_87, L5_80[1].y)
	local L15_90 = L15_90
	local L16_91 = L16_91
	local L17_92 = L17_92
	local L18_93 = L18_93
	local L19_94 = L19_94
	local L20_95 = L20_95
	L15_90(L16_91, L17_92, L18_93, L19_94, L20_95, false, tostring(A0_75), A0_75.weaponType)
	local L21_96 = L21_96
	L15_90 = timer
	L15_90 = L15_90.performWithDelay
	L16_91 = 2000
	function L17_92(A0_98)
		display.remove(_ENV)
		display.remove(L11_86)
		local L2_99 = L2_99
		L2_99 = playerTurnEnd
		L2_99()
	end
	L15_90 = L15_90(L16_91, L17_92)
end
function L5_5(A0_100, A1_101, A2_102)
	local L3_103 = L3_103
	L3_103 = L3_103(A0_100)
	local L4_104 = display.newGroup()
	BEHIND_TANK:insert(L4_104)
	local L5_105 = L5_105
	L5_105 = L5_105(L4_104, L3_103[1].x, L3_103[1].y, L3_103[2].x, L3_103[2].y)
	L5_105:setColor(255, 0, 0)
	L5_105.width = 10
	L5_105.alpha = 0.25
	_FOR_ = 1
	for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
		L5_105:append(L3_103[_FORV_9_].x, L3_103[_FORV_9_].y)
	end
	L11_111 = L5_105
	L10_110 = L5_105.append
	L12_112 = L3_103[1]
	L12_112 = L12_112.x
	L13_113 = L3_103[1]
	L13_113 = L13_113.y
	L10_110(L11_111, L12_112, L13_113)
	return L4_104
end
L6_6 = weaponTypes
L7_7 = weaponTypes
L7_7 = L7_7.SAND_WEDGE
L8_8 = {}
L8_8.name = "Sand Wedge"
L8_8.pluralName = "Sand Wedges"
L8_8.listImage = "sandwedge"
L9_9 = weaponBalance
L10_10 = weaponTypes
L10_10 = L10_10.SAND_WEDGE
L9_9 = L9_9[L10_10]
L9_9 = L9_9.damage
L8_8.damage = L9_9
L9_9 = weaponBalance
L10_10 = weaponTypes
L10_10 = L10_10.SAND_WEDGE
L9_9 = L9_9[L10_10]
L9_9 = L9_9.blastRadius
L8_8.blastRadius = L9_9
L9_9 = weaponBalance
L10_10 = weaponTypes
L10_10 = L10_10.SAND_WEDGE
L9_9 = L9_9[L10_10]
L9_9 = L9_9.forceRadius
L8_8.forceRadius = L9_9
L9_9 = weaponBalance
L10_10 = weaponTypes
L10_10 = L10_10.SAND_WEDGE
L9_9 = L9_9[L10_10]
L9_9 = L9_9.blastForce
L8_8.blastForce = L9_9
L9_9 = weaponBalance
L10_10 = weaponTypes
L10_10 = L10_10.SAND_WEDGE
L9_9 = L9_9[L10_10]
L9_9 = L9_9.cost
L8_8.cost = L9_9


-- [End of decompiled block; see disassembly for inner stripped closures]
