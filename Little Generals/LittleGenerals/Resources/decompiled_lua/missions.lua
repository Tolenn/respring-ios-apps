local L0_0, L1_1
L0_0 = {}
local L0_0.MAX_ACTIVE_MISSIONS, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28 = 3, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28
L1_1 = {}
L0_0.missions = L1_1
L1_1 = {}
L1_1.RUBE_GOLDBERG = 1
L1_1.AIR_DEFENSE = 2
L1_1.NO_FLY_ZONE = 3
L1_1.CLEAR_SKIES = 4
L1_1.GOLD_DIGGER = 5
L1_1.PROSPECTOR = 6
L1_1.AURUM_MAXIMUS = 7
L1_1.BLING_BLING = 8
L1_1.ICE_ICE_BABY = 9
L1_1.TEXAS_TEA = 10
L1_1.INCOMMUNICADO = 11
L1_1.DEMOLITIONS_CREW = 12
L1_1.TRADE_UP = 13
L1_1.HUNKER_DOWN = 14
L1_1.SUNDAY_DRIVE = 15
L1_1.YOU_MEAN_NOTHING = 16
L1_1.BULLS_EYE = 17
L1_1.MOMENTUM = 18
L1_1.RAMPAGE = 19
L1_1.BACKBOARD = 20
L1_1.GOING_POSTAL = 21
L1_1.UNSTOPPABLE = 22
L1_1.CROWN_JEWELS = 23
L1_1.GO_GREEN = 24
L1_1.GREEN_WITH_ENVY = 25
L1_1.GREEN_MONSTER = 26
L1_1.RED_ALERT = 27
L1_1.RED_SHIFT = 28
L1_1.SEEING_RED = 29
L1_1.TOXIC_AVENGER = 30
L0_0.ids = L1_1
L1_1 = {}
L0_0.activeMissions = L1_1
L1_1 = {}
L0_0.stats = L1_1
L1_1 = L0_0.ids
L23_23 = {}
L24_24 = {}
L25_25 = L1_1.AIR_DEFENSE
L26_26 = L1_1.NO_FLY_ZONE
L24_24[1] = L25_25
L24_24[2] = L26_26
L25_25 = {}
L26_26 = L1_1.CLEAR_SKIES
L25_25[1] = L26_26
L26_26 = {}
L27_27 = L1_1.GOLD_DIGGER
L28_28 = L1_1.PROSPECTOR
L26_26[1] = L27_27
L26_26[2] = L28_28
L26_26[3] = L1_1.AURUM_MAXIMUS
L27_27 = {}
L28_28 = L1_1.BLING_BLING
L27_27[1] = L28_28
L27_27[2] = L1_1.ICE_ICE_BABY
L27_27[3] = L1_1.CROWN_JEWELS
L28_28 = {}
L28_28[1] = L1_1.GO_GREEN
L28_28[2] = L1_1.GREEN_WITH_ENVY
L28_28[3] = L1_1.GREEN_MONSTER
;({})[1] = L1_1.RED_ALERT
;({})[2] = L1_1.RED_SHIFT
;({})[3] = L1_1.SEEING_RED
;({})[1] = L1_1.TEXAS_TEA
;({})[1] = L1_1.TOXIC_AVENGER
;({})[1] = L1_1.INCOMMUNICADO
;({})[1] = L1_1.DEMOLITIONS_CREW
;({})[1] = L1_1.GOING_POSTAL
;({})[1] = L1_1.TRADE_UP
local L15_15 = L15_15
;({})[1] = L1_1.HUNKER_DOWN
local L16_16 = L16_16
;({})[1] = L1_1.SUNDAY_DRIVE
local L17_17 = L17_17
;({})[1] = L1_1.YOU_MEAN_NOTHING
local L18_18 = L18_18
;({})[1] = L1_1.BULLS_EYE
local L19_19 = L19_19
local L20_20 = L20_20
local L21_21 = L21_21
;({})[1] = L1_1.MOMENTUM
;({})[2] = L1_1.RAMPAGE
local ({})[3], L22_22 = L1_1.UNSTOPPABLE, L22_22
L23_23[1] = L24_24
L23_23[2] = L25_25
L23_23[3] = L26_26
L23_23[4] = L27_27
L23_23[5] = L28_28
L23_23[6] = L15_15
L23_23[7] = L16_16
L23_23[8] = L17_17
L23_23[9] = L18_18
L23_23[10] = L19_19
L23_23[11] = L20_20
L23_23[12] = L21_21
L23_23[13] = L22_22
L23_23[14] = {}
L23_23[15] = {}
L23_23[16] = {}
L23_23[17] = {}
L0_0.immutableAvailable = L23_23
L23_23 = utils
L23_23 = L23_23.deepcopy
L24_24 = L0_0.immutableAvailable
L23_23 = L23_23(L24_24)
L0_0.availableMissions = L23_23
function L23_23(A0_29)
	local L1_30 = display.newGroup()
	if A0_29.iconBase then
		display.newImageRect(L1_30, A0_29.iconBase, 100, 100).x, display.newImageRect(L1_30, A0_29.iconBase, 100, 100).y = 0, 0
	end
	local L2_31 = L2_31
	L2_31 = L2_31(L1_30, A0_29.icon, 100, 100)
	L2_31.x, L2_31.y = 0, 0
	local L3_32 = L3_32
	L3_32 = L3_32 .. tostring(A0_29.difficulty) .. "_star.png"
	local L4_33 = L4_33
	local L5_34 = L5_34
	local L6_35 = L6_35
	local L7_36 = L7_36
	local L4_33, L8_37 = L4_33(L5_34, L6_35, L7_36, 100), L8_37
	L3_32 = L4_33
	L4_33 = 0
	L3_32.y = 0
	L3_32.x = L4_33
	return L1_30
end
L0_0.getMissionIcon = L23_23
function L24_24(A0_38, A1_39)
	local L2_40
	L2_40 = {}
	L2_40.id = A1_39.id
	L2_40.name = A1_39.name
	if not A1_39.description then
	end
	L2_40.desc = "default description"
	if not A1_39.description2 then
	end
	L2_40.desc2 = nil
	if not A1_39.completed then
	end
	L2_40.completed = false
	L2_40.icon = "res/missions/icons/" .. A1_39.icon
	if A1_39.iconBase then
		local L3_41 = L3_41
		L3_41 = L3_41 .. A1_39.iconBase
		L2_40.iconBase = L3_41
	end
	L3_41 = A1_39.difficulty
	if not L3_41 then
		L3_41 = 1
	end
	L2_40.difficulty = L3_41
	L3_41 = A1_39.getRemainder
	L2_40.getRemainder = L3_41
	L3_41 = A1_39.onActivate
	L2_40.onActivate = L3_41
	L3_41 = A1_39.onBattleStart
	L2_40.onBattleStart = L3_41
	L3_41 = A1_39.statCallback
	L2_40.statCallback = L3_41
	L3_41 = A1_39.isMissionParamsMet
	L2_40.isMissionParamsMet = L3_41
	L3_41 = A1_39.requiresWinToCount
	L2_40.requiresWinToCount = L3_41
	L3_41 = A0_38.missions
	local L4_42 = L4_42
	local L4_42, L5_43 = L4_42(L2_40.id), L5_43
	L3_41[L4_42] = L2_40
	return L2_40
end
L0_0.newMission = L24_24
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.RUBE_GOLDBERG
L27_27.id = L28_28
L27_27.name = "Rube Goldberg"
L27_27.iconBase = "air/missionicon02.png"
L27_27.icon = "air/rubegoldberg.png"
L27_27.difficulty = 3
L27_27.description = "Hit a zeppelin, which hits a zeppelin, which hits"
L27_27.description2 = "the enemy."
L28_28 = {}
L15_15 = "rubeGoldberg"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_44)
	local L3_45 = L3_45
	local L4_46 = L4_46
	L3_45(L4_46, "rubeGoldberg", 0, true)
	local L5_47 = L5_47
