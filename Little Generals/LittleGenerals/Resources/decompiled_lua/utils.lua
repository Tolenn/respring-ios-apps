local L3_3, L4_4, L5_5, L6_6, L8_8, L9_9, L10_10, L11_11 = L3_3, (...), L5_5, L6_6, L8_8, L9_9, L10_10, L11_11
L5_5 = package
L5_5 = L5_5.seeall
L3_3(L4_4, L5_5)
L3_3 = require
L4_4 = "socket.url"
L3_3 = L3_3(L4_4)
L4_4 = "attack.png"
DIALOG_ATTACK = L4_4
L4_4 = "challenge.png"
DIALOG_CHALLENGE = L4_4
L4_4 = "lose.png"
DIALOG_LOSE = L4_4
L4_4 = "exclamation.png"
DIALOG_SUPPLYLINES_ERROR = L4_4
L4_4 = "question.png"
DIALOG_QUESTION = L4_4
L4_4 = "surrender.png"
DIALOG_SURRENDER = L4_4
L4_4 = "win.png"
DIALOG_WIN = L4_4
function L4_4(...)
	local L1_62
	return arg
end
pack = L4_4
function L4_4()
	local L0_63 = isIOSDevice()
	if L0_63 then
		L0_63 = ITUNES_RATE_URL
		return L0_63
	else
		L0_63 = GPLAY_RATE_URL
		return L0_63
	end
end
getRateUsLink = L4_4
function L4_4()
	local L1_64
	L1_64 = EXTERNAL_STORE_URL
	return L1_64
end
getExternalStoreLink = L4_4
function L4_4()
	local L0_65
	L0_65 = spritesheetmanager
	L0_65 = L0_65.SpriteSets
	L0_65 = L0_65["res/ui/windsock.png"]
	L0_65 = L0_65 ~= nil
	local L1_66 = L1_66
	local L1_66, L2_67 = L1_66("res/ui/windsock.png")
	if not L0_65 then
		sprite.add(L1_66, "slow", 1, 5, 750, 0)
		sprite.add(L1_66, "med", 1, 5, 500, 0)
		local L5_70 = L5_70
		local L6_71 = L6_71
		local L7_72 = L7_72
		local L8_73 = L8_73
		L5_70(L6_71, L7_72, L8_73, 5, 350, 0)
		local L9_74 = L9_74
	end
	L5_70 = sprite
	L5_70 = L5_70.newSprite
	L6_71 = L1_66
	return L5_70(L6_71)
end
getWindSockSprite = L4_4
L4_4 = string
function L5_5(A0_75, A1_76, A2_77, A3_78)
	assert(A1_76 ~= "")
	local L4_79 = L4_79
	L4_79(A2_77 == nil or 1 <= A2_77)
	L4_79 = {}
	local L5_80, L6_81 = A0_75:len(), L6_81
	if 0 < L5_80 then
		L5_80 = not A3_78
		if not A2_77 then
			A2_77 = -1
		end
		L6_81 = 1
		nStart = 1
		local L7_82, L8_83 = L7_82, L8_83
		L7_82, L8_83 = L7_82(L8_83, A1_76, nStart, L5_80)
		while L7_82 and A2_77 ~= 0 do
			L4_79[L6_81] = A0_75:sub(nStart, L7_82 - 1)
			L6_81 = L6_81 + 1
			nStart = L8_83 + 1
			local L12_87 = L12_87
			local L12_87, L13_88 = L12_87(A0_75, A1_76, nStart, L5_80)
			L8_83 = L13_88
			L7_82 = L12_87
			A2_77 = A2_77 - 1
		end
		L13_88 = A0_75
		L12_87 = A0_75.sub
		local L12_87, L11_86 = L12_87(L13_88, nStart), L11_86
		L4_79[L6_81] = L12_87
	end
	return L4_79
end
L4_4.split = L5_5
L4_4 = table
function L5_5(A0_89, A1_90)
	local L2_91, L3_92, L4_93, L5_94, L6_95, L7_96
	L2_91 = 1
	L3_92 = #A1_90
	L4_93 = 1
	for L5_94 = L2_91, L3_92, L4_93 do
		L6_95 = #A0_89
		L6_95 = L6_95 + 1
		L7_96 = A1_90[L5_94]
		A0_89[L6_95] = L7_96
	end
	return A0_89
end
L4_4.merge = L5_5
function L4_4(A0_97)
	local L2_98 = L2_98
	local L3_99 = L3_99
	do return L2_98(L3_99, "+", "%%20") end
	local L4_100 = L4_100
end
percentTwentyURLEncode = L4_4
function L4_4()
	L0_101 = string.find(string.lower(system.getInfo("model")), "iphone", 1, false) ~= nil or string.find(string.lower(system.getInfo("model")), "ipad", 1, false) ~= nil
	return L0_101
end
isIOSDevice = L4_4
function L4_4()
	local L0_106 = isIOSDevice()
	L0_106 = not L0_106
	return L0_106
end
isAndroidDevice = L4_4
function L4_4()
	local L0_107 = L0_107
	local L1_108 = L1_108
	local L2_109 = L2_109
	local L3_110 = L3_110
	local L0_107, L4_111 = L0_107(L1_108, L2_109, L3_110, false), L4_111
	L0_107 = L0_107 ~= nil
	return L0_107
end
isAndroid = L4_4
function L4_4()
	local L0_112 = L0_112
	local L0_112, L1_113 = L0_112("environment"), L1_113
	L0_112 = "simulator" == L0_112
	return L0_112
end
isCorona = L4_4
function L4_4()
	local L0_114 = L0_114
	local L1_115 = L1_115
	local L2_116 = L2_116
	local L3_117 = L3_117
	local L0_114, L4_118 = L0_114(L1_115, L2_116, L3_117, false), L4_118
	L0_114 = L0_114 ~= nil
	return L0_114
end
isIOS = L4_4
function L4_4(A0_119, A1_120)
	local L5_124, L6_125, L7_126, L16_135, L17_136 = display.newGroup, L6_125, L7_126, L16_135, L17_136
	L5_124 = L5_124()
	if not A1_120 then
		L6_125 = {}
		A1_120 = L6_125
	end
	L6_125 = getFontForString
	L7_126 = A0_119
	L6_125, L7_126 = L6_125(L7_126)
	L16_135 = A1_120.size
	if not L16_135 then
		L16_135 = 30
	end
	L16_135 = L16_135 * L7_126
	L17_136 = A1_120.fontName
	if not L17_136 then
		L17_136 = L6_125
	end
	if not A1_120.fontColor then
		({})[1] = 255
		;({})[2] = 255
		;({})[3] = 255
	end
	if not A1_120.shadowColor then
	end
	if not A1_120.shadowSize then
	end
	local L10_129 = L10_129
	local L15_134 = L15_134
	local L12_131 = L12_131
	L5_124:insert((display.newText(A0_119, 0, 0, L17_136, L16_135)))
	local L13_132 = L13_132
	local L14_133 = L14_133
	L14_133(display.newText(A0_119, 0, 0, L17_136, L16_135), unpack(L10_129))
	L14_133 = 0
	L13_132.y = 0
	L13_132.x = L14_133
	L14_133 = nil
	if L12_131 ~= 0 then
		L14_133 = (function(A0_139)
			local L5_144 = L5_144
			local L5_144, L6_145 = L5_144(A0_139, 0, 0, _ENV, L8_127), L6_145
			A0_139 = L5_144
			L6_145 = A0_139
			L5_144 = A0_139.setTextColor
			L5_144(L6_145, unpack(L11_130))
			L5_144 = L2_121
			L6_145 = L5_144
			L5_144 = L5_144.insert
			local L3_142 = L3_142
			L5_144(L6_145, L3_142, A0_139)
			local L4_143 = L4_143
			return A0_139
		end)(A0_119)
		L14_133.x, L14_133.y = L12_131, L12_131
		;(function(A0_146)
			local L5_151 = L5_151
			local L5_151, L6_152 = L5_151(A0_146, 0, 0, _ENV, L8_127), L6_152
			A0_146 = L5_151
			L6_152 = A0_146
			L5_151 = A0_146.setTextColor
			L5_151(L6_152, unpack(L11_130))
			L5_151 = L2_121
			L6_152 = L5_151
			L5_151 = L5_151.insert
			local L3_149 = L3_149
			L5_151(L6_152, L3_149, A0_146)
			local L4_150 = L4_150
			return A0_146
		end)(A0_119).x, (function(A0_153)
			local L5_158 = L5_158
			local L5_158, L6_159 = L5_158(A0_153, 0, 0, _ENV, L8_127), L6_159
			A0_153 = L5_158
			L6_159 = A0_153
			L5_158 = A0_153.setTextColor
			L5_158(L6_159, unpack(L11_130))
			L5_158 = L2_121
			L6_159 = L5_158
			L5_158 = L5_158.insert
			local L3_156 = L3_156
			L5_158(L6_159, L3_156, A0_153)
			local L4_157 = L4_157
			return A0_153
		end)(A0_119).y = L12_131, -L12_131
		;(function(A0_160)
			local L5_165 = L5_165
			local L5_165, L6_166 = L5_165(A0_160, 0, 0, _ENV, L8_127), L6_166
			A0_160 = L5_165
			L6_166 = A0_160
			L5_165 = A0_160.setTextColor
			L5_165(L6_166, unpack(L11_130))
			L5_165 = L2_121
			L6_166 = L5_165
			L5_165 = L5_165.insert
			local L3_163 = L3_163
			L5_165(L6_166, L3_163, A0_160)
			local L4_164 = L4_164
			return A0_160
		end)(A0_119).x, (function(A0_167)
			local L5_172 = L5_172
			local L5_172, L6_173 = L5_172(A0_167, 0, 0, _ENV, L8_127), L6_173
			A0_167 = L5_172
			L6_173 = A0_167
			L5_172 = A0_167.setTextColor
			L5_172(L6_173, unpack(L11_130))
			L5_172 = L2_121
			L6_173 = L5_172
			L5_172 = L5_172.insert
			local L3_170 = L3_170
			L5_172(L6_173, L3_170, A0_167)
			local L4_171 = L4_171
			return A0_167
		end)(A0_119).y = -L12_131, L12_131
		;(function(A0_174)
			local L5_179 = L5_179
			local L5_179, L6_180 = L5_179(A0_174, 0, 0, _ENV, L8_127), L6_180
			A0_174 = L5_179
			L6_180 = A0_174
			L5_179 = A0_174.setTextColor
			L5_179(L6_180, unpack(L11_130))
			L5_179 = L2_121
			L6_180 = L5_179
			L5_179 = L5_179.insert
			local L3_177 = L3_177
			L5_179(L6_180, L3_177, A0_174)
			local L4_178 = L4_178
			return A0_174
		end)(A0_119).x, (function(A0_181)
			local L5_186 = L5_186
			local L5_186, L6_187 = L5_186(A0_181, 0, 0, _ENV, L8_127), L6_187
			A0_181 = L5_186
			L6_187 = A0_181
			L5_186 = A0_181.setTextColor
			L5_186(L6_187, unpack(L11_130))
			L5_186 = L2_121
			L6_187 = L5_186
			L5_186 = L5_186.insert
			local L3_184 = L3_184
			L5_186(L6_187, L3_184, A0_181)
			local L4_185 = L4_185
			return A0_181
		end)(A0_119).y = -L12_131, -L12_131
		;(function(A0_188)
			local L5_193 = L5_193
			local L5_193, L6_194 = L5_193(A0_188, 0, 0, _ENV, L8_127), L6_194
			A0_188 = L5_193
			L6_194 = A0_188
			L5_193 = A0_188.setTextColor
			L5_193(L6_194, unpack(L11_130))
			L5_193 = L2_121
			L6_194 = L5_193
			L5_193 = L5_193.insert
			local L3_191 = L3_191
			L5_193(L6_194, L3_191, A0_188)
			local L4_192 = L4_192
			return A0_188
		end)(A0_119).x, (function(A0_195)
			local L5_200 = L5_200
			local L5_200, L6_201 = L5_200(A0_195, 0, 0, _ENV, L8_127), L6_201
			A0_195 = L5_200
			L6_201 = A0_195
			L5_200 = A0_195.setTextColor
			L5_200(L6_201, unpack(L11_130))
			L5_200 = L2_121
			L6_201 = L5_200
			L5_200 = L5_200.insert
			local L3_198 = L3_198
			L5_200(L6_201, L3_198, A0_195)
			local L4_199 = L4_199
			return A0_195
		end)(A0_119).y = 0, L12_131
		local L18_137 = L18_137
		local L19_138 = L19_138
		;(function(A0_202)
			local L5_207 = L5_207
			local L5_207, L6_208 = L5_207(A0_202, 0, 0, _ENV, L8_127), L6_208
			A0_202 = L5_207
			L6_208 = A0_202
			L5_207 = A0_202.setTextColor
			L5_207(L6_208, unpack(L11_130))
			L5_207 = L2_121
			L6_208 = L5_207
			L5_207 = L5_207.insert
			local L3_205 = L3_205
			L5_207(L6_208, L3_205, A0_202)
			local L4_206 = L4_206
			return A0_202
		end)(A0_119).x, (function(A0_209)
			local L5_214 = L5_214
			local L5_214, L6_215 = L5_214(A0_209, 0, 0, _ENV, L8_127), L6_215
			A0_209 = L5_214
			L6_215 = A0_209
			L5_214 = A0_209.setTextColor
			L5_214(L6_215, unpack(L11_130))
			L5_214 = L2_121
			L6_215 = L5_214
			L5_214 = L5_214.insert
			local L3_212 = L3_212
			L5_214(L6_215, L3_212, A0_209)
			local L4_213 = L4_213
			return A0_209
		end)(A0_119).y = 0, -L12_131
	end
	function L5_124.setTextColor(A0_216, ...)
		local L2_217, L3_218, L4_219
		function L2_217()
			local L0_221, L1_222, L2_223
			L0_221 = _ENV
			L0_221 = L0_221[1]
			L1_222 = _ENV
			L1_222 = L1_222[2]
			L2_223 = _ENV
			L2_223 = L2_223[3]
			return L0_221, L1_222, L2_223
		end
		L3_218 = _ENV
		L4_219 = L3_218
		L3_218 = L3_218.setTextColor
		local L5_220 = L2_217()
		L3_218(L4_219, L5_220)
	end
	function L5_124.setShadowColor(A0_224, ...)
		local L2_225, L3_226, L4_227
		L2_225 = _ENV
		if L2_225 ~= 0 then
			function L2_225()
				local L0_229, L1_230, L2_231
				L0_229 = _ENV
				L0_229 = L0_229[1]
				L1_230 = _ENV
				L1_230 = L1_230[2]
				L2_231 = _ENV
				L2_231 = L2_231[3]
				return L0_229, L1_230, L2_231
			end
			L3_226 = L14_133
			L4_227 = L3_226
			L3_226 = L3_226.setTextColor
			L3_226(L4_227, L2_225())
			L3_226 = L18_137
			L4_227 = L3_226
			L3_226 = L3_226.setTextColor
			L3_226(L4_227, L2_225())
			L3_226 = L19_138
			L4_227 = L3_226
			L3_226 = L3_226.setTextColor
			L3_226(L4_227, L2_225())
			L3_226 = _UPVALUE4_
			L4_227 = L3_226
			L3_226 = L3_226.setTextColor
			L3_226(L4_227, L2_225())
			L3_226 = _UPVALUE5_
			L4_227 = L3_226
			L3_226 = L3_226.setTextColor
			L3_226(L4_227, L2_225())
			L3_226 = _UPVALUE6_
			L4_227 = L3_226
			L3_226 = L3_226.setTextColor
			local L5_228 = L2_225()
			L3_226(L4_227, L5_228)
		end
	end
	function L5_124.setText(A0_232)
		local L1_233
		L1_233 = _ENV
		L1_233.text = A0_232
		L1_233 = L12_131
		if L1_233 ~= 0 then
			L1_233 = L14_133
			L1_233.text = A0_232
			L1_233 = L18_137
			L1_233.text = A0_232
			L1_233 = L19_138
			L1_233.text = A0_232
			L1_233 = _UPVALUE5_
			L1_233.text = A0_232
			L1_233 = _UPVALUE6_
			L1_233.text = A0_232
			L1_233 = _UPVALUE7_
			L1_233.text = A0_232
		end
	end
	return L5_124
end
getOutlinedText = L4_4
function L4_4()
	local L0_234 = L0_234
	;({}).autoClose = 3000
	;({}).text = "No network connection detected. Try again later."
	L0_234({})
	local L1_235 = L1_235
end
displayNoNetworkConnection = L4_4
function L4_4(A0_236)
	if not isCorona() then
		if analytics then
			analytics.logEvent(A0_236)
		end
	else
		local L2_237 = L2_237
		L2_237("Would have logged event to Flurry", A0_236)
		local L3_238 = L3_238
	end
