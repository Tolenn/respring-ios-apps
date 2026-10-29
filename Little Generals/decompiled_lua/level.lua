local L6_6 = L6_6
L6_6("terrainFunction")
L6_6 = require
L6_6("changeTracking")
L6_6 = require
L6_6("objectCounter")
L6_6 = require
L6_6("objectTemplates")
L6_6 = require
L6_6("battlefieldFlair")
L6_6 = {}
L6_6.rockCount = 0
L6_6.rockGroup = nil
L6_6.tankGroup = nil
L6_6.terrainFunction = nil
L6_6.strataFunction = nil
L6_6.largestRockSize = 0
local L1_1 = L1_1
local L2_2 = L2_2
local L3_3 = L3_3
local L4_4 = L4_4
L6_6[1] = L1_1
L6_6[2] = L2_2
L6_6[3] = L3_3
L6_6[4] = L4_4
local L6_6[5], L5_5 = counter, L5_5
Level = L6_6
L6_6 = {}
L1_1 = Level
L6_6.__index = L1_1
Level_mt = L6_6
L6_6 = 360
L1_1 = 20
L2_2 = Level
function L3_3(A0_7, A1_8, A2_9, A3_10, A4_11, A5_12, A6_13, A7_14, A8_15, A9_16, A10_17)
	local L11_18 = L11_18
	if not CUSTOM_OVERRIDES.PLATEAU_OVERRIDES then
	end
	L11_18 = L11_18(QuadraticTerrainFunction, A3_10.rect.contentWidth + _ENV, A4_11, A3_10.rect.contentHeight - L0_0, A5_12, A6_13, A7_14)
	local L12_19, L13_20 = L12_19, L13_20
	local L17_24 = L17_24
	local L18_25 = L18_25
	local L19_26 = L19_26
	local L20_27 = L20_27
	local L21_28 = L21_28
	local L18_25, L22_29 = L18_25(L19_26, L20_27, L21_28, 250, 20, A6_13 / 2, 0), L22_29
	L19_26 = 150
	L12_19 = L12_19(L13_20, L17_24, L18_25, L19_26)
	L13_20 = {}
	L17_24 = {}
	L13_20.topRocks = L17_24
	L13_20.rockGroup = A1_8
	L13_20.tankGroup = A2_9
	L13_20.terrainFunction = L11_18
	L13_20.strataFunction = L12_19
	L13_20.largestRockSize = A8_15
	L13_20.minHeight = A4_11
	L17_24 = A3_10.rect
	L17_24 = L17_24.contentHeight
	L18_25 = L0_0
	L17_24 = L17_24 - L18_25
	L13_20.maxHeight = L17_24
	L13_20.world = A3_10
	L17_24 = {}
	L13_20.rockLookupTable = L17_24
	L13_20.rockLookupBucketSize = 100
	L17_24 = Counter
	L18_25 = L17_24
	L17_24 = L17_24.new
	L17_24 = L17_24(L18_25)
	L13_20.counter = L17_24
	L13_20.smallestRockScale = A9_16
	L13_20.theme = A10_17
	L17_24 = setmetatable
	L18_25 = L13_20
	L19_26 = Level_mt
	L17_24(L18_25, L19_26)
	return L13_20
end
L2_2.new = L3_3
L2_2 = Level
function L3_3(A0_30, A1_31, A2_32)
	local L6_36, L7_37 = math.round, L7_37
	L7_37 = A0_30.rockLookupBucketSize
	L7_37 = A1_31 / L7_37
	L6_36 = L6_36(L7_37)
	L7_37 = math
	L7_37 = L7_37.round
	local L7_37, L5_35 = L7_37(A2_32 / A0_30.rockLookupBucketSize), L5_35
	L5_35 = L6_36 * 10000
	L5_35 = L5_35 + L7_37
	return L5_35, L6_36, L7_37
end
L2_2.lookupKey = L3_3
L2_2 = Level
function L3_3(A0_38, A1_39)
	local L2_40, L3_41, L4_42, L5_43, L6_44, L7_45
	L2_40 = {}
	local L12_50 = L12_50
	if A1_39 then
		function L3_41(A0_58, A1_59)
			L7_65 = _ENV
			local L6_64, L7_65 = _ENV.lookupKey, L7_65
			L8_66 = A0_58
			L9_67 = A1_59
			L6_64 = L6_64(L7_65, L8_66, L9_67)
			L7_65 = _ENV
			L7_65 = L7_65.rockLookupTable
			L7_65 = L7_65[L6_64]
			if L7_65 then
				L8_66 = pairs
				L9_67 = L7_65
				L8_66, L9_67, _FOR_ = L8_66(L9_67)
				for _FORV_7_, _FORV_8_ in L8_66, L9_67, _FOR_ do
					table.insert(L2_40, _FORV_7_)
				end
			end
		end
		L4_42 = A1_39.x
		L5_43 = A1_39.width
		L5_43 = L5_43 / 2
		L4_42 = L4_42 - L5_43
		L5_43 = A1_39.x
		L6_44 = A1_39.width
		L6_44 = L6_44 / 2
		L5_43 = L5_43 + L6_44
		L6_44 = A1_39.y
		L7_45 = A1_39.height
		L7_45 = L7_45 / 2
		L6_44 = L6_44 - L7_45
		L7_45 = A1_39.y
		L12_50 = A1_39.height
		L12_50 = L12_50 / 2
		L7_45 = L7_45 + L12_50
		L12_50 = A0_38.rockLookupBucketSize
		L16_54 = L4_42
		_FOR_ = L12_50
		for _FORV_12_ = L16_54, _FOR_, _FOR_ do
			_FOR_ = L12_50
			for _FORV_16_ = _FOR_, _FOR_, _FOR_ do
				L3_41(_FORV_12_, _FORV_16_)
			end
		end
		break -- pseudo-goto
	end
	L3_41 = 1
	L4_42 = levelGroup
	L4_42 = L4_42.numChildren
	L5_43 = 1
	for L6_44 = L3_41, L4_42, L5_43 do
		L7_45 = A0_38.rockGroup
		L7_45 = L7_45[L6_44]
		L12_50 = L7_45.objType
		if L12_50 == "rock" then
			L12_50 = table
			L12_50 = L12_50.insert
			L16_54 = L2_40
			L14_52 = L7_45
			L12_50(L16_54, L14_52)
		end
		repeat
		until true
	end
	return L2_40