end
L27_27.onBattleStart = L28_28
function L28_28(A0_48)
	local L1_49, L2_50 = L1_49, L2_50
	local L1_49, L3_51 = L1_49(L2_50, "rubeGoldberg"), L3_51
	if L1_49 and 2 <= L1_49 then
		L2_50 = true
		return L2_50
	end
	L2_50 = false
	return L2_50
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.AIR_DEFENSE
L27_27.id = L28_28
L27_27.name = "Air Defense"
L27_27.iconBase = "air/missionicon02.png"
L27_27.icon = "air/airdefense.png"
L27_27.difficulty = 2
L27_27.description = "Destroy 2 jets in a single match."
L28_28 = {}
L15_15 = "matchJets"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_52, A1_53, A2_54)
	if A1_53 == "matchJets" then
		local L5_57 = A0_52:getStat("matchJets")
		if L5_57 < 2 then
			L5_57 = A0_52.playDingSoundOnce
			L5_57(A0_52)
			if 2 <= A2_54 then
				L5_57 = A0_52.alert
				L5_57(A0_52)
				local L4_56 = L4_56
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_58)
	local L3_59 = L3_59
	local L4_60 = L4_60
	L3_59(L4_60, "matchJets", 0, true)
	local L5_61 = L5_61
end
L27_27.onBattleStart = L28_28
function L28_28(A0_62)
	local L1_63, L2_64 = L1_63, L2_64
	local L1_63, L3_65 = L1_63(L2_64, "matchJets"), L3_65
	if L1_63 and 2 <= L1_63 then
		L2_64 = true
		return L2_64
	end
	L2_64 = false
	return L2_64
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.NO_FLY_ZONE
L27_27.id = L28_28
L27_27.name = "No Fly Zone"
L27_27.iconBase = "air/missionicon02.png"
L27_27.icon = "air/noflyzone.png"
L27_27.difficulty = 3
L27_27.description = "Destroy any 5 aircraft in a single match."
L28_28 = {}
L15_15 = "matchAircraft"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_66, A1_67, A2_68)
	if A1_67 == "matchAircraft" then
		local L5_71 = L5_71
		local L5_71, L6_72 = L5_71(A0_66, A1_67, 0), L6_72
		if L5_71 < 5 then
			L6_72 = A0_66
			L5_71 = A0_66.playDingSoundOnce
			L5_71(L6_72)
			if 5 <= A2_68 then
				L6_72 = A0_66
				L5_71 = A0_66.alert
				L5_71(L6_72)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_73)
	local L3_74 = L3_74
	local L4_75 = L4_75
	L3_74(L4_75, "matchAircraft", 0, true)
	local L5_76 = L5_76
end
L27_27.onBattleStart = L28_28
function L28_28(A0_77)
	local L1_78, L2_79 = L1_78, L2_79
	local L1_78, L3_80 = L1_78(L2_79, "matchAircraft"), L3_80
	if L1_78 and 5 <= L1_78 then
		L2_79 = true
		return L2_79
	end
	L2_79 = false
	return L2_79
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.CLEAR_SKIES
L27_27.id = L28_28
L27_27.name = "Clear Skies"
L27_27.iconBase = "air/missionicon02.png"
L27_27.icon = "air/clearskies.png"
L27_27.difficulty = 3
L27_27.description = "Destroy 20 aircraft across matches."
L28_28 = {}
L15_15 = "totalAircraft"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_81, A1_82, A2_83)
	if A1_82 == "totalAircraft" then
		local L5_86 = L5_86
		local L5_86, L6_87 = L5_86(A0_81, A1_82, 0), L6_87
		if L5_86 < 20 then
			L6_87 = A0_81
			L5_86 = A0_81.playDingSoundOnce
			L5_86(L6_87)
			if 20 <= A2_83 then
				L6_87 = A0_81
				L5_86 = A0_81.alert
				L5_86(L6_87)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_88)
	local L3_89 = L3_89
	local L4_90 = L4_90
	L3_89(L4_90, "totalAircraft", 0, true)
	local L5_91 = L5_91
end
L27_27.onActivate = L28_28
function L28_28(A0_92)
	local L3_93 = L3_93
	do return L3_93(A0_92, "totalAircraft", 20) end
	local L4_94 = L4_94
end
L27_27.getRemainder = L28_28
function L28_28(A0_95)
	local L1_96, L2_97 = L1_96, L2_97
	local L1_96, L3_98 = L1_96(L2_97, "totalAircraft"), L3_98
	if L1_96 and 20 <= L1_96 then
		L2_97 = true
		return L2_97
	end
	L2_97 = false
	return L2_97
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.GOLD_DIGGER
L27_27.id = L28_28
L27_27.name = "Gold Digger"
L27_27.icon = "resources/resourcesgold.png"
L27_27.difficulty = 1
L27_27.description = "Mine 600 gold in a match."
L28_28 = {}
L15_15 = "goldMined"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_99, A1_100, A2_101)
	if A1_100 == "goldMined" then
		local L5_104 = L5_104
		local L5_104, L6_105 = L5_104(A0_99, A1_100, 0), L6_105
		if L5_104 < 600 then
			L6_105 = A0_99
			L5_104 = A0_99.playDingSoundOnce
			L5_104(L6_105)
			if 600 <= A2_101 then
				L6_105 = A0_99
				L5_104 = A0_99.alert
				L5_104(L6_105)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_106)
	local L3_107 = L3_107
	local L4_108 = L4_108
	L3_107(L4_108, "goldMined", 0, true)
	local L5_109 = L5_109
end
L27_27.onBattleStart = L28_28
function L28_28(A0_110)
	local L1_111, L2_112 = L1_111, L2_112
	local L1_111, L3_113 = L1_111(L2_112, "goldMined"), L3_113
	if L1_111 and 600 <= L1_111 then
		L2_112 = true
		return L2_112
	end
	L2_112 = false
	return L2_112
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.PROSPECTOR
L27_27.id = L28_28
L27_27.name = "Prospector"
L27_27.icon = "resources/resourcesgold.png"
L27_27.difficulty = 2
L27_27.description = "Mine 800 gold in a match."
L28_28 = {}
L15_15 = "goldMined"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_114, A1_115, A2_116)
	if A1_115 == "goldMined" then
		local L5_119 = L5_119
		local L5_119, L6_120 = L5_119(A0_114, A1_115, 0), L6_120
		if L5_119 < 800 then
			L6_120 = A0_114
			L5_119 = A0_114.playDingSoundOnce
			L5_119(L6_120)
			if 800 <= A2_116 then
				L6_120 = A0_114
				L5_119 = A0_114.alert
				L5_119(L6_120)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_121)
	local L3_122 = L3_122
	local L4_123 = L4_123
	L3_122(L4_123, "goldMined", 0, true)
	local L5_124 = L5_124
end
L27_27.onBattleStart = L28_28
function L28_28(A0_125)
	local L1_126, L2_127 = L1_126, L2_127
	local L1_126, L3_128 = L1_126(L2_127, "goldMined"), L3_128
	if L1_126 and 800 <= L1_126 then
		L2_127 = true
		return L2_127
	end
	L2_127 = false
	return L2_127
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.AURUM_MAXIMUS
L27_27.id = L28_28
L27_27.name = "Aurum Maximus"
L27_27.icon = "resources/resourcesgold.png"
L27_27.difficulty = 3
L27_27.description = "Mine 1000 gold in a match."
L28_28 = {}
L15_15 = "goldMined"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_129, A1_130, A2_131)
	if A1_130 == "goldMined" then
		local L5_134 = L5_134
		local L5_134, L6_135 = L5_134(A0_129, A1_130, 0), L6_135
		if L5_134 < 1000 then
			L6_135 = A0_129
			L5_134 = A0_129.playDingSoundOnce
			L5_134(L6_135)
			if 1000 <= A2_131 then
				L6_135 = A0_129
				L5_134 = A0_129.alert
				L5_134(L6_135)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_136)
	local L3_137 = L3_137
	local L4_138 = L4_138
	L3_137(L4_138, "goldMined", 0, true)
	local L5_139 = L5_139