end
logEvent = L4_4
function L4_4(A0_239)
	local L1_240, L2_241, L3_242, L4_243, L5_244
	if not A0_239 then
		L1_240 = {}
		A0_239 = L1_240
	end
	L1_240 = A0_239.isMultiplayer
	if not L1_240 then
		L1_240 = false
	end
	L2_241 = A0_239.amountWon
	if not L2_241 then
		L2_241 = nil
	end
	L3_242 = A0_239.amountSpent
	if not L3_242 then
		L3_242 = nil
	end
	function L4_243(A0_258, A1_259, A2_260)
		local L3_261, L4_262
		L3_261 = A0_258
		L4_262 = false
		L8_266 = 1
		_FOR_ = 1
		for _FORV_8_ = L8_266, _FOR_, _FOR_ do
			if A1_259 <= A2_260[_FORV_8_] then
				L3_261 = L3_261 .. " <= " .. A2_260[_FORV_8_]
				L4_262 = true
				break
			end
		end
		if not L4_262 then
			L8_266 = L3_261
			L9_267 = " > "
			L10_268 = #A2_260
			L10_268 = A2_260[L10_268]
			L3_261 = L8_266 .. L9_267 .. L10_268
		end
		return L3_261
	end
	if L2_241 and 0 < L2_241 then
		L5_244 = "Warbux Won "
		if L1_240 then
			L5_244 = "MP " .. L5_244
		end
		;({})[1] = 100
		;({})[2] = 200
		;({})[3] = 350
		;({})[4] = 500
		;({})[5] = 750
		;({})[6] = 1000
		;({})[7] = 2000
		;({})[8] = 3500
		;({})[9] = 5000
		;({})[10] = 7500
		;({})[11] = 10000
		L5_244 = L4_243(L5_244, L2_241, {})
		logEvent(L5_244)
	end
	if L3_242 and 0 < L3_242 then
		L5_244 = "Warbux Spent "
		if L1_240 then
			local L6_245 = L6_245
			L5_244 = L6_245 .. L5_244
		end
		L6_245 = {}
		local L11_250 = L11_250
		local L12_251 = L12_251
		local L13_252 = L13_252
		local L14_253 = L14_253
		local L15_254 = L15_254
		local L16_255 = L16_255
		local L17_256 = L17_256
		L6_245[1] = L11_250
		L6_245[2] = L12_251
		L6_245[3] = L13_252
		L6_245[4] = L14_253
		L6_245[5] = L15_254
		L6_245[6] = L16_255
		L6_245[7] = L17_256
		L6_245[8] = 1500
		L6_245[9] = 2000
		L6_245[10] = 2500
		L6_245[11] = 3000
		local L6_245[12], L18_257 = 5000, L18_257
		L11_250 = L4_243
		L12_251 = L5_244
		L13_252 = L3_242
		L14_253 = L6_245
		L11_250 = L11_250(L12_251, L13_252, L14_253)
		L5_244 = L11_250
		L11_250 = logEvent
		L12_251 = L5_244
		L11_250(L12_251)
	end
end
logEventMoneyPot = L4_4
function L4_4(A0_270)
	local L1_271
	L1_271 = 1
	local L6_276 = string
	L6_276 = L6_276.len
	L6_276 = L6_276(A0_270)
	_FOR_ = 3
	for _FORV_6_ = _FOR_, _FOR_, _FOR_ do
		if not string.byte(A0_270, _FORV_6_ + 1) then
		end
		if not string.byte(A0_270, _FORV_6_ + 2) then
		end
		L1_271 = math.fmod(L1_271 * 8161, 4294967279) + string.byte(A0_270, _FORV_6_) * 16776193 + (L6_276 - _FORV_6_ + 256) * 8372226 + (L6_276 - _FORV_6_ + 256) * 3932164
	end
	L7_277 = math
	L7_277 = L7_277.fmod
	L9_279 = L1_271
	L10_280 = 4294967291
	return L7_277(L9_279, L10_280)
end
stringHash = L4_4
function L4_4(A0_281)
	local L1_282, L2_283
	L1_282 = {}
	function L2_283(A0_286)
		local L6_292 = L6_292
		if A0_286 ~= nil then
			L6_292 = type
			L6_292 = L6_292(A0_286)
			if L6_292 == "table" then
				goto lbl_10
			end
		end
		do return A0_286 end
		goto lbl_17
		::lbl_10::
		L6_292 = _ENV
		L6_292 = L6_292[A0_286]
		if L6_292 then
			L6_292 = _ENV
			L6_292 = L6_292[A0_286]
			return L6_292
		end
		::lbl_17::
		L6_292 = {}
		_ENV[A0_286] = L6_292
		L2_288, L3_289, _FOR_ = L2_288(A0_286)
		for _FORV_5_, _FORV_6_ in L2_288, L3_289, _FOR_ do
			L6_292[L2_283(_FORV_5_)] = L2_283(_FORV_6_)
		end
		L2_288 = setmetatable
		L3_289 = L6_292
		L7_293 = getmetatable
		L9_295 = A0_286
		L7_293, L9_295 = L7_293(L9_295)
		return L2_288(L3_289, L7_293, L9_295, L7_293(L9_295))
	end
	local L3_284 = L3_284
	do return L3_284(A0_281) end
	local L4_285 = L4_285
end
deepcopy = L4_4
L4_4 = utils
function L5_5(A0_296, A1_297)
	L4_300 = A1_297
	L2_298, L4_300, _FOR_ = L2_298(L4_300)
	for _FORV_5_, _FORV_6_ in L2_298, L4_300, _FOR_ do
		A0_296[_FORV_5_] = _FORV_6_
	end
end
L4_4.copyInto = L5_5
function L4_4(A0_301, A1_302, A2_303, A3_304, A4_305)
	local L5_306, L6_307
	L5_306 = A3_304 - A0_301
	L5_306 = L5_306 ^ 2
	L6_307 = A4_305 - A1_302
	L6_307 = L6_307 ^ 2
	L5_306 = L5_306 + L6_307
	L6_307 = A2_303 ^ 2
	L5_306 = L5_306 <= L6_307
	return L5_306
end
pointInCircle = L4_4
function L4_4(A0_308, A1_309, A2_310, A3_311)
	local L7_314 = L7_314
	local L8_315 = L8_315
	L8_315 = L8_315 + math.pow(A3_311 - A1_309, 2)
	return L7_314(L8_315)
end
distanceBetweenPoints = L4_4
function L4_4(A0_316, A1_317, A2_318, A3_319, A4_320, A5_321, A6_322)
	local L7_323, L8_324, L9_325, L10_326, L11_327, L12_328, L13_329, L14_330
	L7_323 = A5_321 - A3_319
	L8_324 = A6_322 - A4_320
	L9_325 = L7_323 * L7_323
	L10_326 = L8_324 * L8_324
	L9_325 = L9_325 + L10_326
	L10_326 = A0_316 - A3_319
	L10_326 = L10_326 * L7_323
	L11_327 = A1_317 - A4_320
	L11_327 = L11_327 * L8_324
	L10_326 = L10_326 + L11_327
	L10_326 = L10_326 / L9_325
	if 1 < L10_326 then
		L10_326 = 1
	elseif L10_326 < 0 then
		L10_326 = 0
	end
	L11_327 = L10_326 * L7_323
	L11_327 = A3_319 + L11_327
	L12_328 = L10_326 * L8_324
	L12_328 = A4_320 + L12_328
	L13_329 = L11_327 - A0_316
	L14_330 = L12_328 - A1_317
	local L15_331 = L15_331
	local L17_333 = L13_329 * L13_329 + L14_330 * L14_330
	L15_331 = L15_331(L17_333)
	dist = L15_331
	L15_331 = dist
	if A2_318 > L15_331 then
		L15_331 = true
		return L15_331
	end
	L15_331 = false
	return L15_331
end
lineIntersectsCircle = L4_4
function L4_4(A0_334, A1_335, A2_336, A3_337, A4_338)
	if not A3_337 then
	end
	if not A4_338 then
		A4_338 = 0
	end
	A3_337 = 0
	A0_334 = A0_334 - A3_337
	A1_335 = A1_335 - A4_338
	local L5_339 = L5_339
	L5_339 = L5_339(A2_336)
	local L6_340 = L6_340
	L6_340 = L6_340(L5_339)
	L6_340 = A0_334 * L6_340
	L6_340 = L6_340 - A1_335 * math.sin(L5_339)
	local L7_341 = L7_341
	L7_341 = L7_341(L5_339)
	L7_341 = A0_334 * L7_341
	local L8_342 = L8_342
	local L8_342, L9_343 = L8_342(L5_339), L9_343
	L8_342 = A1_335 * L8_342
	L7_341 = L7_341 + L8_342
	L8_342 = L6_340 + A3_337
	L9_343 = L7_341 + A4_338
	return L8_342, L9_343
end
getRotatedPoint = L4_4
function L4_4(A0_344, A1_345, A2_346, A3_347, A4_348)
	local L5_349, L6_350, L7_351, L8_352, L9_353
	if A0_344.x == A1_345.x and A0_344.y == A1_345.y or A2_346.x == A3_347.x and A2_346.y == A3_347.y then
		return false
	end
	A1_345.x = A1_345.x - A0_344.x
	A1_345.y = A1_345.y - A0_344.y
	A2_346.x = A2_346.x - A0_344.x
	A2_346.y = A2_346.y - A0_344.y
	A3_347.x = A3_347.x - A0_344.x
	A3_347.y = A3_347.y - A0_344.y
	local L10_354 = L10_354
	local L13_357 = L13_357
	L13_357 = L13_357 + A1_345.y * A1_345.y
	L10_354 = L10_354(L13_357)
	L5_349 = L10_354
	L10_354 = A1_345.x
	L6_350 = L10_354 / L5_349
	L10_354 = A1_345.y
	L7_351 = L10_354 / L5_349
	L10_354 = A2_346.x
	L10_354 = L10_354 * L6_350
	L13_357 = A2_346.y
	L13_357 = L13_357 * L7_351
	L8_352 = L10_354 + L13_357
	L10_354 = A2_346.y
	L10_354 = L10_354 * L6_350
	L13_357 = A2_346.x
	L13_357 = L13_357 * L7_351
	L10_354 = L10_354 - L13_357
	A2_346.y = L10_354
	A2_346.x = L8_352
	L10_354 = A3_347.x
	L10_354 = L10_354 * L6_350
	L13_357 = A3_347.y
	L13_357 = L13_357 * L7_351
	L8_352 = L10_354 + L13_357
	L10_354 = A3_347.y
	L10_354 = L10_354 * L6_350
	L13_357 = A3_347.x
	L13_357 = L13_357 * L7_351
	L10_354 = L10_354 - L13_357
	A3_347.y = L10_354
	A3_347.x = L8_352
	L10_354 = A2_346.y
	if L10_354 < 0 then
		L10_354 = A3_347.y
		if L10_354 < 0 then
			goto lbl_94
		end
	end
	L10_354 = A2_346.y
	if 0 <= L10_354 then
		L10_354 = A3_347.y
		::lbl_94::
		if 0 <= L10_354 then
			L10_354 = false
			return L10_354
		end
	end
	L10_354 = A3_347.x
	L13_357 = A2_346.x
	L13_357 = L13_357 - A3_347.x
	L13_357 = L13_357 * A3_347.y
	L13_357 = L13_357 / (A3_347.y - A2_346.y)
	L9_353 = L10_354 + L13_357
	if L9_353 < 0 or L5_349 < L9_353 then
		L10_354 = false
		return L10_354
	end
	if A4_348 then
		L10_354 = {}
		L13_357 = A0_344.x
		L13_357 = L13_357 + L9_353 * L6_350
		L10_354.x = L13_357
		L13_357 = A0_344.y
		L13_357 = L13_357 + L9_353 * L7_351
		L10_354.y = L13_357
		return L10_354
	end
	L10_354 = true
	return L10_354
end
lineIntersectsLine = L4_4
function L4_4(A0_358, A1_359)
	local L2_360, L3_361, L4_362, L5_363
	L2_360 = {}
	L3_361 = A0_358.x
	L4_362 = A1_359.x
	L3_361 = L3_361 - L4_362
	L4_362 = A0_358.y
	L5_363 = A1_359.y
	L4_362 = L4_362 - L5_363
	L2_360.y = L4_362
	L2_360.x = L3_361
	return L2_360
end
pointSubtraction = L4_4
function L4_4(A0_364, A1_365)
	local L2_366, L3_367, L4_368
	L2_366 = A0_364.x
	L3_367 = A1_365.x
	L2_366 = L2_366 * L3_367
	L3_367 = A0_364.y
	L4_368 = A1_365.y
	L3_367 = L3_367 * L4_368
	L2_366 = L2_366 + L3_367
	return L2_366
end
dotProduct = L4_4
function L4_4(A0_369, A1_370, A2_371)
	local L3_372, L4_373, L5_374
	L3_372 = A0_369.physics
	if L3_372 then
		L3_372 = A0_369.x
		if L3_372 ~= nil then
			L3_372 = A0_369.y
			if L3_372 ~= nil then
				goto lbl_13
			end
		end
	end
	L3_372 = 0
	L4_373 = 0
	do return L3_372, L4_373 end
	::lbl_13::
	L3_372 = 0
	L4_373 = 0
	L5_374 = A0_369.physics
	L8_377 = #L5_374
	if not (0 < L8_377) then
		L8_377 = {}
		L9_378 = L5_374
		L8_377[1] = L9_378
		L5_374 = L8_377
	end
	L8_377 = pairs
	L9_378 = L5_374
	L8_377, L9_378, L10_379 = L8_377(L9_378)
	for _FORV_9_, _FORV_10_ in L8_377, L9_378, L10_379 do
		if _FORV_10_.shape then
			_FOR_ = 2
			for _FORV_14_ = _FOR_, _FOR_, _FOR_ do
				L3_372 = L3_372 + 1
				if utils.pointInPolygon(A1_370, utils.getRotatedPoint(A0_369.x + _FORV_10_.shape[_FORV_14_], A0_369.y + _FORV_10_.shape[_FORV_14_ + 1], A0_369.rotation, A0_369.x, A0_369.y)) then
					L4_373 = L4_373 + 1
					if L3_372 > L4_373 then
						break
					end
				end
			end
			break -- pseudo-goto
		end
		L18_387 = utils
		L18_387 = L18_387.pointInPolygon
		L19_388 = A1_370
		L20_389 = A0_369.x
		L18_387 = L18_387(L19_388, L20_389, A0_369.y)
		repeat
			if L18_387 then
				L4_373 = 1
			end
		until true
	end
	L8_377 = L3_372
	L9_378 = L4_373
	return L8_377, L9_378
end
getTotalPointsInPolygon = L4_4
function L4_4(A0_390, A1_391, A2_392)
	local L3_393, L4_394, L5_395
	L3_393 = A0_390.physics
	if L3_393 then
		L3_393 = A0_390.x
		if L3_393 ~= nil then
			L3_393 = A0_390.y
			if L3_393 ~= nil then
				goto lbl_13
			end
		end
	end
	L3_393 = 0
	L4_394 = 0
	do return L3_393, L4_394 end
	::lbl_13::
	L3_393 = 0
	L4_394 = 0
	L5_395 = A0_390.physics
	L8_398 = #L5_395
	if not (0 < L8_398) then
		L8_398 = {}
		L9_399 = L5_395
		L8_398[1] = L9_399
		L5_395 = L8_398
	end
	L8_398 = pairs
	L9_399 = L5_395
	L8_398, L9_399, L10_400 = L8_398(L9_399)
	for L11_401, L12_402 in L8_398, L9_399, L10_400 do
		if L12_402.shape then
			_FOR_ = 2
			for _FORV_14_ = _FOR_, _FOR_, _FOR_ do
				L3_393 = L3_393 + 1
				local L22_412 = L22_412
				if utils.pointInCircle(A1_391.x, A1_391.y, A1_391.contentWidth / 2 / A2_392, utils.getRotatedPoint(A0_390.x + L12_402.shape[_FORV_14_], A0_390.y + L12_402.shape[_FORV_14_ + 1], A0_390.rotation, A0_390.x, A0_390.y)) then
					L4_394 = L4_394 + 1
					if L3_393 > L4_394 then
						break
					end
				end
			end
			break -- pseudo-goto
		end
		L3_393 = 1
		L18_408 = A1_391.contentWidth
		L18_408 = L18_408 / 2
		L18_408 = L18_408 / A2_392
		L19_409 = L12_402.radius
		L20_410 = math
		L20_410 = L20_410.sqrt
		L21_411 = A1_391.y
		L22_412 = A0_390.y
		L21_411 = L21_411 - L22_412
		L21_411 = L21_411 ^ 2
		L22_412 = A1_391.x
		L22_412 = L22_412 - A0_390.x
		L22_412 = L22_412 ^ 2
		L21_411 = L21_411 + L22_412
		L20_410 = L20_410(L21_411)
		repeat
			L21_411 = L18_408 + L19_409
			if L20_410 < L21_411 then
				L4_394 = 1
			end
		until true
	end
	L8_398 = L3_393
	L9_399 = L4_394
	return L8_398, L9_399
end
getPointsInCircle = L4_4
function L4_4(A0_413, A1_414, A2_415)
	if not A2_415 then
	end
	A2_415 = string.rep(" ", math.abs(A1_414))
	if A1_414 < 0 then
		return string.sub(A2_415 .. A0_413, A1_414)
	end
	local L3_416 = L3_416
	local L4_417 = L4_417
	local L5_418 = L5_418
	do return L3_416(L4_417, L5_418, A1_414) end
	local L6_419 = L6_419
end
padText = L4_4
function L4_4(A0_420, A1_421, A2_422, A3_423)
	repeat
		if not A2_422 then
			L7_427 = {}
			A2_422 = L7_427
		end
		if not A1_421 then
			A1_421 = 0
		end
		if A3_423 then
			L7_427 = io
			L7_427 = L7_427.write
			L8_428 = A3_423
			L8_428 = L8_428 .. "\n"
			L7_427(L8_428)
		end
		L7_427 = type
		L8_428 = A0_420
		L7_427 = L7_427(L8_428)
		if L7_427 == "table" then
			L7_427 = pairs
			L8_428 = A0_420
			L7_427, L8_428, _FOR_ = L7_427(L8_428)
			for _FORV_7_, _FORV_8_ in L7_427, L8_428, _FOR_ do
				io.write(string.rep(" ", A1_421))
				if type(_FORV_8_) == "table" and not A2_422[_FORV_8_] then
					A2_422[_FORV_8_] = true
					io.write(string.format("[%s] => table\n", tostring(_FORV_7_)))
					io.write(string.rep(" ", A1_421 + 4))
					io.write("(\n")
					table_print(_FORV_8_, A1_421 + 7, A2_422)
					io.write(string.rep(" ", A1_421 + 4))
					io.write(")\n")
				else
					local L12_432 = L12_432
					local L13_433 = L13_433
					local L14_434 = L14_434
					L13_433, L14_434 = L13_433(L14_434, tostring(_FORV_7_), tostring(_FORV_8_))
					L12_432(L13_433, L14_434, L13_433(L14_434, tostring(_FORV_7_), tostring(_FORV_8_)))
				end
			end
			break -- pseudo-goto
		end
		L7_427 = io
		L7_427 = L7_427.write
		L8_428 = tostring
		L9_429 = A0_420
		L8_428 = L8_428(L9_429)
		L9_429 = "\n"
		L8_428 = L8_428 .. L9_429
		L7_427(L8_428)
	until true
