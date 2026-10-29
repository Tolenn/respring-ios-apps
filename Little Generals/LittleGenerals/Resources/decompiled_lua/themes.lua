local L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14 = L7_7, "achievementList", L9_9, L10_10, L11_11, L12_12, L13_13, L14_14
L7_7(L8_8)
L7_7 = require
L8_8 = "lib_particle_candy"
L7_7 = L7_7(L8_8)
Particles = L7_7
L7_7 = {}
L8_8 = id
L9_9 = name
L10_10 = description
L11_11 = pathTo
L12_12 = destructionHandlers
L13_13 = allowsRotation
L7_7[1] = L8_8
L7_7[2] = L9_9
L7_7[3] = L10_10
L7_7[4] = L11_11
L7_7[5] = L12_12
L7_7[6] = L13_13
Theme = L7_7
L7_7 = {}
L8_8 = Theme
L7_7.__index = L8_8
Theme_mc = L7_7
L7_7 = {}
function L8_8(A0_39, A1_40, A2_41, A3_42)
	local L7_46 = Particles.UseSpriteAPI
	L7_46(require("sprite"))
	L7_46 = Particles
	L7_46 = L7_46.EnableDebug
	L7_46(false)
	local L5_44 = L5_44
	function L7_46(A0_47)
		local L1_48 = L1_48
		local L1_48, L2_49 = L1_48 .. ".png", L2_49
		return L1_48
	end
	function L5_44(A0_50, A1_51)
		local L2_52 = L2_52
		local L3_53 = L3_53
		local L5_55 = tostring(A1_51)
		L2_52 = L2_52 .. L3_53 .. L5_55
		return L2_52
	end
	return function(A0_56, A1_57, A2_58)
		repeat
			local L3_59 = L3_59
			local L3_59, L4_60 = L3_59(_ENV)
			function initialize()
				local L0_70, L1_71, L2_72, L3_73, L4_74, L5_75, L6_76, L7_77, L8_78, L9_79
				L0_70 = 1
				L1_71 = _ENV
				L1_71 = #L1_71
				L2_72 = 1
				for L3_73 = L0_70, L1_71, L2_72 do
					L4_74 = _ENV
					L5_75 = _ENV
					L5_75 = L5_75[L3_73]
					L4_74 = L4_74[L5_75]
					L5_75 = 1
					L6_76 = #L4_74
					L7_77 = 1
					for L8_78 = L5_75, L6_76, L7_77 do
						L9_79 = utils
						L9_79 = L9_79.findSpriteFrame
						L9_79 = L9_79(L4_60, L4_43(_ENV[L3_73]))
						local L10_80 = L10_80
						local L11_81 = L11_81
						;({}).SpriteSet = L3_59
						;({}).animSequence = L4_43(L4_74[L8_78])
						;({}).weight = 0.025
						;({}).directionVariation = 100
						;({}).velocityVariation = 25
						;({}).rotationVariation = 360
						;({}).rotationChange = 60
						;({}).alphaStart = 0
						;({}).fadeInSpeed = 1.5
						;({}).fadeOutSpeed = -0.5
						;({}).fadeOutDelay = 500
						;({}).emissionShape = 3
						local L14_84 = L14_84
						local L15_85 = math.min(L9_79.spriteSourceSize.width, L9_79.spriteSourceSize.height)
						L14_84.emissionRadius = L15_85
						L14_84.killOutsideScreen = true
						L14_84.lifeTime = 1000
						L10_80(L11_81, L14_84)
					end
				end
			end
			if A0_56 == "top" and A2_58 ~= -1 then
				if math.round(math.random(1, 4)) % 2 ~= 0 then
					goto lbl_177
				end
				_UPVALUE4_ = _UPVALUE4_ % #A2_41 + 1
				local L5_61 = display.newGroup()
				L5_61:insert((sprite.newSprite(L3_59)))
				sprite.newSprite(L3_59).width = utils.findSpriteFrame(L4_60, L4_43(A2_41[_UPVALUE4_])).spriteSourceSize.width
				sprite.newSprite(L3_59).height = utils.findSpriteFrame(L4_60, L4_43(A2_41[_UPVALUE4_])).spriteSourceSize.height
				sprite.newSprite(L3_59):prepare(utils.findSpriteFrame(L4_60, L4_43(A2_41[_UPVALUE4_])).name)
				function L5_61.destroy()
					local L0_86 = L0_86
					L0_86 = L0_86(_ENV)
					local L1_87, L2_88 = L1_87, L2_88
					L1_87, L2_88 = L1_87(L2_88, 0, 0)
					local L3_89, L4_90 = L3_89, L4_90
					L3_89, L4_90 = L3_89(L4_90, L1_87, L2_88)
					Particles.CreateEmitter(L0_86, 0, 0, 0, false, false, true)
					local L5_91 = L5_91
					L5_91 = L5_91(L0_86)
					TERRAIN_FLAIR:insert(L5_91)
					L5_91.x, L5_91.y = L3_89, L4_90
					_FOR_ = 1
					for _FORV_9_ = L9_95, _FOR_, _FOR_ do
						if not Particles.ParticleTypes[L5_44(A2_41[_UPVALUE2_], _FORV_9_)] then
							initialize()
						end
						local L13_99 = L13_99
						local L14_100 = L14_100
						local L15_101 = L15_101
						L14_100(L15_101, L5_44(A2_41[_UPVALUE2_], _FORV_9_), 50, 250, 0)
						local L16_102 = L16_102
					end
					L9_95 = Particles
					L9_95 = L9_95.StartEmitter
					L10_96 = L0_86
					L9_95(L10_96)
					L9_95 = L5_61
					L9_95.destroy = nil
				end
				if math.round(math.random(1, 2)) % 2 == 0 then
					sprite.newSprite(L3_59):scale(-1, 1)
				end
				do return L5_61, display.BottomCenterReferencePoint, 0, -10 end
				break -- pseudo-goto
			end
			if not A2_58 or A2_58 == -1 then
				if not (A2_58 ~= -1 and 0.25 <= A1_57 and A1_57 < 1) then
					goto lbl_177
				end
				L5_61 = math
				L5_61 = L5_61.round
				L5_61 = L5_61(math.random(1, 20))
				L5_61 = L5_61 % 20
				if L5_61 ~= 0 then
					goto lbl_177
				end
			end
			L5_61 = A2_58 or L5_61
			if not A2_58 then
				L5_61 = math
				L5_61 = L5_61.round
				local L6_62 = L6_62
				L6_62 = L6_62(1, #A3_42)
				L5_61 = L5_61(L6_62, L6_62(1, #A3_42))
			end
			L6_62 = A3_42
			L6_62 = L6_62[L5_61]
			local L7_63 = display.newGroup()
			local L8_64 = L8_64
			L8_64 = L8_64(L6_62.image)
			A1_57 = 2 * A1_57 * math.sqrt(0.5)
			local L9_65 = L9_65
			L9_65(L7_63, L8_64)
			function L9_65()
				if _ENV.onDestroy then
					local L0_103 = L0_103
					L0_103(L8_64)
					local L1_104 = L1_104
				end
				L0_103 = L7_63
				L0_103.destroy = nil
			end
			L7_63.destroy = L9_65
			L9_65 = 1
			if math.round(math.random(1, 2)) % 2 == 0 then
				L9_65 = -1
			end
			L8_64:scale(L9_65 * A1_57, A1_57)
			local L13_69 = L13_69
			L13_69 = math
			L13_69 = L13_69.random
			local L11_67 = L11_67
			local L13_69, L12_68 = L13_69(L11_67, 359), L12_68
			L8_64.rotation = L13_69
			L7_63.flairId = L5_61
			L13_69 = L7_63
			L11_67 = display
			L11_67 = L11_67.CenterReferencePoint
			L12_68 = 0
			return L13_69, L11_67, L12_68, 0
		until true
		::lbl_177::
	end
end
function L9_9()
	local L1_105
	function L1_105(A0_106, A1_107)
		if not A0_106 or not A0_106.isHuman then
			return
		end
		local L2_108 = L2_108
		if not A1_107.xScale then
		end
		L2_108 = L2_108(math.floor(A1_107.score * 0), 0.1)
		local L3_109 = L3_109
		local L4_110 = L4_110
		;({}).scorePlayer = A0_106
		local ({}).objType, L6_112 = A1_107.objType, L6_112
		L6_112.objSubType = nil
		L3_109 = L3_109(L4_110, L6_112)
	end
	return L1_105
end
L10_10 = L9_9
L10_10 = L10_10()
L11_11 = L9_9
L11_11 = L11_11()
L12_12 = L9_9
L12_12 = L12_12()
L13_13 = Theme
function L14_14(A0_113, A1_114, A2_115, A3_116, A4_117, A5_118, A6_119, A7_120, A8_121, A9_122, A10_123)
	local L11_124, L12_125
	L11_124 = A10_123 or nil
	if not A10_123 then
		L11_124 = {}
	end
	L12_125 = L11_124.plain
	if not L12_125 then
		L12_125 = _ENV
		L11_124.plain = L12_125
	end
	L12_125 = L11_124.top
	if not L12_125 then
		L12_125 = L4_4
		L11_124.top = L12_125
	end
	L12_125 = L11_124.fancy
	if not L12_125 then
		L12_125 = L5_5
		L11_124.fancy = L12_125
	end
	L12_125 = {}
	L12_125.landType = A1_114
	L12_125.id = A2_115
	L12_125.pathTo = "res/themes/" .. A3_116 .. "/"
	L12_125.skyColor = A4_117
	L12_125.groundColor = A5_118
	L12_125.backgrounds = A6_119
	L12_125.allowsRotation = A7_120
	L12_125.destructionHandlers = L11_124
	L12_125.flairSpriteSheet = A8_121
	L12_125.flairGenerator = A9_122
	local L13_126 = L13_126
	local L14_127 = L14_127
	L13_126(L14_127, Theme_mc)
	local L15_128 = L15_128
	L13_126 = L0_0
	L13_126[A2_115] = L12_125
	L13_126 = L0_0
	L14_127 = L0_0
	L14_127 = #L14_127
	L14_127 = L14_127 + 1
	L13_126[L14_127] = L12_125
	return L12_125
end
L13_13.new = L14_14
L13_13 = Theme
function L14_14(A0_129)
	if A0_129.flairSpriteSheet then
		spritesheetmanager.disposeSpriteSet(A0_129.flairSpriteSheet)
		local L2_130 = L2_130
	end
end
L13_13.destroy = L14_14
function L13_13(A0_131, A1_132, A2_133)
	if not A2_133 then
		A2_133 = {}
	end
	local L3_134 = L3_134
	local L4_135 = L4_135
	;({}).scorePlayer = A2_133.scorePlayer
	;({}).objType = A2_133.objType
	;({}).objSubType = A2_133.fancyType
	L3_134, L4_135 = L3_134(L4_135, {})
	local L5_136, L6_137 = L5_136, L6_137
	L5_136, L6_137 = L5_136(L6_137, 0, 0)
	L5_136, L6_137 = SCREEN_GROUP:contentToLocal(L5_136, L6_137)
	local L7_138 = L7_138
	local L8_139 = L8_139
	local L9_140 = L9_140
	local L10_141 = L10_141
	;({}).multiplier = L3_134
	L7_138(L8_139, L9_140, L10_141, {})
	local L11_142 = L11_142
	return L4_135
end
L14_14 = {}
L14_14.DINO_BONES = 1
L14_14.DIAMOND = 2
L14_14.EMERALD = 3
L14_14.RUBY = 4
L14_14.GOLD = 5
L14_14.UFO = 6
fancyTypes = L14_14
L14_14 = {}
L14_14.image = "res/fancyblocks/dinosaurbones.png"
function L14_14.onDestroy(A0_143)
	local L1_144 = getRockPointsPlayer()
	if L1_144 and L1_144.isHuman then
		achievementList.unlockAchievement(achievementList.terrainAchievements.DINOSAUR)
		local L2_145, L3_146 = L2_145, L3_146
		local L4_147 = L4_147
		L2_145(L3_146, L4_147, 1)
		local L5_148 = L5_148
	end
end
;({}).image = "res/fancyblocks/gems.png"
;({}).onDestroy = function(A0_149)
	local L1_150 = getRockPointsPlayer()
	if L1_150 and L1_150.isHuman then
		local L2_151 = L2_151
		;({}).scorePlayer = L1_150
		;({}).objType = "fancy"
		;({}).objSubType = fancyTypes.DIAMOND
		L2_151 = L2_151(A0_149, WARBUX_AWARDS.FLAIR_DIAMOND, {})
		missions:addToStat("diamondsMined", L2_151)
		local L3_152, L4_153 = L3_152, L4_153
		local L5_154 = L5_154
		L3_152(L4_153, L5_154, 1)
		local L6_155 = L6_155
	end
end
;({}).image = "res/fancyblocks/emerald.png"
;({}).onDestroy = function(A0_156)
	local L1_157 = getRockPointsPlayer()
	if L1_157 and L1_157.isHuman then
		local L2_158 = L2_158
		;({}).scorePlayer = L1_157
		;({}).objType = "fancy"
		;({}).objSubType = fancyTypes.EMERALD
		L2_158 = L2_158(A0_156, WARBUX_AWARDS.FLAIR_EMERALD, {})
		missions:addToStat("emeraldsMined", L2_158)
		local L3_159, L4_160 = L3_159, L4_160
		local L5_161 = L5_161
		L3_159(L4_160, L5_161, 1)
		local L6_162 = L6_162
	end
end
;({}).image = "res/fancyblocks/ruby.png"
;({}).onDestroy = function(A0_163)
	local L1_164 = getRockPointsPlayer()
	if L1_164 and L1_164.isHuman then
		local L2_165 = L2_165
		;({}).scorePlayer = L1_164
		;({}).objType = "fancy"
		;({}).objSubType = fancyTypes.RUBY
		L2_165 = L2_165(A0_163, WARBUX_AWARDS.FLAIR_RUBY, {})
		missions:addToStat("rubiesMined", L2_165)
		local L3_166, L4_167 = L3_166, L4_167
		local L5_168 = L5_168
		L3_166(L4_167, L5_168, 1)
		local L6_169 = L6_169
	end
end
;({}).image = "res/fancyblocks/goldnuggets.png"
;({}).onDestroy = function(A0_170)
	local L1_171 = getRockPointsPlayer()
	if L1_171 and L1_171.isHuman then
		local L2_172 = L2_172
		;({}).scorePlayer = L1_171
		;({}).objType = "fancy"
		;({}).objSubType = fancyTypes.GOLD
		L2_172 = L2_172(A0_170, WARBUX_AWARDS.FLAIR_GOLD, {})
		missions:addToStat("goldMined", L2_172)
		local L3_173, L4_174 = L3_173, L4_174
		local L5_175 = L5_175
		L3_173(L4_174, L5_175, 1)
		local L6_176 = L6_176
	end
end
;({}).image = "res/fancyblocks/ufo.png"
;({}).onDestroy = function(A0_177)
	local L1_178 = getRockPointsPlayer()
	if L1_178 and L1_178.isHuman then
		achievementList.unlockAchievement(achievementList.terrainAchievements.ALIEN)
		local L2_179, L3_180 = L2_179, L3_180
		local L4_181 = L4_181
		L2_179(L3_180, L4_181, 1)
		local L5_182 = L5_182
	end
end
;(function(A0_183, A1_184, A2_185)
	local L5_188 = math.ceil
	L6_189 = A2_185
	L5_188 = L5_188(L6_189)
	L6_189 = 1
	_FOR_ = 1
	for _FORV_7_ = L6_189, _FOR_, _FOR_ do
		table.insert(A0_183, A1_184)
	end
end)({}, {}, 60)
;(function(A0_193, A1_194, A2_195)
	local L5_198 = math.ceil
	L6_199 = A2_195
	L5_198 = L5_198(L6_199)
	L6_199 = 1
	_FOR_ = 1
	for _FORV_7_ = L6_199, _FOR_, _FOR_ do
		table.insert(A0_193, A1_194)
	end
end)({}, {}, 15)
;(function(A0_203, A1_204, A2_205)
	local L5_208 = math.ceil
	L6_209 = A2_205
	L5_208 = L5_208(L6_209)
	L6_209 = 1
	_FOR_ = 1
	for _FORV_7_ = L6_209, _FOR_, _FOR_ do
		table.insert(A0_203, A1_204)
	end
end)({}, {}, 12)
;(function(A0_213, A1_214, A2_215)
	local L5_218 = math.ceil
	L6_219 = A2_215
	L5_218 = L5_218(L6_219)
	L6_219 = 1
	_FOR_ = 1
	for _FORV_7_ = L6_219, _FOR_, _FOR_ do
		table.insert(A0_213, A1_214)
	end
end)({}, {}, 7)
;(function(A0_223, A1_224, A2_225)
	local L5_228 = math.ceil
	L6_229 = A2_225
	L5_228 = L5_228(L6_229)
	L6_229 = 1
	_FOR_ = 1
	for _FORV_7_ = L6_229, _FOR_, _FOR_ do
		table.insert(A0_223, A1_224)
	end
end)({}, L14_14, 3)
;(function(A0_233, A1_234, A2_235)
	local L5_238 = math.ceil
	L6_239 = A2_235
	L5_238 = L5_238(L6_239)
	L6_239 = 1
	_FOR_ = 1
	for _FORV_7_ = L6_239, _FOR_, _FOR_ do
		table.insert(A0_233, A1_234)
	end
end)({}, {}, 3)
;({})[1] = 227
;({})[2] = 247
;({})[3] = 254
;({})[1] = 120
;({})[2] = 155
;({})[3] = 0
;({}).file = "res/themes/greatwalltheme/greatwall2.png"
;({}).image = "greatwall_1.png"
;({}).xAdjustment = 0.45
;({}).yPos = 160
;({}).bottomRectColor, ({})[1] = {}, 164
;({}).bottomRectColor, ({})[2] = {}, 188
;({}).bottomRectColor, ({})[3] = {}, 19
;({}).bottomRectHeight = 190
;({}).file = "res/themes/greatwalltheme/greatwall2.png"
;({}).image = "greatwall_2.png"
;({}).xAdjustment = 0.5
;({}).yPos = 350
;({}).bottomRectColor, ({})[1] = {}, 137
;({}).bottomRectColor, ({})[2] = {}, 169
;({}).bottomRectColor, ({})[3] = {}, 0
;({}).bottomRectHeight = 150
;({}).file = "res/themes/greatwalltheme/greatwall.png"
;({}).image = "greatwall_front.png"
;({}).xAdjustment = 0.55
;({}).yPos = 585
;({}).bottomRectColor, ({})[1] = {}, 120
;({}).bottomRectColor, ({})[2] = {}, 155
;({}).bottomRectColor, ({})[3] = {}, 0
;({}).bottomRectHeight = 150
;({}).file = "res/themes/greatwalltheme/greatwall.png"
;({}).image = "greatwall_middle.png"
;({}).xAdjustment = 0.75
;({}).yPos = 725
;({}).bottomRectColor, ({})[1] = {}, 24
;({}).bottomRectColor, ({})[2] = {}, 116
;({}).bottomRectColor, ({})[3] = {}, 106
;({}).bottomRectHeight = 120
;({}).file = "res/themes/greatwalltheme/greatwall.png"
;({}).image = "greatwall_back.png"
;({}).xAdjustment = 0.9
;({}).yPos = 800
;({}).bottomRectColor, ({})[1] = {}, 81
;({}).bottomRectColor, ({})[2] = {}, 193
;({}).bottomRectColor, ({})[3] = {}, 229
;({}).bottomRectHeight = 75
;({}).file = "res/themes/greatwalltheme/greatwall.png"
;({}).image = "greatwall_bkg.jpg"
;({}).xAdjustment = 1
;({}).yPos = 920
;({}).bottomRectColor, ({})[1] = {}, 185
;({}).bottomRectColor, ({})[2] = {}, 231
;({}).bottomRectColor, ({})[3] = {}, 244
;({}).bottomRectHeight = 150
;({}).topRectColor, ({})[1] = {}, 227
;({}).topRectColor, ({})[2] = {}, 247
;({}).topRectColor, ({})[3] = {}, 254
;({}).topRectHeight = 1800
;({})[1] = {}
;({})[2] = {}
;({})[3] = {}
;({})[4] = {}
;({})[5] = {}
;({})[6] = {}
;({}).grass1, ({})[1] = {}, "grassparticle"
;({}).grass2, ({})[1] = {}, "grassparticle"
;({}).hill2, ({})[1] = {}, "hill1_2_3particle1"
;({}).hill3, ({})[1] = {}, "hill1_2_3particle1"
;({})[1] = "grass1"
;({})[2] = "grass2"
;({})[3] = "hill2"
;({})[4] = "hill3"
Theme:new(landType.MOUNTAINS, "brownearth1", "greatwalltheme", {}, {}, {}, true, "res/themes/greatwalltheme/greatwall_flair.png", L8_8("greatwall", "res/themes/greatwalltheme/greatwall_flair.png", {}, {}))
;({})[1] = 72
;({})[2] = 126
;({})[3] = 216
;({})[1] = 219
;({})[2] = 123
;({})[3] = 0
;({}).file = "res/themes/arizonatheme/arizona_bkg2.png"
;({}).image = "arizona_1.png"
;({}).xAdjustment = 0.45
;({}).yPos = 10
;({}).bottomRectColor, ({})[1] = {}, 136
;({}).bottomRectColor, ({})[2] = {}, 104
;({}).bottomRectColor, ({})[3] = {}, 66
;({}).bottomRectHeight = 50
;({}).file = "res/themes/arizonatheme/arizona_bkg2.png"
;({}).image = "arizona_2.png"
;({}).xAdjustment = 0.5
;({}).yPos = 185
;({}).bottomRectColor, ({})[1] = {}, 202
;({}).bottomRectColor, ({})[2] = {}, 98
;({}).bottomRectColor, ({})[3] = {}, 22
;({}).bottomRectHeight = 100
;({}).file = "res/themes/arizonatheme/arizona_bkg.png"
;({}).image = "arizona_front.png"
;({}).xAdjustment = 0.55
;({}).yPos = 525
;({}).bottomRectColor, ({})[1] = {}, 219
;({}).bottomRectColor, ({})[2] = {}, 123
;({}).bottomRectColor, ({})[3] = {}, 0
;({}).bottomRectHeight = 310
;({}).file = "res/themes/arizonatheme/arizona_bkg.png"
;({}).image = "arizona_middle.png"
;({}).xAdjustment = 0.75
;({}).yPos = 600
;({}).bottomRectColor, ({})[1] = {}, 232
;({}).bottomRectColor, ({})[2] = {}, 148
;({}).bottomRectColor, ({})[3] = {}, 24
;({}).bottomRectHeight = 100
;({}).file = "res/themes/arizonatheme/arizona_bkg.png"
;({}).image = "arizona_back.png"
;({}).xAdjustment = 0.9
;({}).yPos = 700
;({}).bottomRectColor, ({})[1] = {}, 253
;({}).bottomRectColor, ({})[2] = {}, 180
;({}).bottomRectColor, ({})[3] = {}, 39
;({}).bottomRectHeight = 100
;({}).file = "res/themes/arizonatheme/arizona_bkg.png"
;({}).image = "arizona_bkg.jpg"
;({}).xAdjustment = 1
;({}).yPos = 760
;({}).bottomRectColor, ({})[1] = {}, 147
;({}).bottomRectColor, ({})[2] = {}, 187
;({}).bottomRectColor, ({})[3] = {}, 249
;({}).bottomRectHeight = 60
;({}).topRectColor, ({})[1] = {}, 72
;({}).topRectColor, ({})[2] = {}, 126
;({}).topRectColor, ({})[3] = {}, 216
;({}).topRectHeight = 1800
;({})[1] = {}
;({})[2] = {}
;({})[3] = {}
;({})[4] = {}
;({})[5] = {}
;({})[6] = {}
;({}).cactus1, ({})[1] = {}, "cactus1_3particle1"
;({}).cactus1, ({})[2] = {}, "cactus1_3particle2"
;({}).cactus2, ({})[1] = {}, "cactus1_3particle1"
;({}).cactus2, ({})[2] = {}, "cactus1_3particle2"
;({}).cactus2, ({})[3] = {}, "cactus2particle1"
local ({}).cactus2, ({})[4], L38_38 = {}, "cactus2particle2", L38_38
;({}).cactus3, ({})[1] = {}, "cactus1_3particle1"
;({}).cactus3, ({})[2] = {}, "cactus1_3particle2"
;({}).cactus3, ({})[3] = {}, "cactus3particle"
;({}).grass1, ({})[1] = {}, "grassparticle"
;({}).grass2, ({})[1] = {}, "grassparticle"
;({})[1] = "cactus1"
;({})[2] = "cactus2"
;({})[3] = "cactus3"
;({})[4] = "grass1"
;({})[5] = "grass2"
Theme:new(landType.DESERT, "brownearth2", "arizonatheme", {}, {}, {}, true, "res/themes/arizonatheme/arizona_flair.png", L8_8("arizona", "res/themes/arizonatheme/arizona_flair.png", {}, {}), nil)
;({})[1] = 255
;({})[2] = 147
;({})[3] = 88
;({})[1] = 219
;({})[2] = 123
;({})[3] = 0
;({}).file = "res/themes/volcano/volcano.png"
;({}).image = "foreground.png"
;({}).xAdjustment = 0.55
;({}).yPos = 325
;({}).bottomRectColor, ({})[1] = {}, 73
;({}).bottomRectColor, ({})[2] = {}, 30
;({}).bottomRectColor, ({})[3] = {}, 33
;({}).bottomRectHeight = 410
;({}).file = "res/themes/volcano/volcano.png"
;({}).image = "midground.png"
;({}).xAdjustment = 0.75
;({}).yPos = 550
;({}).bottomRectColor, ({})[1] = {}, 129
;({}).bottomRectColor, ({})[2] = {}, 105
;({}).bottomRectColor, ({})[3] = {}, 126
;({}).bottomRectHeight = 100
;({}).file = "res/themes/volcano/volcano.png"
;({}).image = "background.png"
;({}).xAdjustment = 0.9
;({}).yPos = 700
;({}).bottomRectColor, ({})[1] = {}, 85
;({}).bottomRectColor, ({})[2] = {}, 73
;({}).bottomRectColor, ({})[3] = {}, 97
;({}).bottomRectHeight = 400
;({}).file = "res/themes/volcano/volcano.png"
;({}).image = "sky.png"
;({}).xAdjustment = 1
;({}).yPos = 760
;({}).bottomRectColor, ({})[1] = {}, 255
;({}).bottomRectColor, ({})[2] = {}, 219
;({}).bottomRectColor, ({})[3] = {}, 160
;({}).topRectColor, ({})[1] = {}, 255
;({}).topRectColor, ({})[2] = {}, 147
;({}).topRectColor, ({})[3] = {}, 88
;({}).bottomRectHeight = 60
;({}).topRectHeight = 1800
;({})[1] = {}
;({})[2] = {}
;({})[3] = {}
;({})[4] = {}
;({}).bush, ({})[1] = {}, "branchparticle"
;({}).bush, ({})[2] = {}, "grassparticle"
;({}).shortgrass, ({})[1] = {}, "grassparticle"
;({}).tallgrass, ({})[1] = {}, "grassparticle"
;({}).tree, ({})[1] = {}, "branchparticle"
;({}).tree, ({})[2] = {}, "leafparticle"
;({})[1] = "bush"
;({})[2] = "shortgrass"
;({})[3] = "tallgrass"
;({})[4] = "tree"
Theme:new(landType.VOLCANO, "volcano", "volcano", {}, {}, {}, true, "res/themes/volcano/volcano_flair.png", L8_8("volcano", "res/themes/volcano/volcano_flair.png", {}, {}), nil)
;({})[1] = 72
;({})[2] = 126
;({})[3] = 216
;({})[1] = 219
;({})[2] = 123
;({})[3] = 0
;({}).file = "res/themes/jungle/jungle.png"
;({}).image = "foreground.png"
;({}).xAdjustment = 0.55
;({}).yPos = 325
;({}).bottomRectColor, ({})[1] = {}, 188
;({}).bottomRectColor, ({})[2] = {}, 202
;({}).bottomRectColor, ({})[3] = {}, 79
;({}).bottomRectHeight = 410
;({}).file = "res/themes/jungle/jungle.png"
;({}).image = "midground.png"
;({}).xAdjustment = 0.75
;({}).yPos = 625
;({}).bottomRectColor, ({})[1] = {}, 230
;({}).bottomRectColor, ({})[2] = {}, 232
;({}).bottomRectColor, ({})[3] = {}, 122
;({}).bottomRectHeight = 300
;({}).file = "res/themes/jungle/jungle.png"
;({}).image = "background.png"
;({}).xAdjustment = 0.9
;({}).yPos = 750
;({}).bottomRectColor, ({})[1] = {}, 241
;({}).bottomRectColor, ({})[2] = {}, 214
;({}).bottomRectColor, ({})[3] = {}, 51
;({}).bottomRectHeight = 400
;({}).file = "res/themes/jungle/jungle.png"
;({}).image = "sky.png"
;({}).xAdjustment = 1
;({}).yPos = 790
;({}).bottomRectColor, ({})[1] = {}, 254
;({}).bottomRectColor, ({})[2] = {}, 255
;({}).bottomRectColor, ({})[3] = {}, 237
;({}).topRectColor, ({})[1] = {}, 221
;({}).topRectColor, ({})[2] = {}, 246
;({}).topRectColor, ({})[3] = {}, 255
;({}).bottomRectHeight = 60
;({}).topRectHeight = 1800
;({})[1] = {}
;({})[2] = {}
;({})[3] = {}
;({})[4] = {}
;({}).flowerbush, ({})[1] = {}, "yellowparticle"
;({}).flowerbush, ({})[2] = {}, "leafparticle"
;({}).flowerbush, ({})[3] = {}, "grassparticle"
;({}).flowerbush, ({})[4] = {}, "flowerparticle"
;({}).grass, ({})[1] = {}, "grassparticle"
;({}).palmtree, ({})[1] = {}, "palmparticle"
;({}).palmtree, ({})[2] = {}, "yellowparticle"
;({}).smallpalm, ({})[1] = {}, "palmparticle"
;({}).smallpalm, ({})[2] = {}, "yellowparticle"
;({})[1] = "flowerbush"
;({})[2] = "grass"
;({})[3] = "palmtree"
;({})[4] = "smallpalm"
Theme:new(landType.JUNGLE, "jungle", "jungle", {}, {}, {}, true, "res/themes/jungle/jungle_flair.png", L8_8("jungle", "res/themes/jungle/jungle_flair.png", {}, {}), nil)
local L16_16 = L16_16
local L17_17 = L17_17
local L18_18 = L18_18
local L19_19 = L19_19
local L20_20 = L20_20
;({})[1] = 72
;({})[2] = 126
;({})[3] = 216
local L21_21 = L21_21
;({})[1] = 219
;({})[2] = 123
;({})[3] = 0
local L22_22 = L22_22
;({}).file = "res/themes/snowtheme/snow.png"
;({}).image = "snowforeground.png"
;({}).xAdjustment = 0.55
;({}).yPos = 325
;({}).bottomRectColor, ({})[1] = {}, 255
;({}).bottomRectColor, ({})[2] = {}, 255
;({}).bottomRectColor, ({})[3] = {}, 255
;({}).bottomRectHeight = 410
;({}).file = "res/themes/snowtheme/snow.png"
;({}).image = "snowmidground.png"
;({}).xAdjustment = 0.75
;({}).yPos = 625
;({}).bottomRectColor, ({})[1] = {}, 205
;({}).bottomRectColor, ({})[2] = {}, 213
;({}).bottomRectColor, ({})[3] = {}, 242
;({}).bottomRectHeight = 300
;({}).file = "res/themes/snowtheme/snow.png"
;({}).image = "snowbackground.png"
;({}).xAdjustment = 0.9
;({}).yPos = 850
;({}).bottomRectColor, ({})[1] = {}, 161
;({}).bottomRectColor, ({})[2] = {}, 160
;({}).bottomRectColor, ({})[3] = {}, 197
;({}).bottomRectHeight = 400
;({}).file = "res/themes/snowtheme/snow.png"
;({}).image = "snowsky.png"
;({}).xAdjustment = 1
;({}).yPos = 1000
;({}).bottomRectColor, ({})[1] = {}, 180
;({}).bottomRectColor, ({})[2] = {}, 211
;({}).bottomRectColor, ({})[3] = {}, 251
;({}).topRectColor, ({})[1] = {}, 124
;({}).topRectColor, ({})[2] = {}, 168
;({}).topRectColor, ({})[3] = {}, 248
;({}).bottomRectHeight = 300
;({}).topRectHeight = 1600
;({})[1] = {}
;({})[2] = {}
;({})[3] = {}
;({})[4] = {}
local L23_23 = L23_23
local L24_24 = L24_24
local L27_27 = L27_27
local L30_30 = L30_30
local L31_31 = L31_31
local L32_32 = L32_32
;({}).snowman, ({})[1] = {}, "snowparticle1"
;({}).snowman, ({})[2] = {}, "snowparticle2"
;({}).snowman, ({})[3] = {}, "snowmanparticle"
;({}).snowdrift1, ({})[1] = {}, "snowparticle1"
;({}).snowdrift1, ({})[2] = {}, "snowparticle2"
;({}).snowdrift2, ({})[1] = {}, "snowparticle1"
;({}).snowdrift2, ({})[2] = {}, "snowparticle2"
local L33_33 = L33_33
local L34_34 = L34_34
local L35_35 = L35_35
;({}).rock, ({})[1] = {}, "rockparticle1"
;({}).rock, ({})[2] = {}, "rockparticle2"
local ({}).rock, ({})[3], L36_36 = {}, "snowparticle1", L36_36
;({})[1] = "snowman"
;({})[2] = "snowdrift1"
;({})[3] = "snowdrift2"
;({})[4] = "rock"
L36_36 = L36_36("snow", "res/themes/snowtheme/snow_flair.png", {}, L20_20)
L22_22(L23_23, L24_24, L27_27, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, nil)
return L7_7