end
L2_2.getScreenRocks = L3_3
L2_2 = nil
L3_3 = false
L4_4 = Level
function L5_5(A0_71)
	local L1_72
	L1_72 = {}
	if _ENV then
		if L2_2 ~= nil then
			L2_2:removeSelf()
			L2_2 = display.newGroup()
		else
			local L2_73 = display.newGroup()
			L2_2 = L2_73
		end
	end
	L2_73 = 64
	_FOR_ = 1
	for _FORV_6_ = _FOR_, _FOR_, _FOR_ do
		if A0_71.rockGroup[_FORV_6_].objType == "rock" then
			if L1_72[math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73)] == nil then
				L1_72[math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73)], ({}).y = {}, A0_71.rockGroup[_FORV_6_].y
				if not _ENV then
					goto lbl_101
				end
				display.newText(string.format("%d", A0_71.rockGroup[_FORV_6_].y), math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73) * L2_73, A0_71.rockGroup[_FORV_6_].y, native.systemFont, 16):setTextColor(0, 255, 0)
				L2_2:insert((display.newText(string.format("%d", A0_71.rockGroup[_FORV_6_].y), math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73) * L2_73, A0_71.rockGroup[_FORV_6_].y, native.systemFont, 16)))
				L1_72[math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73)].dot = display.newText(string.format("%d", A0_71.rockGroup[_FORV_6_].y), math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73) * L2_73, A0_71.rockGroup[_FORV_6_].y, native.systemFont, 16)
				break -- pseudo-goto
			end
			L1_72[math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73)].y = math.min(A0_71.rockGroup[_FORV_6_].y, L1_72[math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73)].y)
			if _ENV then
				repeat
					L1_72[math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73)].dot.text = string.format("%d", L1_72[math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73)].y)
					L1_72[math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73)].dot.x = math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73) * L2_73
					L1_72[math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73)].dot.y = L1_72[math.floor(A0_71.rockGroup[_FORV_6_].x / L2_73)].y
				until true
			end
		end
		::lbl_101::
	end
	L14_85 = _ENV
	if L14_85 then
		L14_85 = pairs
		L15_86 = L1_72
		L14_85, L15_86, _FOR_ = L14_85(L15_86)
		for _FORV_6_, _FORV_7_ in L14_85, L15_86, _FOR_ do
			print(_FORV_6_ .. ": " .. _FORV_7_.y)
		end
		L14_85 = display
		L14_85 = L14_85.newCircle
		L15_86 = 0
		L14_85 = L14_85(L15_86, 0, 20)
		L15_86 = L14_85.setFillColor
		L15_86(L14_85, 0, 255, 0)
		local L8_79 = L8_79
		L15_86 = screenGroup
		L8_79 = L15_86
		L15_86 = L15_86.insert
		L15_86(L8_79, L14_85)
		L15_86 = A0_71.rockGroup
		L8_79 = L15_86
		L15_86 = L15_86.insert
		L15_86(L8_79, L2_2)
		L15_86 = L2_2
		L8_79 = L15_86
		L15_86 = L15_86.toFront
		L15_86(L8_79)
	end
	return L1_72
end
L4_4.getHighestPeaks = L5_5
L4_4 = Level
function L5_5(A0_87, A1_88)
	local L2_89, L3_90, L4_91, L5_92, L6_93, L7_94
	L4_91 = 1
	L5_92 = A0_87.topRocks
	L5_92 = #L5_92
	L6_93 = 1
	for L7_94 = L4_91, L5_92, L6_93 do
		if L2_89 == nil or L3_90 > math.abs(A1_88 - A0_87.topRocks[L7_94].x) then
			L2_89 = A0_87.topRocks[L7_94]
			local L8_95 = L8_95
			local L8_95, L9_96 = L8_95(A1_88 - A0_87.topRocks[L7_94].x), L9_96
			repeat
				L3_90 = L8_95
				do break end -- pseudo-goto
				return L2_89
			until true
		end
	end
