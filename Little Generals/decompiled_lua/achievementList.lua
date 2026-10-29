local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18 = L3_3, (...), L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18
L5_5 = package
L5_5 = L5_5.seeall
L3_3(L4_4, L5_5)
L3_3 = require
L4_4 = "achievements"
L3_3(L4_4)
L3_3 = require
L4_4 = "weapon"
L3_3(L4_4)
L3_3 = "com.smarterapps.littlegenerals.hs.kills"
HIGHSCORE_KILLS = L3_3
L3_3 = "com.smarterapps.littlegenerals.hs.mpkills"
HIGHSCORE_MP_KILLS = L3_3
L3_3 = {}
nonRankAchievements = L3_3
L3_3 = 1
function L4_4()
	local L0_33, L1_34
	L0_33 = _ENV
	L0_33 = L0_33 + 1
	_ENV = L0_33
	L0_33 = _ENV
	return L0_33
end
L5_5 = 100
function L6_6()
	local L0_35, L1_36
	L0_35 = _ENV
	L0_35 = L0_35 + 1
	_ENV = L0_35
	L0_35 = _ENV
	return L0_35
end
L7_7 = 1000
function L8_8()
	local L0_37, L1_38
	L0_37 = _ENV
	L0_37 = L0_37 + 1
	_ENV = L0_37
	L0_37 = _ENV
	return L0_37
end
L9_9 = 2000
function L10_10()
	local L0_39, L1_40
	L0_39 = _ENV
	L0_39 = L0_39 + 1
	_ENV = L0_39
	L0_39 = _ENV
	return L0_39
end
L13_13 = 3000
function L14_14()
	local L0_41, L1_42
	L0_41 = _ENV
	L0_41 = L0_41 + 1
	_ENV = L0_41
	L0_41 = _ENV
	return L0_41
end
L15_15 = {}
unacknowledgedUpdates = L15_15
L15_15 = {}
Update = L15_15
L15_15 = {}
L16_16 = Update
L15_15.__index = L16_16
Update_mt = L15_15
L15_15 = Update
function L16_16(A0_43, A1_44, A2_45, A3_46)
	local L4_47
	L4_47 = {}
	L4_47.title = A1_44
	L4_47.description = A2_45
	L4_47.imageProvider = A3_46
	local L5_48 = L5_48
	local L6_49 = L6_49
	L5_48(L6_49, Update_mt)
	local L7_50 = L7_50
	return L4_47
end
L15_15.new = L16_16
L15_15 = Update
function L16_16(A0_51)
	if A0_51.achievement then
		A0_51.achievement:attain()
	end
	if A0_51.updateTwitter and A0_51.tweetText then
		require("twitterSupport")
		twitterSupport.tweet(A0_51.tweetText)
	end
	if A0_51.updateFacebook and A0_51.facebookData then
		require("facebookSupport")
		local L2_52 = L2_52
		local L3_53 = L3_53
		L2_52(L3_53, A0_51.facebookData.picture, A0_51.facebookData.description)
		local L4_54 = L4_54
	end
end
L15_15.syncWithSocialMedia = L16_16
L15_15 = Update
function L16_16(A0_55)
	local L5_60 = L5_60
	L5_60("Acknowledge", A0_55.title, A0_55.description, A0_55.tweetText, A0_55.reward)
	local L6_61 = L6_61
	L6_61 = A0_55
	L5_60 = A0_55.syncWithSocialMedia
	L5_60(L6_61)
	L5_60 = A0_55.reward
	if L5_60 then
		L5_60 = A0_55.reward
		L5_60()
	end
	L5_60 = A0_55.tableOwner
	if L5_60 then
		L5_60 = A0_55.tableRecord
		if L5_60 then
			L5_60 = table
			L5_60 = L5_60.indexOf
			L6_61 = A0_55.tableOwner
			L5_60 = L5_60(L6_61, A0_55.tableRecord)
			if L5_60 then
				L6_61 = table
				L6_61 = L6_61.remove
				L6_61(A0_55.tableOwner, L5_60)
				local L4_59 = L4_59
			end
		end
	end
	L5_60 = A0_55.imageProvider
	if L5_60 then
		L5_60 = A0_55.imageProvider
		L5_60 = L5_60.dispose
		if L5_60 then
			L5_60 = A0_55.imageProvider
			L5_60 = L5_60.dispose
			L5_60()
		end
	end
end
L15_15.acknowledge = L16_16
L15_15 = Update
function L16_16(A0_62)
	local L1_63
	L1_63 = A0_62.imageProvider
	L1_63 = L1_63 ~= nil
	return L1_63
end
L15_15.hasImage = L16_16
L15_15 = Update
function L16_16(A0_64)
	if A0_64.imageProvider then
		return A0_64.imageProvider.create()
	end
end
L15_15.createImage = L16_16
L15_15 = {}
L16_16 = value
L17_17 = update
L15_15[1] = L16_16
L15_15[2] = L17_17
RewardLevel = L15_15
L15_15 = {}
L16_16 = RewardLevel
L15_15.__index = L16_16
RewardLevel_mt = L15_15
L15_15 = {}
L16_16 = RewardLevel
function L17_17(A0_65, A1_66)
	local L2_67
	L2_67 = {}
	L2_67.value = A1_66.value
	L2_67.update = A1_66.update
	setmetatable(L2_67, RewardLevel_mt)
	local L3_68 = L3_68
	local L4_69 = L4_69
	L3_68(L4_69, L2_67)
	local L5_70 = L5_70
	L3_68 = L2_67.update
	if L3_68 then
		L3_68 = L2_67.update
		L4_69 = _ENV
		L3_68.tableOwner = L4_69
		L3_68 = L2_67.update
		L3_68.tableRecord = L2_67
	end
	return L2_67
end
L16_16.new = L17_17
L16_16 = spritesheetmanager
L16_16 = L16_16.ReferenceTracker
L17_17 = "res/achievements/achievement_icons.png"
L16_16 = L16_16(L17_17)
function L17_17(A0_71, A1_72, A2_73, A3_74, A4_75, A5_76, A6_77)
	local L7_78 = L7_78
	local L8_79 = L8_79
	;({}).achievementId = A3_74
	L7_78 = L7_78(L8_79, {})
	L8_79 = nil
	local L9_80 = L9_80
	L9_80 = L9_80 .. " " .. utils.getExternalStoreLink()
	local L10_81 = L10_81
	L10_81 = L10_81 .. [[

Check out Little Generals ]] .. utils.getExternalStoreLink()
	if A5_76 then
		({}).id = A0_71
		;({}).name = A1_72
		;({}).description = A2_73
		;({}).image = A4_75
		nonRankAchievements[A0_71], ({}).funcToCheckIfAchieved = {}, A6_77
	end
	L7_78.image = A4_75
	local L11_82 = L7_78:isAttained()
	if not L11_82 then
		L11_82 = nil
		if A4_75 then
			L11_82 = {}
			function L11_82.create()
				local L1_89 = _ENV.getSpriteSet
				L1_89 = L1_89()
				local L2_90 = L2_90
				local L3_91 = L3_91
				local L4_92 = L4_92
				do return L3_91(L4_92, L2_90, A4_75) end
				local L5_93 = L5_93
			end
			function L11_82.dispose()
				_ENV.disposeSpriteSet()
			end
		end
		local L12_83, L13_84 = L12_83, L13_84
		local L14_85 = L14_85
		local L15_86 = L15_86
		local L12_83, L16_87 = L12_83(L13_84, L14_85, L15_86, L11_82), L16_87
		L8_79 = L12_83
		L8_79.achievement = L7_78
		L8_79.tweetText = L9_80
		L12_83 = {}
		L12_83.message = L10_81
		L8_79.facebookData = L12_83
		L8_79.hideGloss = true
	end
	return L8_79
end
function L18_18(A0_94, A1_95, A2_96, A3_97, A4_98)
	local L5_99 = L5_99
	local L6_100 = L6_100
	local L7_101 = L7_101
	local L8_102 = L8_102
	local L9_103 = L9_103
	local L10_104 = L10_104
	local L11_105 = L11_105
	local L5_99, L12_106 = L5_99(L6_100, L7_101, L8_102, L9_103, L10_104, L11_105, nil), L12_106
	if L5_99 then
		function L6_100()
			settings:set("rank.id", _ENV)
			local L2_108 = L2_108
			L2_108(settings, "rank.name", A1_95)
			local L3_109 = L3_109
			L2_108 = settings
			L3_109 = L2_108
			L2_108 = L2_108.save
			L2_108(L3_109)
		end
		L5_99.reward = L6_100
	end
	return L5_99