end
table_print = L4_4
function L4_4(A0_435, A1_436)
	local L2_437 = L2_437
	local L2_437, L6_441 = L2_437(0, 0, A0_435.contentWidth, A0_435.contentHeight), L6_441
	L2_437.alpha = 0
	L2_437.isHitTestable = true
	L6_441 = addHitBlockListeners
	L6_441(L2_437)
	L6_441 = A0_435.x
	L2_437.y = A0_435.y
	L2_437.x = L6_441
	if A1_436 ~= nil then
		L6_441 = A1_436.insert
		local L4_439 = L4_439
		L6_441(L4_439, L2_437)
		local L5_440 = L5_440
	end
	return L2_437
end
makeHitBlocker = L4_4
function L4_4(A0_442)
	A0_442.isHitTestable = true
	local L4_446 = A0_442.addEventListener
	L4_446(A0_442, "touch", function()
		local L1_447
		L1_447 = true
		return L1_447
	end)
	L4_446 = A0_442.addEventListener
	local L2_444 = L2_444
	local L3_445 = L3_445
	L4_446(L2_444, L3_445, function()
		local L1_448
		L1_448 = true
		return L1_448
	end)
end
addHitBlockListeners = L4_4
function L4_4(A0_449)
	local L1_450, L2_451
	L1_450 = A0_449.x
	L2_451 = A0_449.y
	local L3_452 = L3_452
	local L4_453 = L4_453
	local L3_452, L5_454 = L3_452(L4_453, L1_450), L5_454
	L4_453 = L3_452 * 180
	L5_454 = math
	L5_454 = L5_454.pi
	L4_453 = L4_453 / L5_454
	if L4_453 < 0 then
		L4_453 = 360 + L4_453
	end
	return L4_453
end
angleOfPoint = L4_4
function L4_4(A0_455, A1_456)
	local L2_457
	L2_457 = 4
	if LOW_RES_PHYSICS_MODE then
		L2_457 = L2_457 * 32
	end
	local L3_458 = L3_458
	local L4_459 = L4_459
	do return L3_458(L4_459, A1_456 / L2_457) end
	local L5_460 = L5_460
end
getXYfromCanonVector = L4_4
function L4_4(A0_461, A1_462)
	local L2_463
	L2_463 = math
	L2_463 = L2_463.sin
	local L3_464 = L3_464
	local L3_464, L4_465 = L3_464(A0_461)
	L2_463 = L2_463(L3_464, L4_465, L3_464(A0_461))
	L2_463 = L2_463 * A1_462
	L3_464 = math
	L3_464 = L3_464.cos
	L4_465 = math
	L4_465 = L4_465.abs
	local L5_466 = L5_466
	local L5_466, L6_467 = L5_466(A0_461)
	L4_465, L5_466, L6_467 = L4_465(L5_466, L6_467)
	L3_464 = L3_464(L4_465, L5_466, L6_467)
	L3_464 = -1 * L3_464
	L3_464 = L3_464 * A1_462
	L4_465 = L2_463
	L5_466 = L3_464
	return L4_465, L5_466
end
getXYfromVector = L4_4
function L4_4(A0_468, A1_469, A2_470, A3_471)
	local L4_472
	L4_472 = A0_468.x
	if L4_472 ~= nil then
		L4_472 = A0_468.y
		if L4_472 ~= nil then
			goto lbl_9
		end
	end
	L4_472 = false
	do return L4_472 end
	::lbl_9::
	L4_472 = A0_468.physics
	L7_475 = #L4_472
	if not (0 < L7_475) then
		L7_475 = {}
		L8_476 = L4_472
		L7_475[1] = L8_476
		L4_472 = L7_475
	end
	L7_475 = pairs
	L8_476 = L4_472
	L7_475, L8_476, L9_477 = L7_475(L8_476)
	for _FORV_8_, _FORV_9_ in L7_475, L8_476, L9_477 do
		if _FORV_9_.radius ~= nil then
			if true then
				L12_480 = L12_480(L13_481, A0_468.y, A0_468.contentWidth / 2 / A2_470, A1_469.p1.x, A1_469.p1.y, A1_469.p2.x, A1_469.p2.y)
				if L12_480 then
					L12_480 = true
					return L12_480
				end
				break
		end
		else
			L12_480 = _FORV_9_.shape
			if L12_480 == nil then
				break
			end
		end
		L12_480 = 1
		L13_481 = _FORV_9_.shape
		L13_481 = #L13_481
		L13_481 = L13_481 - 1
		_FOR_ = 2
		for _FORV_13_ = L12_480, L13_481, _FOR_ do
			local L16_484 = L16_484
			local L17_485 = L17_485
			L16_484, L17_485 = L16_484(L17_485, A0_468.y + _FORV_9_.shape[_FORV_13_ + 1], A0_468.rotation, A0_468.x, A0_468.y)
			if _FORV_13_ < #_FORV_9_.shape - 2 then
			else
			end
			local L18_486 = L18_486
			;({}).x = L16_484
			;({}).y = L17_485
			local L19_487 = L19_487
			;({}).x = L18_486
			;({}).y = L19_487
			local L20_488 = L20_488
			;({}).x = A1_469.p1.x
			;({}).y = A1_469.p1.y
			local L21_489 = L21_489
			;({}).x = A1_469.p2.x
			;({}).y = A1_469.p2.y
			local L22_490 = L22_490
			local L20_488, L23_491 = L20_488(L21_489, L22_490, {}, {}, A3_471), L23_491
			if L20_488 then
				return L20_488
			end
		end
	end
	L7_475 = false
	return L7_475
end
polygonIntersectsLineSegment = L4_4
function L4_4(A0_492, A1_493, A2_494)
	local L3_495, L4_496, L5_497, L6_498, L7_499, L8_500, L9_501, L10_502, L11_503, L12_504, L13_505, L14_506, L15_507, L16_508, L17_509
	L3_495 = {}
	L4_496 = A1_493
	L3_495.y = A2_494
	L3_495.x = L4_496
	L4_496 = {}
	L5_497 = 1
	L6_498 = #A0_492
	L6_498 = L6_498 - 2
	L7_499 = 2
	for L8_500 = L5_497, L6_498, L7_499 do
		L9_501 = {}
		L10_502 = A0_492[L8_500]
		L11_503 = L8_500 + 1
		L11_503 = A0_492[L11_503]
		L9_501.y = L11_503
		L9_501.x = L10_502
		L10_502 = #L4_496
		L10_502 = L10_502 + 1
		L4_496[L10_502] = L9_501
	end
	L5_497 = false
	L6_498 = nil
	L7_499 = nil
	L8_500 = #L4_496
	if L8_500 < 3 then
		L8_500 = false
		return L8_500
	end
	L8_500 = #L4_496
	L8_500 = L4_496[L8_500]
	L9_501 = 1
	L10_502 = #L4_496
	L11_503 = 1
	for L12_504 = L9_501, L10_502, L11_503 do
		L13_505 = L4_496[L12_504]
		L14_506 = L13_505.x
		L15_507 = L8_500.x
		if L14_506 > L15_507 then
			L6_498 = L8_500
			L7_499 = L13_505
		else
			L6_498 = L13_505
			L7_499 = L8_500
		end
		L14_506 = L13_505.x
		L15_507 = L3_495.x
		L14_506 = L14_506 < L15_507
		L15_507 = L3_495.x
		L16_508 = L8_500.x
		L15_507 = L15_507 <= L16_508
		if L14_506 == L15_507 then
			L14_506 = L3_495.y
			L15_507 = L6_498.y
			L14_506 = L14_506 - L15_507
			L15_507 = L7_499.x
			L16_508 = L6_498.x
			L15_507 = L15_507 - L16_508
			L14_506 = L14_506 * L15_507
			L15_507 = L7_499.y
			L16_508 = L6_498.y
			L15_507 = L15_507 - L16_508
			L16_508 = L3_495.x
			L17_509 = L6_498.x
			L16_508 = L16_508 - L17_509
			L15_507 = L15_507 * L16_508
			if L14_506 < L15_507 then
				L5_497 = not L5_497
			end
		end
		L8_500 = L13_505
	end
	return L5_497
end
pointInPolygon = L4_4
function L4_4(A0_510, A1_511, A2_512)
	local L3_513
	L3_513 = A0_510.x
	if L3_513 ~= nil then
		L3_513 = A0_510.y
		if L3_513 ~= nil then
			goto lbl_9
		end
	end
	L3_513 = false
	do return L3_513 end
	::lbl_9::
	L3_513 = A0_510.physics
	L6_516 = #L3_513
	if not (0 < L6_516) then
		L6_516 = {}
		L7_517 = L3_513
		L6_516[1] = L7_517
		L3_513 = L6_516
	end
	L6_516 = pairs
	L7_517 = L3_513
	L6_516, L7_517, L8_518 = L6_516(L7_517)
	for L9_519, L10_520 in L6_516, L7_517, L8_518 do
		L11_521 = L10_520.shape
		if L11_521 == nil then
			break
		end
		L11_521 = 1
		L12_522 = L10_520.shape
		L12_522 = #L12_522
		L12_522 = L12_522 - 1
		_FOR_ = 2
		for _FORV_12_ = L11_521, L12_522, _FOR_ do
			local L15_525 = L15_525
			local L16_526 = L16_526
			L15_525, L16_526 = L15_525(L16_526, A0_510.y + L10_520.shape[_FORV_12_ + 1], A0_510.rotation, A0_510.x, A0_510.y)
			if _FORV_12_ < #L10_520.shape - 2 then
			else
			end
			local L17_527 = L17_527
			local L18_528 = L18_528
			local L19_529 = L19_529
			local L20_530 = L20_530
			local L21_531 = L21_531
			local L22_532 = L22_532
			local L23_533 = L23_533
			local L19_529, L24_534 = L19_529(L20_530, L21_531, L22_532, L23_533, L16_526, L17_527, L18_528), L24_534
			if L19_529 then
				L19_529 = true
				return L19_529
			end
		end
	end
	L6_516 = false
	return L6_516
end
polygonIntersectsCircle = L4_4
function L4_4(A0_535, A1_536)
	if A1_536 and 0 < A1_536 then
		local L4_539 = L4_539
		return math.floor(A0_535 * 10 ^ A1_536 + 0.5) / L4_539
	end
	L4_539 = math
	L4_539 = L4_539.floor
	do return L4_539(A0_535 + 0.5) end
	local L3_538 = L3_538
end
round = L4_4
function L4_4(A0_540)
	if not A0_540 then
		return
	end
	L4_544 = A0_540.numChildren
	if L4_544 ~= nil then
		L4_544 = A0_540.numChildren
		if 0 < L4_544 then
			L4_544 = A0_540.numChildren
			_FOR_ = -1
			for _FORV_4_ = L4_544, _FOR_, _FOR_ do
				removeDisplayObject(A0_540[_FORV_4_])
				A0_540[_FORV_4_] = nil
			end
		end
	end
	L4_544 = A0_540.isRemoved
	if not L4_544 then
		L4_544 = display
		L4_544 = L4_544.remove
		L5_545 = A0_540
		L4_544(L5_545)
		A0_540.isRemoved = true
	end
end
removeDisplayObject = L4_4
L4_4 = nil
L5_5 = nil
L6_6 = nil
function L8_8(A0_547)
	local L1_548
	L1_548 = A0_547.action
	if "clicked" == L1_548 then
		L1_548 = A0_547.index
		if 1 == L1_548 then
			system.openURL(_ENV)
		elseif 2 == L1_548 then
			system.openURL(L5_5)
		elseif 3 == L1_548 then
			local L2_549 = L2_549
			L2_549(L6_6)
			local L3_550 = L3_550
		end
	end
end
function L9_9(A0_551)
	local L1_552
	L1_552 = A0_551.action
	if "clicked" == L1_552 then
		L1_552 = A0_551.index
		if 1 == L1_552 then
			system.openURL(_ENV)
		elseif 2 == L1_552 then
			local L2_553 = L2_553
			L2_553(L6_6)
			local L3_554 = L3_554
		end
	end
end
function L10_10(A0_555, A1_556, A2_557)
	_ENV = "mailto:?subject=" .. percentTwentyURLEncode(A0_555) .. "&body=" .. percentTwentyURLEncode(A2_557)
	L5_5 = "http://facebook.com/sharer.php?u=" .. L0_0.escape(A1_556) .. "&t=" .. L0_0.escape(A2_557)
	L6_6 = "https://twitter.com/intent/tweet?text=" .. L0_0.escape(A2_557)
	if isAndroid() then
		({})[1] = "Facebook"
		;({})[2] = "Twitter"
		;({})[3] = "Cancel"
	else
		local L3_558 = L3_558
		local L4_559 = L4_559
		local L5_560 = L5_560
		local L6_561 = L6_561
		local L8_563 = L8_563
		local L9_564 = L9_564
		L6_561[1] = L8_563
		L6_561[2] = L9_564
		L6_561[3] = "Twitter"
		local L6_561[4], L10_565 = "Cancel", L10_565
		L8_563 = L8_8
		L3_558 = L3_558(L4_559, L5_560, L6_561, L8_563)
	end
end
showShareDialog = L10_10
function L10_10(A0_566)
	local L1_567, L2_568
	L1_567 = {}
	L2_568 = {}
	L2_568.__index = L1_567
	function L1_567.new(A0_572)
		local L1_573
		L1_573 = {}
		local L2_574 = L2_574
		local L3_575 = L3_575
		L2_574(L3_575, _ENV)
		local L4_576 = L4_576
		return L1_573
	end
	if A0_566 then
		local L3_569 = L3_569
		local L4_570 = L4_570
		;({}).__index = A0_566
		L3_569(L4_570, {})
		local L5_571 = L5_571
	end
	return L1_567
end
inheritsFrom = L10_10
function L10_10()
	local L0_577 = L0_577
	L0_577 = L0_577("architectureInfo")
	if L0_577:match("iPhone1") or L0_577:match("iPhone2") or L0_577:match("iPhone3") or L0_577:match("iPod") or L0_577:match("iPad1") then
		print("LOW QUALITY", L0_577)
		return false
	end
	local L1_578 = L1_578
	local L2_579 = L2_579
	L1_578(L2_579, L0_577)
	local L3_580 = L3_580
	L1_578 = true
	return L1_578
end
L11_11 = L10_10
L11_11 = L11_11()
highQuality = L11_11
function L11_11(A0_581, A1_582)
	A1_582:insert(A0_581)
	local L4_583 = L4_583
end
parentWidget = L11_11
function L11_11()
	local L1_584, L2_585 = L1_584, L2_585
	do return L2_585(system.getInfo("model"), "iPad") end
	local L3_586 = L3_586
end
isIPad = L11_11
function L11_11()
	local L1_587, L2_588 = L1_587, L2_588
	do return L2_588(system.getInfo("model"), "iPhone") end
	local L3_589 = L3_589
end
isIPhone = L11_11
function L11_11()
	local L1_590, L2_591 = L1_590, L2_591
	do return L2_591(system.getInfo("model"), "iPod") end
	local L3_592 = L3_592
