local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = {}
L0_0._TYPE = "module"
L0_0._NAME = "complex"
L0_0._VERSION = "0.3.3.20111212"
L1_1 = {}
function L2_2(A0_11, A1_12)
	repeat
		local L2_13, L3_14 = L2_13, L3_14
		local L4_15 = L4_15
		L2_13, L3_14, L4_15 = L2_13(L3_14, L4_15, A1_12)
		if not L2_13 then
			return
		end
		if L3_14 == "e" or L3_14 == "E" then
			local L7_18 = L7_18
			if not A0_11:match("^([+-]?%d+)(.?)()", L4_15) then
				error("number format error")
			end
			local L11_22 = L11_22
			L2_13 = tonumber(L2_13 .. L3_14 .. L7_18)
			if not L2_13 then
				error("number format error")
			end
			local L9_20 = L9_20
			do return L2_13, L11_22, A0_11:match("^([+-]?%d+)(.?)()", L4_15) end
			local L10_21 = L10_21
			break -- pseudo-goto
		end
		L7_18 = tonumber
		L11_22 = L2_13
		L7_18 = L7_18(L11_22)
		L2_13 = L7_18
		if not L2_13 then
			L7_18 = error
			L11_22 = "number format error"
			L7_18(L11_22)
		end
		L7_18 = L2_13
		L11_22 = L3_14
		L9_20 = L4_15
		return L7_18, L11_22, L9_20
	until true
end
function L3_3(A0_23, A1_24)
	local L2_25 = L2_25
	local L3_26 = L3_26
	local L2_25, L3_26, L4_27 = L2_25(L3_26, A1_24)
	if not L2_25 then
		if not A0_23:match("^([+-]?)(i)()$", A1_24) then
			error("number format error")
		end
		if A0_23:match("^([+-]?)(i)()$", A1_24) ~= "-" or not -1 then
		end
		local L8_31 = L8_31
		local L9_32 = L9_32
		do return 1, A0_23:match("^([+-]?)(i)()$", A1_24) end
		local L10_33 = L10_33
	end
	if L3_26 == "/" then
		L8_31 = _ENV
		L9_32 = A0_23
		L10_33 = L4_27
		L8_31, L9_32, L10_33 = L8_31(L9_32, L10_33)
		L2_25 = L2_25 / L8_31
		return L2_25, L9_32, L10_33
	end
	L8_31 = L2_25
	L9_32 = L3_26
	L10_33 = L4_27
	return L8_31, L9_32, L10_33
end
function L4_4(A0_34)
	repeat
		local L1_35 = L1_35
		local L2_36 = L2_36
		local L1_35, L2_36, L3_37 = L1_35(L2_36, 1)
		if L2_36 == "+" or L2_36 == "-" then
			local L6_40 = L6_40
			if _ENV(A0_34, L3_37) ~= "i" or _ENV(A0_34, L3_37) ~= #A0_34 + 1 then
				error("number format error")
			end
			if L2_36 == "-" then
				L6_40 = -L6_40
			end
			local L7_41 = L7_41
			do return L1_35, L6_40 end
			local L8_42 = L8_42
			break -- pseudo-goto
		end
		if L2_36 == "" then
			L6_40 = L1_35
			L7_41 = 0
			return L6_40, L7_41
		elseif L2_36 == "i" then
			L6_40 = #A0_34
			L6_40 = L6_40 + 1
			if L3_37 ~= L6_40 then
				L6_40 = error
				L7_41 = "number format error"
				L6_40(L7_41)
			end
			L6_40 = 0
			L7_41 = L1_35
			return L6_40, L7_41
		else
			L6_40 = error
			L7_41 = "number format error"
			L6_40(L7_41)
		end
	until true
end
function L8_8(A0_43)
	if type(A0_43) == "table" then
		if getmetatable(A0_43) == _ENV then
			return A0_43
		end
		if tonumber(A0_43[1]) and tonumber(A0_43[2]) then
			({})[1] = tonumber(A0_43[1])
			;({})[2] = tonumber(A0_43[2])
			return setmetatable({}, _ENV)
		end
		return
	end
	local L1_44 = L1_44
	L1_44 = L1_44(A0_43)
	if L1_44 then
		({})[1] = L1_44
		;({})[2] = 0
		return setmetatable({}, _ENV)
	end
	if type(A0_43) == "string" then
		local L2_45 = L2_45
		local L2_45, L3_46 = L2_45(A0_43)
		local L4_47 = L4_47
		local L5_48 = L5_48
		L5_48[1] = L2_45
		local L5_48[2], L7_50 = L3_46, L7_50
		L7_50 = _ENV
		return L4_47(L5_48, L7_50)
	end