end
L27_27.onBattleStart = L28_28
function L28_28(A0_140)
	local L1_141, L2_142 = L1_141, L2_142
	local L1_141, L3_143 = L1_141(L2_142, "goldMined"), L3_143
	if L1_141 and 1000 <= L1_141 then
		L2_142 = true
		return L2_142
	end
	L2_142 = false
	return L2_142
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.RED_ALERT
L27_27.id = L28_28
L27_27.name = "Red Alert"
L27_27.icon = "resources/resourcesruby.png"
L27_27.difficulty = 1
L27_27.description = "Mine 300 rubies in a match."
L28_28 = {}
L15_15 = "rubiesMined"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_144, A1_145, A2_146)
	if A1_145 == "rubiesMined" then
		local L5_149 = L5_149
		local L5_149, L6_150 = L5_149(A0_144, A1_145, 0), L6_150
		if L5_149 < 300 then
			L6_150 = A0_144
			L5_149 = A0_144.playDingSoundOnce
			L5_149(L6_150)
			if 300 <= A2_146 then
				L6_150 = A0_144
				L5_149 = A0_144.alert
				L5_149(L6_150)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_151)
	local L3_152 = L3_152
	local L4_153 = L4_153
	L3_152(L4_153, "rubiesMined", 0, true)
	local L5_154 = L5_154
end
L27_27.onBattleStart = L28_28
function L28_28(A0_155)
	local L1_156, L2_157 = L1_156, L2_157
	local L1_156, L3_158 = L1_156(L2_157, "rubiesMined"), L3_158
	if L1_156 and 300 <= L1_156 then
		L2_157 = true
		return L2_157
	end
	L2_157 = false
	return L2_157
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.RED_SHIFT
L27_27.id = L28_28
L27_27.name = "Red Shift"
L27_27.icon = "resources/resourcesruby.png"
L27_27.difficulty = 2
L27_27.description = "Mine 600 rubies in a match."
L28_28 = {}
L15_15 = "rubiesMined"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_159, A1_160, A2_161)
	if A1_160 == "rubiesMined" then
		local L5_164 = L5_164
		local L5_164, L6_165 = L5_164(A0_159, A1_160, 0), L6_165
		if L5_164 < 600 then
			L6_165 = A0_159
			L5_164 = A0_159.playDingSoundOnce
			L5_164(L6_165)
			if 600 <= A2_161 then
				L6_165 = A0_159
				L5_164 = A0_159.alert
				L5_164(L6_165)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_166)
	local L3_167 = L3_167
	local L4_168 = L4_168
	L3_167(L4_168, "rubiesMined", 0, true)
	local L5_169 = L5_169
end
L27_27.onBattleStart = L28_28
function L28_28(A0_170)
	local L1_171, L2_172 = L1_171, L2_172
	local L1_171, L3_173 = L1_171(L2_172, "rubiesMined"), L3_173
	if L1_171 and 600 <= L1_171 then
		L2_172 = true
		return L2_172
	end
	L2_172 = false
	return L2_172
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.SEEING_RED
L27_27.id = L28_28
L27_27.name = "Seeing Red"
L27_27.icon = "resources/resourcesruby.png"
L27_27.difficulty = 3
L27_27.description = "Mine 900 rubies in a match."
L28_28 = {}
L15_15 = "rubiesMined"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_174, A1_175, A2_176)
	if A1_175 == "rubiesMined" then
		local L5_179 = L5_179
		local L5_179, L6_180 = L5_179(A0_174, A1_175, 0), L6_180
		if L5_179 < 900 then
			L6_180 = A0_174
			L5_179 = A0_174.playDingSoundOnce
			L5_179(L6_180)
			if 900 <= A2_176 then
				L6_180 = A0_174
				L5_179 = A0_174.alert
				L5_179(L6_180)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_181)
	local L3_182 = L3_182
	local L4_183 = L4_183
	L3_182(L4_183, "rubiesMined", 0, true)
	local L5_184 = L5_184
end
L27_27.onBattleStart = L28_28
function L28_28(A0_185)
	local L1_186, L2_187 = L1_186, L2_187
	local L1_186, L3_188 = L1_186(L2_187, "rubiesMined"), L3_188
	if L1_186 and 900 <= L1_186 then
		L2_187 = true
		return L2_187
	end
	L2_187 = false
	return L2_187
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.GO_GREEN
L27_27.id = L28_28
L27_27.name = "Go Green"
L27_27.icon = "resources/resourcesemerald.png"
L27_27.difficulty = 1
L27_27.description = "Mine 400 emeralds in a match."
L28_28 = {}
L15_15 = "emeraldsMined"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_189, A1_190, A2_191)
	if A1_190 == "emeraldsMined" then
		local L5_194 = L5_194
		local L5_194, L6_195 = L5_194(A0_189, A1_190, 0), L6_195
		if L5_194 < 400 then
			L6_195 = A0_189
			L5_194 = A0_189.playDingSoundOnce
			L5_194(L6_195)
			if 400 <= A2_191 then
				L6_195 = A0_189
				L5_194 = A0_189.alert
				L5_194(L6_195)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_196)
	local L3_197 = L3_197
	local L4_198 = L4_198
	L3_197(L4_198, "emeraldsMined", 0, true)
	local L5_199 = L5_199
end
L27_27.onBattleStart = L28_28
function L28_28(A0_200)
	local L1_201, L2_202 = L1_201, L2_202
	local L1_201, L3_203 = L1_201(L2_202, "emeraldsMined"), L3_203
	if L1_201 and 400 <= L1_201 then
		L2_202 = true
		return L2_202
	end
	L2_202 = false
	return L2_202
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.GREEN_WITH_ENVY
L27_27.id = L28_28
L27_27.name = "Green With Envy"
L27_27.icon = "resources/resourcesemerald.png"
L27_27.difficulty = 2
L27_27.description = "Mine 800 emeralds in a match."
L28_28 = {}
L15_15 = "emeraldsMined"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_204, A1_205, A2_206)
	if A1_205 == "emeraldsMined" then
		local L5_209 = L5_209
		local L5_209, L6_210 = L5_209(A0_204, A1_205, 0), L6_210
		if L5_209 < 800 then
			L6_210 = A0_204
			L5_209 = A0_204.playDingSoundOnce
			L5_209(L6_210)
			if 800 <= A2_206 then
				L6_210 = A0_204
				L5_209 = A0_204.alert
				L5_209(L6_210)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_211)
	local L3_212 = L3_212
	local L4_213 = L4_213
	L3_212(L4_213, "emeraldsMined", 0, true)
	local L5_214 = L5_214
end
L27_27.onBattleStart = L28_28
function L28_28(A0_215)
	local L1_216, L2_217 = L1_216, L2_217
	local L1_216, L3_218 = L1_216(L2_217, "emeraldsMined"), L3_218
	if L1_216 and 800 <= L1_216 then
		L2_217 = true
		return L2_217
	end
	L2_217 = false
	return L2_217
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.GREEN_MONSTER
L27_27.id = L28_28
L27_27.name = "Green Monster"
L27_27.icon = "resources/resourcesemerald.png"
L27_27.difficulty = 3
L27_27.description = "Mine 1200 emeralds in a match."
L28_28 = {}
L15_15 = "emeraldsMined"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_219, A1_220, A2_221)
	if A1_220 == "emeraldsMined" then
		local L5_224 = L5_224
		local L5_224, L6_225 = L5_224(A0_219, A1_220, 0), L6_225
		if L5_224 < 1200 then
			L6_225 = A0_219
			L5_224 = A0_219.playDingSoundOnce
			L5_224(L6_225)
			if 1200 <= A2_221 then
				L6_225 = A0_219
				L5_224 = A0_219.alert
				L5_224(L6_225)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_226)
	local L3_227 = L3_227
	local L4_228 = L4_228
	L3_227(L4_228, "emeraldsMined", 0, true)
	local L5_229 = L5_229