end
isIPod = L11_11
function L11_11(A0_593, A1_594)
	local toDataLocation, L10_603, L11_604, L12_605 = function(A0_612)
		local L3_613 = L3_613
		local L4_614 = L4_614
		do return L4_614(A0_612:gsub("/", "."), ".png", "") end
		local L5_615 = L5_615
	end, L10_603, L11_604, L12_605
	L10_603 = A1_594 or function(A0_616)
		local L3_617 = L3_617
		local L4_618 = L4_618
		do return L4_618(A0_616:gsub("/", "."), ".png", "") end
		local L5_619 = L5_619
	end
	if not A1_594 then
		L10_603 = toDataLocation
		L11_604 = A0_593
		L10_603 = L10_603(L11_604)
	end
	L11_604 = require
	L12_605 = L10_603
	L11_604 = L11_604(L12_605)
	L12_605 = L11_604.getSpriteSheetData
	L12_605 = L12_605()
	local L5_598 = L5_598
	L5_598 = L5_598(A0_593, L12_605)
	local L6_599 = L6_599
	local L7_600 = L7_600
	L6_599 = L6_599(L7_600, 1, #L12_605.frames)
	L7_600 = 1
	L8_601, L9_602, _FOR_ = L8_601(L12_605.frames)
	for _FORV_11_, _FORV_12_ in L8_601, L9_602, _FOR_ do
		local L16_609 = L16_609
		local L17_610 = L17_610
		L16_609(L17_610, _FORV_12_.name, L7_600, 1, 1)
		local L18_611 = L18_611
		L7_600 = L7_600 + 1
	end
	L8_601 = L6_599
	L9_602 = L12_605.frames
	L13_606 = L5_598
	return L8_601, L9_602, L13_606
end
loadImageSpriteSheet = L11_11
function L11_11(A0_620, A1_621)
	local L2_622, L3_623, L4_624, L5_625, L6_626
	L2_622 = 1
	L3_623 = #A0_620
	L4_624 = 1
	for L5_625 = L2_622, L3_623, L4_624 do
		L6_626 = A0_620[L5_625]
		L6_626 = L6_626.name
		if L6_626 == A1_621 then
			L6_626 = A0_620[L5_625]
			return L6_626
		end
	end
	L2_622 = nil
	return L2_622
end
findSpriteFrame = L11_11
function L11_11(A0_627, A1_628, A2_629)
	local L3_630, L4_631, L5_632, L6_633, L7_634
	if A2_629 then
		L3_630 = A2_629.contentBounds
		if L3_630 then
			L3_630 = A2_629.contentBounds
			L3_630 = L3_630.xMin
			L4_631 = A2_629.contentBounds
			L4_631 = L4_631.xMax
			L5_632 = A2_629.contentBounds
			L5_632 = L5_632.yMin
			L6_633 = A2_629.contentBounds
			L6_633 = L6_633.yMax
			if A0_627 >= L3_630 and A0_627 <= L4_631 and A1_628 >= L5_632 and A1_628 <= L6_633 then
				L7_634 = true
				return L7_634
			end
		end
	end
	L3_630 = false
	return L3_630
end
coordInDisplayObjBounds = L11_11
function L11_11(A0_635)
	local L1_636, L2_637, L3_638, L4_639
	L1_636 = A0_635.width
	if not L1_636 then
		L1_636 = 200
	end
	L2_637 = A0_635.height
	if not L2_637 then
		L2_637 = 300
	end
	L3_638 = A0_635.borderWidth
	if not L3_638 then
		L3_638 = 6
	end
	L4_639 = A0_635.outerBorderColor
	if not L4_639 then
		L4_639 = pack
		local L5_640 = LITTLE_GENERALS_BROWN_DARK()
		L4_639 = L4_639(L5_640, LITTLE_GENERALS_BROWN_DARK())
	end
	L5_640 = A0_635.outerFillColor
	if not L5_640 then
		L5_640 = {}
		local L6_641 = L6_641
		L5_640[1] = L6_641
		L5_640[2] = 168
		L5_640[3] = 89
	end
	L6_641 = A0_635.innerBorderColor
	if not L6_641 then
		L6_641 = pack
		local L7_642 = LITTLE_GENERALS_BROWN_DARK()
		L6_641 = L6_641(L7_642, LITTLE_GENERALS_BROWN_DARK())
	end
	L7_642 = A0_635.innerFillColor
	if not L7_642 then
		L7_642 = pack
		local L8_643 = LITTLE_GENERALS_DARK_GREY()
		L7_642 = L7_642(L8_643, LITTLE_GENERALS_DARK_GREY())
	end
	L8_643 = A0_635.highlightColor
	if not L8_643 then
		L8_643 = pack
		L8_643 = L8_643(LITTLE_GENERALS_BACKGROUND_NORMAL())
	end
	local L9_644 = display.newGroup()
	local L10_645 = L10_645
	L10_645 = L10_645(L9_644, 0, 0, L1_636, L2_637)
	L10_645:setFillColor(unpack(L5_640))
	L10_645:setStrokeColor(unpack(L4_639))
	L10_645.strokeWidth = L3_638
	L10_645.x, L10_645.y = 0, 0
	local L11_646 = L11_646
	L11_646 = L11_646(L9_644, 0, 0, L1_636 - 30, L2_637 - 30)
	L11_646:setFillColor(unpack(L7_642))
	L11_646:setStrokeColor(unpack(L6_641))
	L11_646.strokeWidth = L3_638
	L11_646.x, L11_646.y = 0, 0
	local L12_647 = L12_647
	L12_647 = L12_647(L9_644, 0, 0, L10_645.contentWidth - L3_638 * 2, 0)
	L12_647:setReferencePoint(display.CenterReferencePoint)
	L12_647:setColor(unpack(L8_643))
	L12_647.width = 4
	L12_647.x, L12_647.y = L10_645.x, -L10_645.contentHeight / 2 + L3_638 / 2 + L12_647.contentHeight / 2
	local L13_648 = L13_648
	local L19_654 = L19_654
	L13_648 = L13_648(L19_654, 0, 0, 0, L10_645.contentHeight - L3_638 * 2)
	L19_654 = L13_648.setReferencePoint
	local L15_650 = L15_650
	L19_654(L15_650, display.CenterReferencePoint)
	L15_650 = L13_648
	L19_654 = L13_648.setColor
	local L16_651 = L16_651
	local L16_651, L17_652 = L16_651(L8_643)
	L19_654(L15_650, L16_651, L17_652, L16_651(L8_643))
	L13_648.width = 4
	L19_654 = L10_645.contentWidth
	L19_654 = -L19_654
	L19_654 = L19_654 / 2
	L15_650 = L3_638 / 2
	L19_654 = L19_654 + L15_650
	L15_650 = L13_648.contentWidth
	L15_650 = L15_650 / 2
	L19_654 = L19_654 + L15_650
	L15_650 = L10_645.y
	L13_648.y = L15_650
	L13_648.x = L19_654
	L9_644.borderWidth = L3_638
	L9_644.outerRect = L10_645
	L9_644.innerRect = L11_646
	return L9_644
end
drawFatBorderBox = L11_11
function L11_11(A0_655, A1_656, A2_657, A3_658)
	local L4_659
	local L9_664 = L9_664
	if not A2_657 then
		A2_657 = ""
	end
	if not A3_658 then
		A3_658 = A2_657
	end
	if not A1_656 then
		A1_656 = 72
	end
	L4_659 = #A3_658
	L4_659 = 1 - L4_659
	L9_664 = A3_658
	L9_664 = L9_664 .. A0_655:gsub("(%s+)()(%S+)()", function(A0_665, A1_666, A2_667, A3_668)
		if A3_668 - _ENV > A1_656 then
			_ENV = A1_666 - #A2_657
			local L4_669 = L4_669
			local L5_670 = L5_670
			local L4_669, L6_671 = L4_669 .. L5_670 .. A2_667, L6_671
			return L4_669
		end
	end)
	local L6_661 = L6_661
	local L7_662 = L7_662
	do return L6_661(L7_662, "[[NEWLINE]]") end
	local L8_663 = L8_663
end
wrapTextIntoTable = L11_11
function L11_11(A0_672)
	local L1_673, L2_674
	repeat
		L1_673 = A0_672.target
		function L2_674()
			L3_679 = _ENV.buttons
			if L3_679 then
				L3_679 = _ENV
				L3_679 = L3_679.startX
				if L3_679 then
					L3_679 = math
					L3_679 = L3_679.abs
					L4_680 = _ENV
					L4_680 = L4_680.startX
					L5_681 = _ENV
					L5_681 = L5_681.endX
					L4_680 = L4_680 - L5_681
					L3_679 = L3_679(L4_680)
					if L3_679 < 20 then
						L3_679 = math
						L3_679 = L3_679.abs
						L4_680 = _ENV
						L4_680 = L4_680.startY
						L5_681 = _ENV
						L5_681 = L5_681.endY
						L4_680 = L4_680 - L5_681
						L3_679 = L3_679(L4_680)
						if L3_679 < 20 then
							L3_679 = 1
							L4_680 = _ENV
							L4_680 = L4_680.buttons
							L4_680 = #L4_680
							L5_681 = 1
							for _FORV_3_ = L3_679, L4_680, L5_681 do
								({}).id = A0_672.id
								;({}).target, ({}).type = _ENV.buttons[_FORV_3_], "touch"
								;({}).x = _ENV.endX
								;({}).y = _ENV.endY
								;({}).phase = "ended"
								_ENV.buttons[_FORV_3_].touchEventHandler({})
								_ENV.buttons[_FORV_3_].normalize()
							end
						end
					end
				end
			end
			L3_679 = _ENV
			L3_679.startX = nil
			L3_679 = _ENV
			L3_679.startY = nil
		end
		if not L1_673 then
			return true
		end
		if A0_672.type == "contentTouch" then
			if not L1_673.startX then
				L1_673.startX = A0_672.x
				L1_673.startY = A0_672.y
			end
			L1_673.endX = A0_672.x
			L1_673.endY = A0_672.y
			if A0_672.phase == "release" then
				L2_674()
			end
		elseif A0_672.type == "beganScroll" then
		else
			if A0_672.type == "endedScroll" then
				L2_674()
				local L3_675 = L3_675
				break -- pseudo-goto
			end
			L3_675 = A0_672.type
			if L3_675 == "movingToTopLimit" then
			else
				L3_675 = A0_672.type
				if L3_675 == "movingToBottomLimit" then
				else
					L3_675 = A0_672.type
					if L3_675 == "movingToLeftLimit" then
					else
						L3_675 = A0_672.type
						if L3_675 == "movingToRightLimit" then
						else
						end
					end
				end
			end
		end
	until true
end
scrollViewListener = L11_11
function L11_11(A0_684, A1_685, A2_686)
	local L4_688, L5_689, L6_690, L7_691, L8_692, L9_693, L10_694 = display.newGroup, L5_689, L6_690, L7_691, L8_692, L9_693, L10_694
	L4_688 = L4_688()
	if not A2_686 then
		L5_689 = {}
		A2_686 = L5_689
	end
	L5_689 = A2_686.extraHitArea
	if not L5_689 then
		L5_689 = nil
	end
	L6_690 = A2_686.onComplete
	L7_691 = A2_686.buttonText
	L8_692 = A2_686.buttonTextSize
	if not L8_692 then
		L8_692 = 43
	end
	L9_693 = A2_686.buttonTextShadowSize
	if not L9_693 then
		L9_693 = 2
	end
	L10_694 = A2_686.ignoreFocus
	if not L10_694 then
		L10_694 = false
	end
	if not A2_686.normalTextColor then
		local L11_695 = L11_695
		L11_695[1] = 255
		L11_695[2] = 255
		L11_695[3] = 255
	end
	if not A2_686.normalTextShadowColor then
		local L12_696 = L12_696
		L12_696 = L12_696(LITTLE_GENERALS_BROWN_DARK())
	end
	if not A2_686.pressedTextColor then
		local L13_697 = L13_697
		L13_697[1] = 255
		L13_697[2] = 255
		L13_697[3] = 255
	end
	if not A2_686.pressedTextShadowColor then
	end
	L4_688.normalTextColor = L11_695
	L4_688.pressedTextColor = L13_697
	L4_688.pressedTextShadowColor, L4_688.normalTextShadowColor = utils.pack(LITTLE_GENERALS_BLUE_DARK()), L12_696
	L4_688:insert(A0_684)
	A0_684.alpha = 1
	L4_688.normal = A0_684
	if A1_685 then
		local L14_698 = L14_698
		L4_688:insert(A1_685)
		A1_685.alpha = 0
		L4_688.pressed = A1_685
	end
	if L7_691 then
		({}).size = L8_692
		;({}).shadowSize = L9_693
		;({}).fontColor = L11_695
		;({}).shadowColor = L12_696
		L4_688:insert((utils.getOutlinedText(L7_691, {})))
		L4_688.buttonText, utils.getOutlinedText(L7_691, {}).x, utils.getOutlinedText(L7_691, {}).y = utils.getOutlinedText(L7_691, {}), 0, -2
	end
	if L5_689 then
		if not L5_689.padLeft then
		end
		if not L5_689.padRight then
		end
		if not L5_689.padTop then
		end
		if not L5_689.padBottom then
		end
		if not L5_689.alpha then
		end
		if not L5_689.color then
		end
		local L26_710 = L26_710
		if nil then
			local L25_709 = L25_709
			display.newRect(L4_688, 0, 0, A0_684.width + 0 + 0, A0_684.height + 0 + 0):setFillColor(unpack(nil))
		end
		display.newRect(L4_688, 0, 0, A0_684.width + 0 + 0, A0_684.height + 0 + 0).x = 0 / 2 - L25_709 / 2
		display.newRect(L4_688, 0, 0, A0_684.width + 0 + 0, A0_684.height + 0 + 0).alpha, display.newRect(L4_688, 0, 0, A0_684.width + 0 + 0, A0_684.height + 0 + 0).y = 0, 0 / 2 - 0 / 2
		display.newRect(L4_688, 0, 0, A0_684.width + 0 + 0, A0_684.height + 0 + 0).isHitTestable = true
		display.newRect(L4_688, 0, 0, A0_684.width + 0 + 0, A0_684.height + 0 + 0):toBack()
		local L23_707 = L23_707
	end
	L23_707 = L4_688
	L25_709 = L4_688.addEventListener
	L25_709(L23_707, "tap", function()
		local L1_711
		L1_711 = true
		return L1_711
	end)
	if L6_690 then
		function L25_709()
			local L0_712, L1_713
			L0_712 = _ENV
			L0_712 = L0_712.buttonText
			if L0_712 then
				L0_712 = _ENV
				L0_712 = L0_712.buttonText
				L1_713 = L0_712
				L0_712 = L0_712.setTextColor
				L0_712(L1_713, unpack(_ENV.pressedTextColor))
				L0_712 = _ENV
				L0_712 = L0_712.buttonText
				L1_713 = L0_712
				L0_712 = L0_712.setShadowColor
				local L2_714 = L2_714
				local L2_714, L3_715 = L2_714(_ENV.pressedTextShadowColor)
				L0_712(L1_713, L2_714, L3_715)
			end
			L0_712 = _ENV
			L0_712 = L0_712.pressed
			if L0_712 then
				L0_712 = _ENV
				L0_712 = L0_712.normal
				L0_712.alpha = 0
				L0_712 = _ENV
				L0_712 = L0_712.pressed
				L0_712.alpha = 1
			end
		end
		L4_688.showPressed = L25_709
		function L23_707()
			local L0_716, L1_717
			L0_716 = _ENV
			L0_716 = L0_716.pressed
			if L0_716 then
				L0_716 = _ENV
				L0_716 = L0_716.normal
				L0_716.alpha = 1
				L0_716 = _ENV
				L0_716 = L0_716.pressed
				L0_716.alpha = 0
			end
			L0_716 = _ENV
			L0_716 = L0_716.buttonText
			if L0_716 then
				L0_716 = _ENV
				L0_716 = L0_716.buttonText
				L1_717 = L0_716
				L0_716 = L0_716.setTextColor
				L0_716(L1_717, unpack(_ENV.normalTextColor))
				L0_716 = _ENV
				L0_716 = L0_716.buttonText
				L1_717 = L0_716
				L0_716 = L0_716.setShadowColor
				local L2_718 = L2_718
				local L2_718, L3_719 = L2_718(_ENV.normalTextShadowColor)
				L0_716(L1_717, L2_718, L3_719)
			end
		end
		L4_688.showNormal = L23_707
		L4_688.touchEventHandler = touchEventHandler(L4_688, L6_690, L10_694)
		local L18_702 = L18_702
		local L19_703 = L19_703
		L18_702(L19_703, "touch", L4_688.touchEventHandler)
		local L20_704 = L20_704
	end
	return L4_688
end
newTwoStateButton = L11_11
function L11_11(A0_720, A1_721, A2_722)
	local L3_723, L4_724
	function L3_723()
		_ENV.touchId = nil
		if not A2_722 then
			local L1_726 = L1_726
			L1_726(display.getCurrentStage(), nil)
			local L2_727 = L2_727
		end
		L1_726 = _ENV
		L1_726 = L1_726.showNormal
		if L1_726 then
			L1_726 = _ENV
			L1_726 = L1_726.showNormal
			L1_726()
		end
	end
	A0_720.normalize = L3_723
	function L4_724(A0_728)
		if A0_728.phase == "began" and (not _ENV.lastBegan or _ENV.lastBegan + 5000 < system.getTimer()) and _ENV.touchId and _ENV.touchId ~= A0_728.id then
			return true
		end
		if _ENV.lastClick and system.getTimer() - 250 < _ENV.lastClick then
			return true
		end
		if A0_728.phase == "began" then
			_ENV.lastBegan = system.getTimer()
			_ENV.touchId = A0_728.id
			if not A2_722 then
				display.getCurrentStage():setFocus(A0_728.target, A0_728.id)
			end
			if not _ENV.showPressed then
				goto lbl_98
			end
			_ENV.showPressed()
			local L1_729 = L1_729
			break -- pseudo-goto
		end
		L1_729 = A0_728.phase
		if L1_729 ~= "ended" then
			L1_729 = A0_728.phase
			if L1_729 ~= "cancelled" then
				goto lbl_98
			end
		end
		L1_729 = _ENV
		L1_729.lastClick = system.getTimer()
		L1_729 = true
		L3_723()
		if L1_729 then
			local L4_732 = L4_732
			local L4_732, L5_733 = L4_732(A0_728.x, A0_728.y, _ENV), L5_733
			if L4_732 then
				L4_732 = A1_721
				L5_733 = _ENV
				L4_732(L5_733)
				repeat
					L4_732 = true
					return L4_732
				until true
			end
		end
		::lbl_98::
		L1_729 = A2_722
		L1_729 = not L1_729
		return L1_729
	end
	return L4_724
end
touchEventHandler = L11_11
function L11_11(A0_734, A1_735, A2_736, A3_737, A4_738, A5_739, A6_740)
	if not A3_737 then
		A3_737 = A2_736
	end
	local L7_741 = L7_741
	L7_741 = L7_741(A0_734, A1_735, A2_736)
	local L8_742 = L8_742
	L8_742 = L8_742(A0_734, A1_735, A3_737)
	if not A6_740 then
		A6_740 = {}
	end
	A6_740.buttonText = A5_739
	A6_740.onComplete = A4_738
	local L9_743 = L9_743
	local L10_744 = L10_744
	local L11_745 = L11_745
	do return L9_743(L10_744, L11_745, A6_740) end
	local L12_746 = L12_746
end
newButton = L11_11
function L11_11(A0_747, A1_748)
	local L2_749, L3_750
	if not A1_748 then
		L2_749 = {}
		A1_748 = L2_749
	end
	L2_749 = A1_748.normalTopColor
	if L2_749 then
		L2_749 = A0_747.normal
		L2_749 = L2_749.topRect
		L3_750 = L2_749
		L2_749 = L2_749.setFillColor
		L2_749(L3_750, unpack(A1_748.normalTopColor))
	end
	L2_749 = A1_748.normalBottomColor
	if L2_749 then
		L2_749 = A0_747.normal
		L2_749 = L2_749.bottomRect
		L3_750 = L2_749
		L2_749 = L2_749.setFillColor
		L2_749(L3_750, unpack(A1_748.normalBottomColor))
	end
	L2_749 = A1_748.normalBorderColor
	if L2_749 then
		L2_749 = A0_747.normal
		L2_749 = L2_749.borderRect
		L3_750 = L2_749
		L2_749 = L2_749.setStrokeColor
		L2_749(L3_750, unpack(A1_748.normalBorderColor))
	end
	L2_749 = A1_748.normalTextShadowColor
	if L2_749 then
		L2_749 = A1_748.normalTextShadowColor
		A0_747.normalTextShadowColor = L2_749
		L2_749 = A0_747.buttonText
		L3_750 = L2_749
		L2_749 = L2_749.setShadowColor
		local L4_751 = L4_751
		local L4_751, L5_752 = L4_751(A1_748.normalTextShadowColor)
		L2_749(L3_750, L4_751, L5_752)
	end
end
basicButtonModify = L11_11
function L11_11(A0_753)
	local L1_754, L2_755, L3_756
	if not A0_753 then
		L1_754 = {}
		A0_753 = L1_754
	end
	L1_754 = A0_753.width
	if not L1_754 then
		L1_754 = 175
	end
	L2_755 = A0_753.height
	if not L2_755 then
		L2_755 = 50
	end
	L3_756 = A0_753.buttonTextSize
	if not L3_756 then
		L3_756 = 43
	end
	A0_753.buttonTextSize = L3_756
	L3_756 = A0_753.buttonTextShadowSize
	if not L3_756 then
		L3_756 = 2
	end
	A0_753.buttonTextShadowSize = L3_756
	L3_756 = A0_753.normalTopColor
	if not L3_756 then
		L3_756 = {}
		local L4_757 = L4_757
		L3_756[1] = L4_757
		L3_756[2] = 207
		L3_756[3] = 150
	end
	L4_757 = A0_753.normalBottomColor
	if not L4_757 then
		L4_757 = {}
		local L5_758 = L5_758
		local L6_759 = L6_759
		L4_757[1] = L5_758
		L4_757[2] = L6_759
		L4_757[3] = 89
	end
	L5_758 = A0_753.normalBorderWidth
	if not L5_758 then
		L5_758 = nil
	end
	L6_759 = A0_753.normalBorderColor
	if not L6_759 then
		L6_759 = utils
		L6_759 = L6_759.pack
		local L7_760 = LITTLE_GENERALS_BROWN_DARK()
		L6_759 = L6_759(L7_760, LITTLE_GENERALS_BROWN_DARK())
	end
	L7_760 = A0_753.normalTextColor
	if not L7_760 then
		L7_760 = {}
		L7_760[1] = 255
		L7_760[2] = 255
		local L7_760[3], L10_763 = 255, L10_763
	end
	A0_753.normalTextColor = L7_760
	L7_760 = A0_753.normalTextShadowColor
	if not L7_760 then
		L7_760 = utils
		L7_760 = L7_760.pack
		L10_763 = LITTLE_GENERALS_BROWN_DARK
		L10_763 = L10_763()
		L7_760 = L7_760(L10_763, L10_763())
	end
	A0_753.normalTextShadowColor = L7_760
	L7_760 = A0_753.pressedTopColor
	if not L7_760 then
		L7_760 = utils
		L7_760 = L7_760.pack
		L10_763 = LITTLE_GENERALS_BLUE_LIGHT
		L10_763 = L10_763()
		L7_760 = L7_760(L10_763, L10_763())
	end
	L10_763 = A0_753.pressedBottomColor
	if not L10_763 then
		L10_763 = utils
		L10_763 = L10_763.pack
		local L9_762 = LITTLE_GENERALS_BLUE_MED()
		L10_763 = L10_763(L9_762, LITTLE_GENERALS_BLUE_MED())
	end
	L9_762 = A0_753.pressedBorderWidth
	if not L9_762 then
		L9_762 = nil
	end
	if not A0_753.pressedBorderColor then
	end
	if not A0_753.pressedTextColor then
		({})[1] = 255
		;({})[2] = 255
		;({})[3] = 255
	end
	A0_753.pressedTextColor = {}
	if not A0_753.pressedTextShadowColor then
	end
	A0_753.pressedTextShadowColor = utils.pack(LITTLE_GENERALS_BLUE_DARK())
	local L11_764 = L11_764
	;({}).width = L1_754
	;({}).height = L2_755
	;({}).borderWidth = L5_758
	;({}).borderColor = L6_759
	;({}).topColor = L3_756
	;({}).bottomColor = L4_757
	local L12_765 = L12_765
	;({}).width = L1_754
	;({}).height = L2_755
	;({}).borderWidth = L9_762
	;({}).borderColor = L11_764
	;({}).topColor = L7_760
	;({}).bottomColor = L10_763
	local L13_766 = L13_766
	local L14_767 = L14_767
	local L15_768 = L15_768
	do return L14_767(L15_768, L13_766, A0_753) end
	local L16_769 = L16_769
end
getBasicButton = L11_11
function L11_11(A0_770)
	local L1_771
	L1_771 = sprite
	L1_771 = L1_771.newSprite
	L1_771 = L1_771(spritesheetmanager.getSpriteSet(UI_SPRITE_SHEET))
	local L2_772, L3_773 = L2_772, L3_773
	L2_772(L3_773, A0_770)
	local L4_774 = L4_774
	return L1_771
end
getDialogIcon = L11_11
function L11_11(A0_775)
	local L1_776 = L1_776
	;({}).textLine1 = message
	;({}).icon = utils.DIALOG_ATTACK
	;({}).textLine1 = "OUT OF AMMUNITION!"
	;({}).textLine2 = "BUY MORE AMMO OR SELECT A DIFFERENT WEAPON."
	local ({}).confirmSound, L3_778 = sound.globalSounds.button, L3_778
	function L3_778.confirmFunction()
		storyboard.gotoScene("armoryScene")
		local L1_779 = L1_779
	end
	L1_776(L3_778)
end
getInventoryDialog = L11_11
function L11_11(A0_780, A1_781)
	local L2_782
	L2_782 = A0_780.contentWidth
	if A1_781 < L2_782 then
		L2_782 = A0_780.contentWidth
		L2_782 = A1_781 / L2_782
		A0_780.xScale = L2_782
		A0_780.yScale = L2_782
	else
		A0_780.xScale = 1
		A0_780.yScale = 1
	end
end
scaleTo = L11_11
function L11_11(A0_783, A1_784)
	local L3_785, L4_786 = L3_785, L4_786
	local L5_787 = L5_787
	local L6_788 = L6_788
	local L7_789 = L7_789
	L4_786(L5_787, L6_788, L7_789, 0, 180)
	local L8_790 = L8_790
	return L3_785
end
drawGreyOverlay = L11_11
function L11_11(A0_791)
	if not A0_791.x then
	end
	A0_791.x = 0
	if not A0_791.y then
	end
	A0_791.y = 0
	if not A0_791.width then
	end
	A0_791.width = 100
	if not A0_791.height then
	end
	A0_791.height = 100
	if not A0_791.border then
	end
	A0_791.border = 6
	if not A0_791.borderColor then
	end
	A0_791.borderColor = pack(LITTLE_GENERALS_BROWN_DARK())
	if not A0_791.fillColor then
	end
	A0_791.fillColor = pack(LITTLE_GENERALS_BACKGROUND_NORMAL())
	local L1_792 = L1_792
	local L2_793 = L2_793
	local L3_794 = L3_794
	L1_792 = L1_792(L2_793, L3_794, A0_791.width, A0_791.height)
	L2_793 = A0_791.border
	L1_792.strokeWidth = L2_793
	L3_794 = L1_792
	L2_793 = L1_792.setStrokeColor
	L2_793(L3_794, unpack(A0_791.borderColor))
	L3_794 = L1_792
	L2_793 = L1_792.setFillColor
	local L4_795 = L4_795
	local L4_795, L5_796 = L4_795(A0_791.fillColor)
	L2_793(L3_794, L4_795, L5_796)
	return L1_792
end
drawGenericBox = L11_11
function L11_11(A0_797)
	local L1_798, L2_799, L3_800
	if not A0_797 then
		L1_798 = {}
		A0_797 = L1_798
	end
	L1_798 = A0_797.width
	if not L1_798 then
		L1_798 = 175
	end
	L2_799 = A0_797.height
	if not L2_799 then
		L2_799 = 50
	end
	L3_800 = A0_797.bottomColor
	if not L3_800 then
		L3_800 = {}
		local L4_801 = L4_801
		L3_800[1] = L4_801
		L3_800[2] = 168
		L3_800[3] = 89
	end
	L4_801 = A0_797.topColor
	if not L4_801 then
		L4_801 = {}
		local L5_802 = L5_802
		local L6_803 = L6_803
		L4_801[1] = L5_802
		L4_801[2] = L6_803
		L4_801[3] = 150
	end
	L5_802 = A0_797.topPercentage
	if not L5_802 then
		L5_802 = 0.5
	end
	L6_803 = A0_797.borderColor
	if not L6_803 then
		L6_803 = pack
		local L7_804 = LITTLE_GENERALS_BROWN_DARK()
		L6_803 = L6_803(L7_804, LITTLE_GENERALS_BROWN_DARK())
	end
	L7_804 = A0_797.borderWidth
	if not L7_804 then
		L7_804 = 4
	end
	local L8_805 = display.newGroup()
	local L9_806 = L9_806
	L9_806 = L9_806(L8_805, 0, 0, L1_798, L2_799 * L5_802)
	L9_806:setFillColor(unpack(L4_801))
	L9_806.x, L9_806.y = 0, -L9_806.contentHeight / 2
	L8_805.topRect = L9_806
	local L10_807 = L10_807
	L10_807 = L10_807(L8_805, 0, 0, L1_798, L2_799 * (1 - L5_802))
	L10_807:setFillColor(unpack(L3_800))
	L10_807.x, L10_807.y = 0, L10_807.contentHeight / 2
	L8_805.bottomRect = L10_807
	local L11_808 = L11_808
	L11_808 = L11_808(L8_805, 0, 0, L1_798, L2_799)
	L11_808.strokeWidth = L7_804
	local L12_809, L13_810 = L12_809, L13_810
	local L16_813 = L16_813
	L12_809(L13_810, L16_813, 0, 0, 0)
	local L17_814 = L17_814
	L13_810 = L11_808
	L12_809 = L11_808.setStrokeColor
	L16_813 = unpack
	L17_814 = L6_803
	L16_813, L17_814 = L16_813(L17_814)
	L12_809(L13_810, L16_813, L17_814, L16_813(L17_814))
	L12_809 = 0
	L11_808.y = 0
	L11_808.x = L12_809
	L8_805.borderRect = L11_808
	L8_805.borderWidth = L7_804
	return L8_805
end
getTwoToneBox = L11_11
function L11_11()
	local L3_818, L4_819, L5_820, L6_821 = spritesheetmanager.getSpriteSet, L4_819, L5_820, L6_821
	L4_819 = UI_SPRITE_SHEET
	L3_818, L4_819 = L3_818(L4_819)
	L5_820 = display
	L5_820 = L5_820.newGroup
	L5_820 = L5_820()
	L6_821 = 26
	L7_822 = 1
	_FOR_ = 1
	for _FORV_7_ = L7_822, _FOR_, _FOR_ do
		L5_820:insert((utils.newImageFromSpriteSet(L3_818, L4_819, "treadchevron.png")))
		utils.newImageFromSpriteSet(L3_818, L4_819, "treadchevron.png").x, utils.newImageFromSpriteSet(L3_818, L4_819, "treadchevron.png").y = (_FORV_7_ - 1) * 45 + utils.newImageFromSpriteSet(L3_818, L4_819, "treadchevron.png").contentWidth / 2, 0
		local L11_826 = L11_826
		L11_826.alpha = math.min(1, 1 - _FORV_7_ / L6_821 * 0.9 + 0.1)
	end
	L7_822 = L5_820.contentWidth
	L7_822 = L7_822 / 2
	L5_820.xReference = L7_822
	return L5_820
end
function getMinimalistLoadingOverlay(A0_827)
	local L1_828, L2_829
	if not A0_827 then
		L1_828 = {}
		A0_827 = L1_828
	end
	L1_828 = A0_827.blockHits
	if not L1_828 then
		L1_828 = false
	end
	L2_829 = A0_827.loadingText
	if not L2_829 then
		L2_829 = "Loading..."
	end
	local L3_830 = L3_830
	;({}).width = 400
	;({}).height = 100
	;({}).topColor = utils.pack(LITTLE_GENERALS_BACKGROUND_NORMAL())
	;({}).bottomColor = utils.pack(LITTLE_GENERALS_BACKGROUND_NORMAL())
	L3_830 = L3_830({})
	local L4_831 = L4_831
	L4_831 = L4_831(screenWidth, display.contentHeight)
	L3_830:insert(L4_831)
	L4_831.x, L4_831.y = 0, 0
	L4_831:toBack()
	if L1_828 then
		L4_831:addEventListener("tap", function()
			local L1_836
			L1_836 = true
			return L1_836
		end)
		L4_831:addEventListener("touch", function()
			local L1_837
			L1_837 = true
			return L1_837
		end)
	end
	local L5_832 = L5_832
	;({}).size = 60
	L5_832 = L5_832(L2_829, {})
	local L6_833, L7_834 = L6_833, L7_834
	L6_833(L7_834, L5_832)
	local L8_835 = L8_835
	L6_833 = 0
	L5_832.y = 0
	L5_832.x = L6_833
	function L6_833(A0_838)
		display.remove(A0_838)
		local L2_839 = L2_839
	end
	L3_830.destroy = L6_833
	return L3_830
end
function drawBasicSceneBackground(A0_840)
	local L1_841, L2_842, L3_843, L4_844, L5_845, L6_846
	if not A0_840 then
		L1_841 = {}
		A0_840 = L1_841
	end
	L1_841 = 10
	L2_842 = A0_840.group
	L3_843 = A0_840.title
	if not L3_843 then
		L3_843 = "Title Goes Here"
	end
	L4_844 = A0_840.showClose
	if not L4_844 then
		L4_844 = true
	end
	L5_845 = A0_840.onClose
	if not L5_845 then
		L5_845 = nil
	end
	L6_846 = A0_840.showBottomBar
	if not L6_846 then
		L6_846 = false
	end
	local L7_847 = display.newGroup()
	L2_842:insert(L7_847)
	L7_847.x = screenX + screenWidth / 2
	L7_847.y = display.contentHeight / 2
	local L8_848 = L8_848
	local L8_848, L9_849 = L8_848(UI_SPRITE_SHEET)
	local L10_850 = L10_850
	;({}).x = screenX
	;({}).y = 0
	;({}).width = screenWidth
	;({}).height = display.contentHeight
	;({}).border = L1_841
	;({}).borderColor = pack(LITTLE_GENERALS_OFF_WHITE())
	L10_850 = L10_850({})
	L7_847:insert(L10_850)
	L10_850.x, L10_850.y = 0, 0
	local L11_851 = L11_851
	L11_851 = L11_851(L7_847, 0, 0, screenWidth - L1_841, 38)
	L11_851:setFillColor(LITTLE_GENERALS_LIGHT_GREY())
	L11_851.x, L11_851.y = 0, -display.contentHeight / 2 + L11_851.contentHeight / 2 + L1_841 / 2
	local L12_852 = L12_852
	L12_852 = L12_852(L7_847, 0, 0, L11_851.contentWidth, L11_851.contentHeight)
	L12_852:setFillColor(LITTLE_GENERALS_MED_GREY())
	L12_852.x, L12_852.y = L11_851.x, L11_851.y + L11_851.contentHeight / 2 + L12_852.contentHeight / 2
	local L13_853 = L13_853
	L13_853 = L13_853(0, 0, L11_851.contentWidth, 0)
	L7_847:insert(L13_853)
	L13_853:setReferencePoint(display.CenterReferencePoint)
	L13_853.x, L13_853.y = L11_851.x, L12_852.y + L12_852.contentHeight / 2 + L13_853.contentHeight / 2
	L13_853:setColor(LITTLE_GENERALS_DARK_GREY())
	L13_853.width = 8
	local L14_854 = L14_854
	L14_854 = L14_854(0, 0, L11_851.contentWidth, 0)
	L7_847:insert(L14_854)
	L14_854:setReferencePoint(display.CenterReferencePoint)
	L14_854.x, L14_854.y = L11_851.x, L13_853.y + L13_853.contentHeight / 2 + L14_854.contentHeight / 2 - 4
	L14_854:setColor(LITTLE_GENERALS_OFF_WHITE())
	L14_854.width = 8
	local L15_855 = display.newGroup()
	local L16_856 = L16_856
	L16_856 = L16_856(L8_848, L9_849, "title_left.png")
	L15_855:insert(L16_856)
	local L17_857 = L17_857
	L17_857 = L17_857(L8_848, L9_849, "title_right.png")
	L15_855:insert(L17_857)
	L7_847:insert(L15_855)
	L15_855.x = 0
	L15_855.y = -L7_847.contentHeight / 2 + L15_855.contentHeight / 2 + 24
	L7_847.titleBar = L15_855
	local L18_858 = L18_858
	;({}).size = 65
	;({}).fontColor, ({})[1] = {}, 0
	;({}).fontColor, ({})[2] = {}, 0
	;({}).fontColor, ({})[3] = {}, 0
	;({}).shadowColor, ({})[1] = {}, 255
	;({}).shadowColor, ({})[2] = {}, 255
	;({}).shadowColor, ({})[3] = {}, 255
	L18_858 = L18_858(L3_843, {})
	L7_847:insert(L18_858)
	L18_858.x, L18_858.y = L15_855.x, L15_855.y - 5
	L7_847.title = L18_858
	L16_856:setReferencePoint(display.CenterLeftReferencePoint)
	L16_856.x = -math.max(L18_858.contentWidth / 2 + 120, 200)
	L17_857:setReferencePoint(display.CenterRightReferencePoint)
	L17_857.x = math.max(L18_858.contentWidth / 2 + 120, 200)
	local L19_859 = L19_859
	L19_859 = L19_859(L8_848, L9_849, "exit_title.png")
	local L20_860 = L20_860
	L20_860 = L20_860(L8_848, L9_849, "exit_title.png")
	L20_860:setFillColor(LITTLE_GENERALS_BLUE_MED())
	local L21_861 = L21_861
	;({}).onComplete = function()
		local L0_876
		L0_876 = storyboard
		L0_876 = L0_876.getScene
		L0_876 = L0_876(storyboard.getCurrentSceneName())
		local L1_877 = utils.getMinimalistLoadingOverlay()
		L0_876.view:insert(L1_877)
		local L4_880 = L4_880
		L4_880 = screenX
		L4_880 = L4_880 + screenWidth / 2
		L1_877.y = display.contentHeight / 2
		L1_877.x = L4_880
		L4_880 = timer
		L4_880 = L4_880.performWithDelay
		local L3_879 = L3_879
		L4_880(L3_879, function()
			_ENV()
			local L2_883 = L2_883
			L2_883 = timer
			L2_883 = L2_883.performWithDelay
			L2_883(1, function()
				_ENV:destroy()
				local L1_884 = L1_884
			end)
		end)
	end
	L21_861 = L21_861(L19_859, L20_860, {})
	L7_847:insert(L21_861)
	L7_847.closeButton = L21_861
	L21_861:setReferencePoint(display.TopRightReferencePoint)
	L21_861.x = screenWidth / 2 - 10
	L21_861.y = -display.contentHeight / 2 + 10
	L21_861:setReferencePoint(display.CenterReferencePoint)
	if not L4_844 then
		L21_861.alpha = 0
	end
	local L22_862 = _ENV()
	L7_847:insert(L22_862)
	L22_862.xScale = -1
	L22_862.x, L22_862.y = 0, -100
	L22_862.rotation = -3
	local L23_863 = _ENV()
	L7_847:insert(L23_863)
	L23_863.x, L23_863.y = 0, 175
	L23_863.rotation = -3
	local L24_864 = display.newGroup()
	L7_847:insert(L24_864)
	L24_864.x, L24_864.y = 0, 0
	local L25_865 = L25_865
	L25_865 = L25_865(L24_864, 0, 0, 0, display.contentHeight)
	L25_865:setReferencePoint(display.CenterReferencePoint)
	L25_865.x, L25_865.y = -screenWidth / 2, 0
	L25_865:setColor(LITTLE_GENERALS_OFF_WHITE())
	L25_865.width = L1_841
	local L26_866 = L26_866
	L26_866 = L26_866(L24_864, 0, 0, 0, display.contentHeight)
	L26_866:setReferencePoint(display.CenterReferencePoint)
	L26_866.x, L26_866.y = screenWidth / 2, 0
	L26_866:setColor(LITTLE_GENERALS_OFF_WHITE())
	L26_866.width = L1_841
	if not L6_846 then
		display.newLine(L24_864, 0, 0, screenWidth, 0):setReferencePoint(display.CenterReferencePoint)
		display.newLine(L24_864, 0, 0, screenWidth, 0).x, display.newLine(L24_864, 0, 0, screenWidth, 0).y = 0, display.contentHeight / 2
		display.newLine(L24_864, 0, 0, screenWidth, 0):setColor(LITTLE_GENERALS_OFF_WHITE())
		display.newLine(L24_864, 0, 0, screenWidth, 0).width = L1_841
	else
		local L27_867 = display.newGroup()
		L7_847:insert(L27_867)
		L7_847.bottomBar = L27_867
		local L28_868 = L28_868
		L28_868 = L28_868(L27_867, 0, 0, L11_851.contentWidth, 70)
		L28_868:setFillColor(LITTLE_GENERALS_MED_GREY())
		L28_868.x, L28_868.y = 0, 0
		local L29_869 = L29_869
		L29_869 = L29_869(L27_867, 0, 0, L11_851.contentWidth, 0)
		L29_869:setReferencePoint(display.CenterReferencePoint)
		L29_869.x, L29_869.y = L28_868.x, L28_868.y - L28_868.contentHeight / 2 - L29_869.contentHeight / 2
		L29_869:setColor(LITTLE_GENERALS_DARK_GREY())
		L29_869.width = 8
		local L30_870 = L30_870
		local L34_874 = L34_874
		local L30_870, L35_875 = L30_870(L34_874, 0, 0, L11_851.contentWidth, 0), L35_875
		L35_875 = L30_870
		L34_874 = L30_870.setReferencePoint
		L34_874(L35_875, display.CenterReferencePoint)
		L34_874 = L11_851.x
		L35_875 = L29_869.y
		L35_875 = L35_875 - L29_869.contentHeight / 2
		L35_875 = L35_875 - L30_870.contentHeight / 2
		L35_875 = L35_875 + 4
		L30_870.y = L35_875
		L30_870.x = L34_874
		L35_875 = L30_870
		L34_874 = L30_870.setColor
		local L33_873 = LITTLE_GENERALS_OFF_WHITE()
		L34_874(L35_875, L33_873, LITTLE_GENERALS_OFF_WHITE())
		L30_870.width = 8
		L34_874 = 0
		L35_875 = display
		L35_875 = L35_875.contentHeight
		L35_875 = L35_875 / 2
		L33_873 = L27_867.contentHeight
		L33_873 = L33_873 / 2
		L35_875 = L35_875 - L33_873
		L35_875 = L35_875 + 10
		L27_867.y = L35_875
		L27_867.x = L34_874
	end
	return L7_847
end
function getNotificationSlider(A0_885)
	local L1_886, L2_887, L3_888, L4_889, L5_890, L6_891, L7_892, L8_893, L9_894, L10_895, L11_896, L12_897
	L1_886 = 20
	local L2_887, L15_900, L16_901, L17_902, L18_903, L19_904 = A0_885.onClose, L15_900, L16_901, L17_902, L18_903, L19_904
	L3_888 = A0_885.onShow
	L4_889 = A0_885.autoClose
	L5_890 = A0_885.onPress
	L6_891 = A0_885.direction
	if not L6_891 then
		L6_891 = "down"
	end
	L7_892 = A0_885.xPos
	L8_893 = A0_885.yPos
	L9_894 = A0_885.width
	if not L9_894 then
		L9_894 = 520
	end
	L10_895 = A0_885.height
	if not L10_895 then
		L10_895 = 121
	end
	L11_896 = A0_885.border
	if not L11_896 then
		L11_896 = 6
	end
	L12_897 = A0_885.fontSize
	if not L12_897 then
		L12_897 = 60
	end
	L15_900 = A0_885.alertBox
	if not L15_900 then
		L15_900 = drawGenericBox
		L16_901 = {}
		L16_901.width = L9_894
		L16_901.height = L10_895
		L16_901.border = L11_896
		L15_900 = L15_900(L16_901)
	end
	L16_901 = A0_885.text
	L17_902 = A0_885.scale
	L18_903 = nil
	L19_904 = nil
	local L20_905 = L20_905
	L15_900.x = 0
	L15_900.y = 0
	display.newGroup():insert(L15_900)
	if A0_885.spriteImage then
		L19_904 = utils.newButton(spritesheetmanager.getSpriteSet(A0_885.spriteImage))
	elseif A0_885.imageName then
		L19_904 = display.newImage(A0_885.imageName, 0, 0, true)
	end
	if L19_904 and L17_902 then
		L19_904:scale(L17_902, L17_902)
	end
	display.newGroup().x = screenX + screenWidth / 2
	if L16_901 then
		L12_897 = L12_897 * getFontForString(L16_901)
		display.newGroup():insert((display.newText(L16_901.split(L16_901, "[[IMG]]")[1], 0, 0, getFontForString(L16_901))))
		display.newText(L16_901.split(L16_901, "[[IMG]]")[1], 0, 0, getFontForString(L16_901)):setTextColor(LITTLE_GENERALS_BROWN_DARK())
		if #L16_901.split(L16_901, "[[IMG]]") == 2 and L19_904 then
			display.newGroup():insert(L19_904)
			L19_904.x = display.newText(L16_901.split(L16_901, "[[IMG]]")[1], 0, 0, getFontForString(L16_901)).x + display.newText(L16_901.split(L16_901, "[[IMG]]")[1], 0, 0, getFontForString(L16_901)).contentWidth / 2 + L19_904.contentWidth / 2
			L19_904.y = display.newText(L16_901.split(L16_901, "[[IMG]]")[1], 0, 0, getFontForString(L16_901)).contentHeight / 2
			local L31_916 = L31_916
			local L32_917 = L32_917
			display.newText(L16_901.split(L16_901, "[[IMG]]")[2], 0, 0, getFontForString(L16_901)):setTextColor(LITTLE_GENERALS_BROWN_DARK())
			display.newGroup():insert((display.newText(L16_901.split(L16_901, "[[IMG]]")[2], 0, 0, getFontForString(L16_901))))
			display.newText(L16_901.split(L16_901, "[[IMG]]")[2], 0, 0, getFontForString(L16_901)).x = L19_904.x + L19_904.contentWidth / 2 + display.newText(L16_901.split(L16_901, "[[IMG]]")[2], 0, 0, getFontForString(L16_901)).contentWidth / 2
		end
		L32_917:insert((display.newGroup()))
		scaleTo(display.newGroup(), L15_900.contentWidth - L1_886 * 2)
		display.newGroup():setReferencePoint(display.CenterReferencePoint)
		display.newGroup().x = 0
		display.newGroup().y = 0
	end
	L32_917.direction = L6_891
	if L32_917.direction == "left" or L32_917.direction == "right" then
		if L6_891 == "right" then
			L32_917.x = -L32_917.contentWidth / 2
		else
			L32_917.x = screenX + screenWidth + L32_917.contentWidth / 2
		end
		if not L8_893 then
		end
		L32_917.y = 0
		;({}).delta = true
		;({}).x = -1 * L32_917.contentWidth + screenX
		;({}).time = 1000
		;({}).transition = easingx.easeOutBounce
		;({}).onComplete = function()
			if _ENV then
				_ENV()
			end
		end
		transition.to(L32_917, {})
	else
		if L6_891 == "down" then
			L32_917.y = -L32_917.contentHeight / 2
		else
			L32_917.y = display.contentHeight + L32_917.contentHeight / 2
		end
		;({}).delta = true
		;({}).y = -1 * L32_917.contentHeight
		;({}).time = 1000
		;({}).transition = easingx.easeOutBounce
		;({}).onComplete = function()
			if _ENV then
				_ENV()
			end
		end
		transition.to(L32_917, {})
	end
	function L32_917.close()
		if not _ENV.parent then
			return
		end
		function cleanup()
			if not _ENV.parent then
				return
			end
			_ENV:removeSelf()
			if A0_885.spriteImage then
				spritesheetmanager.getSpriteSet(A0_885.spriteImage)
				local L1_923 = L1_923
			end
		end
		if L2_887 then
			L2_887(_ENV)
		end
		if _ENV.direction == "left" or _ENV.direction == "right" then
			({}).delta = true
			;({}).x = -1 * _UPVALUE3_ * _ENV.contentWidth
			;({}).time = 250
			;({}).onComplete = cleanup
			transition.to(_ENV, {})
		else
			local L0_918 = L0_918
			local L1_919 = L1_919
			;({}).delta = true
			local L4_922 = L4_922
			L4_922.y = -1 * _UPVALUE3_ * _ENV.contentHeight
			L4_922.time = 250
			L4_922.onComplete = cleanup
			L0_918(L1_919, L4_922)
		end
	end
	if L4_889 then
		L32_917.timers = {}
		table.insert(L32_917.timers, timer.performWithDelay(L4_889, L32_917.close))
	end
	if L5_890 then
		local L23_908 = L23_908
		local L24_909, L25_910 = L24_909, L25_910
		local L26_911 = L26_911
		L26_911(L32_917, "touch", L25_910)
		local L27_912 = L27_912
	end
	return L32_917
end
function comma_value(A0_924)
	local L1_925
	L1_925 = A0_924
	while "k" do
		local L2_926 = L2_926
		local L3_927 = L3_927
		local L4_928 = L4_928
		local L2_926, L3_927, L5_929 = L2_926(L3_927, L4_928, "%1,%2")
		k = L3_927
		L1_925 = L2_926
		L2_926 = k
		if L2_926 == 0 then
			break
		end
	end
	return L1_925
end
function getDrawnDialogBox(A0_930)
	local L1_931, L2_932, L3_933, L4_934, L5_935, L6_936, L7_937, L8_938, L9_939, L10_940, L11_941, L12_942
	if not A0_930 then
		L1_931 = {}
		A0_930 = L1_931
	end
	L1_931 = A0_930.title
	if not L1_931 then
		L1_931 = "TITLE GOES HERE"
	end
	L2_932 = A0_930.showTitle
	L2_932 = L2_932 == nil or L2_932
	L3_933 = A0_930.newTitleScale
	if not L3_933 then
		L3_933 = nil
	end
	L4_934 = A0_930.width
	if not L4_934 then
		L4_934 = 600
	end
	L5_935 = A0_930.height
	if not L5_935 then
		L5_935 = 400
	end
	L6_936 = A0_930.borderWidth
	if not L6_936 then
		L6_936 = 6
	end
	L7_937 = A0_930.closeable
	L7_937 = L7_937 == nil or L7_937
	L8_938 = A0_930.cancelFunc
	L9_939 = A0_930.showImmediately
	if not L9_939 then
		L9_939 = false
	end
	L10_940 = A0_930.closeImmediately
	if not L10_940 then
		L10_940 = false
	end
	L11_941 = A0_930.onShow
	if not L11_941 then
		L11_941 = nil
	end
	L12_942 = A0_930.onClose
	if not L12_942 then
		L12_942 = nil
	end
	local L13_943 = L13_943
	local L13_943, L14_944 = L13_943(UI_SPRITE_SHEET)
	local L15_945 = L15_945
	L15_945 = L15_945(screenX, 0, screenWidth, display.contentHeight)
	L15_945:setFillColor(0, 0, 0)
	L15_945.alpha = 0
	L15_945.isHitTestable = true
	L15_945:addEventListener("tap", function()
		local L1_956
		L1_956 = true
		return L1_956
	end)
	L15_945:addEventListener("touch", function()
		local L1_957
		L1_957 = true
		return L1_957
	end)
	local L16_946 = display.newGroup()
	L16_946.x = screenX + screenWidth / 2
	L16_946.y = display.contentHeight / 2
	L16_946.washOut = L15_945
	L16_946.trackedTextCandy = {}
	local L17_947 = L17_947
	L17_947 = L17_947(0, 0, L4_934, L5_935)
	L17_947.strokeWidth = 9
	L17_947:setStrokeColor(LITTLE_GENERALS_BACKGROUND_LIGHT())
	L17_947:setFillColor(253, 209, 152)
	local L18_948 = L18_948
	L18_948(L16_946, L17_947)
	L18_948 = 0
	L17_947.y = 0
	L17_947.x = L18_948
	L16_946.outerRect = L17_947
	L18_948 = nil
	if L2_932 then
		L18_948 = display.newRect(L16_946, 0, 0, L17_947.contentWidth, 89)
		L18_948:setFillColor(LITTLE_GENERALS_BACKGROUND_LIGHT())
		L18_948.x, L18_948.y = 0, -L17_947.contentHeight / 2 + L18_948.contentHeight / 2 + 20
		L16_946.titleBar = L18_948
	end
	L17_947 = display.newRect(0, 0, L17_947.contentWidth - 15, L17_947.contentHeight - 15)
	L17_947.strokeWidth = L6_936
	L17_947:setStrokeColor(LITTLE_GENERALS_BROWN_DARK())
	L17_947:setFillColor(0, 0, 0, 0)
	L16_946:insert(L17_947)
	L17_947.x, L17_947.y = 0, 0
	L16_946.innerRect = L17_947
	if L2_932 then
		local L19_949 = L19_949
		;({}).size = 80
		;({}).fontColor = utils.pack(LITTLE_GENERALS_BROWN_DARK())
		;({}).shadowColor, ({})[1] = {}, 255
		;({}).shadowColor, ({})[2] = {}, 255
		local ({}).shadowColor, ({})[3], L25_955 = {}, 255, L25_955
		L19_949 = L19_949(L25_955, {})
		L25_955 = L18_948.y
		L19_949.y = L25_955
		L25_955 = L16_946.insert
		L25_955(L16_946, L19_949)
		L16_946.title = L19_949
		if not L3_933 then
			L25_955 = cancelButton
			if L25_955 then
				L25_955 = L18_948.contentWidth
				L25_955 = L25_955 - (cancelButton.contentWidth + 30) * 2
				L3_933 = L25_955 / L19_949.contentWidth
			else
				L25_955 = L18_948.contentWidth
				L3_933 = L25_955 - 60 / L19_949.contentWidth
			end
			if 1 < L3_933 then
				L3_933 = 1
			end
		end
		L25_955 = L3_933
		L19_949.yScale = L3_933
		L19_949.xScale = L25_955
	end
	function L19_949(A0_958)
		L4_962 = _ENV.preRemoveFunction
		if L4_962 then
			L4_962 = _ENV
			L4_962 = L4_962.preRemoveFunction
			L4_962()
		end
		L4_962 = pairs
		L5_963 = _ENV
		L5_963 = L5_963.trackedTextCandy
		L4_962, L5_963, _FOR_ = L4_962(L5_963)
		for _FORV_4_, _FORV_5_ in L4_962, L5_963, _FOR_ do
			_FORV_5_:delete()
			_ENV.trackedTextCandy[_FORV_4_] = nil
		end
		L4_962 = _ENV
		L4_962.trackedTextCandy = nil
		L4_962 = display
		L4_962 = L4_962.remove
		L5_963 = _ENV
		L5_963 = L5_963.washOut
		L4_962(L5_963)
		L4_962 = display
		L4_962 = L4_962.remove
		L5_963 = _ENV
		L4_962(L5_963)
		L4_962 = _ENV
		L4_962.isClosed = true
		L4_962 = nil
		_ENV = L4_962
		if A0_958 then
			L4_962 = A0_958
			L4_962()
		end
	end
	L16_946.internalClose = L19_949
	function L19_949(A0_966)
		if _ENV and not _ENV.isClosed then
			if L10_940 then
				_ENV.internalClose(A0_966)
			else
				({}).alpha = 0
				;({}).transition = easing.inOutQuad
				transition.to(_ENV.washOut, {})
				local L1_967 = L1_967
				local L2_968 = L2_968
				;({}).y = -_ENV.height
				local ({}).transition, L4_970 = easing.inOutQuad, L4_970
				function L4_970.onComplete()
					_ENV.internalClose(A0_966)
					local L1_971 = L1_971
				end
				L1_967(L2_968, L4_970)
			end
		end
	end
	L16_946.close = L19_949
	L19_949 = nil
	if L7_937 then
		L25_955 = utils
		L25_955 = L25_955.newButton
		L25_955 = L25_955(L13_943, L14_944, "cornerexit_normal_btn.png", "cornerexit_select_btn.png", function()
			sound.playSound(sound.globalSounds.button)
			if _ENV then
				_ENV()
			end
			if L16_946 and not L16_946.isClosed then
				L16_946.close(L12_942)
				local L1_972 = L1_972
			end
		end)
		L19_949 = L25_955
		L25_955 = L16_946.insert
		L25_955(L16_946, L19_949)
		L25_955 = L16_946.contentWidth
		L25_955 = L25_955 / 2
		L25_955 = L25_955 - L19_949.contentWidth / 4
		L25_955 = L25_955 - 2
		L19_949.y = -L16_946.contentHeight / 2 + L19_949.contentHeight / 4 - 6
		L19_949.x = L25_955
		L16_946.cancelButton = L19_949
	end
	if L9_939 then
		L25_955 = L16_946.washOut
		L25_955.alpha = 0.5
		if L11_941 then
			L25_955 = L11_941
			L25_955()
		end
	else
		L25_955 = transition
		L25_955 = L25_955.to
		;({}).alpha = 0.5
		;({}).transition = easing.inOutQuad
		L25_955(L16_946.washOut, {})
		L25_955 = transition
		L25_955 = L25_955.from
		local L21_951 = L21_951
		local L24_954 = L24_954
		L24_954.y = display.contentHeight + L16_946.height
		L24_954.transition = easing.inOutQuad
		function L24_954.onComplete()
			if _ENV then
				_ENV()
			end
		end
		L25_955(L21_951, L24_954)
	end
	return L16_946
end
function getDialog(A0_973)
	local L1_974, L2_975, L3_976, L4_977, L5_978, L6_979, L7_980, L8_981, L9_982
	L1_974 = A0_973.screenGroup
	local L2_975, L12_985 = A0_973.textLine1, L12_985
	L3_976 = A0_973.textLine2
	L4_977 = A0_973.icon
	L5_978 = A0_973.confirmFunction
	L6_979 = A0_973.cancelFunction
	L7_980 = A0_973.confirmSound
	L8_981 = A0_973.cancelSound
	L9_982 = A0_973.onShow
	L12_985 = spritesheetmanager
	L12_985 = L12_985.getSpriteSet
	local L12_985, L11_984 = L12_985(UI_SPRITE_SHEET)
	if L4_977 then
		getDialogIcon(L4_977).y = -142
	end
	if L7_980 then
		sound.loadSound(L7_980)
	end
	if L8_981 then
		sound.loadSound(L8_981)
	end
	local L13_986 = L13_986
	display.newRect(screenX, 0, screenWidth, display.contentHeight):setFillColor(0, 0, 0)
	display.newRect(screenX, 0, screenWidth, display.contentHeight).alpha = 0
	local L14_987 = L14_987
	display.newGroup().washOut = L14_987
	if L1_974 ~= nil then
		L1_974:insert(display.newGroup().washOut)
	end
	display.newGroup().washOut.x = screenX + screenWidth / 2
	display.newGroup().washOut:scale(1.5, 1)
	utils.addHitBlockListeners(display.newGroup().washOut)
	if L1_974 ~= nil then
		L1_974:insert((display.newGroup()))
	end
	display.newGroup().x = display.newGroup().washOut.x
	display.newGroup().y = display.newGroup().washOut.y
	display.newGroup().dialogBack = display.newImage(display.newGroup(), "res/ui/popup_box.png", 0, 0, true)
	display.newGroup().dialogBack.x = 0
	display.newGroup().dialogBack.y = 0
	if L13_986 then
		display.newGroup():insert(L13_986)
	end
	local L15_988 = L15_988
	if L2_975 ~= nil then
		display.newText(L2_975, 0, 0, getFontForString(L2_975)):setTextColor(LITTLE_GENERALS_BROWN_DARK())
		display.newGroup():insert((display.newText(L2_975, 0, 0, getFontForString(L2_975))))
		scaleTo(display.newText(L2_975, 0, 0, getFontForString(L2_975)), L15_988.dialogBack.contentWidth - 30)
		display.newText(L2_975, 0, 0, getFontForString(L2_975)).x, display.newText(L2_975, 0, 0, getFontForString(L2_975)).y = 0, 0
		if L3_976 ~= nil then
			display.newText(L2_975, 0, 0, getFontForString(L2_975)).x, display.newText(L2_975, 0, 0, getFontForString(L2_975)).y = 0, 0 - display.newText(L2_975, 0, 0, getFontForString(L2_975)).contentHeight / 2
			local L24_997 = L24_997
			local L25_998 = L25_998
			display.newText(L3_976, 0, 0, getFontForString(L3_976), getFontForString(L2_975) * 60):setTextColor(LITTLE_GENERALS_BROWN_DARK())
			L24_997:insert((display.newText(L3_976, 0, 0, getFontForString(L3_976), getFontForString(L2_975) * 60)))
			scaleTo(display.newText(L3_976, 0, 0, getFontForString(L3_976), getFontForString(L2_975) * 60), L15_988.dialogBack.contentWidth - 30)
			display.newText(L3_976, 0, 0, getFontForString(L3_976), getFontForString(L2_975) * 60).x = display.newText(L2_975, 0, 0, getFontForString(L2_975)).x
			display.newText(L3_976, 0, 0, getFontForString(L3_976), getFontForString(L2_975) * 60).y = display.newText(L2_975, 0, 0, getFontForString(L2_975)).y + display.newText(L2_975, 0, 0, getFontForString(L2_975)).contentHeight - 10
		end
	end
	L25_998 = L15_988.insert
	L25_998(L15_988, L24_997)
	L25_998 = L15_988.dialogBack
	L25_998 = L25_998.x
	L24_997.y = L15_988.dialogBack.y
	L24_997.x = L25_998
	L15_988.textGroup = L24_997
	function L25_998()
		local L0_999 = L0_999
		L0_999 = L0_999(0, 0, _ENV.contentWidth, _ENV.contentHeight)
		_ENV:insert(L0_999)
		L0_999.alpha = 0
		L0_999.isHitTestable = true
		L0_999.x, L0_999.y = 0, 0
		L0_999:addEventListener("touch", function()
			local L1_1004
			L1_1004 = true
			return L1_1004
		end)
		_ENV.washOut.isHitTestable = true
		;({}).alpha = 0
		;({}).transition = easing.inOutQuad
		transition.to(_ENV.washOut, {})
		local L1_1000 = L1_1000
		local L2_1001 = L2_1001
		;({}).y = -_ENV.height
		local ({}).transition, L4_1003 = easing.inOutQuad, L4_1003
		function L4_1003.onComplete()
			display.remove(_ENV.washOut)
			display.remove(_ENV.dialogBack)
			display.remove(_ENV.textGroup)
			_ENV.confirmButton = nil
			_ENV.cancelButton = nil
			_ENV.textGroup = nil
			_ENV.dialogBack = nil
			_ENV.washOut = nil
			display.remove(_ENV)
			local L1_1006 = L1_1006
			L1_1006 = _ENV
			L1_1006 = L1_1006.finalAction
			if L1_1006 ~= nil then
				L1_1006 = _ENV
				L1_1006 = L1_1006.finalAction
				L1_1006()
			end
			L1_1006 = nil
			_ENV = L1_1006
		end
		L1_1000(L2_1001, L4_1003)
	end
	L15_988.close = L25_998
	L25_998 = utils
	L25_998 = L25_998.newButton
	L25_998 = L25_998(L12_985, L11_984, "accept_normal_btn.png", "accept_select_btn.png", function()
		if _ENV then
			sound.playSound(_ENV)
		end
		local L15_988.finalAction, L1_1008 = L5_978, L1_1008
		L1_1008 = L15_988
		L1_1008 = L1_1008.close
		L1_1008()
		L1_1008 = true
		return L1_1008
	end)
	L15_988:insert(L25_998)
	L25_998.x = L15_988.dialogBack.x
	L25_998.y = L15_988.dialogBack.y + L15_988.dialogBack.contentHeight / 2 - L25_998.contentHeight / 2 - 30
	L15_988.confirmButton = L25_998
	if L6_979 then
		L15_988:insert((utils.newButton(L12_985, L11_984, "exit_normal_btn.png", "exit_select_btn.png", function()
			_ENV.washOut.isHitTestable = true
			if L7_980 then
				sound.playSound(L8_981)
				local L1_1010 = L1_1010
			end
			L1_1010 = _ENV
			L1_1010 = L1_1010.close
			L1_1010()
			L1_1010 = _ENV
			L1_1010.finalAction = L6_979
		end)))
		utils.newButton(L12_985, L11_984, "exit_normal_btn.png", "exit_select_btn.png", function()
			_ENV.washOut.isHitTestable = true
			if L7_980 then
				sound.playSound(L8_981)
				local L1_1012 = L1_1012
			end
			L1_1012 = _ENV
			L1_1012 = L1_1012.close
			L1_1012()
			L1_1012 = _ENV
			L1_1012.finalAction = L6_979
		end).x = L25_998.x - 70
		L25_998.x = L25_998.x + 70
		L15_988.cancelButton, utils.newButton(L12_985, L11_984, "exit_normal_btn.png", "exit_select_btn.png", function()
			_ENV.washOut.isHitTestable = true
			if L7_980 then
				sound.playSound(L8_981)
				local L1_1014 = L1_1014
			end
			L1_1014 = _ENV
			L1_1014 = L1_1014.close
			L1_1014()
			L1_1014 = _ENV
			L1_1014.finalAction = L6_979
		end).y = utils.newButton(L12_985, L11_984, "exit_normal_btn.png", "exit_select_btn.png", function()
			_ENV.washOut.isHitTestable = true
			if L7_980 then
				sound.playSound(L8_981)
				local L1_1016 = L1_1016
			end
			L1_1016 = _ENV
			L1_1016 = L1_1016.close
			L1_1016()
			L1_1016 = _ENV
			L1_1016.finalAction = L6_979
		end), L25_998.y
	end
	;({}).alpha = 0.5
	;({}).transition = easing.inOutQuad
	transition.to(L15_988.washOut, {})
	local L18_991 = L18_991
	local L21_994 = L21_994
	;({}).y = display.contentHeight + L15_988.height
	;({}).transition = easing.inOutQuad
	;({}).onComplete = L9_982
	L18_991(L21_994, {})
	return L15_988
end
function newImageFromSpriteSet(A0_1017, A1_1018, A2_1019)
	local L3_1020 = L3_1020
	L3_1020 = L3_1020(A0_1017)
	local L4_1021 = L4_1021
	L4_1021 = L4_1021(A1_1018, A2_1019)
	L3_1020.width = L4_1021.spriteSourceSize.width
	L3_1020.height = L4_1021.spriteSourceSize.height
	local L5_1022, L6_1023 = L5_1022, L6_1023
	L5_1022(L6_1023, A2_1019)
	local L7_1024 = L7_1024
	return L3_1020
end
function newCheckbox(A0_1025, A1_1026, A2_1027, A3_1028, A4_1029, A5_1030)
	local L12_1037 = sprite.newSprite
	L12_1037 = L12_1037(A0_1025)
	local L7_1032 = L7_1032
	local L8_1033 = L8_1033
	L7_1032 = L7_1032(L8_1033, A2_1027)
	L8_1033 = L7_1032.spriteSourceSize
	L8_1033 = L8_1033.width
	L12_1037.width = L8_1033
	L8_1033 = L7_1032.spriteSourceSize
	L8_1033 = L8_1033.height
	L12_1037.height = L8_1033
	L8_1033 = nil
	if A4_1029 then
		L8_1033 = A3_1028
	else
		L8_1033 = A2_1027
	end
	L12_1037:prepare(L8_1033)
	if A5_1030 then
		local L9_1034, L10_1035 = L9_1034, L10_1035
		local L11_1036 = L11_1036
		L9_1034(L10_1035, L11_1036, function(A0_1038)
			if A0_1038.phase == "began" then
				display.getCurrentStage():setFocus(A0_1038.target)
			elseif A0_1038.phase == "ended" or A0_1038.phase == "cancelled" then
				local L1_1039, L2_1040 = L1_1039, L2_1040
				L1_1039(L2_1040, nil)
				L1_1039 = _ENV
				L2_1040 = nil
				if L1_1039 == A3_1028 then
					L1_1039 = A2_1027
					L2_1040 = false
				else
					L1_1039 = A3_1028
					L2_1040 = true
				end
				local L3_1041 = L3_1041
				L3_1041 = L3_1041(L2_1040)
				if L3_1041 == nil or L3_1041 == true then
					local L4_1042, L5_1043 = L4_1042, L5_1043
					L4_1042(L5_1043, L1_1039)
					local L6_1044 = L6_1044
					_ENV = L1_1039
				end
			end
			L1_1039 = true
			return L1_1039
		end)
	end
	function L9_1034(A0_1045)
		if A0_1045 then
			_ENV = A3_1028
		else
			_ENV = A2_1027
		end
		local L1_1046, L2_1047 = L1_1046, L2_1047
		L1_1046(L2_1047, _ENV)
		local L3_1048 = L3_1048
	end
	L12_1037.setChecked = L9_1034
	return L12_1037
end
function getFontForString(A0_1049)
	local L1_1050 = L1_1050
	local L1_1050, L2_1051 = L1_1050(A0_1049), L2_1051
	if L1_1050 then
		L1_1050 = "SingleSleeve"
		L2_1051 = 1
		return L1_1050, L2_1051
	else
		L1_1050 = native
		L1_1050 = L1_1050.systemFontBold
		L2_1051 = 0.85
		return L1_1050, L2_1051
	end
end
function table.binsearch(A0_1052, A1_1053, A2_1054, A3_1055)
	local L4_1056, L5_1057, L6_1058, L7_1059, L8_1060
	L4_1056 = A2_1054 or nil
	if not A2_1054 then
		L4_1056 = _ENV
	end
	if A3_1055 then
		L5_1057 = _UPVALUE1_
		if L5_1057 then
			goto lbl_10
		end
	end
	L5_1057 = _UPVALUE2_
	::lbl_10::
	L6_1058 = 1
	L7_1059 = #A0_1052
	L8_1060 = 0
	while L6_1058 <= L7_1059 do
		L8_1060 = math.floor((L6_1058 + L7_1059) / 2)
		local L9_1061 = L9_1061
		L9_1061 = L9_1061(A0_1052[L8_1060])
		if A1_1053 == L9_1061 then
			({})[1] = L8_1060
			;({})[2] = L8_1060
			while A1_1053 == L4_1056(A0_1052[L8_1060 - 1]) do
				({})[1] = L8_1060 - 1
			end
			while true do
				local L13_1065 = L13_1065
				if A1_1053 ~= L4_1056(A0_1052[L8_1060 + 1]) then
					break
				end
				L13_1065[2] = L8_1060 + 1
			end
			do return L13_1065 end
			break -- pseudo-goto
		end
		L13_1065 = L5_1057
		local L11_1063 = L11_1063
		local L13_1065, L12_1064 = L13_1065(L11_1063, L9_1061), L12_1064
		repeat
			if L13_1065 then
				L7_1059 = L8_1060 - 1
			else
				L6_1058 = L8_1060 + 1
			end
		until true
	end
end
;({})[1] = "21"
;({})[2] = "ea"
;({})[3] = "64"
;({})[4] = "a7"
;({})[5] = "c9"
;({})[6] = "2206"
;({})[7] = "192"
;({})[8] = "43"
;({})[9] = "22"
;({})[10] = "eb"
;({})[11] = "65"
;({})[12] = "a8"
;({})[13] = "ca"
;({})[14] = "44"
;({})[15] = "23"
;({})[16] = "ec"
;({})[17] = "66"
;({})[18] = "a9"
;({})[19] = "45"
;({})[20] = "f001"
;({})[21] = "cb"
;({})[22] = "24"
;({})[23] = "ed"
;({})[24] = "67"
;({})[25] = "aa"
;({})[26] = "46"
;({})[27] = "152"
;({})[28] = "f002"
;({})[29] = "cc"
;({})[30] = "ee"
;({})[31] = "2013"
;({})[32] = "222b"
;({})[33] = "68"
;({})[34] = "131"
;({})[35] = "ab"
;({})[36] = "25"
;({})[37] = "47"
;({})[38] = "fb01"
;({})[39] = "153"
;({})[40] = "cd"
;({})[41] = "ef"
;({})[42] = "2014"
;({})[43] = "69"
;({})[44] = "ac"
;({})[45] = "26"
;({})[46] = "48"
;({})[47] = "fb02"
;({})[48] = "ce"
;({})[49] = "6a"
;({})[50] = "ad"
;({})[51] = "27"
;({})[52] = "f0"
;({})[53] = "49"
;({})[54] = "cf"
;({})[55] = "6b"
;({})[56] = "2122"
;({})[57] = "ae"
;({})[58] = "2c6"
;({})[59] = "28"
;({})[60] = "f1"
;({})[61] = "d0"
;({})[62] = "4a"
;({})[63] = "6c"
;({})[64] = "2c7"
;({})[65] = "178"
;({})[66] = "29"
;({})[67] = "f2"
;({})[68] = "2039"
;({})[69] = "d1"
;({})[70] = "4b"
;({})[71] = "6d"
;({})[72] = "b0"
;({})[73] = "2a"
;({})[74] = "f3"
;({})[75] = "2018"
;({})[76] = "203a"
;({})[77] = "ffff"
;({})[78] = "d2"
;({})[79] = "220f"
;({})[80] = "4c"
;({})[81] = "6e"
;({})[82] = "b1"
;({})[83] = "2c9"
;({})[84] = "2b"
;({})[85] = "f4"
;({})[86] = "2019"
;({})[87] = "d3"
;({})[88] = "4d"
;({})[89] = "2126"
;({})[90] = "b2"
;({})[91] = "2c"
;({})[92] = "f5"
;({})[93] = "201a"
;({})[94] = "6f"
;({})[95] = "d4"
;({})[96] = "2211"
;({})[97] = "4e"
;({})[98] = "b3"
;({})[99] = "2d"
;({})[100] = "f6"
;({})[101] = "70"
;({})[102] = "d5"
;({})[103] = "2212"
;({})[104] = "4f"
;({})[105] = "b4"
;({})[106] = "17d"
;({})[107] = "2e"
;({})[108] = "f7"
;({})[109] = "201c"
;({})[110] = "71"
;({})[111] = "d6"
;({})[112] = "50"
;({})[113] = "b5"
;({})[114] = "17e"
;({})[115] = "2f"
;({})[116] = "f8"
;({})[117] = "201d"
;({})[118] = "72"
;({})[119] = "d7"
;({})[120] = "51"
;({})[121] = "b6"
;({})[122] = "30"
;({})[123] = "f9"
;({})[124] = "201e"
;({})[125] = "73"
;({})[126] = "d8"
;({})[127] = "2215"
;({})[128] = "52"
;({})[129] = "b7"
;({})[130] = "31"
;({})[131] = "fa"
;({})[132] = "74"
;({})[133] = "d9"
;({})[134] = "53"
;({})[135] = "b8"
;({})[136] = "32"
;({})[137] = "fb"
;({})[138] = "2020"
;({})[139] = "75"
;({})[140] = "da"
;({})[141] = "54"
;({})[142] = "160"
;({})[143] = "33"
;({})[144] = "fc"
;({})[145] = "2021"
;({})[146] = "76"
;({})[147] = "b9"
;({})[148] = "db"
;({})[149] = "55"
;({})[150] = "161"
;({})[151] = "34"
;({})[152] = "fd"
;({})[153] = "2022"
;({})[154] = "77"
;({})[155] = "ba"
;({})[156] = "dc"
;({})[157] = "2219"
;({})[158] = "56"
;({})[159] = "2044"
;({})[160] = "35"
;({})[161] = "fe"
;({})[162] = "78"
;({})[163] = "141"
;({})[164] = "bb"
;({})[165] = "dd"
;({})[166] = "221a"
;({})[167] = "57"
;({})[168] = "36"
;({})[169] = "ff"
;({})[170] = "79"
;({})[171] = "142"
;({})[172] = "bc"
;({})[173] = "58"
;({})[174] = "de"
;({})[175] = "7a"
;({})[176] = "bd"
;({})[177] = "37"
;({})[178] = "59"
;({})[179] = "df"
;({})[180] = "2026"
;({})[181] = "7b"
;({})[182] = "be"
;({})[183] = "20ac"
;({})[184] = "38"
;({})[185] = "5a"
;({})[186] = "2260"
;({})[187] = "37e"
;({})[188] = "e0"
;({})[189] = "7c"
;({})[190] = "bf"
;({})[191] = "39"
;({})[192] = "5b"
;({})[193] = "e1"
;({})[194] = "221e"
;({})[195] = "7d"
;({})[196] = "c0"
;({})[197] = "2d8"
;({})[198] = "3a"
;({})[199] = "e2"
local ({})[200], L61_61 = "5c", L61_61
local L19_19 = L19_19
local L20_20 = L20_20
local L21_21 = L21_21
local L26_26 = L26_26
local L27_27 = L27_27
local L28_28 = L28_28
local L29_29 = L29_29
local L30_30 = L30_30
local L31_31 = L31_31
local L32_32 = L32_32
local L33_33 = L33_33
local L34_34 = L34_34
local L35_35 = L35_35
local L36_36 = L36_36
local L37_37 = L37_37
local L38_38 = L38_38
local L39_39 = L39_39
local L40_40 = L40_40
local L41_41 = L41_41
local L42_42 = L42_42
local L43_43 = L43_43
local L44_44 = L44_44
local L45_45 = L45_45
local L46_46 = L46_46
local L47_47 = L47_47
local L48_48 = L48_48
local L49_49 = L49_49
local L50_50 = L50_50
local L51_51 = L51_51
local L52_52 = L52_52
local L53_53 = L53_53
local L54_54 = L54_54
local L55_55 = L55_55
local L56_56 = L56_56
local L57_57 = L57_57
local L58_58 = L58_58
local L59_59 = L59_59
L21_21[201] = L22_22
L21_21[202] = L23_23
L21_21[203] = L24_24
L21_21[204] = L25_25
L21_21[205] = L26_26
L21_21[206] = L27_27
L21_21[207] = L28_28
L21_21[208] = L29_29
L21_21[209] = L30_30
L21_21[210] = L31_31
L21_21[211] = L32_32
L21_21[212] = L33_33
L21_21[213] = L34_34
L21_21[214] = L35_35
L21_21[215] = L36_36
L21_21[216] = L37_37
L21_21[217] = L38_38
L21_21[218] = L39_39
L21_21[219] = L40_40
L21_21[220] = L41_41
L21_21[221] = L42_42
L21_21[222] = L43_43
L21_21[223] = L44_44
L21_21[224] = L45_45
L21_21[225] = L46_46
L21_21[226] = L47_47
L21_21[227] = L48_48
L21_21[228] = L49_49
L21_21[229] = L50_50
L21_21[230] = L51_51
L21_21[231] = L52_52
L21_21[232] = L53_53
L21_21[233] = L54_54
L21_21[234] = L55_55
L21_21[235] = L56_56
L21_21[236] = L57_57
L21_21[237] = L58_58
L21_21[238] = L59_59
L21_21[239] = "62"
L21_21[240] = "c7"
L21_21[241] = "41"
L21_21[242] = "20"
L21_21[243] = "e9"
L21_21[244] = "63"
L21_21[245] = "a6"
L21_21[246] = "2248"
L21_21[247] = "2030"
L21_21[248] = "c8"
local L21_21[249], L60_60 = "42", L60_60
L22_22 = 1
L23_23 = #L21_21
L24_24 = 1
for L25_25 = L22_22, L23_23, L24_24 do
	L26_26 = tonumber
	L27_27 = L21_21[L25_25]
	L28_28 = 16
	L26_26 = L26_26(L27_27, L28_28)
	L21_21[L25_25] = L26_26
end
L22_22 = table
L23_23 = "sort"
L22_22 = L22_22[L23_23]
L23_23 = L21_21
L22_22(L23_23)
function L22_22(A0_1066)
	local L1_1067
	L1_1067 = 1
	L5_1071 = A0_1066
	L4_1070 = A0_1066.len
	L4_1070 = L4_1070(L5_1071)
	L5_1071 = 1
	for _FORV_4_ = L1_1067, L4_1070, L5_1071 do
		local L7_1073 = L7_1073
		local L8_1074 = table.binsearch(_ENV, (string.byte(string.sub(A0_1066, _FORV_4_, _FORV_4_))))
		if not L8_1074 then
			L8_1074 = false
			return L8_1074
		end
	end
	L1_1067 = true
	return L1_1067
end
canRenderInSingleSleeve = L22_22
L22_22 = {}
L23_23 = {}
L24_24 = "__mode"
L25_25 = "k"
L23_23[L24_24] = L25_25
function L24_24(A0_1076, A1_1077, A2_1078, A3_1079, A4_1080)
	local L5_1081, L6_1082, L7_1083
	L5_1081 = _ENV
	L5_1081[A0_1076] = A4_1080
	L5_1081 = 0
	L6_1082 = 0
	L7_1083 = false
	if not A3_1079 then
		A3_1079 = ""
	else
		local L8_1084 = L8_1084
		A3_1079 = L8_1084 .. "\t"
	end
	L8_1084 = A1_1077 or L8_1084
	if not A1_1077 then
		L8_1084 = {}
	end
	_FOR_, _FOR_, _FOR_ = pairs(A0_1076)
	for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
		if not L8_1084[_FORV_13_] then
			L8_1084[_FORV_13_] = true
			if type(_FORV_13_) == "table" then
				L7_1083 = L24_24(_FORV_13_, L8_1084, A2_1078, A3_1079, _FORV_12_)
				L5_1081 = L5_1081 + L24_24(_FORV_13_, L8_1084, A2_1078, A3_1079, _FORV_12_) + 1
				L6_1082 = L6_1082 + L24_24(_FORV_13_, L8_1084, A2_1078, A3_1079, _FORV_12_)
				if A2_1078 then
					print("***TAB***", A3_1079, L24_24(_FORV_13_, L8_1084, A2_1078, A3_1079, _FORV_12_))
				end
				if not L22_22[tostring(_FORV_12_)] then
					L22_22[tostring(_FORV_12_)] = {}
				end
				if not (not L22_22[tostring(_FORV_12_)][tostring(_FORV_13_)] or L24_24(_FORV_13_, L8_1084, A2_1078, A3_1079, _FORV_12_) > L22_22[tostring(_FORV_12_)][tostring(_FORV_13_)]) then
					goto lbl_157
				end
				if 20 < L24_24(_FORV_13_, L8_1084, A2_1078, A3_1079, _FORV_12_) then
					print(A3_1079, A4_1080, A0_1076, _FORV_12_, L24_24(_FORV_13_, L8_1084, A2_1078, A3_1079, _FORV_12_))
				end
				L22_22[tostring(_FORV_12_)][tostring(_FORV_13_)] = L5_1081
				L7_1083 = true
				break -- pseudo-goto
			end
			if type(_FORV_13_) == "function" then
				L6_1082 = L6_1082 + 1
			end
			if not A2_1078 then
				goto lbl_157
			end
			print("   VAL   ", A3_1079, "-", _FORV_12_, _FORV_13_)
			break -- pseudo-goto
		end
		if type(_FORV_13_) == "table" or type(_FORV_13_) == "userdata" then
			if A2_1078 then
				print("///CYC///", A3_1079, "-", _FORV_12_, _FORV_13_)
			end
			if not L22_22[tostring(_FORV_12_)] then
				L22_22[tostring(_FORV_12_)] = {}
			end
			if not L22_22[tostring(_FORV_12_)][tostring(_FORV_13_)] then
				if 20 < L5_1081 then
					local L21_1097 = L21_1097
					print(A3_1079, A4_1080, A0_1076, _FORV_12_, L5_1081, _FORV_13_)
					local L22_1098 = L22_1098
				end
				L22_22[L21_1097][L22_1098] = L5_1081
				L7_1083 = true
			end
		end
		::lbl_157::
		repeat
		until true
	end
	if L7_1083 then
		L23_1099 = print
		L24_1100 = "PP"
		L18_1094 = A3_1079
		L19_1095 = A4_1080
		L20_1096 = A0_1076
		L21_1097 = L5_1081
		L23_1099(L24_1100, L18_1094, L19_1095, L20_1096, L21_1097)
	end
	L23_1099 = L5_1081
	L24_1100 = L7_1083
	L18_1094 = L6_1082
	return L23_1099, L24_1100, L18_1094
end
function L25_25(A0_1101)
	if A0_1101 then
		A0_1101 = string.gsub(A0_1101, "\n", "\r\n")
		A0_1101 = string.gsub(A0_1101, "([^%w ])", function(A0_1106)
			local L1_1107, L2_1108
			L1_1107 = string
			L1_1107 = L1_1107.format
			L2_1108 = "%%%02X"
			local L3_1109 = L3_1109
			local L3_1109, L4_1110 = L3_1109(A0_1106)
			return L1_1107(L2_1108, L3_1109, L4_1110)
		end)
		local L1_1102 = L1_1102
		local L2_1103 = L2_1103
		local L3_1104 = L3_1104
		local L1_1102, L4_1105 = L1_1102(L2_1103, L3_1104, "+"), L4_1105
		A0_1101 = L1_1102
	end
	return A0_1101
end
urlencode = L25_25
function L25_25(A0_1111)
	A0_1111 = string.gsub(A0_1111, "+", " ")
	A0_1111 = string.gsub(A0_1111, "%%(%x%x)", function(A0_1116)
		local L1_1117
		L1_1117 = string
		L1_1117 = L1_1117.char
		local L2_1118 = L2_1118
		local L3_1119 = L3_1119
		local L2_1118, L3_1119, L4_1120 = L2_1118(L3_1119, 16)
		return L1_1117(L2_1118, L3_1119, L4_1120)
	end)
	local L1_1112 = L1_1112
	local L2_1113 = L2_1113
	local L3_1114 = L3_1114
	local L1_1112, L4_1115 = L1_1112(L2_1113, L3_1114, "\n"), L4_1115
	A0_1111 = L1_1112
	return A0_1111
end
urldecode = L25_25
function L25_25(A0_1121)
	local L8_1129 = CUSTOM_OVERRIDES.MEM_DELTA
	if not L8_1129 then
		return
	end
	L8_1129 = collectgarbage
	L8_1129()
	L8_1129 = A0_1121 or L8_1129
	if not A0_1121 then
		L8_1129 = _G
	end
	local L2_1123 = L2_1123
	local L2_1123, L3_1124 = L2_1123(L8_1129), L3_1124
	L3_1124 = _ENV
	L3_1124 = L3_1124[L2_1123]
	if not L3_1124 then
		L3_1124 = _ENV
		L3_1124[L2_1123] = {}
	end
	L3_1124 = 0
	L4_1125, _FOR_, _FOR_ = L4_1125(L8_1129)
	for _FORV_7_, _FORV_8_ in L4_1125, _FOR_, _FOR_ do
		if _FORV_7_ ~= "_G" and type(_FORV_8_) == "table" then
			L3_1124 = L3_1124 + L24_24(_FORV_8_, {}, false, "", _FORV_7_)
			if not _ENV[L2_1123][tostring(_FORV_8_)] or L24_24(_FORV_8_, {}, false, "", _FORV_7_) > _ENV[L2_1123][tostring(_FORV_8_)] then
				print(_FORV_7_, L24_24(_FORV_8_, {}, false, "", _FORV_7_))
				_ENV[L2_1123][tostring(_FORV_8_)] = L24_24(_FORV_8_, {}, false, "", _FORV_7_)
			end
		end
	end
	L4_1125 = 0
	L9_1130 = pairs
	L15_1136 = L23_23
	L9_1130, L15_1136, L16_1137 = L9_1130(L15_1136)
	for L17_1138, _FORV_9_ in L9_1130, L15_1136, L16_1137 do
		print("Leak", L17_1138, _FORV_9_)
		L4_1125 = L4_1125 + 1
	end
	L9_1130 = print
	L15_1136 = "total"
	L16_1137 = L4_1125
	L9_1130(L15_1136, L16_1137)
	L9_1130 = print
	L15_1136 = "function total"
	L16_1137 = L3_1124
	L9_1130(L15_1136, L16_1137)
	L9_1130 = {}
	L23_23 = L9_1130
	L9_1130 = L23_23
	L9_1130.__mode = "k"
end
memDelta = L25_25
function L25_25()
	local L0_1139 = L0_1139
	;({}).autoClose = 3000
	;({}).text = "Please make sure in-app purchases are enabled on your device. "
	;({}).direction = "down"
	L0_1139({})
	local L1_1140 = L1_1140
end
showEnableIAPs = L25_25
function L25_25(A0_1141, A1_1142, A2_1143)
	local L3_1144 = L3_1144
	L3_1144 = L3_1144(A0_1141, "\n")
	_FOR_ = 1
	for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
		print("P", L3_1144[_FORV_7_])
	end
	L9_1150 = #L3_1144
	if L9_1150 ~= 3 then
		L9_1150 = #L3_1144
		if L9_1150 ~= 4 then
			L9_1150 = nil
			return L9_1150
		end
	end
	L9_1150 = crypto
	L9_1150 = L9_1150.hmac
	L10_1151 = A1_1142
	L9_1150 = L9_1150(L10_1151, L3_1144[2] .. L3_1144[3], A2_1143)
	L10_1151 = print
	local L6_1147 = L6_1147
	local L7_1148 = L7_1148
	L10_1151(L6_1147, L7_1148, L3_1144[1])
	local L8_1149 = L8_1149
	L10_1151 = L3_1144[1]
	if L10_1151 == L9_1150 then
		L10_1151 = L3_1144[3]
		return L10_1151
	else
		L10_1151 = nil
		return L10_1151
	end
end
verifyHmac = L25_25
function L25_25(A0_1152)
	local L1_1153
	L1_1153 = ""
	if A0_1152 then
		L5_1157 = string
		L5_1157 = L5_1157.gmatch
		L5_1157, L3_1155, L4_1156 = L5_1157(L3_1155, "(%w*)")
		for _FORV_5_ in L5_1157, L3_1155, L4_1156 do
			local L1_1153, L7_1159 = L1_1153 .. _FORV_5_, L7_1159
		end
	end
	return L1_1153
end
sanitizeId = L25_25