end
L4_4.findTop = L5_5
L4_4 = Level
function L5_5(A0_97)
	local L1_98
	L1_98 = A0_97.terrainFunction
	local L1_98, L3_100, L11_108 = L1_98.plateaus, L3_100, L11_108
	L3_100 = tutorial
	L3_100 = L3_100.isFirstFightTutorialsComplete
	L3_100 = L3_100()
	if L3_100 then
		L3_100 = CUSTOM_OVERRIDES
		L3_100 = L3_100.GROUND_FLAIR_ODDS
		if not L3_100 then
			L3_100 = 2
		end
		L4_101 = 1
		L5_102 = #L1_98
		L5_102 = L5_102 - 2
		L6_103 = 1
		for L7_104 = L4_101, L5_102, L6_103 do
			L11_108 = math
			L11_108 = L11_108.round
			L11_108 = L11_108(math.random(1, L3_100))
			L11_108 = L11_108 % L3_100
			if L11_108 == 0 then
				L11_108 = L7_104 + 1
				L11_108 = L1_98[L11_108]
				L11_108 = L11_108.startX
				L11_108 = L11_108 + (L1_98[L7_104 + 1].endX - L1_98[L7_104 + 1].startX) / 2
				local L9_106 = L9_106
				local L9_106, L10_107 = L9_106(A0_97, L11_108 - A0_97.world.rect.width / 2), L10_107
				if L9_106 then
					L10_107 = L9_106.x
					if L9_106.rock then
						L9_106 = L9_106.rock
					end
					local L12_109 = L12_109
					if not CUSTOM_OVERRIDES.GROUND_FLAIR_OVERRIDE then
					end
					battlefieldFlair.GroundFlair:new(math.round(math.random(1, #battlefieldFlair.GroundFlairTypes)), L9_106):setReferencePoint(display.BottomCenterReferencePoint)
					A0_97.tankGroup:insert((battlefieldFlair.GroundFlair:new(math.round(math.random(1, #battlefieldFlair.GroundFlairTypes)), L9_106)))
					battlefieldFlair.GroundFlair:new(math.round(math.random(1, #battlefieldFlair.GroundFlairTypes)), L9_106).x, battlefieldFlair.GroundFlair:new(math.round(math.random(1, #battlefieldFlair.GroundFlairTypes)), L9_106).y = L10_107, L12_109 - L9_106.contentHeight / 2 + 10
					local L13_110 = L13_110
					local L14_111 = L14_111
					local L15_112 = L15_112
					local L16_113 = L16_113
					local L17_114 = L17_114
					L15_112(L16_113, L17_114, L14_111, L14_111.x, L14_111.y)
					local L18_115 = L18_115
				end
				L3_100 = L3_100 * 2
			end
		end
	end
end
L4_4.createFlair = L5_5
L4_4 = Level
function L5_5(A0_116, A1_117)
	local L2_118, L3_119, L4_120, L5_121, L6_122
	L2_118 = {}
	local L3_119, L13_129, L14_130, L15_131, L16_132, L17_133, L18_134, L19_135 = A0_116.terrainFunction, L13_129, L14_130, L15_131, L16_132, L17_133, L18_134, L19_135
	L3_119 = L3_119.plateaus
	L4_120 = 0
	L5_121 = #L3_119
	L6_122 = 1
	L9_125 = table
	L9_125 = L9_125.sort
	L10_126 = A0_116.topRocks
	function L11_127(A0_150, A1_151)
		local L2_152, L3_153
		L2_152 = A0_150.x
		L3_153 = A1_151.x
		L2_152 = L2_152 < L3_153
		return L2_152
	end
	L9_125(L10_126, L11_127)
	L9_125 = 1
	L10_126 = #A1_117
	L11_127 = 1
	for L12_128 = L9_125, L10_126, L11_127 do
		L13_129 = A1_117[L12_128]
		L13_129 = L13_129.id
		L14_130 = A1_117[L12_128]
		L14_130 = L14_130.alias
		L15_131 = A1_117[L12_128]
		L15_131 = L15_131.healthX
		L16_132 = A1_117[L12_128]
		L17_133 = 0
		L18_134 = L12_128 - 1
		L18_134 = L18_134 % 2
		if L18_134 == 0 then
			L18_134 = L3_119[L12_128]
			L18_134 = L18_134.startX
			L19_135 = L3_119[L12_128]
			L19_135 = L19_135.endX
			L19_135 = L19_135 - L3_119[L12_128].startX
			L19_135 = L19_135 / 2
			L17_133 = L18_134 + L19_135
			L18_134 = L3_119[L12_128]
			L18_134.used = true
		else
			L18_134 = L5_121
			L19_135 = L3_119[L18_134]
			L19_135 = L19_135.startX
			L17_133 = L19_135 + (L3_119[L18_134].endX - L3_119[L18_134].startX) / 2
			L19_135 = L3_119[L18_134]
			L19_135.used = true
			L5_121 = L5_121 - 1
		end
		L18_134 = nil
		L19_135 = nil
		L19_135 = L13_129
		L18_134 = L13_129
		if not L16_132.tank then
		end
		if not ({}).id then
			local L20_136 = L20_136
			local L21_137 = L21_137
			L21_137 = L21_137[math.random(1, #availableTankTypesInOrder)]
		end
		local L22_138 = L22_138
		local L23_139 = L23_139
		L22_138 = L22_138(L23_139, math.round(L17_133 - A0_116.world.rect.width / 2))
		L23_139 = L22_138.x
		if A0_116.hasAddedTank then
		end
		A0_116.hasAddedTank = true
		print("creating tank", "right")
		local L24_140 = L24_140
		local L28_144 = L28_144
		local L29_145 = L29_145
		local L30_146 = L30_146
		local L31_147 = L31_147
		local L32_148 = L32_148
		local L29_145, L33_149 = L29_145(L30_146, L31_147, L32_148, L21_137, L23_139, L24_140 - L22_138.contentHeight / 2, L19_135, L28_144, L18_134), L33_149
		L29_145.alias = L14_130
		L30_146 = L16_132.backgroundSoundChannel
		L29_145.backgroundSoundChannel = L30_146
		L30_146 = L16_132.isHuman
		L29_145.isHuman = L30_146
		L30_146 = L16_132.maxHealth
		if L30_146 then
			L30_146 = L16_132.maxHealth
			L29_145.maxHealth = L30_146
		end
		L30_146 = L16_132.health
		if L30_146 then
			L30_146 = L16_132.health
			L29_145.health = L30_146
		end
		if L15_131 then
			L30_146 = type
			L31_147 = L15_131
			L30_146 = L30_146(L31_147)
			if L30_146 == "number" then
				L30_146 = L29_145.maxHealth
				L30_146 = L30_146 * L15_131
				L29_145.maxHealth = L30_146
				L30_146 = L29_145.health
				L30_146 = L30_146 * L15_131
				L29_145.health = L30_146
			end
		end
		L30_146 = table
		L30_146 = L30_146.insert
		L31_147 = L2_118
		L32_148 = L29_145
		L30_146(L31_147, L32_148)
	end
	A0_116.players = L2_118
	return L2_118
end
L4_4.createPlayers = L5_5
L4_4 = Level
function L5_5(A0_154)
	local L1_155
	L1_155 = A0_154.terrainFunction
	L1_155.values = nil
	A0_154.topRocks = nil
end
L4_4.finishCreation = L5_5
L4_4 = Level
function L5_5(A0_156)
	A0_156.rockLookupTable = nil
	A0_156.counter = nil
	A0_156.theme:destroy()
	local L1_157, L2_158 = L1_157, L2_158
end
L4_4.destroy = L5_5
L4_4 = Level
function L5_5(A0_159, A1_160)
	local L3_161 = require("themes")
	A0_159.theme = L3_161[A1_160.theme]
end
L4_4.restoreSetup = L5_5
L4_4 = Level
function L5_5(A0_162, A1_163, A2_164, A3_165, A4_166, A5_167)
	local L6_168
	L6_168 = {}
	L6_168.rockGroup = A1_163
	L6_168.tankGroup = A2_164
	L6_168.world = A3_165
	L6_168.counter = Counter:new()
	L6_168.rockLookupTable = {}
	L6_168.rockLookupBucketSize = 100
	setmetatable(L6_168, Level_mt)
	local L7_169 = L7_169
	L7_169 = L7_169("json")
	local L8_170 = L8_170
	L8_170 = L8_170(A4_166, system.TemporaryDirectory)
	print("path", A4_166, L8_170)
	local L9_171 = L9_171
	L9_171 = L9_171(L8_170, "r")
	local L10_172 = L9_171:lines()
	A0_162:restoreSetup(L7_169.decode(L10_172()))
	local L11_173 = L11_173
	local L11_173, L14_176 = L11_173(L10_172, L6_168, A5_167), L14_176
	L14_176 = io
	L14_176 = L14_176.close
	L14_176(L9_171)
	local L13_175 = L13_175
	A0_162.players = L11_173
	L14_176 = L6_168
	L13_175 = L11_173
	return L14_176, L13_175
end
L4_4.loadLevel = L5_5
L4_4 = Level
function L5_5(A0_177)
	local L1_178
	L1_178 = A0_177.world
	L1_178 = L1_178.rect
	L1_178 = L1_178.contentWidth
	L1_178 = -1 * L1_178
	L1_178 = L1_178 / 2
	return L1_178
end
L4_4.minWorld = L5_5
L4_4 = Level
function L5_5(A0_179)
	local L1_180, L2_181
	L1_180 = A0_179.world
	L1_180 = L1_180.rect
	L1_180 = L1_180.contentWidth
	L1_180 = L1_180 / 2
	L2_181 = _ENV
	L1_180 = L1_180 + L2_181
	return L1_180
end
L4_4.maxWorld = L5_5
L4_4 = Level
function L5_5(A0_182)
	local L1_183, L2_184
	L1_183 = {}
	L2_184 = A0_182.theme
	L2_184 = L2_184.id
	L1_183.theme = L2_184
	return L1_183
end
L4_4.saveSetup = L5_5
L4_4 = Level
function L5_5(A0_185)
	local L4_189 = L4_189
	local L5_190 = L5_190
	local L4_189, L6_191 = L4_189(L5_190, A0_185, 150, 20, 750), L6_191
	changeSet = L4_189
	L4_189 = changeSet
	L4_189 = L4_189.changes
	L6_191 = A0_185
	L5_190 = A0_185.saveSetup
	L5_190 = L5_190(L6_191)
	L4_189[1] = L5_190
	L4_189 = changeSet
	L5_190 = L4_189
	L4_189 = L4_189.startTrackChanges
	L4_189(L5_190)
	L4_189 = changeSet
	A0_185.changeSet = L4_189
	L4_189 = changeSet
	return L4_189
end
L4_4.trackChanges = L5_5
L4_4 = Level
function L5_5(A0_192)
	local L1_193
	L1_193 = A0_192.world
	L1_193 = L1_193.rect
	L1_193 = L1_193.contentWidth
	L1_193 = L1_193 / 2
	L5_197 = A0_192.minWorld
	L5_197 = L5_197(A0_192)
	L3_195 = A0_192:maxWorld()
	L4_196 = 20
	for _FORV_5_ = L5_197, L3_195, L4_196 do
		local L7_199 = L7_199
		display.newCircle(_FORV_5_, L7_199, 4):setFillColor(255, 0, 0)
		local L8_200 = L8_200
		A0_192.rockGroup:insert((display.newCircle(_FORV_5_, L7_199, 4)))
		local L14_206 = L14_206
		L14_206 = L14_206(_FORV_5_ - 10, A0_192.terrainFunction:valueAt(_FORV_5_ - 10 + L1_193), _FORV_5_ + 10, A0_192.terrainFunction:valueAt(_FORV_5_ + 10 + L1_193))
		L14_206:setColor(0, 0, 255)
		A0_192.rockGroup:insert(L14_206)
		L7_199 = A0_192.strataFunction:valueAt(_FORV_5_ + L1_193)
		L8_200 = display.newCircle(_FORV_5_, L7_199, 4)
		L8_200:setFillColor(0, 255, 0)
		local L13_205 = L13_205
		L13_205 = A0_192.rockGroup
		L13_205 = L13_205.insert
		L13_205(L13_205, L8_200)
		local L11_203 = L11_203
	end
end
L4_4.debugTerrain = L5_5
function L4_4(A0_207, A1_208)
	if A0_207 then
		if A0_207.contentBounds.yMax < A1_208.contentBounds.yMin then
			if (function(A0_217, A1_218)
				local L2_219, L3_220, L4_221, L5_222, L6_223
				L2_219 = A0_217.neighbours
				L3_220 = 1
				L4_221 = #L2_219
				L5_222 = 1
				for L6_223 = L3_220, L4_221, L5_222 do
					if L2_219[L6_223].contentBounds.maxX == A0_217.contentBounds.maxX and L2_219[L6_223].contentBounds.yMax < A0_217.contentBounds.yMin then
						if L2_219[L6_223].y > A1_218.contentBounds.yMin and L2_219[L6_223].y < A1_218.contentBounds.yMax then
							print("good strata")
							return L2_219[L6_223]
						else
							print("moving strata downward", L2_219[L6_223])
							local L7_224 = L7_224
							local L8_225 = L8_225
							do return L7_224(L8_225, A1_218) end
							local L9_226 = L9_226
						end
					end
				end
				L3_220 = nil
				return L3_220
			end)(A0_207, A1_208) then
				physics.newJoint("weld", A0_207, (function(A0_227, A1_228)
					local L2_229, L3_230, L4_231, L5_232, L6_233
					L2_229 = A0_227.neighbours
					L3_230 = 1
					L4_231 = #L2_229
					L5_232 = 1
					for L6_233 = L3_230, L4_231, L5_232 do
						if L2_229[L6_233].contentBounds.maxX == A0_227.contentBounds.maxX and L2_229[L6_233].contentBounds.yMax < A0_227.contentBounds.yMin then
							if L2_229[L6_233].y > A1_228.contentBounds.yMin and L2_229[L6_233].y < A1_228.contentBounds.yMax then
								print("good strata")
								return L2_229[L6_233]
							else
								print("moving strata downward", L2_229[L6_233])
								local L7_234 = L7_234
								local L8_235 = L8_235
								do return L7_234(L8_235, A1_228) end
								local L9_236 = L9_236
							end
						end
					end
					L3_230 = nil
					return L3_230
				end)(A0_207, A1_208), A0_207.x, A1_208.y)
				return ((function(A0_237, A1_238)
					local L2_239, L3_240, L4_241, L5_242, L6_243
					L2_239 = A0_237.neighbours
					L3_240 = 1
					L4_241 = #L2_239
					L5_242 = 1
					for L6_243 = L3_240, L4_241, L5_242 do
						if L2_239[L6_243].contentBounds.maxX == A0_237.contentBounds.maxX and L2_239[L6_243].contentBounds.yMax < A0_237.contentBounds.yMin then
							if L2_239[L6_243].y > A1_238.contentBounds.yMin and L2_239[L6_243].y < A1_238.contentBounds.yMax then
								print("good strata")
								return L2_239[L6_243]
							else
								print("moving strata downward", L2_239[L6_243])
								local L7_244 = L7_244
								local L8_245 = L8_245
								do return L7_244(L8_245, A1_238) end
								local L9_246 = L9_246
							end
						end
					end
					L3_240 = nil
					return L3_240
				end)(A0_207, A1_208))
			else
				return nil
			end
		else
			if A0_207.contentBounds.yMin > A1_208.contentBounds.yMax then
				if (function(A0_247, A1_248)
					local L2_249, L3_250, L4_251, L5_252, L6_253
					L2_249 = A0_247.neighbours
					L3_250 = 1
					L4_251 = #L2_249
					L5_252 = 1
					for L6_253 = L3_250, L4_251, L5_252 do
						if L2_249[L6_253].contentBounds.maxX == A0_247.contentBounds.maxX and L2_249[L6_253].contentBounds.yMin > A0_247.contentBounds.yMax then
							if L2_249[L6_253].y > A1_248.contentBounds.yMin and L2_249[L6_253].y < A1_248.contentBounds.yMax then
								local L10_257 = L10_257
								L10_257("good strata", L2_249[L6_253].y, A1_248.contentBounds.yMin, A1_248.contentBounds.yMax)
								local L11_258 = L11_258
								L10_257 = L2_249[L6_253]
								do return L10_257 end
								break -- pseudo-goto
							end
							L10_257 = print
							L11_258 = "moving strata upward"
							L10_257(L11_258, L2_249[L6_253])
							L10_257 = _ENV
							L11_258 = L2_249[L6_253]
							do return L10_257(L11_258, A1_248) end
							local L9_256 = L9_256
							repeat
							until true
						end
					end
					L3_250 = nil
					return L3_250
				end)(A0_207, A1_208) then
					local L8_215 = L8_215
					physics.newJoint("weld", A0_207, (function(A0_259, A1_260)
						local L2_261, L3_262, L4_263, L5_264, L6_265
						L2_261 = A0_259.neighbours
						L3_262 = 1
						L4_263 = #L2_261
						L5_264 = 1
						for L6_265 = L3_262, L4_263, L5_264 do
							if L2_261[L6_265].contentBounds.maxX == A0_259.contentBounds.maxX and L2_261[L6_265].contentBounds.yMin > A0_259.contentBounds.yMax then
								if L2_261[L6_265].y > A1_260.contentBounds.yMin and L2_261[L6_265].y < A1_260.contentBounds.yMax then
									local L10_269 = L10_269
									L10_269("good strata", L2_261[L6_265].y, A1_260.contentBounds.yMin, A1_260.contentBounds.yMax)
									local L11_270 = L11_270
									L10_269 = L2_261[L6_265]
									do return L10_269 end
									break -- pseudo-goto
								end
								L10_269 = print
								L11_270 = "moving strata upward"
								L10_269(L11_270, L2_261[L6_265])
								L10_269 = _ENV
								L11_270 = L2_261[L6_265]
								do return L10_269(L11_270, A1_260) end
								local L9_268 = L9_268
								repeat
								until true
							end
						end
						L3_262 = nil
						return L3_262
					end)(A0_207, A1_208), A0_207.x, A1_208.y)
					local L9_216 = L9_216
					repeat
						do return L9_216 end
						do break end -- pseudo-goto
						return nil
					until true
				end
				break -- pseudo-goto
			end
			L8_215 = physics
			L8_215 = L8_215.newJoint
			L9_216 = "weld"
			local L4_211 = L4_211
			local L5_212 = L5_212
			local L6_213 = L6_213
			L8_215(L9_216, L4_211, L5_212, L6_213, A1_208.y)
			local L7_214 = L7_214
		end
	end
	repeat
	until true
	return A1_208
end
L5_5 = Level
function L5_5.build(A0_271, A1_272, A2_273, A3_274, A4_275, A5_276, A6_277, A7_278, A8_279)
	local L11_282, L16_287, L17_288 = L11_282, L16_287, L17_288
	if not A1_272 then
		A1_272 = false
	end
	if not A2_273 then
		A2_273 = A0_271.largestRockSize
	end
	if not A3_274 then
		L12_283 = A0_271
		L11_282 = A0_271.minWorld
		L11_282 = L11_282(L12_283)
		A3_274 = L11_282
	end
	if not A4_275 then
		L12_283 = A0_271
		L11_282 = A0_271.maxWorld
		L11_282 = L11_282(L12_283)
		A4_275 = L11_282
	end
	if not A5_276 then
		L11_282 = A0_271.world
		L11_282 = L11_282.rect
		L11_282 = L11_282.height
		L11_282 = L11_282 / 2
		L12_283 = A0_271.world
		L12_283 = L12_283.groundLevel
		L11_282 = L11_282 - L12_283
		L12_283 = A2_273 / 2
		L11_282 = L11_282 - L12_283
		A5_276 = L11_282 - 118
	end
	if not A6_277 then
		A6_277 = nil
	end
	if not A7_278 then
		A7_278 = nil
	end
	if not A8_279 then
		A8_279 = 0
	end
	function L11_282()
		local L0_307, L1_308, L2_309
		L0_307 = math
		L0_307 = L0_307.round
		L1_308 = math
		L1_308 = L1_308.random
		L2_309 = 1
		local L3_310 = L3_310
		local L4_311 = L4_311
		local L3_310, L4_311, L5_312 = L3_310(L4_311, 1)
		L1_308, L2_309, L3_310, L4_311, L5_312 = L1_308(L2_309, L3_310, L4_311, L5_312)
		L0_307 = L0_307(L1_308, L2_309, L3_310, L4_311, L5_312)
		L0_307 = L0_307 == 1
		return L0_307
	end
	L12_283 = A3_274
	L13_284 = A4_275
	L14_285 = A2_273
	for L15_286 = L12_283, L13_284, L14_285 do
		L16_287 = 0
		if A1_272 then
		end
		L17_288 = A0_271.world
		L17_288 = L17_288.rect
		L17_288 = L17_288.contentWidth
		L17_288 = L17_288 / 2
		local L18_289 = L18_289
		local L19_290, L20_291 = L19_290, L20_291
		local L21_292 = L21_292
		if L15_286 > A0_271:minWorld() and L15_286 < A0_271:maxWorld() then
			availableHeightLastHalf = math.max(0, A5_276 - L20_291)
			availableHeightNextHalf = math.max(0, A5_276 - L21_292)
			while roomForFullBlock(L16_287 + A2_273 * 2, availableHeightLastHalf, availableHeightNextHalf) do
				if A0_271.theme.allowsRotation then
				end
				if A0_271:roomForTriangle(L16_287 + A2_273 * 2, L21_292, L20_291, A2_273, A5_276) == false and A0_271:blockSizeIsValid(A2_273 / 2) == false and roomForFullBlock(L16_287 + 3 * A2_273, availableHeightLastHalf, availableHeightNextHalf) == false then
				end
				local L33_304 = L33_304
				local L34_305 = L34_305
				L16_287 = L16_287 + A2_273
				if L33_304 ~= nil then
					if L11_282() then
						repeat
							A8_279 = A8_279 + 1
							table.insert(L33_304.joints, (A0_271:getRock(1, L15_286, A5_276 - L16_287, A2_273 / A0_271.largestRockSize, 0 * 90, "static", "top", false, true)))
							table.insert(A0_271:getRock(1, L15_286, A5_276 - L16_287, A2_273 / A0_271.largestRockSize, 0 * 90, "static", "top", false, true).joints, L33_304)
							do break end -- pseudo-goto
							A8_279 = 0
						until true
					end
					table.insert(L33_304.neighbours, (A0_271:getRock(1, L15_286, A5_276 - L16_287, A2_273 / A0_271.largestRockSize, 0 * 90, "static", "top", false, true)))
					table.insert(A0_271:getRock(1, L15_286, A5_276 - L16_287, A2_273 / A0_271.largestRockSize, 0 * 90, "static", "top", false, true).neighbours, L33_304)
				end
				if L34_305 > A0_271:getRock(1, L15_286, A5_276 - L16_287, A2_273 / A0_271.largestRockSize, 0 * 90, "static", "top", false, true).y and L34_305 <= A0_271:getRock(1, L15_286, A5_276 - L16_287, A2_273 / A0_271.largestRockSize, 0 * 90, "static", "top", false, true).y + A0_271:getRock(1, L15_286, A5_276 - L16_287, A2_273 / A0_271.largestRockSize, 0 * 90, "static", "top", false, true).contentHeight then
					A7_278 = _ENV(A7_278, (A0_271:getRock(1, L15_286, A5_276 - L16_287, A2_273 / A0_271.largestRockSize, 0 * 90, "static", "top", false, true)))
				end
				if "top" == "top" then
					table.insert(A0_271.topRocks, (A0_271:getRock(1, L15_286, A5_276 - L16_287, A2_273 / A0_271.largestRockSize, 0 * 90, "static", "top", false, true)))
				end
				L33_304 = A0_271:getRock(1, L15_286, A5_276 - L16_287, A2_273 / A0_271.largestRockSize, 0 * 90, "static", "top", false, true)
			end
		end
		L35_306 = A0_271.roomForTriangle
		L35_306 = L35_306(A0_271, L16_287, L21_292, L20_291, A2_273, A5_276)
		if L35_306 then
			L35_306 = 2
			triangleRockNum = L35_306
			if L20_291 < L21_292 then
				L35_306 = 3
				triangleRockNum = L35_306
			end
			L35_306 = A0_271.getRock
			L35_306 = L35_306(A0_271, triangleRockNum, L15_286, A5_276 - L16_287, A2_273 / A0_271.largestRockSize, 0, "static", "top", false)
			table.insert(A0_271.topRocks, L35_306)
			if not (L34_305 > L35_306.y) or L34_305 <= L35_306.y + L35_306.height then
			end
			if L33_304 ~= nil then
				if L11_282() then
					table.insert(L33_304.joints, L35_306)
					table.insert(L35_306.joints, L33_304)
					A8_279 = A8_279 + 1
				else
					A8_279 = 0
				end
				table.insert(L33_304.neighbours, L35_306)
				table.insert(L35_306.neighbours, L33_304)
			end
			_FOR_ = 1
			for _FORV_26_ = _FOR_, _FOR_, _FOR_ do
				A0_271.terrainFunction.values[_FORV_26_] = L35_306.y + L35_306.contentHeight / 2
			end
		else
			L35_306 = A2_273 / 2
			newRockSize = L35_306
			L35_306 = A0_271.blockSizeIsValid
			L35_306 = L35_306(A0_271, newRockSize)
			if L35_306 then
				L35_306 = A0_271.build
				local L28_299 = L28_299
				local L29_300 = L29_300
				local L30_301 = L30_301
				local L35_306, L31_302 = L35_306(L25_296, L26_297, L27_298, L28_299, L29_300, L30_301, L33_304, A7_278, A8_279), L31_302
				repeat
					A7_278 = L35_306
					do break end -- pseudo-goto
					L35_306 = L18_289
					L25_296 = L19_290
					L26_297 = 1
					for L27_298 = L35_306, L25_296, L26_297 do
						if L33_304 ~= nil then
							L28_299 = L33_304
							L29_300 = L33_304.rock
							if L29_300 then
								L28_299 = L33_304.rock
							end
							L29_300 = A0_271.terrainFunction
							L29_300 = L29_300.values
							L30_301 = L33_304.y
							L31_302 = L28_299.contentHeight
							L31_302 = L31_302 / 2
							L30_301 = L30_301 - L31_302
							L29_300[L27_298] = L30_301
						else
							L28_299 = A0_271.terrainFunction
							L28_299 = L28_299.values
							L28_299[L27_298] = 0
						end
					end
				until true
			end
		end
	end
	return A7_278
end
L5_5 = Level
function L5_5.isSmallestRockSize(A0_313, A1_314)
	local L2_315, L3_316
	L2_315 = A0_313.largestRockSize
	L2_315 = A1_314 / L2_315
	L3_316 = A0_313.smallestRockScale
	L2_315 = L2_315 <= L3_316
	return L2_315
end
L5_5 = Level
function L5_5.blockSizeIsValid(A0_317, A1_318)
	local L2_319, L3_320
	L2_319 = A0_317.largestRockSize
	L2_319 = A1_318 / L2_319
	L3_320 = A0_317.smallestRockScale
	L2_319 = L2_319 >= L3_320
	return L2_319
end
function L5_5(A0_321, A1_322, A2_323)
	local L3_324
	L3_324 = A0_321 <= A1_322 and A0_321 < A2_323
	return L3_324
end
roomForFullBlock = L5_5
L5_5 = Level
function L5_5.roomForTriangle(A0_325, A1_326, A2_327, A3_328, A4_329, A5_330)
	local L8_332 = A0_325:isSmallestRockSize(A4_329)
	if L8_332 then
		L8_332 = A1_326 + A2_327
		L8_332 = A5_330 > L8_332
	end
	return L8_332
end
function L5_5(A0_333, A1_334, A2_335)
	local L3_336
	L3_336 = joinType
	if not L3_336 then
		L3_336 = "weld"
	end
	local L4_337 = L4_337
	local L5_338 = L5_338
	local L6_339 = L6_339
	local L7_340 = L7_340
	local L8_341 = L8_341
	local L10_343 = A1_334.y + A1_334.contentHeight / 2
	L4_337 = L4_337(L5_338, L6_339, L7_340, L8_341, L10_343)
	joint = L4_337
	L4_337 = joint
	return L4_337
end
join = L5_5
L5_5 = Level
function L5_5.getRock(A0_344, A1_345, A2_346, A3_347, A4_348, A5_349, A6_350, A7_351, A8_352, A9_353)
	local L10_354 = L10_354
	local L15_359 = L15_359
	local L16_360 = L16_360
	local L10_354, L17_361 = L10_354(L15_359, L16_360, A3_347, A4_348, A0_344, A7_351, A9_353), L17_361
	L15_359 = {}
	L10_354.neighbours = L15_359
	L15_359 = L10_354.neighbours
	L15_359.__mode = "v"
	L15_359 = {}
	L10_354.joints = L15_359
	L15_359 = L10_354.joints
	L15_359.__mode = "v"
	L15_359 = system
	L15_359 = L15_359.getTimer
	L15_359 = L15_359()
	L10_354.created = L15_359
	L15_359 = A0_344.counter
	L16_360 = L15_359
	L15_359 = L15_359.nextId
	L17_361 = L10_354
	L15_359(L16_360, L17_361)
	L10_354.bodyType = A6_350
	L10_354.rotation = A5_349
	L10_354.x = A2_346
	L10_354.y = A3_347
	L15_359 = A0_344.rockGroup
	L16_360 = L15_359
	L15_359 = L15_359.insert
	L17_361 = L10_354
	L15_359(L16_360, L17_361)
	L15_359 = A0_344.rockCount
	L15_359 = L15_359 + 1
	A0_344.rockCount = L15_359
	if A8_352 then
		L15_359 = A0_344.changeSet
		if L15_359 then
			L15_359 = A0_344.changeSet
			L16_360 = L15_359
			L15_359 = L15_359.track
			L17_361 = L10_354
			L15_359(L16_360, L17_361, false)
			local L14_358 = L14_358
		end
	end
	L15_359 = A0_344
	return L10_354
end