end
L27_27.onBattleStart = L28_28
function L28_28(A0_230)
	local L1_231, L2_232 = L1_231, L2_232
	local L1_231, L3_233 = L1_231(L2_232, "emeraldsMined"), L3_233
	if L1_231 and 1200 <= L1_231 then
		L2_232 = true
		return L2_232
	end
	L2_232 = false
	return L2_232
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.BLING_BLING
L27_27.id = L28_28
L27_27.name = "Bling Bling"
L27_27.icon = "resources/resourcesgems.png"
L27_27.difficulty = 1
L27_27.description = "Mine 500 diamonds in a match."
L28_28 = {}
L15_15 = "diamondsMined"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_234, A1_235, A2_236)
	if A1_235 == "diamondsMined" then
		local L5_239 = L5_239
		local L5_239, L6_240 = L5_239(A0_234, A1_235, 0), L6_240
		if L5_239 < 500 then
			L6_240 = A0_234
			L5_239 = A0_234.playDingSoundOnce
			L5_239(L6_240)
			if 500 <= A2_236 then
				L6_240 = A0_234
				L5_239 = A0_234.alert
				L5_239(L6_240)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_241)
	local L3_242 = L3_242
	local L4_243 = L4_243
	L3_242(L4_243, "diamondsMined", 0, true)
	local L5_244 = L5_244
end
L27_27.onBattleStart = L28_28
function L28_28(A0_245)
	local L1_246, L2_247 = L1_246, L2_247
	local L1_246, L3_248 = L1_246(L2_247, "diamondsMined"), L3_248
	if L1_246 and 500 <= L1_246 then
		L2_247 = true
		return L2_247
	end
	L2_247 = false
	return L2_247
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.ICE_ICE_BABY
L27_27.id = L28_28
L27_27.name = "Ice Ice Baby"
L27_27.icon = "resources/resourcesgems.png"
L27_27.difficulty = 2
L27_27.description = "Mine 1000 diamonds in a match."
L28_28 = {}
L15_15 = "diamondsMined"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_249, A1_250, A2_251)
	if A1_250 == "diamondsMined" then
		local L5_254 = L5_254
		local L5_254, L6_255 = L5_254(A0_249, A1_250, 0), L6_255
		if L5_254 < 1000 then
			L6_255 = A0_249
			L5_254 = A0_249.playDingSoundOnce
			L5_254(L6_255)
			if 1000 <= A2_251 then
				L6_255 = A0_249
				L5_254 = A0_249.alert
				L5_254(L6_255)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_256)
	local L3_257 = L3_257
	local L4_258 = L4_258
	L3_257(L4_258, "diamondsMined", 0, true)
	local L5_259 = L5_259
end
L27_27.onBattleStart = L28_28
function L28_28(A0_260)
	local L1_261, L2_262 = L1_261, L2_262
	local L1_261, L3_263 = L1_261(L2_262, "diamondsMined"), L3_263
	if L1_261 and 1000 <= L1_261 then
		L2_262 = true
		return L2_262
	end
	L2_262 = false
	return L2_262
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.CROWN_JEWELS
L27_27.id = L28_28
L27_27.name = "Crown Jewels"
L27_27.icon = "resources/resourcesgems.png"
L27_27.difficulty = 3
L27_27.description = "Mine 1500 diamonds in a match."
L28_28 = {}
L15_15 = "diamondsMined"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_264, A1_265, A2_266)
	if A1_265 == "diamondsMined" then
		local L5_269 = L5_269
		local L5_269, L6_270 = L5_269(A0_264, A1_265, 0), L6_270
		if L5_269 < 1500 then
			L6_270 = A0_264
			L5_269 = A0_264.playDingSoundOnce
			L5_269(L6_270)
			if 1500 <= A2_266 then
				L6_270 = A0_264
				L5_269 = A0_264.alert
				L5_269(L6_270)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_271)
	local L3_272 = L3_272
	local L4_273 = L4_273
	L3_272(L4_273, "diamondsMined", 0, true)
	local L5_274 = L5_274
end
L27_27.onBattleStart = L28_28
function L28_28(A0_275)
	local L1_276, L2_277 = L1_276, L2_277
	local L1_276, L3_278 = L1_276(L2_277, "diamondsMined"), L3_278
	if L1_276 and 1500 <= L1_276 then
		L2_277 = true
		return L2_277
	end
	L2_277 = false
	return L2_277
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.TEXAS_TEA
L27_27.id = L28_28
L27_27.name = "Texas Tea"
L27_27.iconBase = "ground/missionicon01.png"
L27_27.icon = "ground/texastea.png"
L27_27.difficulty = 1
L27_27.description = "Destroy 5 oil derricks across matches."
L28_28 = {}
L15_15 = "totalOil"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_279, A1_280, A2_281)
	if A1_280 == "totalOil" then
		local L5_284 = L5_284
		local L5_284, L6_285 = L5_284(A0_279, A1_280, 0), L6_285
		if L5_284 < 5 then
			L6_285 = A0_279
			L5_284 = A0_279.playDingSoundOnce
			L5_284(L6_285)
			if 5 <= A2_281 then
				L6_285 = A0_279
				L5_284 = A0_279.alert
				L5_284(L6_285)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_286)
	local L3_287 = L3_287
	local L4_288 = L4_288
	L3_287(L4_288, "totalOil", 0, true)
	local L5_289 = L5_289
end
L27_27.onActivate = L28_28
function L28_28(A0_290)
	local L3_291 = L3_291
	do return L3_291(A0_290, "totalOil", 5) end
	local L4_292 = L4_292
end
L27_27.getRemainder = L28_28
function L28_28(A0_293)
	local L1_294, L2_295 = L1_294, L2_295
	local L1_294, L3_296 = L1_294(L2_295, "totalOil"), L3_296
	if L1_294 and 5 <= L1_294 then
		L2_295 = true
		return L2_295
	end
	L2_295 = false
	return L2_295
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.INCOMMUNICADO
L27_27.id = L28_28
L27_27.name = "Incommunicado"
L27_27.iconBase = "ground/missionicon01.png"
L27_27.icon = "ground/incommunicado.png"
L27_27.difficulty = 1
L27_27.description = "Destroy 5 satellite dishes across matches."
L28_28 = {}
L15_15 = "totalSatellites"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_297, A1_298, A2_299)
	if A1_298 == "totalSatellites" then
		local L5_302 = L5_302
		local L5_302, L6_303 = L5_302(A0_297, A1_298, 0), L6_303
		if L5_302 < 5 then
			L6_303 = A0_297
			L5_302 = A0_297.playDingSoundOnce
			L5_302(L6_303)
			if 5 <= A2_299 then
				L6_303 = A0_297
				L5_302 = A0_297.alert
				L5_302(L6_303)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_304)
	local L3_305 = L3_305
	local L4_306 = L4_306
	L3_305(L4_306, "totalSatellites", 0, true)
	local L5_307 = L5_307
end
L27_27.onActivate = L28_28
function L28_28(A0_308)
	local L3_309 = L3_309
	do return L3_309(A0_308, "totalSatellites", 5) end
	local L4_310 = L4_310
end
L27_27.getRemainder = L28_28
function L28_28(A0_311)
	local L1_312, L2_313 = L1_312, L2_313
	local L1_312, L3_314 = L1_312(L2_313, "totalSatellites"), L3_314
	if L1_312 and 5 <= L1_312 then
		L2_313 = true
		return L2_313
	end
	L2_313 = false
	return L2_313
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.DEMOLITIONS_CREW
L27_27.id = L28_28
L27_27.name = "Demolitions Crew"
L27_27.iconBase = "ground/missionicon01.png"
L27_27.icon = "ground/demolitions.png"
L27_27.difficulty = 1
L27_27.description = "Destroy 5 TNTs across matches."
L28_28 = {}
L15_15 = "totalTNT"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_315, A1_316, A2_317)
	if A1_316 == "totalTNT" then
		local L5_320 = L5_320
		local L5_320, L6_321 = L5_320(A0_315, A1_316, 0), L6_321
		if L5_320 < 5 then
			L6_321 = A0_315
			L5_320 = A0_315.playDingSoundOnce
			L5_320(L6_321)
			if 5 <= A2_317 then
				L6_321 = A0_315
				L5_320 = A0_315.alert
				L5_320(L6_321)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_322)
	local L3_323 = L3_323
	local L4_324 = L4_324
	L3_323(L4_324, "totalTNT", 0, true)
	local L5_325 = L5_325
end
L27_27.onActivate = L28_28
function L28_28(A0_326)
	local L3_327 = L3_327
	do return L3_327(A0_326, "totalTNT", 5) end
	local L4_328 = L4_328