end
L0_0.to = L8_8
L8_8 = setmetatable
L9_9 = L0_0
L10_10 = {}
function L10_10.__call(A0_51, A1_52)
	do return _ENV.to(A1_52) end
	local L3_53 = L3_53
end
L8_8(L9_9, L10_10)
function L8_8(...)
	local L2_54 = L2_54
	;({})[1] = ...
	do return L2_54({}, _ENV) end
	local L3_55 = L3_55
end
L0_0.new = L8_8
function L8_8(A0_56)
	local L1_57 = L1_57
	local L1_57, L2_58 = L1_57(A0_56), L2_58
	L2_58 = _ENV
	if L1_57 == L2_58 then
		L1_57 = "complex"
		return L1_57
	end
end
L0_0.type = L8_8
function L8_8(A0_59, A1_60)
	local L2_61 = L2_61
	local L3_62 = L3_62
	local L6_65 = L6_65
	L3_62[1] = L6_65
	L3_62[2] = A0_59 * math.sin(A1_60)
	L6_65 = _ENV
	return L2_61(L3_62, L6_65)
end
L0_0.convpolar = L8_8
function L8_8(A0_66, A1_67)
	A1_67 = A1_67 / 180 * math.pi
	local L2_68 = L2_68
	local L3_69 = L3_69
	local L6_72 = L6_72
	L3_69[1] = L6_72
	L3_69[2] = A0_66 * math.sin(A1_67)
	L6_72 = _ENV
	return L2_68(L3_69, L6_72)
end
L0_0.convpolardeg = L8_8
function L8_8(A0_73, A1_74)
	local L2_75, L3_76
	L2_75 = A0_73[1]
	L3_76 = A0_73[2]
	if A1_74 then
		if L3_76 == 0 then
			return string.format(A1_74, L2_75)
		elseif L2_75 == 0 then
			return string.format(A1_74, L3_76) .. "i"
		elseif 0 < L3_76 then
			return string.format(A1_74, L2_75) .. "+" .. string.format(A1_74, L3_76) .. "i"
		end
		return string.format(A1_74, L2_75) .. string.format(A1_74, L3_76) .. "i"
	end
	if L3_76 == 0 then
		return L2_75
	elseif L2_75 == 0 then
		if (L3_76 ~= 1 or not "") and (L3_76 ~= -1 or not "-") then
		end
		return L3_76 .. "i"
	elseif 0 < L3_76 then
		if L3_76 ~= 1 or not "" then
		end
		return L2_75 .. "+" .. L3_76 .. "i"
	end
	local L4_77 = L4_77
	if L3_76 ~= -1 or not "-" then
	end
	local L5_78 = L5_78
	local L4_77, L6_79 = L4_77 .. L5_78 .. "i", L6_79
	return L4_77
end
L0_0.tostring = L8_8
function L8_8(...)
	local L1_80, L2_81, L3_82
	L1_80 = print
	L2_81 = _ENV
	L2_81 = L2_81.tostring
	L3_82 = ...
	L2_81, L3_82 = L2_81(L3_82)
	L1_80(L2_81, L3_82)
end
L0_0.print = L8_8
function L8_8(A0_83)
	local L1_84 = L1_84
	L1_84 = L1_84(A0_83[1] ^ 2 + A0_83[2] ^ 2)
	local L2_85 = L2_85
	local L3_86 = L3_86
	local L2_85, L3_86, L4_87 = L2_85(L3_86, A0_83[1])
	return L1_84, L2_85, L3_86, L4_87
