local L0_0, L1_1
L0_0 = {}
local L0_0._TYPE, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14 = "module", L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14
L0_0._NAME = "matrix"
L0_0._VERSION = "0.2.10.20111203"
L1_1 = {}
function L5_5(A0_21, A1_22, A2_23, A3_24)
	local L13_34 = L13_34
	L13_34 = L13_34(A1_22)
	if L13_34 == "table" then
		L13_34 = type
		L13_34 = L13_34(A1_22[1])
		if L13_34 ~= "table" then
			L13_34 = setmetatable
			;({})[1] = A1_22[1]
			;({})[1] = A1_22[2]
			;({})[1] = A1_22[3]
			;({})[1] = {}
			;({})[2] = {}
			;({})[3] = {}
			return L13_34({}, _ENV)
		end
		L13_34 = setmetatable
		local L5_26 = L5_26
		return L13_34(L5_26, _ENV)
	end
	L13_34 = {}
	L5_26 = A3_24 or L5_26
	if not A3_24 then
		L5_26 = 0
	end
	if A2_23 == "I" then
		_FOR_ = 1
		for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
			L13_34[_FORV_9_] = {}
			_FOR_ = 1
			for _FORV_13_ = _FOR_, _FOR_, _FOR_ do
				if _FORV_9_ == _FORV_13_ then
					L13_34[_FORV_9_][_FORV_13_] = 1
				else
					L13_34[_FORV_9_][_FORV_13_] = 0
				end
			end
		end
	else
		_FOR_ = 1
		for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
			L13_34[_FORV_9_] = {}
			_FOR_ = 1
			for _FORV_13_ = _FOR_, _FOR_, _FOR_ do
				L13_34[_FORV_9_][_FORV_13_] = L5_26
			end
		end
	end
	L10_31 = setmetatable
	L11_32 = L13_34
	L12_33 = _ENV
	return L10_31(L11_32, L12_33)
end
L0_0.new = L5_5
L5_5 = setmetatable
L6_6 = L0_0
L7_7 = {}
function L8_8(...)
	local L1_36
	L1_36 = _ENV
	L1_36 = L1_36.new
	return L1_36(...)
end
L7_7.__call = L8_8
L5_5(L6_6, L7_7)
function L5_5(A0_37, A1_38)
	local L2_39
	L2_39 = {}
	L6_43 = 1
	L11_48 = #A0_37
	_FOR_ = 1
	for _FORV_6_ = L6_43, L11_48, _FOR_ do
		L2_39[_FORV_6_] = {}
		_FOR_ = 1
		for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
			local L13_50 = L13_50
			L13_50[_FORV_11_] = A0_37[_FORV_6_][_FORV_11_] + A1_38[_FORV_6_][_FORV_11_]
		end
	end
	L6_43 = setmetatable
	L11_48 = L2_39
	L9_46 = _ENV
	return L6_43(L11_48, L9_46)
end
L0_0.add = L5_5
function L5_5(A0_51, A1_52)
	local L2_53
	L2_53 = {}
	L6_57 = 1
	L11_62 = #A0_51
	_FOR_ = 1
	for _FORV_6_ = L6_57, L11_62, _FOR_ do
		L2_53[_FORV_6_] = {}
		_FOR_ = 1
		for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
			local L13_64 = L13_64
			L13_64[_FORV_11_] = A0_51[_FORV_6_][_FORV_11_] - A1_52[_FORV_6_][_FORV_11_]
		end
	end
	L6_57 = setmetatable
	L11_62 = L2_53
	L9_60 = _ENV
	return L6_57(L11_62, L9_60)
end
L0_0.sub = L5_5
function L5_5(A0_65, A1_66)
	local L2_67
	L2_67 = {}
	L6_71 = 1
	L10_75 = #A0_65
	L15_80 = 1
	for _FORV_6_ = L6_71, L10_75, L15_80 do
		L2_67[_FORV_6_] = {}
		_FOR_ = 1
		for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
			_FOR_ = 1
			for _FORV_15_ = _FOR_, _FOR_, _FOR_ do
			end
			L2_67[_FORV_6_][_FORV_10_] = A0_65[_FORV_6_][1] * A1_66[1][_FORV_10_] + A0_65[_FORV_6_][_FORV_15_] * A1_66[_FORV_15_][_FORV_10_]
		end
	end
	L6_71 = setmetatable
	L10_75 = L2_67
	L15_80 = _ENV
	return L6_71(L10_75, L15_80)
end
L0_0.mul = L5_5
function L5_5(A0_83, A1_84)
	local L2_85
	A1_84, L2_85 = _ENV.invert(A1_84)
	if not A1_84 then
		return A1_84, L2_85
	end
	local L3_86 = L3_86
	local L4_87 = L4_87
	do return L3_86(L4_87, A1_84) end
	local L5_88 = L5_88
end
L0_0.div = L5_5
function L5_5(A0_89, A1_90)
	local L2_91
	L2_91 = {}
	L6_95 = 1
	L10_99 = #A0_89
	_FOR_ = 1
	for _FORV_6_ = L6_95, L10_99, _FOR_ do
		L2_91[_FORV_6_] = {}
		_FOR_ = 1
		for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
			L2_91[_FORV_6_][_FORV_10_] = A0_89[_FORV_6_][_FORV_10_] * A1_90
		end
	end
	L6_95 = setmetatable
	L10_99 = L2_91
	L8_97 = _ENV
	return L6_95(L10_99, L8_97)
end
L0_0.mulnum = L5_5
function L5_5(A0_102, A1_103)
	local L2_104
	L2_104 = {}
	L6_108 = 1
	L11_113 = #A0_102
	_FOR_ = 1
	for _FORV_6_ = L6_108, L11_113, _FOR_ do
		L2_104[_FORV_6_] = {}
		_FOR_ = 1
		for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
			local ({})[_FORV_11_], L12_114 = A0_102[_FORV_6_][_FORV_11_] / A1_103, L12_114
		end
	end
	L6_108 = setmetatable
	L11_113 = L2_104
	L9_111 = _ENV
	return L6_108(L11_113, L9_111)