end
L27_27.getRemainder = L28_28
function L28_28(A0_329)
	local L1_330, L2_331 = L1_330, L2_331
	local L1_330, L3_332 = L1_330(L2_331, "totalTNT"), L3_332
	if L1_330 and 5 <= L1_330 then
		L2_331 = true
		return L2_331
	end
	L2_331 = false
	return L2_331
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.TOXIC_AVENGER
L27_27.id = L28_28
L27_27.name = "Toxic Avenger"
L27_27.iconBase = "ground/missionicon01.png"
L27_27.icon = "ground/waste.png"
L27_27.difficulty = 1
L27_27.description = "Destroy 5 Toxic Wastes across matches."
L28_28 = {}
L15_15 = "totalToxic"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_333, A1_334, A2_335)
	if A1_334 == "totalToxic" then
		local L5_338 = L5_338
		local L5_338, L6_339 = L5_338(A0_333, A1_334, 0), L6_339
		if L5_338 < 5 then
			L6_339 = A0_333
			L5_338 = A0_333.playDingSoundOnce
			L5_338(L6_339)
			if 5 <= A2_335 then
				L6_339 = A0_333
				L5_338 = A0_333.alert
				L5_338(L6_339)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_340)
	local L3_341 = L3_341
	local L4_342 = L4_342
	L3_341(L4_342, "totalToxic", 0, true)
	local L5_343 = L5_343
end
L27_27.onActivate = L28_28
function L28_28(A0_344)
	local L3_345 = L3_345
	do return L3_345(A0_344, "totalToxic", 5) end
	local L4_346 = L4_346
end
L27_27.getRemainder = L28_28
function L28_28(A0_347)
	local L1_348, L2_349 = L1_348, L2_349
	local L1_348, L3_350 = L1_348(L2_349, "totalToxic"), L3_350
	if L1_348 and 5 <= L1_348 then
		L2_349 = true
		return L2_349
	end
	L2_349 = false
	return L2_349
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.GOING_POSTAL
L27_27.id = L28_28
L27_27.name = "Going Postal"
L27_27.iconBase = "ground/missionicon01.png"
L27_27.icon = "ground/postal.png"
L27_27.difficulty = 1
L27_27.description = "Destroy 5 Mailboxes across matches."
L28_28 = {}
L15_15 = "totalMail"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_351, A1_352, A2_353)
	if A1_352 == "totalMail" then
		local L5_356 = L5_356
		local L5_356, L6_357 = L5_356(A0_351, A1_352, 0), L6_357
		if L5_356 < 5 then
			L6_357 = A0_351
			L5_356 = A0_351.playDingSoundOnce
			L5_356(L6_357)
			if 5 <= A2_353 then
				L6_357 = A0_351
				L5_356 = A0_351.alert
				L5_356(L6_357)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_358)
	local L3_359 = L3_359
	local L4_360 = L4_360
	L3_359(L4_360, "totalMail", 0, true)
	local L5_361 = L5_361
end
L27_27.onActivate = L28_28
function L28_28(A0_362)
	local L3_363 = L3_363
	do return L3_363(A0_362, "totalMail", 5) end
	local L4_364 = L4_364
end
L27_27.getRemainder = L28_28
function L28_28(A0_365)
	local L1_366, L2_367 = L1_366, L2_367
	local L1_366, L3_368 = L1_366(L2_367, "totalMail"), L3_368
	if L1_366 and 5 <= L1_366 then
		L2_367 = true
		return L2_367
	end
	L2_367 = false
	return L2_367
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.TRADE_UP
L27_27.id = L28_28
L27_27.name = "Trade Up"
L27_27.iconBase = "tank/missionicon03.png"
L27_27.icon = "tank/tradeup.png"
L27_27.difficulty = 1
L27_27.description = "Buy and win with a new tank."
L28_28 = {}
L15_15 = "tankUsed"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_369, A1_370, A2_371)
	if A1_370 == "tankUsed" and A2_371 == true then
		local L5_374 = L5_374
		local L5_374, L6_375 = L5_374(A0_369, A1_370, false), L6_375
		if L5_374 == false then
			L6_375 = A0_369
			L5_374 = A0_369.playDingSoundOnce
			L5_374(L6_375)
			L6_375 = A0_369
			L5_374 = A0_369.alert
			L5_374(L6_375)
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_376)
	local L3_377 = L3_377
	local L4_378 = L4_378
	L3_377(L4_378, "tankUsed", false, true)
	local L5_379 = L5_379
end
L27_27.onBattleStart = L28_28
function L28_28(A0_380)
	local L1_381, L2_382 = L1_381, L2_382
	local L1_381, L3_383 = L1_381(L2_382, "tankUsed"), L3_383
	if L1_381 then
		L2_382 = true
		return L2_382
	end
	L2_382 = false
	return L2_382
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.HUNKER_DOWN
L27_27.id = L28_28
L27_27.name = "Hunker Down"
L27_27.iconBase = "tank/missionicon03.png"
L27_27.icon = "tank/hunkerdown.png"
L27_27.difficulty = 3
L27_27.description = "Deploy 5 shields in a single match."
L28_28 = {}
L15_15 = "shieldsDeployed"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_384, A1_385, A2_386)
	if A1_385 == "shieldsDeployed" then
		local L5_389 = L5_389
		local L5_389, L6_390 = L5_389(A0_384, A1_385, 0), L6_390
		if L5_389 < 5 then
			L6_390 = A0_384
			L5_389 = A0_384.playDingSoundOnce
			L5_389(L6_390)
			if 5 <= A2_386 then
				L6_390 = A0_384
				L5_389 = A0_384.alert
				L5_389(L6_390)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_391)
	local L3_392 = L3_392
	local L4_393 = L4_393
	L3_392(L4_393, "shieldsDeployed", 0, true)
	local L5_394 = L5_394
end
L27_27.onBattleStart = L28_28
function L28_28(A0_395)
	local L1_396, L2_397 = L1_396, L2_397
	local L1_396, L3_398 = L1_396(L2_397, "shieldsDeployed"), L3_398
	if L1_396 and 5 <= L1_396 then
		L2_397 = true
		return L2_397
	end
	L2_397 = false
	return L2_397
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.SUNDAY_DRIVE
L27_27.id = L28_28
L27_27.name = "Sunday Drive"
L27_27.iconBase = "tank/missionicon03.png"
L27_27.icon = "tank/sundaydrive.png"
L27_27.difficulty = 1
L27_27.description = "Drive to the other side of your enemy."
L28_28 = {}
L15_15 = "sundayDrive"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_399, A1_400, A2_401)
	if A1_400 == "sundayDrive" and A2_401 == true then
		local L5_404 = L5_404
		local L5_404, L6_405 = L5_404(A0_399, A1_400, false), L6_405
		if L5_404 == false then
			L6_405 = A0_399
			L5_404 = A0_399.playDingSoundOnce
			L5_404(L6_405)
			L6_405 = A0_399
			L5_404 = A0_399.alert
			L5_404(L6_405)
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_406)
	local L3_407 = L3_407
	local L4_408 = L4_408
	L3_407(L4_408, "sundayDrive", false, true)
	local L5_409 = L5_409
end
L27_27.onBattleStart = L28_28
function L28_28(A0_410)
	local L1_411, L2_412 = L1_411, L2_412
	local L1_411, L3_413 = L1_411(L2_412, "sundayDrive"), L3_413
	if L1_411 then
		L2_412 = true
		return L2_412
	end
	L2_412 = false
	return L2_412
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.YOU_MEAN_NOTHING
L27_27.id = L28_28
L27_27.name = "You Mean Nothing To Me"
L27_27.iconBase = "tank/missionicon03.png"
L27_27.icon = "tank/you_mean_nothing.png"
L27_27.difficulty = 1
L27_27.description = "Hit an enemy with any tracer 3 times in a match."
L28_28 = {}
L15_15 = "tracerHits"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_414, A1_415, A2_416)
	if A1_415 == "tracerHits" then
		local L5_419 = L5_419
		local L5_419, L6_420 = L5_419(A0_414, A1_415, 0), L6_420
		if L5_419 < 3 then
			L6_420 = A0_414
			L5_419 = A0_414.playDingSoundOnce
			L5_419(L6_420)
			if 3 <= A2_416 then
				L6_420 = A0_414
				L5_419 = A0_414.alert
				L5_419(L6_420)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_421)
	local L3_422 = L3_422
	local L4_423 = L4_423
	L3_422(L4_423, "tracerHits", 0, true)
	local L5_424 = L5_424