end
L0_0.polar = L8_8
function L8_8(A0_88)
	local L1_89 = L1_89
	L1_89 = L1_89(A0_88[1] ^ 2 + A0_88[2] ^ 2)
	local L2_90 = L2_90
	local L3_91 = L3_91
	local L2_90, L4_92 = L2_90(L3_91, A0_88[1]), L4_92
	L3_91 = math
	L3_91 = L3_91.pi
	L2_90 = L2_90 / L3_91
	L2_90 = L2_90 * 180
	return L1_89, L2_90
end
L0_0.polardeg = L8_8
function L8_8(A0_93)
	local L1_94, L2_95
	L1_94 = A0_93[1]
	L1_94 = L1_94 ^ 2
	L2_95 = A0_93[2]
	L2_95 = L2_95 ^ 2
	L1_94 = L1_94 + L2_95
	return L1_94
end
L0_0.norm2 = L8_8
function L8_8(A0_96)
	local L3_98 = L3_98
	return L3_98(A0_96[1] ^ 2 + A0_96[2] ^ 2)
end
L0_0.abs = L8_8
function L8_8(A0_99)
	local L1_100, L2_101
	L1_100 = A0_99[1]
	L2_101 = A0_99[2]
	return L1_100, L2_101
end
L0_0.get = L8_8
function L8_8(A0_102, A1_103, A2_104)
	A0_102[1], A0_102[2] = A1_103, A2_104
end
L0_0.set = L8_8
function L8_8(A0_105, A1_106, A2_107)
	local L3_108
	L3_108 = A0_105[1]
	if L3_108 == A1_106 then
		L3_108 = A0_105[2]
		if L3_108 == A2_107 then
			L3_108 = true
			return L3_108
		end
	end
	L3_108 = false
	return L3_108
end
L0_0.is = L8_8
function L8_8(A0_109)
	local L1_110 = L1_110
	local L2_111 = L2_111
	L2_111[1] = A0_109[1]
	local L2_111[2], L4_113 = A0_109[2], L4_113
	L4_113 = _ENV
	return L1_110(L2_111, L4_113)
end
L0_0.copy = L8_8
function L8_8(A0_114, A1_115)
	local L2_116 = L2_116
	local L3_117 = L3_117
	local L6_120 = L6_120
	L3_117[1] = L6_120
	L3_117[2] = A0_114[2] + A1_115[2]
	L6_120 = _ENV
	return L2_116(L3_117, L6_120)
end
L0_0.add = L8_8
function L8_8(A0_121, A1_122)
	local L2_123 = L2_123
	local L3_124 = L3_124
	local L6_127 = L6_127
	L3_124[1] = L6_127
	L3_124[2] = A0_121[2] - A1_122[2]
	L6_127 = _ENV
	return L2_123(L3_124, L6_127)
end
L0_0.sub = L8_8
function L8_8(A0_128, A1_129)
	local L2_130 = L2_130
	local L3_131 = L3_131
	local L7_135 = L7_135
	L3_131[1] = L7_135
	L3_131[2] = A0_128[1] * A1_129[2] + A0_128[2] * A1_129[1]
	L7_135 = _ENV
	return L2_130(L3_131, L7_135)
end
L0_0.mul = L8_8
function L8_8(A0_136, A1_137)
	local L2_138 = L2_138
	local L3_139 = L3_139
	L3_139[1] = A0_136[1] * A1_137
	local L3_139[2], L5_141 = A0_136[2] * A1_137, L5_141
	L5_141 = _ENV
	return L2_138(L3_139, L5_141)
end
L0_0.mulnum = L8_8
function L8_8(A0_142, A1_143)
	local L2_144
	L2_144 = A1_143[1]
	L2_144 = L2_144 ^ 2
	L2_144 = L2_144 + A1_143[2] ^ 2
	local L3_145 = L3_145
	local L4_146 = L4_146
	local L8_150 = L8_150
	L4_146[1] = L8_150
	L4_146[2] = (A0_142[2] * A1_143[1] - A0_142[1] * A1_143[2]) / L2_144
	L8_150 = _ENV
	return L3_145(L4_146, L8_150)
end
L0_0.div = L8_8
function L8_8(A0_151, A1_152)
	local L2_153 = L2_153
	local L3_154 = L3_154
	L3_154[1] = A0_151[1] / A1_152
	local L3_154[2], L5_156 = A0_151[2] / A1_152, L5_156
	L5_156 = _ENV
	return L2_153(L3_154, L5_156)