end
L0_0.divnum = L5_5
function L5_5(A0_115, A1_116)
	assert(A1_116 == math.floor(A1_116), "exponent not an integer")
	if A1_116 == 0 then
		do return _ENV:new(#A0_115, "I") end
		local L5_120 = L5_120
	end
	if A1_116 < 0 then
		L5_120 = nil
		A0_115, L5_120 = _ENV.invert(A0_115)
		if not A0_115 then
			return A0_115, L5_120
		end
		A1_116 = -A1_116
	end
	L5_120 = _ENV
	L5_120 = L5_120.copy
	L5_120 = L5_120(A0_115)
	L3_118 = 2
	_FOR_ = 1
	for _FORV_6_ = L3_118, _FOR_, _FOR_ do
		L5_120 = _ENV.mul(L5_120, A0_115)
	end
	return L5_120
end
L0_0.pow = L5_5
function L5_5(A0_121)
	return A0_121 * A0_121
end
function L6_6(A0_122)
	local L1_123, L7_129, L8_130, L9_131, L10_132, L11_133 = L1_123, #A0_122, L8_130, L9_131, L10_132, L11_133
	L8_130 = A0_122[1]
	L8_130 = #L8_130
	L7_129 = L7_129 == L8_130
	L8_130 = "matrix not square"
	L1_123(L7_129, L8_130)
	L1_123 = #A0_122
	if L1_123 == 1 then
		L7_129 = A0_122[1]
		L7_129 = L7_129[1]
		return L7_129
	end
	if L1_123 == 2 then
		L7_129 = A0_122[1]
		L7_129 = L7_129[1]
		L8_130 = A0_122[2]
		L8_130 = L8_130[2]
		L7_129 = L7_129 * L8_130
		L8_130 = A0_122[2]
		L8_130 = L8_130[1]
		L9_131 = A0_122[1]
		L9_131 = L9_131[2]
		L8_130 = L8_130 * L9_131
		L7_129 = L7_129 - L8_130
		return L7_129
	end
	if L1_123 == 3 then
		L7_129 = A0_122[1]
		L7_129 = L7_129[1]
		L8_130 = A0_122[2]
		L8_130 = L8_130[2]
		L7_129 = L7_129 * L8_130
		L8_130 = A0_122[3]
		L8_130 = L8_130[3]
		L7_129 = L7_129 * L8_130
		L8_130 = A0_122[1]
		L8_130 = L8_130[2]
		L9_131 = A0_122[2]
		L9_131 = L9_131[3]
		L8_130 = L8_130 * L9_131
		L9_131 = A0_122[3]
		L9_131 = L9_131[1]
		L8_130 = L8_130 * L9_131
		L7_129 = L7_129 + L8_130
		L8_130 = A0_122[1]
		L8_130 = L8_130[3]
		L9_131 = A0_122[2]
		L9_131 = L9_131[1]
		L8_130 = L8_130 * L9_131
		L9_131 = A0_122[3]
		L9_131 = L9_131[2]
		L8_130 = L8_130 * L9_131
		L7_129 = L7_129 + L8_130
		L8_130 = A0_122[1]
		L8_130 = L8_130[3]
		L9_131 = A0_122[2]
		L9_131 = L9_131[2]
		L8_130 = L8_130 * L9_131
		L9_131 = A0_122[3]
		L9_131 = L9_131[1]
		L8_130 = L8_130 * L9_131
		L7_129 = L7_129 - L8_130
		L8_130 = A0_122[1]
		L8_130 = L8_130[1]
		L9_131 = A0_122[2]
		L9_131 = L9_131[3]
		L8_130 = L8_130 * L9_131
		L9_131 = A0_122[3]
		L9_131 = L9_131[2]
		L8_130 = L8_130 * L9_131
		L7_129 = L7_129 - L8_130
		L8_130 = A0_122[1]
		L8_130 = L8_130[2]
		L9_131 = A0_122[2]
		L9_131 = L9_131[1]
		L8_130 = L8_130 * L9_131
		L9_131 = A0_122[3]
		L9_131 = L9_131[3]
		L8_130 = L8_130 * L9_131
		L7_129 = L7_129 - L8_130
		return L7_129
	end
	L7_129 = A0_122[1]
	L7_129 = L7_129[1]
	L8_130 = type
	L9_131 = L7_129
	L8_130 = L8_130(L9_131)
	if L8_130 == "table" then
		L8_130 = L7_129.zero
		if L8_130 then
			goto lbl_98
		end
	end
	L8_130 = 0
	::lbl_98::
	L9_131 = type
	L10_132 = L7_129
	L9_131 = L9_131(L10_132)
	if L9_131 == "table" then
		L9_131 = L7_129.norm2
		if L9_131 then
			goto lbl_107
		end
	end
	L9_131 = _ENV
	::lbl_107::
	L10_132 = L0_0
	L10_132 = L10_132.copy
	L11_133 = A0_122
	L10_132 = L10_132(L11_133)
	L11_133 = 1
	L12_134 = 1
	L13_135 = L10_132[1]
	L13_135 = #L13_135
	L17_139 = 1
	for _FORV_10_ = L12_134, L13_135, L17_139 do
		_FOR_ = 1
		for _FORV_17_ = _FOR_, _FOR_, _FOR_ do
			if not nil then
				if L10_132[_FORV_17_][_FORV_10_] ~= L8_130 then
				end
			elseif L10_132[_FORV_17_][_FORV_10_] ~= L8_130 then
				if math.abs(L9_131(L10_132[_FORV_17_][_FORV_10_]) - 1) < math.abs(L9_131(L10_132[_FORV_17_][_FORV_10_]) - 1) then
				end
			end
		end
		if L10_132[_FORV_17_][_FORV_10_] then
			if _FORV_17_ ~= #L10_132 then
				L10_132[#L10_132], L10_132[_FORV_17_] = L10_132[_FORV_17_], L10_132[#L10_132]
				L11_133 = -L11_133
			end
			_FOR_ = 1
			for _FORV_17_ = _FOR_, _FOR_, _FOR_ do
				if L10_132[_FORV_17_][_FORV_10_] ~= L8_130 then
					local L19_141 = L19_141
					local L20_142 = L20_142
					_FOR_ = 1
					local L21_143 = L21_143
					for _FORV_22_ = _FOR_, _FOR_, _FOR_ do
						L10_132[_FORV_17_][_FORV_22_] = L10_132[_FORV_17_][_FORV_22_] - L10_132[_FORV_17_][_FORV_10_] / L10_132[_FORV_17_][_FORV_10_] * L10_132[L19_141][_FORV_22_]
					end
				end
			end
			L25_147 = math
			L25_147 = L25_147.fmod
			L25_147 = L25_147(L19_141, 2)
			if L25_147 == 0 then
				L11_133 = -L11_133
			end
			L11_133 = L11_133 * L20_142
			L25_147 = table
			L25_147 = L25_147.remove
			L25_147(L10_132)
			repeat
				do break end -- pseudo-goto
				L25_147 = L11_133 * 0
				return L25_147
			until true
		end
	end
	return L11_133
end
L0_0.det = L6_6
function L6_6(A0_148, A1_149, A2_150, A3_151, A4_152, A5_153)
	local L6_154, L7_155, L8_156, L9_157, L10_158, L11_159
	L6_154 = A0_148[A1_149]
	L6_154 = L6_154[A2_150]
	if L6_154 == A4_152 then
		L6_154 = true
		return L6_154
	end
	L6_154 = nil
	L7_155 = A1_149
	L8_156 = #A0_148
	L9_157 = 1
	for L10_158 = L7_155, L8_156, L9_157 do
		L11_159 = A0_148[L10_158]
		L11_159 = L11_159[A2_150]
		if L11_159 == A4_152 then
			break
		end
		if not L6_154 then
			if L11_159 ~= A3_151 then
				L6_154 = L10_158
			end
		elseif L11_159 ~= A3_151 then
			local L12_160 = L12_160
			L12_160 = L12_160(A5_153(L11_159) - 1)
			local L13_161 = L13_161
			local L15_163 = A5_153(A0_148[L6_154][A2_150])
			L15_163 = L15_163 - 1
			L13_161 = L13_161(L15_163)
			if L12_160 < L13_161 then
				L6_154 = L10_158
			end
		end
	end
	if L6_154 then
		if L6_154 ~= A1_149 then
			L7_155 = A0_148[L6_154]
			L8_156 = A0_148[A1_149]
			A0_148[L6_154] = L8_156
			A0_148[A1_149] = L7_155
		end
		L7_155 = true
		return L7_155
	end
end
function L7_7(A0_164)
	if type(A0_164) == "table" then
		local L1_165 = L1_165
		local L1_165, L2_166 = L1_165(A0_164), L2_166
		if L1_165 then
			goto lbl_12
		end
	end
	L1_165 = A0_164
	::lbl_12::
	return L1_165
end
function L8_8(A0_167)
	local L1_168
	L1_168 = A0_167[1]
	local L1_168, L6_173, L7_174, L8_175, L9_176, L10_177 = L1_168[1], L6_173, L7_174, L8_175, L9_176, L10_177
	L6_173 = type
	L7_174 = L1_168
	L6_173 = L6_173(L7_174)
	if L6_173 == "table" then
		L6_173 = L1_168.zero
		if L6_173 then
			goto lbl_12
		end
	end
	L6_173 = 0
	::lbl_12::
	L7_174 = type
	L8_175 = L1_168
	L7_174 = L7_174(L8_175)
	if L7_174 == "table" then
		L7_174 = L1_168.one
		if L7_174 then
			goto lbl_21
		end
	end
	L7_174 = 1
	::lbl_21::
	L8_175 = type
	L9_176 = L1_168
	L8_175 = L8_175(L9_176)
	if L8_175 == "table" then
		L8_175 = L1_168.norm2
		if L8_175 then
			goto lbl_30
		end
	end
	L8_175 = _ENV
	::lbl_30::
	L9_176 = #A0_167
	L10_177 = A0_167[1]
	L10_177 = #L10_177
	_FOR_ = 1
	for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
		if L3_3(A0_167, _FORV_10_, _FORV_10_, L6_173, L7_174, L8_175) then
			_FOR_ = 1
			for _FORV_14_ = _FOR_, _FOR_, _FOR_ do
				if A0_167[_FORV_14_][_FORV_10_] ~= L6_173 then
					A0_167[_FORV_14_][_FORV_10_] = L4_4(L6_173)
					_FOR_ = 1
					for _FORV_19_ = _FOR_, _FOR_, _FOR_ do
						A0_167[_FORV_14_][_FORV_19_] = A0_167[_FORV_14_][_FORV_19_] - A0_167[_FORV_14_][_FORV_10_] / A0_167[_FORV_10_][_FORV_10_] * A0_167[_FORV_10_][_FORV_19_]
					end
				end
				repeat
					do break end -- pseudo-goto
					return false, _FORV_10_ - 1
				until true
			end
		end
	end
	L11_178 = L9_176
	L12_179 = 1
	L15_182 = -1
	for L20_187 = L11_178, L12_179, L15_182 do
		_FOR_ = 1
		for _FORV_15_ = _FOR_, _FOR_, _FOR_ do
			A0_167[L20_187][_FORV_15_] = A0_167[L20_187][_FORV_15_] / A0_167[L20_187][L20_187]
		end
		_FOR_ = -1
		for _FORV_15_ = _FOR_, _FOR_, _FOR_ do
			if A0_167[_FORV_15_][L20_187] ~= L6_173 then
				_FOR_ = 1
				for _FORV_20_ = _FOR_, _FOR_, _FOR_ do
					local L23_190 = L23_190
					A0_167[_FORV_15_][_FORV_20_] = A0_167[_FORV_15_][_FORV_20_] - A0_167[_FORV_15_][L20_187] * A0_167[L20_187][_FORV_20_]
				end
				A0_167[_FORV_15_][L20_187] = L4_4(L6_173)
			end
		end
		A0_167[L20_187][L20_187] = L4_4(L7_174)
	end
	L11_178 = true
	return L11_178
end
L0_0.dogauss = L8_8
function L8_8(A0_191)
	repeat
		local L12_203, L14_205 = L12_203, #A0_191
		L14_205 = L14_205 == #A0_191[1]
		L12_203(L14_205, "matrix not square")
		L12_203 = _ENV
		L12_203 = L12_203.copy
		L14_205 = A0_191
		L12_203 = L12_203(L14_205)
		L14_205 = setmetatable
		local L3_194 = L3_194
		L14_205 = L14_205(L3_194, L1_1)
		L3_194 = A0_191[1]
		L3_194 = L3_194[1]
		local L4_195 = L4_195
		L4_195 = L4_195(L3_194)
		if L4_195 == "table" then
			L4_195 = L3_194.zero
			if L4_195 then
				goto lbl_30
			end
		end
		L4_195 = 0
		::lbl_30::
		local L5_196 = L5_196
		L5_196 = L5_196(L3_194)
		if L5_196 == "table" then
			L5_196 = L3_194.one
			if L5_196 then
				goto lbl_39
			end
		end
		L5_196 = 1
		::lbl_39::
		_FOR_ = 1
		for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
			L14_205[_FORV_9_] = {}
			_FOR_ = 1
			for _FORV_14_ = _FOR_, _FOR_, _FOR_ do
				if _FORV_9_ ~= _FORV_14_ or not L5_196 then
				end
				;({})[_FORV_14_] = L4_4(L4_195)
			end
		end
		L16_207 = _ENV
		L16_207 = L16_207.concath
		L16_207 = L16_207(L12_203, L14_205)
		L12_203 = L16_207
		L16_207 = _ENV
		L16_207 = L16_207.dogauss
		local L16_207, L7_198 = L16_207(L12_203)
		if L16_207 then
			local L8_199 = L8_199
			local L9_200 = L9_200
			local L10_201 = L10_201
			local L11_202 = L11_202
			local L13_204 = L13_204
			do return L8_199(L9_200, L10_201, L11_202, L13_204, #L12_203[1]) end
			break -- pseudo-goto
		end
		L8_199 = nil
		L9_200 = L7_198
		return L8_199, L9_200
	until true
end
L0_0.invert = L8_8
function L8_8(A0_208, A1_209)
	local L2_210, L3_211
	L2_210 = 0
	local L3_211, L6_214 = A0_208[1], L6_214
	L3_211 = L3_211[1]
	L6_214 = type
	L7_215 = L3_211
	L6_214 = L6_214(L7_215)
	if L6_214 == "table" then
		L6_214 = L3_211.abs
		if L6_214 then
			goto lbl_14
		end
	end
	L6_214 = math
	L6_214 = L6_214.abs
	::lbl_14::
	L7_215 = 1
	L8_216 = #A0_208
	L9_217 = 1
	for L10_218 = L7_215, L8_216, L9_217 do
		L11_219 = 1
		L12_220 = A0_208[1]
		L12_220 = #L12_220
		_FOR_ = 1
		for _FORV_12_ = L11_219, L12_220, _FOR_ do
			L2_210 = L2_210 + L6_214(A0_208[L10_218][_FORV_12_] - A1_209[L10_218][_FORV_12_])
		end
	end
	L7_215 = #A0_208
	L7_215 = L7_215 * 2
	L7_215 = L2_210 / L7_215
	return L7_215
end
function L9_9(A0_224, A1_225)
	local L2_226, L5_229, L7_231 = L2_226, #A0_224, L7_231
	L7_231 = A0_224[1]
	L7_231 = #L7_231
	L5_229 = L5_229 == L7_231
	L7_231 = "matrix not square"
	L2_226(L5_229, L7_231)
	L2_226 = A1_225 or L2_226
	if not A1_225 then
		L2_226 = math
		L2_226 = L2_226.huge
	end
	L5_229 = _ENV
	L5_229 = L5_229.copy
	L7_231 = A0_224
	L5_229 = L5_229(L7_231)
	L7_231 = _ENV
	local L7_231, L6_230 = L7_231(#L5_229, "I"), L6_230
	L6_230 = math
	L6_230 = L6_230.huge
	_FOR_ = 1
	for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
		L5_229, L7_231 = _ENV.divnum(_ENV.add(L5_229, _ENV.invert(L7_231)), 2), _ENV.divnum(_ENV.add(L7_231, _ENV.invert(L5_229)), 2)
		if L2_226 == math.huge and L6_230 <= L8_8(L5_229, L5_229) then
			local L18_242 = L18_242
			local L17_241 = L17_241
			return L5_229, L7_231, L8_8(_ENV.mul(L5_229, L5_229), A0_224)
		end
		L6_230 = L8_8(L5_229, L5_229)
	end
	L12_236 = L5_229
	L13_237 = L7_231
	L14_238 = L8_8
	L15_239 = _ENV
	L15_239 = L15_239.mul
	L18_242 = L5_229
	L17_241 = L5_229
	L15_239 = L15_239(L18_242, L17_241)
	L18_242 = A0_224
	L14_238, L15_239, L18_242, L17_241 = L14_238(L15_239, L18_242)
	return L12_236, L13_237, L14_238, L15_239, L18_242, L17_241, L14_238(L15_239, L18_242)
end
L0_0.sqrt = L9_9
function L9_9(A0_243, A1_244, A2_245)
	local L3_246 = L3_246
	L3_246(#A0_243 == #A0_243[1], "matrix not square")
	L3_246 = A2_245 or L3_246
	if not A2_245 then
		L3_246 = math
		L3_246 = L3_246.huge
	end
	local L4_247 = L4_247
	local L4_247, L5_248 = L4_247(A0_243), L5_248
	L5_248 = _ENV
	L5_248 = L5_248.mul
	local L6_249 = L4_247:invert()
	L7_250, L8_251 = L7_250(L8_251, A1_244 - 1)
	L5_248 = L5_248(L6_249, L7_250, L8_251, L7_250(L8_251, A1_244 - 1))
	L6_249 = math
	L6_249 = L6_249.huge
	L7_250 = 1
	L8_251 = L3_246
	_FOR_ = 1
	for _FORV_10_ = L7_250, L8_251, _FOR_ do
		L4_247, L5_248 = L4_247:mulnum(A1_244 - 1):add(L5_248:invert()):divnum(A1_244), L5_248:mulnum(A1_244 - 1):add(L4_247:invert()):divnum(A1_244):mul(L5_248:invert():pow(A1_244 - 2)):mul(L5_248:mulnum(A1_244 - 1):add(L4_247:invert())):divnum(A1_244)
		if L3_246 == math.huge and L6_249 <= L8_8(L4_247, L4_247) then
			local L15_258 = L15_258
			local L16_259 = L16_259
			local L19_262 = L19_262
			local L18_261 = L18_261
			return L18_261, L5_248, L8_8(_ENV.pow(L15_258, A1_244), A0_243)
		end
		L6_249 = L19_262
	end
	L7_250 = L4_247
	L8_251 = L5_248
	L13_256 = L8_8
	L14_257 = _ENV
	L14_257 = L14_257.pow
	L15_258 = L4_247
	L16_259 = A1_244
	L14_257 = L14_257(L15_258, L16_259)
	L15_258 = A0_243
	L13_256, L14_257, L15_258, L16_259, L19_262, L18_261 = L13_256(L14_257, L15_258)
	return L7_250, L8_251, L13_256, L14_257, L15_258, L16_259, L19_262, L18_261, L13_256(L14_257, L15_258)
end
L0_0.root = L9_9
function L9_9(A0_263)
	local L6_269, L10_273 = _ENV.type, L10_273
	L10_273 = A0_263
	L6_269 = L6_269(L10_273)
	L10_273 = 0
	_FOR_ = 1
	for _FORV_6_ = _FOR_, _FOR_, _FOR_ do
		_FOR_ = 1
		for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
			if L6_269 ~= "number" then
			end
			L10_273 = L10_273 + A0_263[_FORV_6_][_FORV_10_]:abs() ^ 2
		end
	end
	L7_270 = type
	L8_271 = L10_273
	L7_270 = L7_270(L8_271)
	if L7_270 == "number" then
		L7_270 = math
		L7_270 = L7_270.sqrt
		if L7_270 then
			goto lbl_36
		end
	end
	L7_270 = L10_273.sqrt
	::lbl_36::
	L8_271 = L7_270
	L9_272 = L10_273
	return L8_271(L9_272)
end
L0_0.normf = L9_9
function L9_9(A0_277)
	local L3_280, L4_281 = _ENV.type, L4_281
	L4_281 = A0_277
	L3_280 = L3_280(L4_281)
	if L3_280 == "number" then
		L3_280 = math
		L3_280 = L3_280.abs
		if L3_280 then
			goto lbl_14
		end
	end
	L3_280 = A0_277[1]
	L3_280 = L3_280[1]
	L3_280 = L3_280.abs
	::lbl_14::
	L4_281 = 0
	L5_282 = 1
	L6_283 = #A0_277
	L7_284 = 1
	for L8_285 = L5_282, L6_283, L7_284 do
		L9_286 = 1
		L10_287 = A0_277[1]
		L10_287 = #L10_287
		_FOR_ = 1
		for _FORV_10_ = L9_286, L10_287, _FOR_ do
			if L4_281 < L3_280(A0_277[L8_285][_FORV_10_]) then
				L4_281 = L3_280(A0_277[L8_285][_FORV_10_])
			end
		end
	end
	return L4_281
end
L0_0.normmax = L9_9
function L9_9(A0_290, A1_291)
	local L2_292 = L2_292
	local L2_292, L3_293 = L2_292(A0_290 * A1_291 + 0.5), L3_293
	L2_292 = L2_292 / A1_291
	return L2_292
end
function L10_10(A0_294, A1_295)
	L4_298 = A0_294
	L2_296, L4_298, L5_299 = L2_296(L4_298)
	for L6_300, _FORV_6_ in L2_296, L4_298, L5_299 do
		local L8_302 = math.floor(_FORV_6_ * A1_295 + 0.5)
		L8_302 = L8_302 / A1_295
		A0_294[L6_300] = L8_302
	end
	return A0_294
end
function L11_11(A0_303, A1_304)
	local L2_305
	L2_305 = A1_304 or nil
	local L5_308 = L5_308
	if not A1_304 then
		L2_305 = 0
	end
	L2_305 = 10 ^ L2_305
	L5_308 = _ENV
	L5_308 = L5_308.type
	L6_309 = A0_303
	L5_308 = L5_308(L6_309)
	if L5_308 == "number" then
		L5_308 = L9_9
		if L5_308 then
			goto lbl_15
		end
	end
	L5_308 = L10_10
	::lbl_15::
	L6_309 = 1
	L7_310 = #A0_303
	L8_311 = 1
	for L9_312 = L6_309, L7_310, L8_311 do
		L10_313 = 1
		L11_314 = A0_303[1]
		L11_314 = #L11_314
		L12_315 = 1
		for _FORV_11_ = L10_313, L11_314, L12_315 do
			local L14_317 = L14_317
			local L15_318 = L5_308(A0_303[L9_312][_FORV_11_], L2_305)
			L14_317[_FORV_11_] = L15_318
		end
	end
	return A0_303
end
L0_0.round = L11_11
function L11_11(A0_319, A1_320, A2_321, A3_322)
	local L4_323 = L4_323
	local L5_324 = L5_324
	local L4_323, L6_325 = L4_323(L5_324, A2_321), L6_325
	L4_323 = L4_323 / A3_322
	return L4_323
end
function L12_12(A0_326, A1_327, A2_328, A3_329)
	L6_332 = A0_326
	L4_330, L6_332, _FOR_ = L4_330(L6_332)
	for _FORV_7_ in L4_330, L6_332, _FOR_ do
		local L10_335 = math.random(A1_327, A2_328)
		L10_335 = L10_335 / A3_329
		A0_326[_FORV_7_] = L10_335
	end
	return A0_326
end
function L13_13(A0_336, A1_337, A2_338, A3_339)
	local L4_340, L5_341, L6_342
	L4_340 = A1_337 or nil
	local L9_345 = L9_345
	if not A1_337 then
		L4_340 = -10
	end
	L5_341 = A2_338 or L5_341
	if not A2_338 then
		L5_341 = 10
	end
	L6_342 = A3_339 or L6_342
	if not A3_339 then
		L6_342 = 1
	end
	L9_345 = _ENV
	L9_345 = L9_345.type
	L10_346 = A0_336
	L9_345 = L9_345(L10_346)
	if L9_345 == "number" then
		L9_345 = L11_11
		if L9_345 then
			goto lbl_20
		end
	end
	L9_345 = L12_12
	::lbl_20::
	L10_346 = 1
	L11_347 = #A0_336
	L12_348 = 1
	for L13_349 = L10_346, L11_347, L12_348 do
		L14_350 = 1
		L15_351 = A0_336[1]
		L15_351 = #L15_351
		L16_352 = 1
		for _FORV_15_ = L14_350, L15_351, L16_352 do
			local L18_354 = L18_354
			local L19_355 = L19_355
			local L20_356 = L20_356
			local L19_355, L21_357 = L19_355(L20_356, L4_340, L5_341, L6_342), L21_357
			L18_354[_FORV_15_] = L19_355
		end
	end
	return A0_336
end
L0_0.random = L13_13
function L13_13(A0_358)
	local L1_359
	L1_359 = A0_358[1]
	L1_359 = L1_359[1]
	if type(L1_359) == "table" then
		if L1_359.type then
			do return L1_359:type() end
			local L2_360, L3_361 = L2_360, L3_361
		end
		L2_360 = "tensor"
		return L2_360
	end
	L2_360 = "number"
	return L2_360
end
L0_0.type = L13_13
function L13_13(A0_362)
	local L1_363
	return A0_362
end
function L14_14(A0_364)
	local L1_365
	L1_365 = setmetatable
	L1_365 = L1_365(L4_368, getmetatable(A0_364))
	L4_368 = ipairs
	L4_368, L3_367, _FOR_ = L4_368(A0_364)
	for _FORV_5_, _FORV_6_ in L4_368, L3_367, _FOR_ do
		L1_365[_FORV_5_] = _FORV_6_
	end
	return L1_365
end
function L0_0.copy(A0_369)
	local L6_375, L8_377 = _ENV.type, L8_377
	L8_377 = A0_369
	L6_375 = L6_375(L8_377)
	if L6_375 == "number" then
		L6_375 = L13_13
		if L6_375 then
			goto lbl_11
		end
	end
	L6_375 = L14_14
	::lbl_11::
	L8_377 = {}
	L10_379 = 1
	_FOR_ = 1
	for _FORV_6_ = L10_379, _FOR_, _FOR_ do
		L8_377[_FORV_6_] = {}
		_FOR_ = 1
		for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
			L8_377[_FORV_6_][_FORV_10_] = L6_375(A0_369[_FORV_6_][_FORV_10_])
		end
	end
	L10_379 = setmetatable
	L9_378 = L8_377
	L13_382 = L1_1
	return L10_379(L9_378, L13_382)
end
function L0_0.transpose(A0_383)
	local L6_389, L8_391 = _ENV.type, L8_391
	L8_391 = A0_383
	L6_389 = L6_389(L8_391)
	if L6_389 == "number" then
		L6_389 = L13_13
		if L6_389 then
			goto lbl_11
		end
	end
	L6_389 = L14_14
	::lbl_11::
	L8_391 = {}
	L10_393 = 1
	_FOR_ = 1
	for _FORV_6_ = L10_393, _FOR_, _FOR_ do
		L8_391[_FORV_6_] = {}
		_FOR_ = 1
		for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
			L8_391[_FORV_6_][_FORV_10_] = L6_389(A0_383[_FORV_10_][_FORV_6_])
		end
	end
	L10_393 = setmetatable
	L9_392 = L8_391
	L13_396 = L1_1
	return L10_393(L9_392, L13_396)
end
function L0_0.subm(A0_397, A1_398, A2_399, A3_400, A4_401)
	local L10_407, L15_412 = _ENV.type, L15_412
	L15_412 = A0_397
	L10_407 = L10_407(L15_412)
	if L10_407 == "number" then
		L10_407 = L13_13
		if L10_407 then
			goto lbl_11
		end
	end
	L10_407 = L14_14
	::lbl_11::
	L15_412 = {}
	_FOR_ = 1
	for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
		L15_412[_FORV_10_ - A1_398 + 1] = {}
		_FOR_ = 1
		for _FORV_15_ = _FOR_, _FOR_, _FOR_ do
			local L16_413 = L16_413
			L15_412[_FORV_10_ - A1_398 + 1][_FORV_15_ - A2_399 + 1] = L10_407(A0_397[_FORV_10_][_FORV_15_])
		end
	end
	L11_408 = setmetatable
	L12_409 = L15_412
	L13_410 = L1_1
	return L11_408(L12_409, L13_410)
end
function L0_0.concath(A0_417, A1_418)
	local L8_425, L12_429 = L8_425, #A0_417
	L12_429 = L12_429 == #A1_418
	L8_425(L12_429, "matrix size mismatch")
	L8_425 = _ENV
	L8_425 = L8_425.type
	L12_429 = A0_417
	L8_425 = L8_425(L12_429)
	if L8_425 == "number" then
		L8_425 = L13_13
		if L8_425 then
			goto lbl_20
		end
	end
	L8_425 = L14_14
	::lbl_20::
	L12_429 = {}
	_FOR_ = 1
	for _FORV_8_ = _FOR_, _FOR_, _FOR_ do
		L12_429[_FORV_8_] = {}
		_FOR_ = 1
		for _FORV_12_ = _FOR_, _FOR_, _FOR_ do
			L12_429[_FORV_8_][_FORV_12_] = L8_425(A0_417[_FORV_8_][_FORV_12_])
		end
		local L9_426 = L9_426
		_FOR_ = 1
		for _FORV_12_ = _FOR_, _FOR_, _FOR_ do
			L12_429[_FORV_8_][_FORV_12_ + L9_426] = L8_425(A1_418[_FORV_8_][_FORV_12_])
		end
	end
	L10_427 = setmetatable
	L11_428 = L12_429
	L14_431 = L1_1
	return L10_427(L11_428, L14_431)
end
function L0_0.concatv(A0_434, A1_435)
	assert(#A0_434[1] == #A1_435[1], "matrix size mismatch")
	local L4_438 = L4_438
	L4_438 = _ENV
	L4_438 = L4_438.type
	local L4_438, L3_437 = L4_438(A0_434), L3_437
	if L4_438 == "number" then
		L4_438 = L13_13
		if L4_438 then
			goto lbl_22
		end
	end
	L4_438 = L14_14
	::lbl_22::
	L3_437 = {}
	_FOR_ = 1
	for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
		L3_437[_FORV_7_] = {}
		_FOR_ = 1
		for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
			L3_437[_FORV_7_][_FORV_11_] = L4_438(A0_434[_FORV_7_][_FORV_11_])
		end
	end
	L8_442 = #L3_437
	L13_447 = 1
	_FOR_ = 1
	for _FORV_8_ = L13_447, _FOR_, _FOR_ do
		L3_437[_FORV_8_ + L8_442] = {}
		_FOR_ = 1
		for _FORV_13_ = _FOR_, _FOR_, _FOR_ do
			local L16_450 = L16_450
			L3_437[_FORV_8_ + L8_442][_FORV_13_] = L4_438(A1_435[_FORV_8_][_FORV_13_])
		end
	end
	L13_447 = setmetatable
	L10_444 = L3_437
	L11_445 = L1_1
	return L13_447(L10_444, L11_445)
end
function L0_0.rotl(A0_451)
	L5_456 = _ENV
	local L4_455, L5_456 = _ENV.new, L5_456
	L6_457 = A0_451[1]
	L6_457 = #L6_457
	L7_458 = #A0_451
	L4_455 = L4_455(L5_456, L6_457, L7_458)
	L5_456 = _ENV
	L5_456 = L5_456.type
	L6_457 = A0_451
	L5_456 = L5_456(L6_457)
	if L5_456 == "number" then
		L5_456 = L13_13
		if L5_456 then
			goto lbl_17
		end
	end
	L5_456 = L14_14
	::lbl_17::
	L6_457 = 1
	L7_458 = #A0_451
	L8_459 = 1
	for L9_460 = L6_457, L7_458, L8_459 do
		L10_461 = 1
		L11_462 = A0_451[1]
		L11_462 = #L11_462
		_FOR_ = 1
		for _FORV_10_ = L10_461, L11_462, _FOR_ do
			L4_455[#A0_451[1] - _FORV_10_ + 1][L9_460] = L5_456(A0_451[L9_460][_FORV_10_])
		end
	end
	return L4_455
end
function L0_0.rotr(A0_465)
	L5_470 = _ENV
	local L4_469, L5_470 = _ENV.new, L5_470
	L6_471 = A0_465[1]
	L6_471 = #L6_471
	L7_472 = #A0_465
	L4_469 = L4_469(L5_470, L6_471, L7_472)
	L5_470 = _ENV
	L5_470 = L5_470.type
	L6_471 = A0_465
	L5_470 = L5_470(L6_471)
	if L5_470 == "number" then
		L5_470 = L13_13
		if L5_470 then
			goto lbl_17
		end
	end
	L5_470 = L14_14
	::lbl_17::
	L6_471 = 1
	L7_472 = #A0_465
	L8_473 = 1
	for L9_474 = L6_471, L7_472, L8_473 do
		L10_475 = 1
		L11_476 = A0_465[1]
		L11_476 = #L11_476
		L12_477 = 1
		for _FORV_10_ = L10_475, L11_476, L12_477 do
			local L14_479 = L14_479
			L14_479[#A0_465 - L9_474 + 1] = L5_470(A0_465[L9_474][_FORV_10_])
		end
	end
	return L4_469
end
function L0_0.tostring(A0_480, A1_481)
	local L2_482
	L2_482 = {}
	local L9_489, L14_494 = _ENV, L14_494
	L9_489 = L9_489.type
	L14_494 = A0_480
	L9_489 = L9_489(L14_494)
	L14_494 = A0_480[1]
	L14_494 = L14_494[1]
	if L9_489 ~= "tensor" or not _UPVALUE1_ then
		local L5_485 = L5_485
		L5_485 = L5_485(L14_494)
		if L5_485 == "table" then
			L5_485 = L14_494.tostring
			if L5_485 then
				goto lbl_22
			end
		end
		L5_485 = _UPVALUE2_
	end
	::lbl_22::
	_FOR_ = 1
	for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
		_FOR_ = 1
		for _FORV_14_ = _FOR_, _FOR_, _FOR_ do
			({})[_FORV_14_] = L5_485(A0_480[_FORV_9_][_FORV_14_], A1_481)
		end
		L2_482[_FORV_9_] = table.concat({}, "\t")
	end
	L16_496 = table
	L16_496 = L16_496.concat
	L17_497 = L2_482
	L13_493 = "\n"
	return L16_496(L17_497, L13_493)
end
function L0_0.print(...)
	local L1_498, L2_499, L3_500
	L1_498 = print
	L2_499 = _ENV
	L2_499 = L2_499.tostring
	L3_500 = ...
	L2_499, L3_500 = L2_499(L3_500)
	L1_498(L2_499, L3_500)
end
function L0_0.latex(A0_501, A1_502)
	local L2_503
	L2_503 = A1_502 or nil
	local L8_509 = L8_509
	if not A1_502 then
		L2_503 = "c"
	end
	L8_509 = "$\\left( \\begin{array}{"
	L8_509 = L8_509 .. string.rep(L2_503, #A0_501[1]) .. "}\n"
	local L4_505 = L4_505
	L4_505 = L4_505(A0_501)
	if L4_505 == "tensor" then
		L4_505 = _UPVALUE1_
		if L4_505 then
			goto lbl_23
		end
	end
	L4_505 = _UPVALUE2_
	::lbl_23::
	_FOR_ = 1
	for _FORV_8_ = _FOR_, _FOR_, _FOR_ do
		L8_509 = L8_509 .. "\t" .. L4_505(A0_501[_FORV_8_][1])
		_FOR_ = 1
		for _FORV_12_ = _FOR_, _FOR_, _FOR_ do
			L8_509 = L8_509 .. " & " .. L4_505(A0_501[_FORV_8_][_FORV_12_])
		end
		L16_517 = #A0_501
		if _FORV_8_ == L16_517 then
			L16_517 = L8_509
			L8_509 = L16_517 .. "\n"
		else
			L16_517 = L8_509
			L8_509 = L16_517 .. " \\\\\n"
		end
	end
	L7_508 = L8_509
	L12_513 = "\\end{array} \\right)$"
	L7_508 = L7_508 .. L12_513
	return L7_508
end
function L0_0.rows(A0_518)
	return #A0_518
end
function L0_0.columns(A0_519)
	local L1_520
	L1_520 = A0_519[1]
	L1_520 = #L1_520
	return L1_520
end
function L0_0.size(A0_521)
	local L3_524 = _ENV.type
	local L3_524, L2_523 = L3_524(A0_521), L2_523
	if L3_524 == "tensor" then
		L3_524 = #A0_521
		L2_523 = A0_521[1]
		L2_523 = #L2_523
		return L3_524, L2_523, #A0_521[1][1]
	end
	L3_524 = #A0_521
	L2_523 = A0_521[1]
	L2_523 = #L2_523
	return L3_524, L2_523
end
function L0_0.getelement(A0_525, A1_526, A2_527)
	local L3_528
	L3_528 = A0_525[A1_526]
	if L3_528 then
		L3_528 = A0_525[A1_526]
		L3_528 = L3_528[A2_527]
		if L3_528 then
			L3_528 = A0_525[A1_526]
			L3_528 = L3_528[A2_527]
			return L3_528
		end
	end
end
function L0_0.setelement(A0_529, A1_530, A2_531, A3_532)
	local L4_533 = L4_533
	local L5_534 = L5_534
	local L6_535 = L6_535
	local L4_533, L7_536 = L4_533(L5_534, L6_535, A2_531), L7_536
	if L4_533 then
		L4_533 = A0_529[A1_530]
		L4_533[A2_531] = A3_532
		L4_533 = 1
		return L4_533
	end
end
function L0_0.ipairs(A0_537)
	local L1_538, L2_539, L3_540, L4_541, L5_542
	L1_538 = 1
	L2_539 = 0
	L3_540 = #A0_537
	L4_541 = A0_537[1]
	L4_541 = #L4_541
	function L5_542()
		local L0_543, L1_544
		L0_543 = _ENV
		L0_543 = L0_543 + 1
		_ENV = L0_543
		L0_543 = _ENV
		L1_544 = L4_541
		if L0_543 > L1_544 then
			L0_543 = L1_538
			L0_543 = L0_543 + 1
			L1_544 = 1
			_ENV = L1_544
			L1_538 = L0_543
		end
		L0_543 = L1_538
		L1_544 = L3_540
		if L0_543 <= L1_544 then
			L0_543 = L1_538
			L1_544 = _ENV
			return L0_543, L1_544
		end
	end
	return L5_542
end
function L0_0.scalar(A0_545, A1_546)
	local L2_547, L3_548, L4_549
	L2_547 = A0_545[1]
	L2_547 = L2_547[1]
	L3_548 = A1_546[1]
	L3_548 = L3_548[1]
	L2_547 = L2_547 * L3_548
	L3_548 = A0_545[2]
	L3_548 = L3_548[1]
	L4_549 = A1_546[2]
	L4_549 = L4_549[1]
	L3_548 = L3_548 * L4_549
	L2_547 = L2_547 + L3_548
	L3_548 = A0_545[3]
	L3_548 = L3_548[1]
	L4_549 = A1_546[3]
	L4_549 = L4_549[1]
	L3_548 = L3_548 * L4_549
	L2_547 = L2_547 + L3_548
	return L2_547
end
function L0_0.cross(A0_550, A1_551)
	local L2_552
	L2_552 = {}
	L2_552[1], ({})[1] = {}, A0_550[2][1] * A1_551[3][1] - A0_550[3][1] * A1_551[2][1]
	L2_552[2], ({})[1] = {}, A0_550[3][1] * A1_551[1][1] - A0_550[1][1] * A1_551[3][1]
	local L6_556 = L6_556
	L6_556[1] = A0_550[1][1] * A1_551[2][1] - A0_550[2][1] * A1_551[1][1]
	L2_552[3] = L6_556
	L6_556 = setmetatable
	local L4_554 = L4_554
	do return L6_556(L4_554, _ENV) end
	local L5_555 = L5_555
end
function L0_0.len(A0_557)
	local L3_559 = L3_559
	return L3_559(A0_557[1][1] ^ 2 + A0_557[2][1] ^ 2 + A0_557[3][1] ^ 2)
end
function L0_0.replace(A0_560, A1_561, ...)
	local L3_562
	L3_562 = {}
	L7_566 = 1
	L11_570 = #A0_560
	L13_572 = 1
	for _FORV_7_ = L7_566, L11_570, L13_572 do
		_FOR_ = 1
		for _FORV_13_ = _FOR_, _FOR_, _FOR_ do
			local L15_574 = L15_574
			;({})[_FORV_13_] = A1_561(A0_560[_FORV_7_][_FORV_13_], ...)
		end
		L3_562[_FORV_7_] = {}
	end
	L7_566 = setmetatable
	L11_570 = L3_562
	L13_572 = _ENV
	return L7_566(L11_570, L13_572)
end
function L0_0.elementstostrings(A0_575)
	local L1_576
	L1_576 = A0_575[1]
	L1_576 = L1_576[1]
	local L2_577 = L2_577
	L2_577 = L2_577(L1_576)
	if L2_577 == "table" then
		L2_577 = L1_576.tostring
		if L2_577 then
			goto lbl_12
		end
	end
	L2_577 = tostring
	::lbl_12::
	local L3_578 = L3_578
	local L4_579 = L4_579
	do return L3_578(L4_579, L2_577) end
	local L5_580 = L5_580
end
function L0_0.solve(A0_581)
	local L5_586, L1_582 = _ENV, L1_582
	L5_586 = L5_586.type
	L9_590 = A0_581
	L5_586 = L5_586(L9_590)
	L5_586 = L5_586 == "symbol"
	L9_590 = "matrix not of type 'symbol'"
	L1_582(L5_586, L9_590)
	L1_582 = {}
	L5_586 = 1
	L9_590 = #A0_581
	_FOR_ = 1
	for _FORV_5_ = L5_586, L9_590, _FOR_ do
		L1_582[_FORV_5_] = {}
		_FOR_ = 1
		for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
			L1_582[_FORV_5_][_FORV_9_] = tonumber(loadstring("return " .. A0_581[_FORV_5_][_FORV_9_][1])())
		end
	end
	L5_586 = setmetatable
	L9_590 = L1_582
	L7_588 = L1_1
	return L5_586(L9_590, L7_588)
end
function L1_1.__add(...)
	local L1_596
	L1_596 = _ENV
	L1_596 = L1_596.add
	return L1_596(...)
end
function L1_1.__sub(...)
	local L1_597
	L1_597 = _ENV
	L1_597 = L1_597.sub
	return L1_597(...)
end
function L1_1.__mul(A0_598, A1_599)
	if getmetatable(A0_598) ~= _ENV then
		return L0_0.mulnum(A1_599, A0_598)
	elseif getmetatable(A1_599) ~= _ENV then
		return L0_0.mulnum(A0_598, A1_599)
	end
	local L3_600 = L3_600
	do return L3_600(A0_598, A1_599) end
	local L4_601 = L4_601
end
function L1_1.__div(A0_602, A1_603)
	if getmetatable(A0_602) ~= _ENV then
		return L0_0.mulnum(L0_0.invert(A1_603), A0_602)
	elseif getmetatable(A1_603) ~= _ENV then
		return L0_0.divnum(A0_602, A1_603)
	end
	local L3_604 = L3_604
	do return L3_604(A0_602, A1_603) end
	local L4_605 = L4_605
end
function L1_1.__unm(A0_606)
	local L2_607 = L2_607
	do return L2_607(A0_606, -1) end
	local L3_608 = L3_608
end
;({})["*"] = function(A0_609)
	do return _ENV.conjugate(A0_609) end
	local L2_610 = L2_610
end
;({}).T = function(A0_611)
	do return _ENV.transpose(A0_611) end
	local L2_612 = L2_612
end
function L1_1.__pow(A0_613, A1_614)
	if not _ENV[A1_614] or not _ENV[A1_614](A0_613) then
		local L2_615 = L2_615
		local L3_616 = L3_616
		local L2_615, L4_617 = L2_615(L3_616, A1_614), L4_617
	end
	return L2_615
end
function L1_1.__eq(A0_618, A1_619)
	L5_623 = _ENV.type
	L6_624 = A0_618
	L5_623 = L5_623(L6_624)
	L6_624 = _ENV
	L6_624 = L6_624.type
	L7_625 = A1_619
	L6_624 = L6_624(L7_625)
	if L5_623 ~= L6_624 then
		L5_623 = false
		return L5_623
	end
	L5_623 = #A0_618
	L6_624 = #A1_619
	if L5_623 == L6_624 then
		L5_623 = A0_618[1]
		L5_623 = #L5_623
		L6_624 = A1_619[1]
		L6_624 = #L6_624
		if L5_623 == L6_624 then
			goto lbl_25
		end
	end
	L5_623 = false
	do return L5_623 end
	::lbl_25::
	L5_623 = 1
	L6_624 = #A0_618
	L7_625 = 1
	for L8_626 = L5_623, L6_624, L7_625 do
		L9_627 = 1
		L10_628 = A0_618[1]
		L10_628 = #L10_628
		L11_629 = 1
		for _FORV_9_ = L9_627, L10_628, L11_629 do
			if A0_618[L8_626][_FORV_9_] ~= A1_619[L8_626][_FORV_9_] then
				return false
			end
		end
	end
	L5_623 = true
	return L5_623
end
function L1_1.__tostring(...)
	local L1_630
	L1_630 = _ENV
	L1_630 = L1_630.tostring
	return L1_630(...)
end
function L1_1.__call(...)
	local L1_631, L2_632
	L1_631 = _ENV
	L1_631 = L1_631.print
	L2_632 = ...
	L1_631(L2_632)
end
L1_1.__index = {}
local L15_15 = L15_15
local _FOR_, _FOR_, _FOR_, L16_16 = pairs(L0_0)
for _FORV_18_, _FORV_19_ in _FOR_, _FOR_, _FOR_ do
	L1_1.__index[_FORV_18_] = _FORV_19_
	local L20_20 = L20_20
end
;({}).__index = {}
;({}).new = function(A0_633)
	local L2_634 = L2_634
	local L4_636 = L4_636
	L4_636[1] = tostring(A0_633)
	L4_636[2] = tostring(A0_633)
	return L2_634(L4_636, _ENV)
end
;({}).to = ({}).new
local L18_18 = L18_18
;({}).__call = function(A0_637, A1_638)
	do return _ENV.to(A1_638) end
	local L3_639 = L3_639
end
setmetatable({}, {})
local L19_19 = L19_19
function L18_18.tostring(A0_640, A1_641)
	local L3_642 = L3_642
	do return L3_642(A1_641, A0_640[1]) end
	local L4_643 = L4_643
end
function L18_18.type(A0_644)
	local L1_645 = L1_645
	local L1_645, L2_646 = L1_645(A0_644), L2_646
	L2_646 = _ENV
	if L1_645 == L2_646 then
		L1_645 = "symbol"
		return L1_645
	end
end
function L18_18.gsub(A0_647, A1_648, A2_649)
	local L3_650
	L3_650 = _ENV
	L3_650 = L3_650.to
	local L4_651 = L4_651
	local L5_652 = L5_652
	local L6_653 = L6_653
	local L4_651, L5_652, L6_653, L7_654 = L4_651(L5_652, L6_653, A2_649)
	return L3_650(L4_651, L5_652, L6_653, L7_654)
end
function L18_18.makereplacer(...)
	local L1_655, L2_656
	L1_655 = {}
	local L2_656, L7_661, L8_662 = {}, L7_661, L8_662
	L3_657, L4_658, L5_659, L6_660, L7_661, L8_662 = ...
	L2_656[1] = L3_657
	L2_656[2] = L4_658
	L2_656[3] = L5_659
	L2_656[4] = L6_660
	L2_656[5] = L7_661
	L2_656[6] = L8_662
	L3_657 = 1
	L4_658 = #L2_656
	L5_659 = 2
	for L6_660 = L3_657, L4_658, L5_659 do
		L7_661 = L2_656[L6_660]
		L8_662 = L6_660 + 1
		L8_662 = L2_656[L8_662]
		L1_655[L7_661] = L8_662
	end
	function L3_657(A0_663)
		local L1_664
		L1_664 = _ENV
		L1_664 = L1_664[A0_663]
		if not L1_664 then
			L1_664 = A0_663
		end
		return L1_664
	end
	function L4_658(A0_665)
		local L1_666
		L1_666 = _ENV
		L1_666 = L1_666.to
		local L2_667 = L2_667
		local L3_668 = L3_668
		local L4_669 = L4_669
		local L2_667, L3_668, L4_669, L5_670 = L2_667(L3_668, L4_669, L3_657)
		return L1_666(L2_667, L3_668, L4_669, L5_670)
	end
	return L4_658
end
function L18_18.abs(A0_671)
	local L3_673 = L3_673
	local L4_674 = "(" .. A0_671[1] .. "):abs()"
	return L3_673(L4_674)
end
function L18_18.sqrt(A0_675)
	local L3_677 = L3_677
	local L4_678 = "(" .. A0_675[1] .. "):sqrt()"
	return L3_677(L4_678)
end
function L18_18.__add(A0_679, A1_680)
	local L4_682 = L4_682
	local L5_683 = A0_679 .. "+" .. A1_680
	return L4_682(L5_683)
end
function L18_18.__sub(A0_684, A1_685)
	local L4_687 = L4_687
	local L5_688 = A0_684 .. "-" .. A1_685
	return L4_687(L5_688)
end
function L18_18.__mul(A0_689, A1_690)
	local L4_692 = L4_692
	local L5_693 = L5_693
	local L6_694 = L6_694
	local L5_693, L7_695 = L5_693 .. L6_694 .. ")*(" .. A1_690 .. ")", L7_695
	return L4_692(L5_693)
end
function L18_18.__div(A0_696, A1_697)
	local L4_699 = L4_699
	local L5_700 = L5_700
	local L6_701 = L6_701
	local L5_700, L7_702 = L5_700 .. L6_701 .. ")/(" .. A1_697 .. ")", L7_702
	return L4_699(L5_700)
end
function L18_18.__pow(A0_703, A1_704)
	local L4_706 = L4_706
	local L5_707 = L5_707
	local L6_708 = L6_708
	local L5_707, L7_709 = L5_707 .. L6_708 .. ")^(" .. A1_704 .. ")", L7_709
	return L4_706(L5_707)
end
function L18_18.__eq(A0_710, A1_711)
	local L2_712, L3_713
	L2_712 = A0_710[1]
	L3_713 = A1_711[1]
	L2_712 = L2_712 == L3_713
	return L2_712
end
function L18_18.__tostring(A0_714)
	return A0_714[1]
end
function L18_18.__concat(A0_715, A1_716)
	local L2_717 = L2_717
	local L4_719 = tostring(A1_716)
	L2_717 = L2_717 .. L4_719
	return L2_717
end
L0_0.symbol = L19_19
return L0_0