end
RewardLevel:new((function(A0_110, A1_111)
	local L2_112, L3_113 = L2_112, L3_113
	local L4_114 = L4_114
	L2_112 = L2_112(L3_113, L4_114, {})
	L3_113 = nil
	L4_114 = "Cha-Ching!"
	local L5_115 = L5_115
	L5_115 = L5_115 .. tostring(A1_111) .. " Warbux as a reward for your awesomeness!"
	local L6_116 = L6_116
	L6_116 = L6_116 .. tostring(A1_111) .. " Warbux as a reward for my awesomeness! " .. utils.getExternalStoreLink()
	local L7_117 = L7_117
	L7_117 = L7_117 .. tostring(A1_111) .. " Warbux as a reward for my awesomeness! Check out Little Generals " .. utils.getExternalStoreLink()
	local L8_118 = L8_118
	L8_118 = L8_118(L2_112, A0_110)
	if not L8_118 then
		L8_118 = nil
		L8_118 = {}
		function L8_118.create()
			local L1_125 = _ENV.getSpriteSet
			L1_125 = L1_125()
			local L2_126 = L2_126
			local L3_127 = L3_127
			local L4_128 = L4_128
			do return L3_127(L4_128, L2_126, "warbux.png") end
			local L5_129 = L5_129
		end
		function L8_118.dispose()
			_ENV.disposeSpriteSet()
		end
		local L9_119, L10_120 = L9_119, L10_120
		local L11_121 = L11_121
		local L12_122 = L12_122
		local L9_119, L13_123 = L9_119(L10_120, L11_121, L12_122, L8_118), L13_123
		L3_113 = L9_119
		L3_113.hideGloss = true
		function L9_119()
			_ENV[#_ENV + 1] = A0_110
			warbux:credit(A1_111)
			local L2_132 = L2_132
			L2_132(settings, "rank.cash.unlocked", _ENV)
			local L3_133 = L3_133
			L2_132 = settings
			L3_133 = L2_132
			L2_132 = L2_132.save
			L2_132(L3_133)
		end
		L3_113.reward = L9_119
		L3_113.tweetText = L6_116
		L9_119 = {}
		L9_119.message = L7_117
		L3_113.facebookData = L9_119
	end
	L8_118 = {}
	L8_118.value = A0_110
	L8_118.update = L3_113
	return L8_118
end)(3, 100))
RewardLevel:new((function(A0_134, A1_135)
	local L2_136, L3_137 = L2_136, L3_137
	local L4_138 = L4_138
	L2_136 = L2_136(L3_137, L4_138, {})
	L3_137 = nil
	L4_138 = "Cha-Ching!"
	local L5_139 = L5_139
	L5_139 = L5_139 .. tostring(A1_135) .. " Warbux as a reward for your awesomeness!"
	local L6_140 = L6_140
	L6_140 = L6_140 .. tostring(A1_135) .. " Warbux as a reward for my awesomeness! " .. utils.getExternalStoreLink()
	local L7_141 = L7_141
	L7_141 = L7_141 .. tostring(A1_135) .. " Warbux as a reward for my awesomeness! Check out Little Generals " .. utils.getExternalStoreLink()
	local L8_142 = L8_142
	L8_142 = L8_142(L2_136, A0_134)
	if not L8_142 then
		L8_142 = nil
		L8_142 = {}
		function L8_142.create()
			local L1_149 = _ENV.getSpriteSet
			L1_149 = L1_149()
			local L2_150 = L2_150
			local L3_151 = L3_151
			local L4_152 = L4_152
			do return L3_151(L4_152, L2_150, "warbux.png") end
			local L5_153 = L5_153
		end
		function L8_142.dispose()
			_ENV.disposeSpriteSet()
		end
		local L9_143, L10_144 = L9_143, L10_144
		local L11_145 = L11_145
		local L12_146 = L12_146
		local L9_143, L13_147 = L9_143(L10_144, L11_145, L12_146, L8_142), L13_147
		L3_137 = L9_143
		L3_137.hideGloss = true
		function L9_143()
			_ENV[#_ENV + 1] = A0_110
			warbux:credit(A1_111)
			local L2_156 = L2_156
			L2_156(settings, "rank.cash.unlocked", _ENV)
			local L3_157 = L3_157
			L2_156 = settings
			L3_157 = L2_156
			L2_156 = L2_156.save
			L2_156(L3_157)
		end
		L3_137.reward = L9_143
		L3_137.tweetText = L6_140
		L9_143 = {}
		L9_143.message = L7_141
		L3_137.facebookData = L9_143
	end
	L8_142 = {}
	L8_142.value = A0_134
	L8_142.update = L3_137
	return L8_142
end)(24, 100))
RewardLevel:new((function(A0_158, A1_159)
	local L2_160, L3_161 = L2_160, L3_161
	local L4_162 = L4_162
	L2_160 = L2_160(L3_161, L4_162, {})
	L3_161 = nil
	L4_162 = "Cha-Ching!"
	local L5_163 = L5_163
	L5_163 = L5_163 .. tostring(A1_159) .. " Warbux as a reward for your awesomeness!"
	local L6_164 = L6_164
	L6_164 = L6_164 .. tostring(A1_159) .. " Warbux as a reward for my awesomeness! " .. utils.getExternalStoreLink()
	local L7_165 = L7_165
	L7_165 = L7_165 .. tostring(A1_159) .. " Warbux as a reward for my awesomeness! Check out Little Generals " .. utils.getExternalStoreLink()
	local L8_166 = L8_166
	L8_166 = L8_166(L2_160, A0_158)
	if not L8_166 then
		L8_166 = nil
		L8_166 = {}
		function L8_166.create()
			local L1_173 = _ENV.getSpriteSet
			L1_173 = L1_173()
			local L2_174 = L2_174
			local L3_175 = L3_175
			local L4_176 = L4_176
			do return L3_175(L4_176, L2_174, "warbux.png") end
			local L5_177 = L5_177
		end
		function L8_166.dispose()
			_ENV.disposeSpriteSet()
		end
		local L9_167, L10_168 = L9_167, L10_168
		local L11_169 = L11_169
		local L12_170 = L12_170
		local L9_167, L13_171 = L9_167(L10_168, L11_169, L12_170, L8_166), L13_171
		L3_161 = L9_167
		L3_161.hideGloss = true
		function L9_167()
			_ENV[#_ENV + 1] = A0_110
			warbux:credit(A1_111)
			local L2_180 = L2_180
			L2_180(settings, "rank.cash.unlocked", _ENV)
			local L3_181 = L3_181
			L2_180 = settings
			L3_181 = L2_180
			L2_180 = L2_180.save
			L2_180(L3_181)
		end
		L3_161.reward = L9_167
		L3_161.tweetText = L6_164
		L9_167 = {}
		L9_167.message = L7_165
		L3_161.facebookData = L9_167
	end
	L8_166 = {}
	L8_166.value = A0_158
	L8_166.update = L3_161
	return L8_166
end)(37, 150))
RewardLevel:new((function(A0_182, A1_183)
	local L2_184, L3_185 = L2_184, L3_185
	local L4_186 = L4_186
	L2_184 = L2_184(L3_185, L4_186, {})
	L3_185 = nil
	L4_186 = "Cha-Ching!"
	local L5_187 = L5_187
	L5_187 = L5_187 .. tostring(A1_183) .. " Warbux as a reward for your awesomeness!"
	local L6_188 = L6_188
	L6_188 = L6_188 .. tostring(A1_183) .. " Warbux as a reward for my awesomeness! " .. utils.getExternalStoreLink()
	local L7_189 = L7_189
	L7_189 = L7_189 .. tostring(A1_183) .. " Warbux as a reward for my awesomeness! Check out Little Generals " .. utils.getExternalStoreLink()
	local L8_190 = L8_190
	L8_190 = L8_190(L2_184, A0_182)
	if not L8_190 then
		L8_190 = nil
		L8_190 = {}
		function L8_190.create()
			local L1_197 = _ENV.getSpriteSet
			L1_197 = L1_197()
			local L2_198 = L2_198
			local L3_199 = L3_199
			local L4_200 = L4_200
			do return L3_199(L4_200, L2_198, "warbux.png") end
			local L5_201 = L5_201
		end
		function L8_190.dispose()
			_ENV.disposeSpriteSet()
		end
		local L9_191, L10_192 = L9_191, L10_192
		local L11_193 = L11_193
		local L12_194 = L12_194
		local L9_191, L13_195 = L9_191(L10_192, L11_193, L12_194, L8_190), L13_195
		L3_185 = L9_191
		L3_185.hideGloss = true
		function L9_191()
			_ENV[#_ENV + 1] = A0_110
			warbux:credit(A1_111)
			local L2_204 = L2_204
			L2_204(settings, "rank.cash.unlocked", _ENV)
			local L3_205 = L3_205
			L2_204 = settings
			L3_205 = L2_204
			L2_204 = L2_204.save
			L2_204(L3_205)
		end
		L3_185.reward = L9_191
		L3_185.tweetText = L6_188
		L9_191 = {}
		L9_191.message = L7_189
		L3_185.facebookData = L9_191
	end
	L8_190 = {}
	L8_190.value = A0_182
	L8_190.update = L3_185
	return L8_190
end)(53, 150))
RewardLevel:new((function(A0_206, A1_207)
	local L2_208, L3_209 = L2_208, L3_209
	local L4_210 = L4_210
	L2_208 = L2_208(L3_209, L4_210, {})
	L3_209 = nil
	L4_210 = "Cha-Ching!"
	local L5_211 = L5_211
	L5_211 = L5_211 .. tostring(A1_207) .. " Warbux as a reward for your awesomeness!"
	local L6_212 = L6_212
	L6_212 = L6_212 .. tostring(A1_207) .. " Warbux as a reward for my awesomeness! " .. utils.getExternalStoreLink()
	local L7_213 = L7_213
	L7_213 = L7_213 .. tostring(A1_207) .. " Warbux as a reward for my awesomeness! Check out Little Generals " .. utils.getExternalStoreLink()
	local L8_214 = L8_214
	L8_214 = L8_214(L2_208, A0_206)
	if not L8_214 then
		L8_214 = nil
		L8_214 = {}
		function L8_214.create()
			local L1_221 = _ENV.getSpriteSet
			L1_221 = L1_221()
			local L2_222 = L2_222
			local L3_223 = L3_223
			local L4_224 = L4_224
			do return L3_223(L4_224, L2_222, "warbux.png") end
			local L5_225 = L5_225
		end
		function L8_214.dispose()
			_ENV.disposeSpriteSet()
		end
		local L9_215, L10_216 = L9_215, L10_216
		local L11_217 = L11_217
		local L12_218 = L12_218
		local L9_215, L13_219 = L9_215(L10_216, L11_217, L12_218, L8_214), L13_219
		L3_209 = L9_215
		L3_209.hideGloss = true
		function L9_215()
			_ENV[#_ENV + 1] = A0_110
			warbux:credit(A1_111)
			local L2_228 = L2_228
			L2_228(settings, "rank.cash.unlocked", _ENV)
			local L3_229 = L3_229
			L2_228 = settings
			L3_229 = L2_228
			L2_228 = L2_228.save
			L2_228(L3_229)
		end
		L3_209.reward = L9_215
		L3_209.tweetText = L6_212
		L9_215 = {}
		L9_215.message = L7_213
		L3_209.facebookData = L9_215
	end
	L8_214 = {}
	L8_214.value = A0_206
	L8_214.update = L3_209
	return L8_214
end)(63, 200))
RewardLevel:new((function(A0_230, A1_231)
	local L2_232, L3_233 = L2_232, L3_233
	local L4_234 = L4_234
	L2_232 = L2_232(L3_233, L4_234, {})
	L3_233 = nil
	L4_234 = "Cha-Ching!"
	local L5_235 = L5_235
	L5_235 = L5_235 .. tostring(A1_231) .. " Warbux as a reward for your awesomeness!"
	local L6_236 = L6_236
	L6_236 = L6_236 .. tostring(A1_231) .. " Warbux as a reward for my awesomeness! " .. utils.getExternalStoreLink()
	local L7_237 = L7_237
	L7_237 = L7_237 .. tostring(A1_231) .. " Warbux as a reward for my awesomeness! Check out Little Generals " .. utils.getExternalStoreLink()
	local L8_238 = L8_238
	L8_238 = L8_238(L2_232, A0_230)
	if not L8_238 then
		L8_238 = nil
		L8_238 = {}
		function L8_238.create()
			local L1_245 = _ENV.getSpriteSet
			L1_245 = L1_245()
			local L2_246 = L2_246
			local L3_247 = L3_247
			local L4_248 = L4_248
			do return L3_247(L4_248, L2_246, "warbux.png") end
			local L5_249 = L5_249
		end
		function L8_238.dispose()
			_ENV.disposeSpriteSet()
		end
		local L9_239, L10_240 = L9_239, L10_240
		local L11_241 = L11_241
		local L12_242 = L12_242
		local L9_239, L13_243 = L9_239(L10_240, L11_241, L12_242, L8_238), L13_243
		L3_233 = L9_239
		L3_233.hideGloss = true
		function L9_239()
			_ENV[#_ENV + 1] = A0_110
			warbux:credit(A1_111)
			local L2_252 = L2_252
			L2_252(settings, "rank.cash.unlocked", _ENV)
			local L3_253 = L3_253
			L2_252 = settings
			L3_253 = L2_252
			L2_252 = L2_252.save
			L2_252(L3_253)
		end
		L3_233.reward = L9_239
		L3_233.tweetText = L6_236
		L9_239 = {}
		L9_239.message = L7_237
		L3_233.facebookData = L9_239
	end
	L8_238 = {}
	L8_238.value = A0_230
	L8_238.update = L3_233
	return L8_238
end)(72, 200))
RewardLevel:new((function(A0_254, A1_255)
	local L2_256, L3_257 = L2_256, L3_257
	local L4_258 = L4_258
	L2_256 = L2_256(L3_257, L4_258, {})
	L3_257 = nil
	L4_258 = "Cha-Ching!"
	local L5_259 = L5_259
	L5_259 = L5_259 .. tostring(A1_255) .. " Warbux as a reward for your awesomeness!"
	local L6_260 = L6_260
	L6_260 = L6_260 .. tostring(A1_255) .. " Warbux as a reward for my awesomeness! " .. utils.getExternalStoreLink()
	local L7_261 = L7_261
	L7_261 = L7_261 .. tostring(A1_255) .. " Warbux as a reward for my awesomeness! Check out Little Generals " .. utils.getExternalStoreLink()
	local L8_262 = L8_262
	L8_262 = L8_262(L2_256, A0_254)
	if not L8_262 then
		L8_262 = nil
		L8_262 = {}
		function L8_262.create()
			local L1_269 = _ENV.getSpriteSet
			L1_269 = L1_269()
			local L2_270 = L2_270
			local L3_271 = L3_271
			local L4_272 = L4_272
			do return L3_271(L4_272, L2_270, "warbux.png") end
			local L5_273 = L5_273
		end
		function L8_262.dispose()
			_ENV.disposeSpriteSet()
		end
		local L9_263, L10_264 = L9_263, L10_264
		local L11_265 = L11_265
		local L12_266 = L12_266
		local L9_263, L13_267 = L9_263(L10_264, L11_265, L12_266, L8_262), L13_267
		L3_257 = L9_263
		L3_257.hideGloss = true
		function L9_263()
			_ENV[#_ENV + 1] = A0_110
			warbux:credit(A1_111)
			local L2_276 = L2_276
			L2_276(settings, "rank.cash.unlocked", _ENV)
			local L3_277 = L3_277
			L2_276 = settings
			L3_277 = L2_276
			L2_276 = L2_276.save
			L2_276(L3_277)
		end
		L3_257.reward = L9_263
		L3_257.tweetText = L6_260
		L9_263 = {}
		L9_263.message = L7_261
		L3_257.facebookData = L9_263
	end
	L8_262 = {}
	L8_262.value = A0_254
	L8_262.update = L3_257
	return L8_262
end)(82, 300))
RewardLevel:new((function(A0_278, A1_279)
	local L2_280, L3_281, L4_282
	L2_280 = weaponTypes
	L2_280 = L2_280[A1_279]
	L3_281 = {}
	L4_282 = nil
	L4_282 = {}
	function L4_282.create()
		local L0_290, L1_291 = getWeaponSpriteSet()
		local L2_292 = L2_292
		local L3_293 = L3_293
		local L4_294 = L4_294
		local L6_296 = _ENV.listImage .. ".png"
		return L2_292(L3_293, L4_294, L6_296)
	end
	local L5_283 = L5_283
	local L6_284 = L6_284
	local L7_285 = L7_285
	local L8_286 = L8_286
	local L9_287 = L9_287
	local L10_288 = L10_288
	local L5_283, L11_289 = L5_283(L6_284, L7_285, L8_286, L9_287, L10_288, L4_282), L11_289
	L6_284 = L5_283.update
	if L6_284 then
		L6_284 = weaponTypes
		L6_284 = L6_284[A1_279]
		L6_284 = L6_284.inventory
		if L6_284 then
			L6_284 = L5_283.update
			L6_284 = L6_284.reward
			L7_285 = L5_283.update
			function L8_286()
				_ENV()
				local L1_297 = L1_297
				L1_297(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_298 = L2_298
			end
			L7_285.reward = L8_286
		end
	end
	L6_284 = {}
	L7_285 = L5_283.value
	L6_284.value = L7_285
	L7_285 = L5_283.update
	L6_284.update = L7_285
	return L6_284
end)(2, weaponTypes.MISSILE))
RewardLevel:new((function(A0_299, A1_300)
	local L2_301, L3_302, L4_303
	L2_301 = weaponTypes
	L2_301 = L2_301[A1_300]
	L3_302 = {}
	L4_303 = nil
	L4_303 = {}
	function L4_303.create()
		local L0_311, L1_312 = getWeaponSpriteSet()
		local L2_313 = L2_313
		local L3_314 = L3_314
		local L4_315 = L4_315
		local L6_317 = _ENV.listImage .. ".png"
		return L2_313(L3_314, L4_315, L6_317)
	end
	local L5_304 = L5_304
	local L6_305 = L6_305
	local L7_306 = L7_306
	local L8_307 = L8_307
	local L9_308 = L9_308
	local L10_309 = L10_309
	local L5_304, L11_310 = L5_304(L6_305, L7_306, L8_307, L9_308, L10_309, L4_303), L11_310
	L6_305 = L5_304.update
	if L6_305 then
		L6_305 = weaponTypes
		L6_305 = L6_305[A1_300]
		L6_305 = L6_305.inventory
		if L6_305 then
			L6_305 = L5_304.update
			L6_305 = L6_305.reward
			L7_306 = L5_304.update
			function L8_307()
				_ENV()
				local L1_318 = L1_318
				L1_318(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_319 = L2_319
			end
			L7_306.reward = L8_307
		end
	end
	L6_305 = {}
	L7_306 = L5_304.value
	L6_305.value = L7_306
	L7_306 = L5_304.update
	L6_305.update = L7_306
	return L6_305
end)(5, weaponTypes.DRILL))
RewardLevel:new((function(A0_320, A1_321)
	local L2_322, L3_323, L4_324
	L2_322 = weaponTypes
	L2_322 = L2_322[A1_321]
	L3_323 = {}
	L4_324 = nil
	L4_324 = {}
	function L4_324.create()
		local L0_332, L1_333 = getWeaponSpriteSet()
		local L2_334 = L2_334
		local L3_335 = L3_335
		local L4_336 = L4_336
		local L6_338 = _ENV.listImage .. ".png"
		return L2_334(L3_335, L4_336, L6_338)
	end
	local L5_325 = L5_325
	local L6_326 = L6_326
	local L7_327 = L7_327
	local L8_328 = L8_328
	local L9_329 = L9_329
	local L10_330 = L10_330
	local L5_325, L11_331 = L5_325(L6_326, L7_327, L8_328, L9_329, L10_330, L4_324), L11_331
	L6_326 = L5_325.update
	if L6_326 then
		L6_326 = weaponTypes
		L6_326 = L6_326[A1_321]
		L6_326 = L6_326.inventory
		if L6_326 then
			L6_326 = L5_325.update
			L6_326 = L6_326.reward
			L7_327 = L5_325.update
			function L8_328()
				_ENV()
				local L1_339 = L1_339
				L1_339(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_340 = L2_340
			end
			L7_327.reward = L8_328
		end
	end
	L6_326 = {}
	L7_327 = L5_325.value
	L6_326.value = L7_327
	L7_327 = L5_325.update
	L6_326.update = L7_327
	return L6_326
end)(8, weaponTypes.BABY_ROLLER))
RewardLevel:new((function(A0_341, A1_342)
	local L2_343, L3_344, L4_345
	L2_343 = weaponTypes
	L2_343 = L2_343[A1_342]
	L3_344 = {}
	L4_345 = nil
	L4_345 = {}
	function L4_345.create()
		local L0_353, L1_354 = getWeaponSpriteSet()
		local L2_355 = L2_355
		local L3_356 = L3_356
		local L4_357 = L4_357
		local L6_359 = _ENV.listImage .. ".png"
		return L2_355(L3_356, L4_357, L6_359)
	end
	local L5_346 = L5_346
	local L6_347 = L6_347
	local L7_348 = L7_348
	local L8_349 = L8_349
	local L9_350 = L9_350
	local L10_351 = L10_351
	local L5_346, L11_352 = L5_346(L6_347, L7_348, L8_349, L9_350, L10_351, L4_345), L11_352
	L6_347 = L5_346.update
	if L6_347 then
		L6_347 = weaponTypes
		L6_347 = L6_347[A1_342]
		L6_347 = L6_347.inventory
		if L6_347 then
			L6_347 = L5_346.update
			L6_347 = L6_347.reward
			L7_348 = L5_346.update
			function L8_349()
				_ENV()
				local L1_360 = L1_360
				L1_360(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_361 = L2_361
			end
			L7_348.reward = L8_349
		end
	end
	L6_347 = {}
	L7_348 = L5_346.value
	L6_347.value = L7_348
	L7_348 = L5_346.update
	L6_347.update = L7_348
	return L6_347
end)(10, weaponTypes.SAND_WEDGE))
RewardLevel:new((function(A0_362, A1_363)
	local L2_364, L3_365, L4_366
	L2_364 = weaponTypes
	L2_364 = L2_364[A1_363]
	L3_365 = {}
	L4_366 = nil
	L4_366 = {}
	function L4_366.create()
		local L0_374, L1_375 = getWeaponSpriteSet()
		local L2_376 = L2_376
		local L3_377 = L3_377
		local L4_378 = L4_378
		local L6_380 = _ENV.listImage .. ".png"
		return L2_376(L3_377, L4_378, L6_380)
	end
	local L5_367 = L5_367
	local L6_368 = L6_368
	local L7_369 = L7_369
	local L8_370 = L8_370
	local L9_371 = L9_371
	local L10_372 = L10_372
	local L5_367, L11_373 = L5_367(L6_368, L7_369, L8_370, L9_371, L10_372, L4_366), L11_373
	L6_368 = L5_367.update
	if L6_368 then
		L6_368 = weaponTypes
		L6_368 = L6_368[A1_363]
		L6_368 = L6_368.inventory
		if L6_368 then
			L6_368 = L5_367.update
			L6_368 = L6_368.reward
			L7_369 = L5_367.update
			function L8_370()
				_ENV()
				local L1_381 = L1_381
				L1_381(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_382 = L2_382
			end
			L7_369.reward = L8_370
		end
	end
	L6_368 = {}
	L7_369 = L5_367.value
	L6_368.value = L7_369
	L7_369 = L5_367.update
	L6_368.update = L7_369
	return L6_368
end)(13, weaponTypes.NAPALM))
RewardLevel:new((function(A0_383, A1_384)
	local L2_385, L3_386, L4_387
	L2_385 = weaponTypes
	L2_385 = L2_385[A1_384]
	L3_386 = {}
	L4_387 = nil
	L4_387 = {}
	function L4_387.create()
		local L0_395, L1_396 = getWeaponSpriteSet()
		local L2_397 = L2_397
		local L3_398 = L3_398
		local L4_399 = L4_399
		local L6_401 = _ENV.listImage .. ".png"
		return L2_397(L3_398, L4_399, L6_401)
	end
	local L5_388 = L5_388
	local L6_389 = L6_389
	local L7_390 = L7_390
	local L8_391 = L8_391
	local L9_392 = L9_392
	local L10_393 = L10_393
	local L5_388, L11_394 = L5_388(L6_389, L7_390, L8_391, L9_392, L10_393, L4_387), L11_394
	L6_389 = L5_388.update
	if L6_389 then
		L6_389 = weaponTypes
		L6_389 = L6_389[A1_384]
		L6_389 = L6_389.inventory
		if L6_389 then
			L6_389 = L5_388.update
			L6_389 = L6_389.reward
			L7_390 = L5_388.update
			function L8_391()
				_ENV()
				local L1_402 = L1_402
				L1_402(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_403 = L2_403
			end
			L7_390.reward = L8_391
		end
	end
	L6_389 = {}
	L7_390 = L5_388.value
	L6_389.value = L7_390
	L7_390 = L5_388.update
	L6_389.update = L7_390
	return L6_389
end)(20, weaponTypes.SAND_BOMB))
RewardLevel:new((function(A0_404, A1_405)
	local L2_406, L3_407, L4_408
	L2_406 = weaponTypes
	L2_406 = L2_406[A1_405]
	L3_407 = {}
	L4_408 = nil
	L4_408 = {}
	function L4_408.create()
		local L0_416, L1_417 = getWeaponSpriteSet()
		local L2_418 = L2_418
		local L3_419 = L3_419
		local L4_420 = L4_420
		local L6_422 = _ENV.listImage .. ".png"
		return L2_418(L3_419, L4_420, L6_422)
	end
	local L5_409 = L5_409
	local L6_410 = L6_410
	local L7_411 = L7_411
	local L8_412 = L8_412
	local L9_413 = L9_413
	local L10_414 = L10_414
	local L5_409, L11_415 = L5_409(L6_410, L7_411, L8_412, L9_413, L10_414, L4_408), L11_415
	L6_410 = L5_409.update
	if L6_410 then
		L6_410 = weaponTypes
		L6_410 = L6_410[A1_405]
		L6_410 = L6_410.inventory
		if L6_410 then
			L6_410 = L5_409.update
			L6_410 = L6_410.reward
			L7_411 = L5_409.update
			function L8_412()
				_ENV()
				local L1_423 = L1_423
				L1_423(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_424 = L2_424
			end
			L7_411.reward = L8_412
		end
	end
	L6_410 = {}
	L7_411 = L5_409.value
	L6_410.value = L7_411
	L7_411 = L5_409.update
	L6_410.update = L7_411
	return L6_410
end)(30, weaponTypes.BIG_ROLLER))
RewardLevel:new((function(A0_425, A1_426)
	local L2_427, L3_428, L4_429
	L2_427 = weaponTypes
	L2_427 = L2_427[A1_426]
	L3_428 = {}
	L4_429 = nil
	L4_429 = {}
	function L4_429.create()
		local L0_437, L1_438 = getWeaponSpriteSet()
		local L2_439 = L2_439
		local L3_440 = L3_440
		local L4_441 = L4_441
		local L6_443 = _ENV.listImage .. ".png"
		return L2_439(L3_440, L4_441, L6_443)
	end
	local L5_430 = L5_430
	local L6_431 = L6_431
	local L7_432 = L7_432
	local L8_433 = L8_433
	local L9_434 = L9_434
	local L10_435 = L10_435
	local L5_430, L11_436 = L5_430(L6_431, L7_432, L8_433, L9_434, L10_435, L4_429), L11_436
	L6_431 = L5_430.update
	if L6_431 then
		L6_431 = weaponTypes
		L6_431 = L6_431[A1_426]
		L6_431 = L6_431.inventory
		if L6_431 then
			L6_431 = L5_430.update
			L6_431 = L6_431.reward
			L7_432 = L5_430.update
			function L8_433()
				_ENV()
				local L1_444 = L1_444
				L1_444(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_445 = L2_445
			end
			L7_432.reward = L8_433
		end
	end
	L6_431 = {}
	L7_432 = L5_430.value
	L6_431.value = L7_432
	L7_432 = L5_430.update
	L6_431.update = L7_432
	return L6_431
end)(50, weaponTypes.GRENADE))
RewardLevel:new((function(A0_446, A1_447)
	local L2_448, L3_449, L4_450
	L2_448 = weaponTypes
	L2_448 = L2_448[A1_447]
	L3_449 = {}
	L4_450 = nil
	L4_450 = {}
	function L4_450.create()
		local L0_458, L1_459 = getWeaponSpriteSet()
		local L2_460 = L2_460
		local L3_461 = L3_461
		local L4_462 = L4_462
		local L6_464 = _ENV.listImage .. ".png"
		return L2_460(L3_461, L4_462, L6_464)
	end
	local L5_451 = L5_451
	local L6_452 = L6_452
	local L7_453 = L7_453
	local L8_454 = L8_454
	local L9_455 = L9_455
	local L10_456 = L10_456
	local L5_451, L11_457 = L5_451(L6_452, L7_453, L8_454, L9_455, L10_456, L4_450), L11_457
	L6_452 = L5_451.update
	if L6_452 then
		L6_452 = weaponTypes
		L6_452 = L6_452[A1_447]
		L6_452 = L6_452.inventory
		if L6_452 then
			L6_452 = L5_451.update
			L6_452 = L6_452.reward
			L7_453 = L5_451.update
			function L8_454()
				_ENV()
				local L1_465 = L1_465
				L1_465(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_466 = L2_466
			end
			L7_453.reward = L8_454
		end
	end
	L6_452 = {}
	L7_453 = L5_451.value
	L6_452.value = L7_453
	L7_453 = L5_451.update
	L6_452.update = L7_453
	return L6_452
end)(70, weaponTypes.FUNKY_BOMB))
RewardLevel:new((function(A0_467, A1_468)
	local L2_469, L3_470, L4_471
	L2_469 = weaponTypes
	L2_469 = L2_469[A1_468]
	L3_470 = {}
	L4_471 = nil
	L4_471 = {}
	function L4_471.create()
		local L0_479, L1_480 = getWeaponSpriteSet()
		local L2_481 = L2_481
		local L3_482 = L3_482
		local L4_483 = L4_483
		local L6_485 = _ENV.listImage .. ".png"
		return L2_481(L3_482, L4_483, L6_485)
	end
	local L5_472 = L5_472
	local L6_473 = L6_473
	local L7_474 = L7_474
	local L8_475 = L8_475
	local L9_476 = L9_476
	local L10_477 = L10_477
	local L5_472, L11_478 = L5_472(L6_473, L7_474, L8_475, L9_476, L10_477, L4_471), L11_478
	L6_473 = L5_472.update
	if L6_473 then
		L6_473 = weaponTypes
		L6_473 = L6_473[A1_468]
		L6_473 = L6_473.inventory
		if L6_473 then
			L6_473 = L5_472.update
			L6_473 = L6_473.reward
			L7_474 = L5_472.update
			function L8_475()
				_ENV()
				local L1_486 = L1_486
				L1_486(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_487 = L2_487
			end
			L7_474.reward = L8_475
		end
	end
	L6_473 = {}
	L7_474 = L5_472.value
	L6_473.value = L7_474
	L7_474 = L5_472.update
	L6_473.update = L7_474
	return L6_473
end)(90, weaponTypes.LASER))
RewardLevel:new((function(A0_488, A1_489)
	local L2_490, L3_491, L4_492
	L2_490 = weaponTypes
	L2_490 = L2_490[A1_489]
	L3_491 = {}
	L4_492 = nil
	L4_492 = {}
	function L4_492.create()
		local L0_500, L1_501 = getWeaponSpriteSet()
		local L2_502 = L2_502
		local L3_503 = L3_503
		local L4_504 = L4_504
		local L6_506 = _ENV.listImage .. ".png"
		return L2_502(L3_503, L4_504, L6_506)
	end
	local L5_493 = L5_493
	local L6_494 = L6_494
	local L7_495 = L7_495
	local L8_496 = L8_496
	local L9_497 = L9_497
	local L10_498 = L10_498
	local L5_493, L11_499 = L5_493(L6_494, L7_495, L8_496, L9_497, L10_498, L4_492), L11_499
	L6_494 = L5_493.update
	if L6_494 then
		L6_494 = weaponTypes
		L6_494 = L6_494[A1_489]
		L6_494 = L6_494.inventory
		if L6_494 then
			L6_494 = L5_493.update
			L6_494 = L6_494.reward
			L7_495 = L5_493.update
			function L8_496()
				_ENV()
				local L1_507 = L1_507
				L1_507(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_508 = L2_508
			end
			L7_495.reward = L8_496
		end
	end
	L6_494 = {}
	L7_495 = L5_493.value
	L6_494.value = L7_495
	L7_495 = L5_493.update
	L6_494.update = L7_495
	return L6_494
end)(110, weaponTypes.MIRV))
RewardLevel:new((function(A0_509, A1_510)
	local L2_511, L3_512, L4_513
	L2_511 = weaponTypes
	L2_511 = L2_511[A1_510]
	L3_512 = {}
	L4_513 = nil
	L4_513 = {}
	function L4_513.create()
		local L0_521, L1_522 = getWeaponSpriteSet()
		local L2_523 = L2_523
		local L3_524 = L3_524
		local L4_525 = L4_525
		local L6_527 = _ENV.listImage .. ".png"
		return L2_523(L3_524, L4_525, L6_527)
	end
	local L5_514 = L5_514
	local L6_515 = L6_515
	local L7_516 = L7_516
	local L8_517 = L8_517
	local L9_518 = L9_518
	local L10_519 = L10_519
	local L5_514, L11_520 = L5_514(L6_515, L7_516, L8_517, L9_518, L10_519, L4_513), L11_520
	L6_515 = L5_514.update
	if L6_515 then
		L6_515 = weaponTypes
		L6_515 = L6_515[A1_510]
		L6_515 = L6_515.inventory
		if L6_515 then
			L6_515 = L5_514.update
			L6_515 = L6_515.reward
			L7_516 = L5_514.update
			function L8_517()
				_ENV()
				local L1_528 = L1_528
				L1_528(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_529 = L2_529
			end
			L7_516.reward = L8_517
		end
	end
	L6_515 = {}
	L7_516 = L5_514.value
	L6_515.value = L7_516
	L7_516 = L5_514.update
	L6_515.update = L7_516
	return L6_515
end)(130, weaponTypes.BABY_NUKE))
RewardLevel:new((function(A0_530, A1_531)
	local L2_532, L3_533, L4_534
	L2_532 = weaponTypes
	L2_532 = L2_532[A1_531]
	L3_533 = {}
	L4_534 = nil
	L4_534 = {}
	function L4_534.create()
		local L0_542, L1_543 = getWeaponSpriteSet()
		local L2_544 = L2_544
		local L3_545 = L3_545
		local L4_546 = L4_546
		local L6_548 = _ENV.listImage .. ".png"
		return L2_544(L3_545, L4_546, L6_548)
	end
	local L5_535 = L5_535
	local L6_536 = L6_536
	local L7_537 = L7_537
	local L8_538 = L8_538
	local L9_539 = L9_539
	local L10_540 = L10_540
	local L5_535, L11_541 = L5_535(L6_536, L7_537, L8_538, L9_539, L10_540, L4_534), L11_541
	L6_536 = L5_535.update
	if L6_536 then
		L6_536 = weaponTypes
		L6_536 = L6_536[A1_531]
		L6_536 = L6_536.inventory
		if L6_536 then
			L6_536 = L5_535.update
			L6_536 = L6_536.reward
			L7_537 = L5_535.update
			function L8_538()
				_ENV()
				local L1_549 = L1_549
				L1_549(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_550 = L2_550
			end
			L7_537.reward = L8_538
		end
	end
	L6_536 = {}
	L7_537 = L5_535.value
	L6_536.value = L7_537
	L7_537 = L5_535.update
	L6_536.update = L7_537
	return L6_536
end)(150, weaponTypes.BABY_SHIELD))
RewardLevel:new((function(A0_551, A1_552)
	local L2_553, L3_554, L4_555
	L2_553 = weaponTypes
	L2_553 = L2_553[A1_552]
	L3_554 = {}
	L4_555 = nil
	L4_555 = {}
	function L4_555.create()
		local L0_563, L1_564 = getWeaponSpriteSet()
		local L2_565 = L2_565
		local L3_566 = L3_566
		local L4_567 = L4_567
		local L6_569 = _ENV.listImage .. ".png"
		return L2_565(L3_566, L4_567, L6_569)
	end
	local L5_556 = L5_556
	local L6_557 = L6_557
	local L7_558 = L7_558
	local L8_559 = L8_559
	local L9_560 = L9_560
	local L10_561 = L10_561
	local L5_556, L11_562 = L5_556(L6_557, L7_558, L8_559, L9_560, L10_561, L4_555), L11_562
	L6_557 = L5_556.update
	if L6_557 then
		L6_557 = weaponTypes
		L6_557 = L6_557[A1_552]
		L6_557 = L6_557.inventory
		if L6_557 then
			L6_557 = L5_556.update
			L6_557 = L6_557.reward
			L7_558 = L5_556.update
			function L8_559()
				_ENV()
				local L1_570 = L1_570
				L1_570(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_571 = L2_571
			end
			L7_558.reward = L8_559
		end
	end
	L6_557 = {}
	L7_558 = L5_556.value
	L6_557.value = L7_558
	L7_558 = L5_556.update
	L6_557.update = L7_558
	return L6_557
end)(175, weaponTypes.F_BOMB))
RewardLevel:new((function(A0_572, A1_573)
	local L2_574, L3_575, L4_576
	L2_574 = weaponTypes
	L2_574 = L2_574[A1_573]
	L3_575 = {}
	L4_576 = nil
	L4_576 = {}
	function L4_576.create()
		local L0_584, L1_585 = getWeaponSpriteSet()
		local L2_586 = L2_586
		local L3_587 = L3_587
		local L4_588 = L4_588
		local L6_590 = _ENV.listImage .. ".png"
		return L2_586(L3_587, L4_588, L6_590)
	end
	local L5_577 = L5_577
	local L6_578 = L6_578
	local L7_579 = L7_579
	local L8_580 = L8_580
	local L9_581 = L9_581
	local L10_582 = L10_582
	local L5_577, L11_583 = L5_577(L6_578, L7_579, L8_580, L9_581, L10_582, L4_576), L11_583
	L6_578 = L5_577.update
	if L6_578 then
		L6_578 = weaponTypes
		L6_578 = L6_578[A1_573]
		L6_578 = L6_578.inventory
		if L6_578 then
			L6_578 = L5_577.update
			L6_578 = L6_578.reward
			L7_579 = L5_577.update
			function L8_580()
				_ENV()
				local L1_591 = L1_591
				L1_591(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_592 = L2_592
			end
			L7_579.reward = L8_580
		end
	end
	L6_578 = {}
	L7_579 = L5_577.value
	L6_578.value = L7_579
	L7_579 = L5_577.update
	L6_578.update = L7_579
	return L6_578
end)(200, weaponTypes.LEAPFROG))
RewardLevel:new((function(A0_593, A1_594)
	local L2_595, L3_596, L4_597
	L2_595 = weaponTypes
	L2_595 = L2_595[A1_594]
	L3_596 = {}
	L4_597 = nil
	L4_597 = {}
	function L4_597.create()
		local L0_605, L1_606 = getWeaponSpriteSet()
		local L2_607 = L2_607
		local L3_608 = L3_608
		local L4_609 = L4_609
		local L6_611 = _ENV.listImage .. ".png"
		return L2_607(L3_608, L4_609, L6_611)
	end
	local L5_598 = L5_598
	local L6_599 = L6_599
	local L7_600 = L7_600
	local L8_601 = L8_601
	local L9_602 = L9_602
	local L10_603 = L10_603
	local L5_598, L11_604 = L5_598(L6_599, L7_600, L8_601, L9_602, L10_603, L4_597), L11_604
	L6_599 = L5_598.update
	if L6_599 then
		L6_599 = weaponTypes
		L6_599 = L6_599[A1_594]
		L6_599 = L6_599.inventory
		if L6_599 then
			L6_599 = L5_598.update
			L6_599 = L6_599.reward
			L7_600 = L5_598.update
			function L8_601()
				_ENV()
				local L1_612 = L1_612
				L1_612(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_613 = L2_613
			end
			L7_600.reward = L8_601
		end
	end
	L6_599 = {}
	L7_600 = L5_598.value
	L6_599.value = L7_600
	L7_600 = L5_598.update
	L6_599.update = L7_600
	return L6_599
end)(225, weaponTypes.BABY_ROLLER_REVERSE))
RewardLevel:new((function(A0_614, A1_615)
	local L2_616, L3_617, L4_618
	L2_616 = weaponTypes
	L2_616 = L2_616[A1_615]
	L3_617 = {}
	L4_618 = nil
	L4_618 = {}
	function L4_618.create()
		local L0_626, L1_627 = getWeaponSpriteSet()
		local L2_628 = L2_628
		local L3_629 = L3_629
		local L4_630 = L4_630
		local L6_632 = _ENV.listImage .. ".png"
		return L2_628(L3_629, L4_630, L6_632)
	end
	local L5_619 = L5_619
	local L6_620 = L6_620
	local L7_621 = L7_621
	local L8_622 = L8_622
	local L9_623 = L9_623
	local L10_624 = L10_624
	local L5_619, L11_625 = L5_619(L6_620, L7_621, L8_622, L9_623, L10_624, L4_618), L11_625
	L6_620 = L5_619.update
	if L6_620 then
		L6_620 = weaponTypes
		L6_620 = L6_620[A1_615]
		L6_620 = L6_620.inventory
		if L6_620 then
			L6_620 = L5_619.update
			L6_620 = L6_620.reward
			L7_621 = L5_619.update
			function L8_622()
				_ENV()
				local L1_633 = L1_633
				L1_633(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_634 = L2_634
			end
			L7_621.reward = L8_622
		end
	end
	L6_620 = {}
	L7_621 = L5_619.value
	L6_620.value = L7_621
	L7_621 = L5_619.update
	L6_620.update = L7_621
	return L6_620
end)(250, weaponTypes.BIG_ROLLER_REVERSE))
RewardLevel:new((function(A0_635, A1_636)
	local L2_637, L3_638, L4_639
	L2_637 = weaponTypes
	L2_637 = L2_637[A1_636]
	L3_638 = {}
	L4_639 = nil
	L4_639 = {}
	function L4_639.create()
		local L0_647, L1_648 = getWeaponSpriteSet()
		local L2_649 = L2_649
		local L3_650 = L3_650
		local L4_651 = L4_651
		local L6_653 = _ENV.listImage .. ".png"
		return L2_649(L3_650, L4_651, L6_653)
	end
	local L5_640 = L5_640
	local L6_641 = L6_641
	local L7_642 = L7_642
	local L8_643 = L8_643
	local L9_644 = L9_644
	local L10_645 = L10_645
	local L5_640, L11_646 = L5_640(L6_641, L7_642, L8_643, L9_644, L10_645, L4_639), L11_646
	L6_641 = L5_640.update
	if L6_641 then
		L6_641 = weaponTypes
		L6_641 = L6_641[A1_636]
		L6_641 = L6_641.inventory
		if L6_641 then
			L6_641 = L5_640.update
			L6_641 = L6_641.reward
			L7_642 = L5_640.update
			function L8_643()
				_ENV()
				local L1_654 = L1_654
				L1_654(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_655 = L2_655
			end
			L7_642.reward = L8_643
		end
	end
	L6_641 = {}
	L7_642 = L5_640.value
	L6_641.value = L7_642
	L7_642 = L5_640.update
	L6_641.update = L7_642
	return L6_641
end)(300, weaponTypes.HOT_NAPALM))
RewardLevel:new((function(A0_656, A1_657)
	local L2_658, L3_659, L4_660
	L2_658 = weaponTypes
	L2_658 = L2_658[A1_657]
	L3_659 = {}
	L4_660 = nil
	L4_660 = {}
	function L4_660.create()
		local L0_668, L1_669 = getWeaponSpriteSet()
		local L2_670 = L2_670
		local L3_671 = L3_671
		local L4_672 = L4_672
		local L6_674 = _ENV.listImage .. ".png"
		return L2_670(L3_671, L4_672, L6_674)
	end
	local L5_661 = L5_661
	local L6_662 = L6_662
	local L7_663 = L7_663
	local L8_664 = L8_664
	local L9_665 = L9_665
	local L10_666 = L10_666
	local L5_661, L11_667 = L5_661(L6_662, L7_663, L8_664, L9_665, L10_666, L4_660), L11_667
	L6_662 = L5_661.update
	if L6_662 then
		L6_662 = weaponTypes
		L6_662 = L6_662[A1_657]
		L6_662 = L6_662.inventory
		if L6_662 then
			L6_662 = L5_661.update
			L6_662 = L6_662.reward
			L7_663 = L5_661.update
			function L8_664()
				_ENV()
				local L1_675 = L1_675
				L1_675(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_676 = L2_676
			end
			L7_663.reward = L8_664
		end
	end
	L6_662 = {}
	L7_663 = L5_661.value
	L6_662.value = L7_663
	L7_663 = L5_661.update
	L6_662.update = L7_663
	return L6_662
end)(350, weaponTypes.NUKE))
RewardLevel:new((function(A0_677, A1_678)
	local L2_679, L3_680, L4_681
	L2_679 = weaponTypes
	L2_679 = L2_679[A1_678]
	L3_680 = {}
	L4_681 = nil
	L4_681 = {}
	function L4_681.create()
		local L0_689, L1_690 = getWeaponSpriteSet()
		local L2_691 = L2_691
		local L3_692 = L3_692
		local L4_693 = L4_693
		local L6_695 = _ENV.listImage .. ".png"
		return L2_691(L3_692, L4_693, L6_695)
	end
	local L5_682 = L5_682
	local L6_683 = L6_683
	local L7_684 = L7_684
	local L8_685 = L8_685
	local L9_686 = L9_686
	local L10_687 = L10_687
	local L5_682, L11_688 = L5_682(L6_683, L7_684, L8_685, L9_686, L10_687, L4_681), L11_688
	L6_683 = L5_682.update
	if L6_683 then
		L6_683 = weaponTypes
		L6_683 = L6_683[A1_678]
		L6_683 = L6_683.inventory
		if L6_683 then
			L6_683 = L5_682.update
			L6_683 = L6_683.reward
			L7_684 = L5_682.update
			function L8_685()
				_ENV()
				local L1_696 = L1_696
				L1_696(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_697 = L2_697
			end
			L7_684.reward = L8_685
		end
	end
	L6_683 = {}
	L7_684 = L5_682.value
	L6_683.value = L7_684
	L7_684 = L5_682.update
	L6_683.update = L7_684
	return L6_683
end)(400, weaponTypes.DEATH_HEAD))
RewardLevel:new((function(A0_698, A1_699)
	local L2_700, L3_701, L4_702
	L2_700 = weaponTypes
	L2_700 = L2_700[A1_699]
	L3_701 = {}
	L4_702 = nil
	L4_702 = {}
	function L4_702.create()
		local L0_710, L1_711 = getWeaponSpriteSet()
		local L2_712 = L2_712
		local L3_713 = L3_713
		local L4_714 = L4_714
		local L6_716 = _ENV.listImage .. ".png"
		return L2_712(L3_713, L4_714, L6_716)
	end
	local L5_703 = L5_703
	local L6_704 = L6_704
	local L7_705 = L7_705
	local L8_706 = L8_706
	local L9_707 = L9_707
	local L10_708 = L10_708
	local L5_703, L11_709 = L5_703(L6_704, L7_705, L8_706, L9_707, L10_708, L4_702), L11_709
	L6_704 = L5_703.update
	if L6_704 then
		L6_704 = weaponTypes
		L6_704 = L6_704[A1_699]
		L6_704 = L6_704.inventory
		if L6_704 then
			L6_704 = L5_703.update
			L6_704 = L6_704.reward
			L7_705 = L5_703.update
			function L8_706()
				_ENV()
				local L1_717 = L1_717
				L1_717(weaponTypes[A1_279].inventory, UNLOCK_WEAPON_COUNT)
				local L2_718 = L2_718
			end
			L7_705.reward = L8_706
		end
	end
	L6_704 = {}
	L7_705 = L5_703.value
	L6_704.value = L7_705
	L7_705 = L5_703.update
	L6_704.update = L7_705
	return L6_704
end)(450, weaponTypes.BIG_SHIELD))
;({}).rankData = {}
;({}).CADET = 1
;({}).PRIVATE = 2
;({}).PRIVATE_FIRST_CLASS = 3
;({}).SPECIALIST = 4
;({}).CORPORAL = 5
;({}).TANK_GUNNER = 6
;({}).SGT = 7
;({}).STAFF_SGT = 8
;({}).SGT_FIRST_CLASS = 9
;({}).MASTER_SGT = 10
;({}).FIRST_SGT = 11
;({}).SGT_MAJOR = 12
;({}).TANK_COMMANDER = 13
;({}).OFFICER_IN_TRANING = 14
;({}).OFFICER = 15
;({}).SECOND_LT = 16
;({}).FIRST_LT = 17
;({}).FULL_LT = 18
;({}).CAPTAIN = 19
;({}).MAJOR = 20
;({}).LT_COLONEL = 21
;({}).COLONEL = 22
;({}).BRIG_GENERAL = 23
;({}).MAJ_GENERAL = 24
;({}).LT_GENERAL = 25
ranks, ({}).ids, ({}).GENERAL = {}, {}, 26
;(function(A0_719, A1_720, A2_721, A3_722, A4_723, A5_724)
	local L6_725, L7_726, L8_727
	L6_725 = {}
	L6_725.id = A0_719
	L6_725.rewardLevel = A1_720
	L6_725.name = A2_721
	L6_725.description = A3_722
	L6_725.gameCenterId = A4_723
	L6_725.image = A5_724
	L7_726 = ranks
	L7_726 = L7_726.rankData
	L8_727 = L6_725.id
	L7_726[L8_727] = L6_725
end)(ranks.ids.CADET, 7, "Cadet", "You've attained the rank of Cadet", "com.smarterapps.littlegenerals.cadet", "cadet.png")
;(function(A0_728, A1_729, A2_730, A3_731, A4_732, A5_733)
	local L6_734, L7_735, L8_736
	L6_734 = {}
	L6_734.id = A0_728
	L6_734.rewardLevel = A1_729
	L6_734.name = A2_730
	L6_734.description = A3_731
	L6_734.gameCenterId = A4_732
	L6_734.image = A5_733
	L7_735 = ranks
	L7_735 = L7_735.rankData
	L8_736 = L6_734.id
	L7_735[L8_736] = L6_734
end)(ranks.ids.PRIVATE, 12, "Private", "You've attained the rank of Private", "com.smarterapps.littlegenerals.private", "private.png")
;(function(A0_737, A1_738, A2_739, A3_740, A4_741, A5_742)
	local L6_743, L7_744, L8_745
	L6_743 = {}
	L6_743.id = A0_737
	L6_743.rewardLevel = A1_738
	L6_743.name = A2_739
	L6_743.description = A3_740
	L6_743.gameCenterId = A4_741
	L6_743.image = A5_742
	L7_744 = ranks
	L7_744 = L7_744.rankData
	L8_745 = L6_743.id
	L7_744[L8_745] = L6_743
end)(ranks.ids.PRIVATE_FIRST_CLASS, 18, "Private First Class", "You've attained the rank of Private First Class", "com.smarterapps.littlegenerals.privatefirstclass", "privatefirstclass.png")
;(function(A0_746, A1_747, A2_748, A3_749, A4_750, A5_751)
	local L6_752, L7_753, L8_754
	L6_752 = {}
	L6_752.id = A0_746
	L6_752.rewardLevel = A1_747
	L6_752.name = A2_748
	L6_752.description = A3_749
	L6_752.gameCenterId = A4_750
	L6_752.image = A5_751
	L7_753 = ranks
	L7_753 = L7_753.rankData
	L8_754 = L6_752.id
	L7_753[L8_754] = L6_752
end)(ranks.ids.SPECIALIST, 27, "Specialist", "You've attained the rank of Specialist", "com.smarterapps.littlegenerals.specialist", "specialist.png")
;(function(A0_755, A1_756, A2_757, A3_758, A4_759, A5_760)
	local L6_761, L7_762, L8_763
	L6_761 = {}
	L6_761.id = A0_755
	L6_761.rewardLevel = A1_756
	L6_761.name = A2_757
	L6_761.description = A3_758
	L6_761.gameCenterId = A4_759
	L6_761.image = A5_760
	L7_762 = ranks
	L7_762 = L7_762.rankData
	L8_763 = L6_761.id
	L7_762[L8_763] = L6_761
end)(ranks.ids.CORPORAL, 32, "Corporal", "You've attained the rank of Corporal", "com.smarterapps.littlegenerals.corporal", "corporal.png")
;(function(A0_764, A1_765, A2_766, A3_767, A4_768, A5_769)
	local L6_770, L7_771, L8_772
	L6_770 = {}
	L6_770.id = A0_764
	L6_770.rewardLevel = A1_765
	L6_770.name = A2_766
	L6_770.description = A3_767
	L6_770.gameCenterId = A4_768
	L6_770.image = A5_769
	L7_771 = ranks
	L7_771 = L7_771.rankData
	L8_772 = L6_770.id
	L7_771[L8_772] = L6_770
end)(ranks.ids.TANK_GUNNER, 42, "Tank Gunner", "You've attained the rank of Tank Gunner", "com.smarterapps.littlegenerals.tankgunner", "tankgunner.png")
;(function(A0_773, A1_774, A2_775, A3_776, A4_777, A5_778)
	local L6_779, L7_780, L8_781
	L6_779 = {}
	L6_779.id = A0_773
	L6_779.rewardLevel = A1_774
	L6_779.name = A2_775
	L6_779.description = A3_776
	L6_779.gameCenterId = A4_777
	L6_779.image = A5_778
	L7_780 = ranks
	L7_780 = L7_780.rankData
	L8_781 = L6_779.id
	L7_780[L8_781] = L6_779
end)(ranks.ids.SGT, 60, "Sergeant", "You've attained the rank of Sergeant", "com.smarterapps.littlegenerals.sergeant", "sergeant.png")
;(function(A0_782, A1_783, A2_784, A3_785, A4_786, A5_787)
	local L6_788, L7_789, L8_790
	L6_788 = {}
	L6_788.id = A0_782
	L6_788.rewardLevel = A1_783
	L6_788.name = A2_784
	L6_788.description = A3_785
	L6_788.gameCenterId = A4_786
	L6_788.image = A5_787
	L7_789 = ranks
	L7_789 = L7_789.rankData
	L8_790 = L6_788.id
	L7_789[L8_790] = L6_788
end)(ranks.ids.STAFF_SGT, 80, "Staff Sergeant", "You've attained the rank of Staff Sergeant", "com.smarterapps.littlegenerals.staffsergeant", "staffsergeant.png")
;(function(A0_791, A1_792, A2_793, A3_794, A4_795, A5_796)
	local L6_797, L7_798, L8_799
	L6_797 = {}
	L6_797.id = A0_791
	L6_797.rewardLevel = A1_792
	L6_797.name = A2_793
	L6_797.description = A3_794
	L6_797.gameCenterId = A4_795
	L6_797.image = A5_796
	L7_798 = ranks
	L7_798 = L7_798.rankData
	L8_799 = L6_797.id
	L7_798[L8_799] = L6_797
end)(ranks.ids.SGT_FIRST_CLASS, 100, "Sergeant First Class", "You've attained the rank of Sergeant First Class", "com.smarterapps.littlegenerals.sergeantfirstclass", "sergeantfirstclass.png")
;(function(A0_800, A1_801, A2_802, A3_803, A4_804, A5_805)
	local L6_806, L7_807, L8_808
	L6_806 = {}
	L6_806.id = A0_800
	L6_806.rewardLevel = A1_801
	L6_806.name = A2_802
	L6_806.description = A3_803
	L6_806.gameCenterId = A4_804
	L6_806.image = A5_805
	L7_807 = ranks
	L7_807 = L7_807.rankData
	L8_808 = L6_806.id
	L7_807[L8_808] = L6_806
end)(ranks.ids.MASTER_SGT, 125, "Master Sergeant", "You've attained the rank of Master Sergeant", "com.smarterapps.littlegenerals.mastersergeant", "mastersergeant.png")
;(function(A0_809, A1_810, A2_811, A3_812, A4_813, A5_814)
	local L6_815, L7_816, L8_817
	L6_815 = {}
	L6_815.id = A0_809
	L6_815.rewardLevel = A1_810
	L6_815.name = A2_811
	L6_815.description = A3_812
	L6_815.gameCenterId = A4_813
	L6_815.image = A5_814
	L7_816 = ranks
	L7_816 = L7_816.rankData
	L8_817 = L6_815.id
	L7_816[L8_817] = L6_815
end)(ranks.ids.FIRST_SGT, 150, "First Sergeant", "You've attained the rank of First Sergeant", "com.smarterapps.littlegenerals.firstsergeant", "firstsergeant.png")
;(function(A0_818, A1_819, A2_820, A3_821, A4_822, A5_823)
	local L6_824, L7_825, L8_826
	L6_824 = {}
	L6_824.id = A0_818
	L6_824.rewardLevel = A1_819
	L6_824.name = A2_820
	L6_824.description = A3_821
	L6_824.gameCenterId = A4_822
	L6_824.image = A5_823
	L7_825 = ranks
	L7_825 = L7_825.rankData
	L8_826 = L6_824.id
	L7_825[L8_826] = L6_824
end)(ranks.ids.SGT_MAJOR, 200, "Sergeant Major", "You've attained the rank of Sergeant Major", "com.smarterapps.littlegenerals.sergeantmajor", "sergeantmajor.png")
;(function(A0_827, A1_828, A2_829, A3_830, A4_831, A5_832)
	local L6_833, L7_834, L8_835
	L6_833 = {}
	L6_833.id = A0_827
	L6_833.rewardLevel = A1_828
	L6_833.name = A2_829
	L6_833.description = A3_830
	L6_833.gameCenterId = A4_831
	L6_833.image = A5_832
	L7_834 = ranks
	L7_834 = L7_834.rankData
	L8_835 = L6_833.id
	L7_834[L8_835] = L6_833
end)(ranks.ids.TANK_COMMANDER, 260, "Tank Commander", "You've attained the rank of Tank Commander", "com.smarterapps.littlegenerals.tankcommander", "tankcommander.png")
;(function(A0_836, A1_837, A2_838, A3_839, A4_840, A5_841)
	local L6_842, L7_843, L8_844
	L6_842 = {}
	L6_842.id = A0_836
	L6_842.rewardLevel = A1_837
	L6_842.name = A2_838
	L6_842.description = A3_839
	L6_842.gameCenterId = A4_840
	L6_842.image = A5_841
	L7_843 = ranks
	L7_843 = L7_843.rankData
	L8_844 = L6_842.id
	L7_843[L8_844] = L6_842
end)(ranks.ids.OFFICER_IN_TRANING, 320, "Officer In Training", "You've attained the rank of Officer In Training", "com.smarterapps.littlegenerals.officerintraining", "officerintraining.png")
;(function(A0_845, A1_846, A2_847, A3_848, A4_849, A5_850)
	local L6_851, L7_852, L8_853
	L6_851 = {}
	L6_851.id = A0_845
	L6_851.rewardLevel = A1_846
	L6_851.name = A2_847
	L6_851.description = A3_848
	L6_851.gameCenterId = A4_849
	L6_851.image = A5_850
	L7_852 = ranks
	L7_852 = L7_852.rankData
	L8_853 = L6_851.id
	L7_852[L8_853] = L6_851
end)(ranks.ids.OFFICER, 380, "Officer", "You've attained the rank of Officer", "com.smarterapps.littlegenerals.officer", "officer.png")
;(function(A0_854, A1_855, A2_856, A3_857, A4_858, A5_859)
	local L6_860, L7_861, L8_862
	L6_860 = {}
	L6_860.id = A0_854
	L6_860.rewardLevel = A1_855
	L6_860.name = A2_856
	L6_860.description = A3_857
	L6_860.gameCenterId = A4_858
	L6_860.image = A5_859
	L7_861 = ranks
	L7_861 = L7_861.rankData
	L8_862 = L6_860.id
	L7_861[L8_862] = L6_860
end)(ranks.ids.SECOND_LT, 440, "Second Lieutenant", "You've attained the rank of Second Lieutenant", "com.smarterapps.littlegenerals.secondlieutenant", "secondlieutanant.png")
;(function(A0_863, A1_864, A2_865, A3_866, A4_867, A5_868)
	local L6_869, L7_870, L8_871
	L6_869 = {}
	L6_869.id = A0_863
	L6_869.rewardLevel = A1_864
	L6_869.name = A2_865
	L6_869.description = A3_866
	L6_869.gameCenterId = A4_867
	L6_869.image = A5_868
	L7_870 = ranks
	L7_870 = L7_870.rankData
	L8_871 = L6_869.id
	L7_870[L8_871] = L6_869
end)(ranks.ids.FIRST_LT, 500, "First Lieutenant", "You've attained the rank of First Lieutenant", "com.smarterapps.littlegenerals.firstlieutenant", "firstlieutenant.png")
;(function(A0_872, A1_873, A2_874, A3_875, A4_876, A5_877)
	local L6_878, L7_879, L8_880
	L6_878 = {}
	L6_878.id = A0_872
	L6_878.rewardLevel = A1_873
	L6_878.name = A2_874
	L6_878.description = A3_875
	L6_878.gameCenterId = A4_876
	L6_878.image = A5_877
	L7_879 = ranks
	L7_879 = L7_879.rankData
	L8_880 = L6_878.id
	L7_879[L8_880] = L6_878
end)(ranks.ids.FULL_LT, 560, "Full Lieutenant", "You've attained the rank of Full Lieutenant", "com.smarterapps.littlegenerals.fulllieutenant", "lieutenant.png")
;(function(A0_881, A1_882, A2_883, A3_884, A4_885, A5_886)
	local L6_887, L7_888, L8_889
	L6_887 = {}
	L6_887.id = A0_881
	L6_887.rewardLevel = A1_882
	L6_887.name = A2_883
	L6_887.description = A3_884
	L6_887.gameCenterId = A4_885
	L6_887.image = A5_886
	L7_888 = ranks
	L7_888 = L7_888.rankData
	L8_889 = L6_887.id
	L7_888[L8_889] = L6_887
end)(ranks.ids.CAPTAIN, 620, "Captain", "You've attained the rank of Captain", "com.smarterapps.littlegenerals.captain", "captain.png")
;(function(A0_890, A1_891, A2_892, A3_893, A4_894, A5_895)
	local L6_896, L7_897, L8_898
	L6_896 = {}
	L6_896.id = A0_890
	L6_896.rewardLevel = A1_891
	L6_896.name = A2_892
	L6_896.description = A3_893
	L6_896.gameCenterId = A4_894
	L6_896.image = A5_895
	L7_897 = ranks
	L7_897 = L7_897.rankData
	L8_898 = L6_896.id
	L7_897[L8_898] = L6_896
end)(ranks.ids.MAJOR, 680, "Major", "You've attained the rank of Major", "com.smarterapps.littlegenerals.major", "major.png")
;(function(A0_899, A1_900, A2_901, A3_902, A4_903, A5_904)
	local L6_905, L7_906, L8_907
	L6_905 = {}
	L6_905.id = A0_899
	L6_905.rewardLevel = A1_900
	L6_905.name = A2_901
	L6_905.description = A3_902
	L6_905.gameCenterId = A4_903
	L6_905.image = A5_904
	L7_906 = ranks
	L7_906 = L7_906.rankData
	L8_907 = L6_905.id
	L7_906[L8_907] = L6_905
end)(ranks.ids.LT_COLONEL, 750, "Lieutenant Colonel", "You've attained the rank of Lieutenant Colonel", "com.smarterapps.littlegenerals.lieutenantcolonel", "lieutenantcolonel.png")
;(function(A0_908, A1_909, A2_910, A3_911, A4_912, A5_913)
	local L6_914, L7_915, L8_916
	L6_914 = {}
	L6_914.id = A0_908
	L6_914.rewardLevel = A1_909
	L6_914.name = A2_910
	L6_914.description = A3_911
	L6_914.gameCenterId = A4_912
	L6_914.image = A5_913
	L7_915 = ranks
	L7_915 = L7_915.rankData
	L8_916 = L6_914.id
	L7_915[L8_916] = L6_914
end)(ranks.ids.COLONEL, 820, "Colonel", "You've attained the rank of Colonel", "com.smarterapps.littlegenerals.colonel", "colonel.png")
;(function(A0_917, A1_918, A2_919, A3_920, A4_921, A5_922)
	local L6_923, L7_924, L8_925
	L6_923 = {}
	L6_923.id = A0_917
	L6_923.rewardLevel = A1_918
	L6_923.name = A2_919
	L6_923.description = A3_920
	L6_923.gameCenterId = A4_921
	L6_923.image = A5_922
	L7_924 = ranks
	L7_924 = L7_924.rankData
	L8_925 = L6_923.id
	L7_924[L8_925] = L6_923
end)(ranks.ids.BRIG_GENERAL, 890, "Brigidier General", "You've attained the rank of Brigidier General", "com.smarterapps.littlegenerals.brigidiergeneral", "bridgidiergeneral.png")
;(function(A0_926, A1_927, A2_928, A3_929, A4_930, A5_931)
	local L6_932, L7_933, L8_934
	L6_932 = {}
	L6_932.id = A0_926
	L6_932.rewardLevel = A1_927
	L6_932.name = A2_928
	L6_932.description = A3_929
	L6_932.gameCenterId = A4_930
	L6_932.image = A5_931
	L7_933 = ranks
	L7_933 = L7_933.rankData
	L8_934 = L6_932.id
	L7_933[L8_934] = L6_932
end)(ranks.ids.MAJ_GENERAL, 960, "Major General", "You've attained the rank of Major General", "com.smarterapps.littlegenerals.majorgeneral", "majorgeneral.png")
;(function(A0_935, A1_936, A2_937, A3_938, A4_939, A5_940)
	local L6_941, L7_942, L8_943
	L6_941 = {}
	L6_941.id = A0_935
	L6_941.rewardLevel = A1_936
	L6_941.name = A2_937
	L6_941.description = A3_938
	L6_941.gameCenterId = A4_939
	L6_941.image = A5_940
	L7_942 = ranks
	L7_942 = L7_942.rankData
	L8_943 = L6_941.id
	L7_942[L8_943] = L6_941
end)(ranks.ids.LT_GENERAL, 1100, "Lieutenant General", "You've attained the rank of Lieutenant General", "com.smarterapps.littlegenerals.lieutenantgeneral", "lieutenantgeneral.png")
;(function(A0_944, A1_945, A2_946, A3_947, A4_948, A5_949)
	local L6_950, L7_951, L8_952
	L6_950 = {}
	L6_950.id = A0_944
	L6_950.rewardLevel = A1_945
	L6_950.name = A2_946
	L6_950.description = A3_947
	L6_950.gameCenterId = A4_948
	L6_950.image = A5_949
	L7_951 = ranks
	L7_951 = L7_951.rankData
	L8_952 = L6_950.id
	L7_951[L8_952] = L6_950
end)(ranks.ids.GENERAL, 1500, "General", "You've attained the rank of General", "com.smarterapps.littlegenerals.general", "general.png")
_FOR_, _FOR_, _FOR_ = pairs(ranks.rankData)
for _FORV_22_, _FORV_23_ in _FOR_, _FOR_, _FOR_ do
	({}).value = _FORV_23_.rewardLevel
	local L29_29 = L29_29
	local L30_30 = L30_30
	local L31_31 = L31_31
	local L32_32 = L32_32
	;({}).update = L18_18(_FORV_23_.id, _FORV_23_.name, _FORV_23_.description, _FORV_23_.gameCenterId, _FORV_23_.image)
	RewardLevel:new({})
end
;({}).ROOKIE = L4_4()
;({}).DUNCE = L14_14()
;({}).COWARD = L14_14()
;({}).PURPLE_HEART = L14_14()
;({}).MISSION_NOT_IMPOSSIBLE = L14_14()
miscAchievements, ({}).VIVA_LA_REVOLUTION = {}, L14_14()
miscAchievements[miscAchievements.DUNCE] = L17_17(miscAchievements.DUNCE, "Dunce", "You killed yourself.", "com.smarterapps.littlegenerals.dunce", "dunce.png", true, nil)
miscAchievements[miscAchievements.COWARD] = L17_17(miscAchievements.COWARD, "Coward's Way Out", "You surrendered.", "com.smarterapps.littlegenerals.coward", "coward.png", true, nil)
miscAchievements[miscAchievements.PURPLE_HEART] = L17_17(miscAchievements.PURPLE_HEART, "Purple Heart", "Almost died, but rallied to win the battle!", "com.smarterapps.littlegenerals.purpleheart", "purpleheart.png", true, nil)
miscAchievements[miscAchievements.MISSION_NOT_IMPOSSIBLE] = L17_17(miscAchievements.MISSION_NOT_IMPOSSIBLE, "Mission (not) Impossible", "Completed all the missions.", "com.smarterapps.littlegenerals.missions", "missions.png", true, nil)
miscAchievements[miscAchievements.VIVA_LA_REVOLUTION] = L17_17(miscAchievements.VIVA_LA_REVOLUTION, "Viva La Revolution", "Capture back 5 lands after having lost them.", "com.smarterapps.littlegenerals.revolution", "revolution.png", true, nil)
;({}).value = 1
;({}).update = L17_17(miscAchievements.ROOKIE, "It's the Rookie!", "You've gotten your first victory.", "com.smarterapps.littlegenerals.rookie", "rookie.png", true, function()
	local L0_953 = playerKills()
	if 1 <= L0_953 then
		L0_953 = true
		return L0_953
	end
	L0_953 = false
	return L0_953
end)
RewardLevel:new({})
table.sort(L15_15, function(A0_954, A1_955)
	local L2_956, L3_957
	L2_956 = A0_954.value
	L3_957 = A1_955.value
	L2_956 = L2_956 < L3_957
	return L2_956
end)
;({}).DINOSAUR = L6_6()
terrainAchievements, ({}).ALIEN = {}, L6_6()
terrainAchievements[terrainAchievements.DINOSAUR] = L17_17(terrainAchievements.DINOSAUR, "Paleontologist", "Show a love of paleontology by destroying a dinosaur.", "com.smarterapps.littlegenerals.paleontologist", "paleontologist.png", true, nil)
terrainAchievements[terrainAchievements.ALIEN] = L17_17(terrainAchievements.ALIEN, "Roswell Fight Club", "You've shown the peaceful alien visitors not to mess with you.", "com.smarterapps.littlegenerals.alien", "alien.png", true, nil)
battleAchievements, ({}).AIRSTRIKE = {}, L8_8()
battleAchievements[battleAchievements.AIRSTRIKE] = L17_17(battleAchievements.AIRSTRIKE, "Air Strike", "Death from above! Direct hit via precision airstrike!", "com.smarterapps.littlegenerals.airstrike", "airstrike.png", true, nil)
;({}).CAMPAIGN_01_COMPLETED = L10_10()
;({}).CAMPAIGN_05_COMPLETED = L10_10()
;({}).CAMPAIGN_10_COMPLETED = L10_10()
;({}).CAMPAIGN_25_COMPLETED = L10_10()
campaignAchievements, ({}).CAMPAIGN_50_COMPLETED = {}, L10_10()
campaignAchievements[campaignAchievements.CAMPAIGN_01_COMPLETED] = L17_17(campaignAchievements.CAMPAIGN_01_COMPLETED, "Property Owner", "You've conquered your 1st continent!", "com.smarterapps.littlegenerals.campaign01", "campaign001.png", true, nil)
campaignAchievements[campaignAchievements.CAMPAIGN_05_COMPLETED] = L17_17(campaignAchievements.CAMPAIGN_05_COMPLETED, "Real Estate Magnate", "You've conquered your 5th continent!", "com.smarterapps.littlegenerals.campaign05", "campaign005.png", true, nil)
campaignAchievements[campaignAchievements.CAMPAIGN_10_COMPLETED] = L17_17(campaignAchievements.CAMPAIGN_10_COMPLETED, "Expansionist Policy", "You've conquered your 10th continent!", "com.smarterapps.littlegenerals.campaign10", "campaign010.png", true, nil)
campaignAchievements[campaignAchievements.CAMPAIGN_25_COMPLETED] = L17_17(campaignAchievements.CAMPAIGN_25_COMPLETED, "Conqueror", "You've conquered your 25th continent!", "com.smarterapps.littlegenerals.campaign25", "campaign025.png", true, nil)
local L26_26 = L26_26
local L27_27 = L27_27
local L28_28 = L28_28
L27_27[L28_28] = L17_17(campaignAchievements.CAMPAIGN_50_COMPLETED, "Hail, Caesar!", "You've conquered your 50th continent!", "com.smarterapps.littlegenerals.campaign50", "campaign050.png", true, nil)
function L27_27(A0_958)
	if not getCurrentBattle or getCurrentBattle() == nil or not getCurrentBattle().isMultiplayer then
		if terrainAchievements[A0_958] and not terrainAchievements[A0_958].achievement:isAttained() then
			print("Unlocking terrain achievement", A0_958)
			unacknowledgedUpdates[#unacknowledgedUpdates + 1] = terrainAchievements[A0_958]
		elseif battleAchievements[A0_958] and not battleAchievements[A0_958].achievement:isAttained() then
			print("Unlocking battle achievement", A0_958)
			unacknowledgedUpdates[#unacknowledgedUpdates + 1] = battleAchievements[A0_958]
		elseif campaignAchievements[A0_958] and not campaignAchievements[A0_958].achievement:isAttained() then
			print("Unlocking campaign achievement", A0_958)
			unacknowledgedUpdates[#unacknowledgedUpdates + 1] = campaignAchievements[A0_958]
		elseif miscAchievements[A0_958] and not miscAchievements[A0_958].achievement:isAttained() then
			local L1_959 = L1_959
			local L2_960 = L2_960
			L1_959(L2_960, A0_958)
			local L3_961 = L3_961
			L1_959 = unacknowledgedUpdates
			L2_960 = unacknowledgedUpdates
			L2_960 = #L2_960
			L2_960 = L2_960 + 1
			L3_961 = miscAchievements
			L3_961 = L3_961[A0_958]
			L1_959[L2_960] = L3_961
		end
	end
end
unlockAchievement = L27_27
function L27_27(A0_962)
	local L2_964 = L2_964
	if not A0_962 then
		L2_964 = nil
		return L2_964
	end
	L2_964 = _ENV
	L2_964 = L2_964.getSpriteSet
	L2_964 = L2_964()
	local L3_965 = L3_965
	local L4_966 = L4_966
	local L5_967 = L5_967
	do return L4_966(L5_967, L3_965, A0_962) end
	local L6_968 = L6_968
end
getAchievementImage = L27_27
function L27_27(A0_969)
	local L1_970
	if A0_969 then
		L1_970 = ranks
		L1_970 = L1_970.rankData
		L1_970 = L1_970[A0_969]
		if L1_970 then
			goto lbl_10
		end
	end
	L1_970 = nil
	do return L1_970 end
	::lbl_10::
	L1_970 = ranks
	L1_970 = L1_970.rankData
	L1_970 = L1_970[A0_969]
	if not L1_970 or not L1_970.image then
		return nil
	end
	local L2_971 = L2_971
	do return L2_971(L1_970.image) end
	local L3_972 = L3_972
end
getRankImage = L27_27
function L27_27()
	L6_979 = settings
	local L5_978, L6_979, L7_980 = settings.get, L6_979, L7_980
	L7_980 = "rank.id"
	L8_981 = 0
	L5_978 = L5_978(L6_979, L7_980, L8_981)
	if L5_978 == 0 then
		L6_979 = playerKills
		L6_979 = L6_979()
		L7_980 = 0
		L8_981 = pairs
		L8_981, _FOR_, _FOR_ = L8_981(ranks.rankData)
		for _FORV_6_, _FORV_7_ in L8_981, _FOR_, _FOR_ do
			if L6_979 >= _FORV_7_.rewardLevel and L7_980 < _FORV_7_.rewardLevel then
				L5_978 = _FORV_7_.id
				L7_980 = _FORV_7_.rewardLevel
			end
		end
	end
	return L5_978
end
playerRankId = L27_27
function L27_27(A0_982)
	if A0_982 and ranks.rankData[A0_982] and ranks.rankData[A0_982].name then
		return ranks.rankData[A0_982].name
	end
	local L1_983, L2_984 = L1_983, L2_984
	local L3_985 = L3_985
	do return L1_983(L2_984, L3_985, "Tank Newbie") end
	local L4_986 = L4_986
end
playerRank = L27_27
function L27_27()
	local L1_987 = L1_987
	local L2_988 = L2_988
	do return L1_987(L2_988, "statistics.kills.index", 1) end
	local L3_989 = L3_989
end
playerLevel = L27_27
function L27_27()
	local L1_990 = L1_990
	local L2_991 = L2_991
	do return L1_990(L2_991, "statistics.kills", 0) end
	local L3_992 = L3_992
end
playerKills = L27_27
function L27_27(A0_993, A1_994)
	local L2_995, L3_996
	L2_995 = achievementList
	L2_995 = L2_995.nonRankAchievements
	L2_995 = L2_995[A0_993]
	L3_996 = L2_995.funcToCheckIfAchieved
	if L3_996 then
		if L3_996() then
			return true
		end
	else
		if A1_994[A0_993] then
			if not A1_994[A0_993].achievement then
				goto lbl_29
			end
			local L4_997, L5_998 = A1_994[A0_993].achievement:isAttained(), L5_998
			if not L4_997 then
				goto lbl_29
			end
		end
		L4_997 = true
		return L4_997
	end
	::lbl_29::
	L4_997 = false
	return L4_997
end
achievementIsComplete = L27_27
function L27_27()
	local L0_999, L1_1000, L2_1001
	L0_999 = 0
	L1_1000 = 0
	L2_1001 = {}
	L7_1006 = achievementList
	L7_1006 = L7_1006.miscAchievements
	L11_1010 = achievementList
	L11_1010 = L11_1010.terrainAchievements
	L12_1011 = achievementList
	L12_1011 = L12_1011.battleAchievements
	L2_1001[1] = L7_1006
	L2_1001[2] = L11_1010
	L2_1001[3] = L12_1011
	L2_1001[4] = achievementList.campaignAchievements
	L7_1006 = pairs
	L11_1010 = L2_1001
	L7_1006, L11_1010, L12_1011 = L7_1006(L11_1010)
	for _FORV_6_, _FORV_7_ in L7_1006, L11_1010, L12_1011 do
		_FOR_, _FOR_, _FOR_ = pairs(_FORV_7_)
		for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
			if type(_FORV_12_) == "number" then
				if achievementIsComplete(_FORV_12_, _FORV_7_) then
					L0_999 = L0_999 + 1
				end
				L1_1000 = L1_1000 + 1
			end
		end
	end
	L7_1006 = playerKills
	L7_1006 = L7_1006()
	L11_1010 = pairs
	L12_1011 = ranks
	L12_1011 = L12_1011.rankData
	L11_1010, L12_1011, L10_1009 = L11_1010(L12_1011)
	for L14_1013, L15_1014 in L11_1010, L12_1011, L10_1009 do
		L1_1000 = L1_1000 + 1
		if L7_1006 >= L15_1014.rewardLevel then
			L0_999 = L0_999 + 1
		end
	end
	L11_1010 = L1_1000
	L12_1011 = L0_999
	return L11_1010, L12_1011
end
getTotalAchievements = L27_27
function L27_27(A0_1015)
	local L2_1017 = L2_1017
	if A0_1015 then
		L2_1017 = A0_1015.isValid
		if L2_1017 then
			L2_1017 = A0_1015.isValid
			L2_1017 = L2_1017()
			if not L2_1017 then
				goto lbl_37
			end
		end
		L2_1017 = true
		L3_1018 = 1
		L4_1019 = unacknowledgedUpdates
		L4_1019 = #L4_1019
		L5_1020 = 1
		for _FORV_5_ = L3_1018, L4_1019, L5_1020 do
			local L7_1022 = L7_1022
			local L8_1023 = L8_1023
			L7_1022(L8_1023, unacknowledgedUpdates[_FORV_5_].title, A0_1015.title)
			local L9_1024 = L9_1024
			L7_1022 = unacknowledgedUpdates
			L7_1022 = L7_1022[_FORV_5_]
			if L7_1022 == A0_1015 then
				L2_1017 = false
				break
			end
		end
		if L2_1017 then
			L3_1018 = unacknowledgedUpdates
			L4_1019 = unacknowledgedUpdates
			L4_1019 = #L4_1019
			L4_1019 = L4_1019 + 1
			L3_1018[L4_1019] = A0_1015
		end
	end
	::lbl_37::
end
function L28_28(A0_1025, A1_1026)
	local L2_1027, L7_1032 = L2_1027, A0_1025
	L2_1027 = L2_1027 .. L7_1032
	L7_1032 = settings
	L7_1032 = L7_1032.get
	L7_1032 = L7_1032(L7_1032, L2_1027, 0)
	_FOR_ = 1
	for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
		if not (L7_1032 >= A1_1026[_FORV_7_].value) then
			break
		end
		if _FORV_7_ > settings:get(L2_1027 .. ".index", 0) then
			settings:set(L2_1027 .. ".index", _FORV_7_)
		end
		_ENV(A1_1026[_FORV_7_].update)
		goto lbl_39
		do break end
		::lbl_39::
	end
	L6_1031 = settings
	L10_1035 = L6_1031
	L6_1031 = L6_1031.save
	L6_1031(L10_1035)
end
function unlockWeapon(A0_1037)
	local L3_1039 = L3_1039
	local L4_1040 = L20_20(0, A0_1037)
	L4_1040 = L4_1040.update
	L3_1039(L4_1040)
end
function updateStatistics(A0_1041)
	if A0_1041.kills then
		gamecenterSupport.updateHighScore(HIGHSCORE_KILLS, (_ENV("kills", L15_15, A0_1041.kills)))
	end
	if A0_1041.mp_kills then
		local L1_1042 = L1_1042
		local L2_1043 = L2_1043
		local L3_1044 = L3_1044
		local L1_1042, L4_1045 = L1_1042(L2_1043, L3_1044, A0_1041.mp_kills), L4_1045
	end
end
print("Player level", playerLevel())
print("Player kills", playerKills())
print("Player rank", playerRank())
L28_28("kills", L15_15)
function acknowledgeAll()
	local L0_1046, L1_1047, L2_1048, L3_1049
	L0_1046 = 1
	L1_1047 = unacknowledgedUpdates
	L1_1047 = #L1_1047
	L2_1048 = 1
	for L3_1049 = L0_1046, L1_1047, L2_1048 do
		unacknowledgedUpdates[L3_1049]:acknowledge()
		local L4_1050, L5_1051 = L4_1050, L5_1051
	end
	L0_1046 = {}
	unacknowledgedUpdates = L0_1046
end
acknowledgeAll()