end
L0_0.divnum = L8_8
function L8_8(A0_157, A1_158)
	if math.floor(A1_158) == A1_158 then
		if A1_158 < 0 then
			A0_157, ({})[1] = {}, A0_157[1] / (A0_157[1] ^ 2 + A0_157[2] ^ 2)
			A0_157, ({})[2] = {}, -A0_157[2] / (A0_157[1] ^ 2 + A0_157[2] ^ 2)
			A1_158 = -A1_158
		end
		_FOR_ = 1
		for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
			local L9_166 = L9_166
			local L10_167 = A0_157[1] * A0_157[2] + A0_157[2] * A0_157[1]
			L9_166 = A0_157[1] * A0_157[1] - A0_157[2] * A0_157[2]
		end
		;({})[1] = L9_166
		;({})[2] = L10_167
		return setmetatable({}, _ENV)
	end
	L9_166 = math
	L9_166 = L9_166.sqrt
	L10_167 = A0_157[1]
	L10_167 = L10_167 ^ 2
	L10_167 = L10_167 + A0_157[2] ^ 2
	L9_166 = L9_166(L10_167)
	L9_166 = L9_166 ^ A1_158
	L10_167 = math
	L10_167 = L10_167.atan2
	L10_167 = L10_167(A0_157[2], A0_157[1])
	L10_167 = L10_167 * A1_158
	local L4_161 = L4_161
	local L5_162 = L5_162
	local L8_165 = L8_165
	L5_162[1] = L8_165
	L5_162[2] = L9_166 * math.sin(L10_167)
	L8_165 = _ENV
	return L4_161(L5_162, L8_165)
end
L0_0.pow = L8_8
function L8_8(A0_168)
	local L1_169 = L1_169
	local L1_169, L2_170 = L1_169(A0_168[1] ^ 2 + A0_168[2] ^ 2), L2_170
	L2_170 = A0_168[2]
	if L2_170 < 0 then
		L2_170 = -1
		if L2_170 then
			goto lbl_16
		end
	end
	L2_170 = 1
	::lbl_16::
	local L3_171 = L3_171
	local L4_172 = L4_172
	local L7_175 = L7_175
	L4_172[1] = L7_175
	L4_172[2] = L2_170 * math.sqrt((L1_169 - A0_168[1]) / 2)
	L7_175 = _ENV
	return L3_171(L4_172, L7_175)
end
L0_0.sqrt = L8_8
function L8_8(A0_176)
	local L1_177 = L1_177
	local L2_178 = L2_178
	local L4_180 = L4_180
	local L5_181 = L5_181
	local L5_181, L6_182 = L5_181(A0_176[2], A0_176[1])
	L2_178[1] = L4_180
	L2_178[2] = L5_181
	L2_178[3] = L6_182
	L2_178[4] = L5_181(A0_176[2], A0_176[1])
	L4_180 = _ENV
	return L1_177(L2_178, L4_180)
end
L0_0.ln = L8_8
function L8_8(A0_183)
	local L1_184 = L1_184
	L1_184 = L1_184(A0_183[1])
	local L2_185 = L2_185
	local L3_186 = L3_186
	local L6_189 = L6_189
	L3_186[1] = L6_189
	L3_186[2] = L1_184 * math.sin(A0_183[2])
	L6_189 = _ENV
	return L2_185(L3_186, L6_189)
end
L0_0.exp = L8_8
function L8_8(A0_190)
	local L1_191 = L1_191
	local L2_192 = L2_192
	local L4_194 = L4_194
	L2_192[1] = L4_194
	L2_192[2] = -A0_190[2]
	L4_194 = _ENV
	return L1_191(L2_192, L4_194)
end
L0_0.conjugate = L8_8
function L8_8(A0_195, A1_196)
	local L2_197
	L2_197 = A1_196 or nil
	if not A1_196 then
		L2_197 = 0
	end
	L2_197 = 10 ^ L2_197
	local L3_198 = L3_198
	local L4_199 = L4_199
	local L7_202 = L7_202
	L4_199[1] = L7_202
	L4_199[2] = math.floor(A0_195[2] * L2_197 + 0.5) / L2_197
	L7_202 = _ENV
	return L3_198(L4_199, L7_202)