end
L27_27.onBattleStart = L28_28
function L28_28(A0_425)
	local L1_426, L2_427 = L1_426, L2_427
	local L1_426, L3_428 = L1_426(L2_427, "tracerHits"), L3_428
	if L1_426 and 3 <= L1_426 then
		L2_427 = true
		return L2_427
	end
	L2_427 = false
	return L2_427
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.BULLS_EYE
L27_27.id = L28_28
L27_27.name = "Bulls Eye"
L27_27.icon = "bullseye.png"
L27_27.difficulty = 1
L27_27.description = "One shot, one kill."
L28_28 = {}
L15_15 = "bullseyes"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_429, A1_430, A2_431)
	if A1_430 == "bullseyes" then
		local L5_434 = L5_434
		local L5_434, L6_435 = L5_434(A0_429, A1_430, 0), L6_435
		if L5_434 < 1 then
			L6_435 = A0_429
			L5_434 = A0_429.playDingSoundOnce
			L5_434(L6_435)
			if 1 <= A2_431 then
				L6_435 = A0_429
				L5_434 = A0_429.alert
				L5_434(L6_435)
			end
		end
	end
end
L27_27.statCallback = L28_28
function L28_28(A0_436)
	local L3_437 = L3_437
	local L4_438 = L4_438
	L3_437(L4_438, "bullseyes", 0, true)
	local L5_439 = L5_439
end
L27_27.onActivate = L28_28
function L28_28(A0_440)
	local L1_441, L2_442 = L1_441, L2_442
	local L1_441, L3_443 = L1_441(L2_442, "bullseyes"), L3_443
	if L1_441 and 1 <= L1_441 then
		L2_442 = true
		return L2_442
	end
	L2_442 = false
	return L2_442
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.MOMENTUM
L27_27.id = L28_28
L27_27.name = "Momentum"
L27_27.iconBase = "tank/missionicon03.png"
L27_27.icon = "tank/momentum.png"
L27_27.difficulty = 1
L27_27.description = "Win 5 matches in a row."
function L28_28(A0_444)
	local L3_445 = L3_445
	local L4_446 = L4_446
	L3_445(L4_446, "winStreak", 0, true)
	local L5_447 = L5_447
end
L27_27.onActivate = L28_28
function L28_28(A0_448)
	local L3_449 = L3_449
	do return L3_449(A0_448, "winStreak", 5) end
	local L4_450 = L4_450
end
L27_27.getRemainder = L28_28
function L28_28(A0_451)
	local L1_452, L2_453 = L1_452, L2_453
	local L1_452, L3_454 = L1_452(L2_453, "winStreak"), L3_454
	if L1_452 and 5 <= L1_452 then
		L2_453 = true
		return L2_453
	end
	L2_453 = false
	return L2_453
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.RAMPAGE
L27_27.id = L28_28
L27_27.name = "Rampage"
L27_27.iconBase = "tank/missionicon03.png"
L27_27.icon = "tank/rampage.png"
L27_27.difficulty = 2
L27_27.description = "Win 10 matches in a row."
function L28_28(A0_455)
	local L3_456 = L3_456
	local L4_457 = L4_457
	L3_456(L4_457, "winStreak", 0, true)
	local L5_458 = L5_458
end
L27_27.onActivate = L28_28
function L28_28(A0_459)
	local L3_460 = L3_460
	do return L3_460(A0_459, "winStreak", 10) end
	local L4_461 = L4_461
end
L27_27.getRemainder = L28_28
function L28_28(A0_462)
	local L1_463, L2_464 = L1_463, L2_464
	local L1_463, L3_465 = L1_463(L2_464, "winStreak"), L3_465
	if L1_463 and 10 <= L1_463 then
		L2_464 = true
		return L2_464
	end
	L2_464 = false
	return L2_464
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.UNSTOPPABLE
L27_27.id = L28_28
L27_27.name = "Unstoppable"
L27_27.iconBase = "tank/missionicon03.png"
L27_27.icon = "tank/unstoppable.png"
L27_27.difficulty = 3
L27_27.description = "Win 20 matches in a row."
function L28_28(A0_466)
	local L3_467 = L3_467
	local L4_468 = L4_468
	L3_467(L4_468, "winStreak", 0, true)
	local L5_469 = L5_469
end
L27_27.onActivate = L28_28
function L28_28(A0_470)
	local L3_471 = L3_471
	do return L3_471(A0_470, "winStreak", 20) end
	local L4_472 = L4_472
end
L27_27.getRemainder = L28_28
function L28_28(A0_473)
	local L1_474, L2_475 = L1_474, L2_475
	local L1_474, L3_476 = L1_474(L2_475, "winStreak"), L3_476
	if L1_474 and 20 <= L1_474 then
		L2_475 = true
		return L2_475
	end
	L2_475 = false
	return L2_475
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
L26_26 = L0_0
L25_25 = L0_0.newMission
L27_27 = {}
L28_28 = L1_1.BACKBOARD
L27_27.id = L28_28
L27_27.name = "Backboard"
L27_27.icon = "bullseye.png"
L27_27.difficulty = 1
L27_27.description = "Hit the back wall with napalm or dirt bomb. Destroy the enemy below."
L28_28 = {}
L15_15 = "backboard"
L28_28[1] = L15_15
L27_27.requiresWinToCount = L28_28
function L28_28(A0_477)
	local L3_478 = L3_478
	local L4_479 = L4_479
	L3_478(L4_479, "backboard", false, true)
	local L5_480 = L5_480
end
L27_27.onBattleStart = L28_28
function L28_28(A0_481)
	local L1_482, L2_483 = L1_482, L2_483
	local L1_482, L3_484 = L1_482(L2_483, "backboard"), L3_484
	if L1_482 then
		L2_483 = true
		return L2_483
	end
	L2_483 = false
	return L2_483
end
L27_27.isMissionParamsMet = L28_28
L25_25(L26_26, L27_27)
function L25_25(A0_485, A1_486, A2_487)
	local L3_488, L4_489 = L3_488, L4_489
	local L3_488, L5_490 = L3_488(L4_489, A1_486), L5_490
	if L3_488 then
		L4_489 = A2_487 - L3_488
		return L4_489
	end
	return A2_487
end
L0_0.getRemainderInMission = L25_25
function L26_26(A0_491)
	if not A0_491.dingSoundPlayed then
		sound.playSound(sound.globalSounds.ding)
		local L2_492 = L2_492
		A0_491.dingSoundPlayed = true
	end
end
L0_0.playDingSoundOnce = L26_26
function L27_27(A0_493)
	if A0_493.alertMsgTimer then
		timer.cancel(A0_493.alertMsgTimer)
		local L2_494 = L2_494
	end
	A0_493.alertMsgTimer = nil
	L2_494 = A0_493.alertMsg
	if L2_494 then
		L2_494 = A0_493.alertMsg
		L2_494 = L2_494.close
		L2_494()
	end
	A0_493.alertMsg = nil
end
L0_0.dismissAlertMsg = L27_27
function L28_28(A0_495, A1_496)
	local L6_501 = L6_501
	if not A1_496 then
		A1_496 = 3000
	end
	L6_501 = A0_495.dismissAlertMsg
	L6_501(A0_495)
	L6_501 = {}
	L6_501.text = "Objective reached! Win battle to complete mission!"
	L6_501.height = 50
	L6_501.border = 3
	local L3_498 = L3_498
	L3_498 = L3_498(L6_501)
	A0_495.alertMsg = L3_498
	local L4_499 = L4_499
	local L5_500 = L5_500
	L4_499 = L4_499(L5_500, function(A0_502)
		A0_502.source.params.missions:dismissAlertMsg()
		local L2_503 = L2_503
	end)
	A0_495.alertMsgTimer = L4_499
	L4_499 = A0_495.alertMsgTimer
	L5_500 = {}
	L5_500.missions = A0_495
	L4_499.params = L5_500