end
L0_0.round = L8_8
L8_8 = L0_0.new
L9_9 = 0
L10_10 = 0
L8_8 = L8_8(L9_9, L10_10)
L0_0.zero = L8_8
L8_8 = L0_0.new
L9_9 = 1
L10_10 = 0
L8_8 = L8_8(L9_9, L10_10)
L0_0.one = L8_8
function L8_8(A0_203, A1_204)
	local L2_205 = L2_205
	L2_205 = L2_205(A0_203)
	local L3_206 = L3_206
	L3_206 = L3_206(A1_204)
	local L4_207 = L4_207
	local L5_208 = L5_208
	do return L4_207(L5_208, L3_206) end
	local L6_209 = L6_209
end
L1_1.__add = L8_8
function L8_8(A0_210, A1_211)
	local L2_212 = L2_212
	L2_212 = L2_212(A0_210)
	local L3_213 = L3_213
	L3_213 = L3_213(A1_211)
	local L4_214 = L4_214
	local L5_215 = L5_215
	do return L4_214(L5_215, L3_213) end
	local L6_216 = L6_216
end
L1_1.__sub = L8_8
function L8_8(A0_217, A1_218)
	local L2_219 = L2_219
	L2_219 = L2_219(A0_217)
	local L3_220 = L3_220
	L3_220 = L3_220(A1_218)
	local L4_221 = L4_221
	local L5_222 = L5_222
	do return L4_221(L5_222, L3_220) end
	local L6_223 = L6_223
end
L1_1.__mul = L8_8
function L8_8(A0_224, A1_225)
	local L2_226 = L2_226
	L2_226 = L2_226(A0_224)
	local L3_227 = L3_227
	L3_227 = L3_227(A1_225)
	local L4_228 = L4_228
	local L5_229 = L5_229
	do return L4_228(L5_229, L3_227) end
	local L6_230 = L6_230
end
L1_1.__div = L8_8
function L8_8(A0_231, A1_232)
	if A1_232 == "*" then
		return _ENV.conjugate(A0_231)
	end
	local L2_233 = L2_233
	local L3_234 = L3_234
	return L2_233(L3_234, A1_232)
end
L1_1.__pow = L8_8
function L8_8(A0_235)
	local L1_236 = L1_236
	local L2_237 = L2_237
	local L4_239 = L4_239
	L2_237[1] = L4_239
	L2_237[2] = -A0_235[2]
	L4_239 = _ENV
	return L1_236(L2_237, L4_239)
end
L1_1.__unm = L8_8
function L8_8(A0_240, A1_241)
	local L2_242, L3_243
	L2_242 = A0_240[1]
	L3_243 = A1_241[1]
	if L2_242 == L3_243 then
		L2_242 = A0_240[2]
		L3_243 = A1_241[2]
		if L2_242 == L3_243 then
			L2_242 = true
			return L2_242
		end
	end
	L2_242 = false
	return L2_242
end
L1_1.__eq = L8_8
function L8_8(A0_244)
	local L2_245 = L2_245
	local L3_246 = _ENV.tostring(A0_244)
	return L2_245(L3_246, _ENV.tostring(A0_244))
end
L1_1.__tostring = L8_8
function L8_8(A0_247, A1_248)
	local L2_249 = L2_249
	local L4_251 = tostring(A1_248)
	L2_249 = L2_249 .. L4_251
	return L2_249
end
L1_1.__concat = L8_8
function L8_8(...)
	local L1_252, L2_253, L3_254
	L1_252 = print
	L2_253 = _ENV
	L2_253 = L2_253.tostring
	L3_254 = ...
	L2_253, L3_254 = L2_253(L3_254)
	L1_252(L2_253, L3_254)
end
L1_1.__call = L8_8
L8_8 = {}
L1_1.__index = L8_8
L8_8 = pairs
L9_9 = L0_0
L8_8, L9_9, L10_10 = L8_8(L9_9)
for _FORV_8_, _FORV_9_ in L8_8, L9_9, L10_10 do
	L1_1.__index[_FORV_8_] = _FORV_9_
end
return L0_0