end
L0_0.alert = L28_28
function L15_15(A0_504)
	L5_509 = A0_504.missions
	L4_508, L5_509, _FOR_ = L4_508(L5_509)
	for _FORV_4_, _FORV_5_ in L4_508, L5_509, _FOR_ do
		if _FORV_5_.onBattleStart then
			_FORV_5_.onBattleStart(A0_504)
		end
	end
	L4_508 = utils
	L4_508 = L4_508.deepcopy
	L5_509 = A0_504.stats
	L4_508 = L4_508(L5_509)
	A0_504.preBattleStatCache = L4_508
end
L0_0.resetPreBattleStats = L15_15
function L16_16(A0_513)
	local L3_516, L9_522 = A0_513.activeMissions, L9_522
	L1_514, L3_516, L4_517 = L1_514(L3_516)
	for L5_518, L6_519 in L1_514, L3_516, L4_517 do
		L9_522 = A0_513.missions
		L10_523 = tostring
		L11_524 = L6_519.id
		L10_523 = L10_523(L11_524)
		L9_522 = L9_522[L10_523]
		L10_523 = L9_522.requiresWinToCount
		if L10_523 then
			L10_523 = 1
			L11_524 = L9_522.requiresWinToCount
			L11_524 = #L11_524
			_FOR_ = 1
			for _FORV_10_ = L10_523, L11_524, _FOR_ do
				local L14_527 = L14_527
				local L15_528 = L15_528
				L15_528(A0_513, L9_522.requiresWinToCount[_FORV_10_], A0_513.preBattleStatCache[L14_527], true)
				local L16_529 = L16_529
			end
		end
	end
end
L0_0.resetPostBattleStatsAfterLoss = L16_16
function L17_17(A0_530, A1_531, A2_532)
	A0_530.dingSoundPlayed = false
	L5_535 = pairs
	L6_536 = A0_530.activeMissions
	L5_535, L6_536, L7_537 = L5_535(L6_536)
	for L8_538, _FORV_7_ in L5_535, L6_536, L7_537 do
		if A0_530.missions[tostring(_FORV_7_.id)].statCallback then
			local L10_540 = L10_540
			local L11_541 = L11_541
			L11_541(A0_530, A1_531, A2_532)
			local L12_542 = L12_542
		end
	end
	A0_530.dingSoundPlayed = false
end
L0_0.triggerStatCallbacks = L17_17
function L18_18(A0_543, A1_544, A2_545, A3_546)
	if getCurrentBattle and getCurrentBattle() and not getCurrentBattle().isMultiplayer then
		if not A3_546 then
			local L4_547, L5_548 = L4_547, L5_548
			local L6_549 = L6_549
			L4_547(L5_548, L6_549, A2_545)
			local L7_550 = L7_550
		end
		L4_547 = A0_543.stats
		L4_547[A1_544] = A2_545
	end
end
L0_0.setStat = L18_18
function L19_19(A0_551, A1_552, A2_553)
	local L3_554
	L3_554 = A0_551.stats
	L3_554 = L3_554[A1_552]
	if not L3_554 then
		return A2_553
	end
	return L3_554
end
L0_0.getStat = L19_19
function L20_20(A0_555, A1_556, A2_557, A3_558)
	if getCurrentBattle and not getCurrentBattle().isMultiplayer then
		local L4_559 = L4_559
		L4_559 = L4_559(_ENV, A1_556, 0)
		L4_559 = L4_559 + A2_557
		if not A3_558 then
			local L5_560, L6_561 = L5_560, L6_561
			local L7_562 = L7_562
			L5_560(L6_561, L7_562, L4_559)
			local L8_563 = L8_563
		end
		L5_560 = A0_555.stats
		L5_560[A1_556] = L4_559
	end
end
L0_0.addToStat = L20_20
function L21_21(A0_564)
	local L1_565
	L1_565 = false
	local L2_566 = L2_566
	L2_566 = L2_566("missionData.json")
	L2_566:load()
	A0_564.data = L2_566
	local L3_567 = L3_567
	L3_567 = L3_567(A0_564.data, "missionStates")
	if L3_567 then
		_FOR_, _FOR_, _FOR_ = pairs(L3_567)
		for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
			if A0_564.missions[tostring(_FORV_8_.id)] then
				if not _FORV_8_.completed then
				end
				A0_564.missions[tostring(_FORV_8_.id)].completed = false
				if not _FORV_8_.completedDate then
				end
				A0_564.missions[tostring(_FORV_8_.id)].completedDate = nil
				if A0_564.missions[tostring(_FORV_8_.id)].completed then
					({}).missionIsComplete = true
					A0_564:removeMissionFromAvailable(A0_564.missions[tostring(_FORV_8_.id)].id, {})
				end
			end
		end
	end
	L9_573 = A0_564.data
	L9_573 = L9_573.get
	L9_573 = L9_573(L9_573, "activeMissions")
	if L9_573 then
		_FOR_, _FOR_, _FOR_ = pairs(L9_573)
		for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
			({}).id = _FORV_9_.id
			;({}).activeDate = _FORV_9_.activeDate
			A0_564:activateMission({})
		end
	end
	L10_574 = A0_564.data
	L13_577 = L10_574
	L10_574 = L10_574.get
	L10_574 = L10_574(L13_577, "stats")
	if L10_574 then
		L13_577 = pairs
		L13_577, _FOR_, _FOR_ = L13_577(L10_574)
		for _FORV_9_, _FORV_10_ in L13_577, _FOR_, _FOR_ do
			A0_564.stats[_FORV_9_] = _FORV_10_
		end
	end
	L13_577 = A0_564.fillActiveMissions
	L13_577 = L13_577(A0_564)
	if #L13_577 then
		L1_565 = true
	end
	if L1_565 then
		A0_564:saveAllMissionData()
		local L7_571, L8_572 = L7_571, L8_572
	end
end
L0_0.loadAllMissionData = L21_21
function L22_22(A0_578)
	local L1_579
	L1_579 = {}
	_FOR_, _FOR_, _FOR_ = pairs(A0_578.activeMissions)
	for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
		({}).id = _FORV_6_.id
		L1_579[tostring(_FORV_6_.id)], ({}).activeDate = {}, _FORV_6_.activeDate
	end
	L8_586 = A0_578.data
	L8_586 = L8_586.set
	L8_586(L8_586, "activeMissions", L1_579)
	L8_586 = {}
	_FOR_, _FOR_, _FOR_ = pairs(A0_578.stats)
	for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
		L8_586[_FORV_6_] = _FORV_7_
	end
	local L3_581 = L3_581
	L3_581(A0_578.data, "stats", L8_586)
	L3_581 = {}
	_FOR_, _FOR_, _FOR_ = pairs(A0_578.missions)
	for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
		({}).id = _FORV_8_.id
		if not _FORV_8_.completed then
		end
		;({}).completed = false
		if not _FORV_8_.completedDate then
		end
		;({}).completedDate = nil
		L3_581[tostring(_FORV_8_.id)] = {}
	end
	L9_587 = A0_578.data
	L11_589 = L9_587
	L9_587 = L9_587.set
	L9_587(L11_589, "missionStates", L3_581)
	L9_587 = A0_578.data
	L11_589 = L9_587
	L9_587 = L9_587.save
	L9_587(L11_589)
end
L0_0.saveAllMissionData = L22_22
function L0_0.removeMissionFromAvailable(A0_590, A1_591, A2_592)
	local L3_593, L4_594, L5_595, L6_596, L7_597, L8_598, L9_599, L10_600, L11_601, L12_602, L13_603, L14_604
	L3_593 = A0_590.availableMissions
	if not A2_592 then
		L4_594 = {}
		A2_592 = L4_594
	end
	L4_594 = A2_592.missionIsComplete
	L5_595 = A0_590.mutuallyExclusiveMissions
	if not L5_595 then
		L5_595 = {}
		A0_590.mutuallyExclusiveMissions = L5_595
	end
	L5_595 = false
	L6_596 = #L3_593
	L7_597 = 1
	L8_598 = -1
	for L9_599 = L6_596, L7_597, L8_598 do
		L10_600 = L3_593[L9_599]
		L11_601 = #L10_600
		L12_602 = 1
		L13_603 = -1
		for L14_604 = L11_601, L12_602, L13_603 do
			if L10_600[L14_604] == A1_591 then
				table.remove(L10_600, L14_604)
				L5_595 = true
				if #L10_600 == 0 then
					table.remove(L3_593, L9_599)
					break
				end
				if L4_594 then
					break
				end
				local L15_605 = L15_605
				L15_605(L3_593, L9_599)
				L15_605 = #L10_600
				if not (0 < L15_605) then
					break
				end
				L15_605 = A0_590.mutuallyExclusiveMissions
				local L16_606 = L16_606
				local L16_606, L17_607 = L16_606(A1_591), L17_607
				L15_605[L16_606] = L10_600
				break
			end
		end
		if L5_595 then
			break
		end
	end
	return L5_595
end
function L0_0.resetMissions(A0_608)
	A0_608.stats = {}
	L4_612 = {}
	A0_608.activeMissions = L4_612
	L4_612 = utils
	L4_612 = L4_612.deepcopy
	L4_612 = L4_612(A0_608.immutableAvailable)
	A0_608.availableMissions = L4_612
	L4_612 = pairs
	L4_612, _FOR_, _FOR_ = L4_612(A0_608.missions)
	for _FORV_4_, _FORV_5_ in L4_612, _FOR_, _FOR_ do
		_FORV_5_.completed = false
		_FORV_5_.completedDate = nil
	end
	L5_613 = A0_608
	L4_612 = A0_608.fillActiveMissions
	L4_612(L5_613)
	L5_613 = A0_608
	L4_612 = A0_608.saveAllMissionData
	L4_612(L5_613)
end
function L0_0.numActiveMissions(A0_614)
	local L1_615
	L1_615 = 0
	L4_618 = pairs
	L4_618, L3_617, _FOR_ = L4_618(A0_614.activeMissions)
	for _FORV_5_, _FORV_6_ in L4_618, L3_617, _FOR_ do
		L1_615 = L1_615 + 1
	end
	return L1_615
end
function L0_0.numAvailableMissions(A0_619)
	local L1_620, L2_621, L3_622, L4_623, L5_624, L6_625, L7_626, L8_627
	L1_620 = 0
	L2_621 = A0_619.availableMissions
	L3_622 = 1
	L4_623 = #L2_621
	L5_624 = 1
	for L6_625 = L3_622, L4_623, L5_624 do
		L7_626 = L2_621[L6_625]
		L7_626 = #L7_626
		L1_620 = L1_620 + L7_626
	end
	L3_622 = A0_619.mutuallyExclusiveMissions
	if L3_622 then
		L3_622 = A0_619.mutuallyExclusiveMissions
		L4_623 = 1
		L5_624 = #L3_622
		L6_625 = 1
		for L7_626 = L4_623, L5_624, L6_625 do
			L8_627 = L3_622[L7_626]
			L8_627 = #L8_627
			L1_620 = L1_620 + L8_627
		end
	end
	return L1_620
end
function L0_0.checkActiveMissionsForCompletion(A0_628)
	local L1_629
	L1_629 = 0
	L4_632 = pairs
	L5_633 = A0_628.activeMissions
	L4_632, L5_633, L6_634 = L4_632(L5_633)
	for L7_635, _FORV_6_ in L4_632, L5_633, L6_634 do
		if A0_628.missions[tostring(_FORV_6_.id)].isMissionParamsMet(A0_628) then
			local L9_637 = L9_637
			A0_628:markActiveMissionComplete(A0_628.missions[tostring(_FORV_6_.id)].id)
			local L10_638 = L10_638
			L1_629 = L1_629 + 1
		end
	end
	return L1_629
end
function L0_0.markActiveMissionComplete(A0_639, A1_640)
	local L2_641
	L2_641 = A0_639.activeMissions
	L2_641 = L2_641[tostring(A1_640)]
	if L2_641 then
		L2_641 = A0_639.activeMissions
		local L3_642 = L3_642
		local L3_642, L4_643 = L3_642(A1_640), L4_643
		L2_641 = L2_641[L3_642]
		L2_641.completed = true
	end
end
function L0_0.getCompletedActiveMissions(A0_644)
	local L1_645
	L1_645 = {}
	L4_648 = pairs
	L5_649 = A0_644.activeMissions
	L4_648, L5_649, L6_650 = L4_648(L5_649)
	for _FORV_5_, _FORV_6_ in L4_648, L5_649, L6_650 do
		if _FORV_6_.completed then
			table.insert(L1_645, _FORV_6_)
			local L9_653 = L9_653
		end
	end
	return L1_645
end
function L0_0.removeCompletedActiveMissions(A0_654)
	L3_657 = A0_654.activeMissions
	L1_655, L3_657, L4_658 = L1_655(L3_657)
	for L5_659, L6_660 in L1_655, L3_657, L4_658 do
		if L6_660.completed then
			A0_654.activeMissions[L5_659] = nil
		end
	end
end
function L0_0.getMission(A0_661, A1_662)
	local L2_663
	L2_663 = A0_661.missions
	local L3_664 = L3_664
	local L3_664, L4_665 = L3_664(A1_662), L4_665
	L2_663 = L2_663[L3_664]
	return L2_663
end
function L0_0.markMissionCompleted(A0_666, A1_667)
	local L2_668
	L2_668 = A0_666.missions
	L2_668 = L2_668[tostring(A1_667)]
	if L2_668 then
		L2_668 = A0_666.missions
		L2_668 = L2_668[tostring(A1_667)]
		L2_668.completed = true
		L2_668 = A0_666.missions
		L2_668 = L2_668[tostring(A1_667)]
		L2_668.completedDate = os.time()
		L2_668 = A0_666.mutuallyExclusiveMissions
		L2_668 = L2_668[tostring(A1_667)]
		if L2_668 then
			A0_666.mutuallyExclusiveMissions[tostring(A1_667)] = nil
			local L3_669 = L3_669
			local L4_670 = L4_670
			L3_669(L4_670, L2_668)
			local L5_671 = L5_671
		end
	end
	L2_668 = false
	return L2_668
end
function L0_0.activateMission(A0_672, A1_673)
	local L2_674
	L2_674 = {}
	L2_674.id = A1_673.id
	if not A1_673.activeDate then
	end
	L2_674.activeDate = os.time()
	local L3_675 = L3_675
	;({}).missionIsComplete = false
	local L3_675, L6_678 = L3_675(A0_672, L2_674.id, {}), L6_678
	if L3_675 then
		L3_675 = A0_672.activeMissions
		L6_678 = tostring
		local L6_678, L5_677 = L6_678(L2_674.id), L5_677
		L3_675[L6_678] = L2_674
	end
end
function L0_0.fillActiveMissions(A0_679)
	local L1_680
	L1_680 = {}
	while true do
		local L2_681 = A0_679:numActiveMissions()
		if not (L2_681 < A0_679.MAX_ACTIVE_MISSIONS) then
			break
		end
		L2_681 = A0_679.availableMissions
		L2_681 = #L2_681
		if not (0 < L2_681) then
			break
		end
		L2_681 = A0_679.availableMissions
		L2_681 = L2_681[math.random(1, #A0_679.availableMissions)]
		L2_681 = L2_681[1]
		;({}).id = L2_681
		A0_679:activateMission({})
		if A0_679.missions[tostring(L2_681)].onActivate then
			A0_679.missions[tostring(L2_681)].onActivate(A0_679)
		end
		local L3_682 = L3_682
		local L4_683 = L4_683
		L3_682(L4_683, L2_681)
		local L5_684 = L5_684
	end
	return L1_680
end
function L0_0.isActive(A0_685, A1_686)
	local L2_687
	L2_687 = A0_685.activeMissions
	L2_687 = L2_687[A1_686]
	if L2_687 then
		L2_687 = true
		return L2_687
	end
	L2_687 = false
	return L2_687
end
return L0_0
