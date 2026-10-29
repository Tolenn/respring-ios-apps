fit = require("fit")
terrainFunctionClasstable = {}
local L2_2.components, ({})[1], L2_2 = {}, 0, L2_2
PolynomialFunction = L2_2
L2_2 = {}
L2_2.__index = PolynomialFunction
PolynomialFunction_mt = L2_2
L2_2 = terrainFunctionClasstable
L2_2.PolynomialFunction = PolynomialFunction_mt
L2_2 = PolynomialFunction
function L2_2.new(A0_3, A1_4)
	local L2_5
	L2_5 = {}
	L2_5.components = A1_4
	L2_5.class = "PolynomialFunction"
	local L3_6 = L3_6
	local L4_7 = L4_7
	L3_6(L4_7, PolynomialFunction_mt)
	local L5_8 = L5_8
	return L2_5
end
L2_2 = PolynomialFunction
function L2_2.valueAt(A0_9, A1_10)
	local L2_11, L3_12, L4_13
	L3_12 = A0_9.components
	L3_12 = #L3_12
	if L3_12 == 1 then
		L3_12 = A0_9.components
		L2_11 = L3_12[1]
	else
		L3_12 = A0_9.components
		L3_12 = #L3_12
		if L3_12 == 2 then
			L3_12 = A0_9.components
			L3_12 = L3_12[2]
			L3_12 = L3_12 * A1_10
			L4_13 = A0_9.components
			L4_13 = L4_13[1]
			L2_11 = L3_12 + L4_13
		else
			L3_12 = A0_9.components
			L3_12 = #L3_12
			if L3_12 == 3 then
				L3_12 = A0_9.components
				L3_12 = L3_12[3]
				L3_12 = L3_12 * A1_10
				L3_12 = L3_12 * A1_10
				L4_13 = A0_9.components
				L4_13 = L4_13[2]
				L4_13 = L4_13 * A1_10
				L3_12 = L3_12 + L4_13
				L4_13 = A0_9.components
				L4_13 = L4_13[1]
				L2_11 = L3_12 + L4_13
			end
		end
	end
	return L2_11
end
L2_2 = PolynomialFunction
function L2_2.slopeAt(A0_14, A1_15)
	local L2_16
	L2_16 = A0_14.components
	L2_16 = #L2_16
	if L2_16 == 1 then
		L2_16 = 0
		value = L2_16
	else
		L2_16 = A0_14.components
		L2_16 = #L2_16
		if L2_16 == 2 then
			L2_16 = A0_14.components
			L2_16 = L2_16[2]
			value = L2_16
		end
	end
	L2_16 = value
	return L2_16
end
L2_2 = {}
L2_2.segments = {}
L2_2.plateaus = {}
L2_2.values = {}
TerrainFunction = L2_2
L2_2 = {}
L2_2.__index = TerrainFunction
TerrainFunction_mt = L2_2
L2_2 = TerrainFunction
function L2_2.valueAt(A0_17, A1_18)
	seg_fun = A0_17:findSegmentFunction(A1_18)
	if seg_fun == nil then
		return 0
	end
	local L2_19 = L2_19
	do return L2_19(seg_fun, A1_18) end
	local L4_20 = L4_20
end
L2_2 = TerrainFunction
function L2_2.findSegmentFunction(A0_21, A1_22)
	local L2_23, L3_24, L4_25, L5_26, L6_27
	L2_23 = 1
	L3_24 = A0_21.segments
	L3_24 = #L3_24
	L4_25 = 1
	for L5_26 = L2_23, L3_24, L4_25 do
		L6_27 = A0_21.segments
		L6_27 = L6_27[L5_26]
		L6_27 = L6_27.startX
		if A1_22 >= L6_27 then
			L6_27 = A0_21.segments
			L6_27 = L6_27[L5_26]
			L6_27 = L6_27.endX
			if A1_22 < L6_27 then
				L6_27 = A0_21.segments
				L6_27 = L6_27[L5_26]
				L6_27 = L6_27.segmentFunction
				return L6_27
			end
		end
	end
	L2_23 = nil
	return L2_23
end
L2_2 = TerrainFunction
function L2_2.slopeAt(A0_28, A1_29)
	seg_fun = A0_28:findSegmentFunction(A1_29)
	if seg_fun == nil then
		return 0
	end
	local L2_30 = L2_30
	do return L2_30(seg_fun, A1_29) end
	local L4_31 = L4_31
end
L2_2 = utils
L2_2 = L2_2.inheritsFrom
L2_2 = L2_2(TerrainFunction)
SubdivisionTerrainFunction = L2_2
L2_2 = {}
L2_2.__index = SubdivisionTerrainFunction
SubdivisionTerrainFunction_mt = L2_2
L2_2 = terrainFunctionClasstable
L2_2.SubdivisionTerrainFunction = SubdivisionTerrainFunction_mt
L2_2 = SubdivisionTerrainFunction
function L2_2.new(A0_32, A1_33, A2_34, A3_35, A4_36, A5_37, A6_38)
	local L7_39
	L7_39 = {}
	L7_39.width = A1_33
	L7_39.values = {}
	L7_39.minHeight = A2_34
	L7_39.maxHeight = A3_35
	L7_39.verticalVariance = A4_36
	L7_39.roughness = A5_37
	L7_39.plateaus = A6_38
	L7_39.class = "SubdivisionTerrainFunction"
	local L8_40 = L8_40
	L8_40(L7_39, SubdivisionTerrainFunction_mt)
	L8_40 = A1_33 / 2
	local L9_41, L10_42 = L9_41, L10_42
	local L11_43 = L11_43
	L9_41(L10_42, L11_43, A1_33)
	local L12_44 = L12_44
	return L7_39
end
L2_2 = SubdivisionTerrainFunction
function L2_2.populate(A0_45, A1_46, A2_47, A3_48, A4_49)
	local L5_50, L6_51
	L5_50 = A3_48 or nil
	if not A3_48 then
		L5_50 = A0_45.maxHeight
		L6_51 = A0_45.minHeight
		L5_50 = L5_50 - L6_51
		L5_50 = L5_50 / 3
	end
	L6_51 = A4_49 or L6_51
	if not A4_49 then
		L6_51 = A0_45.verticalVariance
	end
	local L7_52 = L7_52
	L7_52 = L7_52((A2_47 - A1_46) / 2 + A1_46)
	local L8_53 = L8_53
	L8_53 = L8_53(-L6_51, L6_51)
	L8_53 = L5_50 + L8_53
	A0_45.values[L7_52] = L8_53
	local L9_54 = L9_54
	L9_54 = L9_54(2, -1 * A0_45.roughness)
	L9_54 = L6_51 * L9_54
	if A1_46 ~= L7_52 then
		A0_45:populate(A1_46, L7_52, L8_53, L9_54)
	end
	if L7_52 ~= A2_47 then
		local L10_55, L11_56 = L10_55, L11_56
		local L12_57 = L12_57
		local L13_58 = L13_58
		local L14_59 = L14_59
		L10_55(L11_56, L12_57, L13_58, L14_59, L9_54)
		local L15_60 = L15_60
	end
end
L2_2 = SubdivisionTerrainFunction
function L2_2.valueAt(A0_61, A1_62)
	local L2_63, L3_64
	L2_63 = math
	L2_63 = L2_63.max
	L3_64 = 0
	local L4_65 = L4_65
	local L5_66 = L5_66
	local L6_67 = #A0_61.values
	L4_65, L5_66, L6_67 = L4_65(L5_66, L6_67)
	L2_63 = L2_63(L3_64, L4_65, L5_66, L6_67)
	L3_64 = A0_61.values
	L3_64 = L3_64[L2_63]
	return L3_64
end
L2_2 = SubdivisionTerrainFunction
function L2_2.slopeAt(A0_68, A1_69)
	local L2_70 = L2_70
	L2_70 = L2_70(A0_68, A1_69 + 1)
	local L4_71 = L4_71
	local L4_71, L5_72 = L4_71(A0_68, A1_69 - 1), L5_72
	L4_71 = L4_71 / 2
	L2_70 = L2_70 - L4_71
	return L2_70
end
L2_2 = utils
L2_2 = L2_2.inheritsFrom
L2_2 = L2_2(TerrainFunction)
LinearTerrainFunction = L2_2
L2_2 = {}
L2_2.__index = LinearTerrainFunction
LinearTerrainFunction_mt = L2_2
L2_2 = terrainFunctionClasstable
L2_2.LinearTerrainFunction = LinearTerrainFunction_mt
L2_2 = LinearTerrainFunction
function L2_2.new(A0_73, A1_74, A2_75, A3_76, A4_77, A5_78, A6_79)
	local L7_80
	L7_80 = {}
	local L12_85, L14_87, L15_88, L16_89, L18_91 = {}, L14_87, L15_88, L16_89, L18_91
	L7_80.segments = L12_85
	L7_80.class = "LinearTerrainFunction"
	L12_85 = setmetatable
	L14_87 = L7_80
	L15_88 = LinearTerrainFunction_mt
	L12_85(L14_87, L15_88)
	L12_85 = math
	L12_85 = L12_85.ceil
	L14_87 = A1_74 / 80
	L14_87 = L14_87 * A5_78
	L12_85 = L12_85(L14_87)
	L14_87 = A1_74 / L12_85
	L15_88 = A3_76 - A2_75
	L15_88 = L15_88 / 2
	L16_89 = math
	L16_89 = L16_89.random
	L18_91 = -A4_77
	L16_89 = L16_89(L18_91, A4_77)
	L15_88 = L15_88 + L16_89
	L16_89 = 0
	L18_91 = L15_88
	_FOR_ = 1
	for _FORV_16_ = _FOR_, _FOR_, _FOR_ do
		endX = L16_89 + L14_87
		delta = math.random(-A4_77, A4_77)
		if A3_76 < L18_91 + delta then
			L18_91 = L18_91 - delta
		elseif A2_75 > L18_91 + delta then
			L18_91 = L18_91 - delta
		else
			L18_91 = L18_91 + delta
		end
		slope = (L18_91 - L15_88) / (endX - L16_89)
		;({}).startX = L16_89
		;({}).endX = endX
		;({})[1] = L15_88 - slope * L16_89
		local ({})[2], L23_96 = slope, L23_96
		L23_96[_FORV_16_], ({}).segmentFunction = {}, PolynomialFunction:new({})
		L15_88 = L18_91
		L16_89 = endX
	end
	return L7_80
end
L2_2 = utils
L2_2 = L2_2.inheritsFrom
L2_2 = L2_2(TerrainFunction)
QuadraticTerrainFunction = L2_2
L2_2 = {}
L2_2.__index = QuadraticTerrainFunction
QuadraticTerrainFunction_mt = L2_2
L2_2 = terrainFunctionClasstable
L2_2.QuadraticTerrainFunction = QuadraticTerrainFunction_mt
L2_2 = QuadraticTerrainFunction
function L2_2.new(A0_97, A1_98, A2_99, A3_100, A4_101, A5_102, A6_103)
	local L7_104, L8_105
	L7_104 = 150
	local L8_105, L13_110 = {}, L13_110
	L13_110 = {}
	L8_105.segments = L13_110
	L13_110 = {}
	L8_105.plateaus = L13_110
	L13_110 = {}
	L8_105.values = L13_110
	L8_105.class = "QuadraticTerrainFunction"
	L13_110 = A6_103 * L7_104
	A1_98 = A1_98 - L13_110
	L13_110 = setmetatable
	L13_110(L8_105, QuadraticTerrainFunction_mt)
	L13_110 = math
	L13_110 = L13_110.ceil
	L13_110 = L13_110(A1_98 / 80 * A5_102 * 2)
	L13_110 = L13_110 + A6_103
	if L13_110 % 2 == 0 then
		L13_110 = L13_110 + 1
	end
	local L10_107 = L10_107
	local L11_108 = L11_108
	local L10_107, L12_109 = L10_107(L11_108, A6_103 * 3), L12_109
	L13_110 = L10_107
	L10_107 = A1_98 / L13_110
	function L11_108(A0_126)
		local L1_127
		L1_127 = _ENV
		L1_127 = A0_126 * L1_127
		return L1_127
	end
	xFori = L11_108
	function L11_108()
		local L0_128
		L0_128 = _ENV
		L0_128 = L0_128 - A2_99
		L0_128 = L0_128 / 2
		local L1_129 = L1_129
		local L2_130 = -A4_101
		local L1_129, L3_131 = L1_129(L2_130, A4_101), L3_131
		L0_128 = L0_128 + L1_129
		return L0_128
	end
	vary = L11_108
	L11_108 = {}
	L12_109 = A3_100 - A2_99
	L12_109 = L12_109 / 2
	while L13_110 >= 1 do
		({})[1] = xFori(1 - 1)
		;({})[2] = xFori(1)
		;({})[3] = xFori(1 + 1)
		;({})[1] = L12_109
		;({})[2] = vary()
		;({})[3] = vary()
		;({})[1] = {}
		;({})[2] = {}
		table.insert(L11_108, {})
		L12_109 = vary()
	end
	print("QTF", A2_99, A3_100, A4_101, A5_102, A6_103, L13_110, #L11_108)
	function shift(A0_132, A1_133)
		local L2_134, L3_135, L4_136, L5_137, L6_138
		L2_134 = 1
		L3_135 = #A0_132
		L4_136 = 1
		for L5_137 = L2_134, L3_135, L4_136 do
			L6_138 = A0_132[L5_137]
			L6_138 = L6_138 + A1_133
			A0_132[L5_137] = L6_138
		end
	end
	_FOR_ = 1
	for _FORV_17_ = _FOR_, _FOR_, _FOR_ do
		print(_FORV_17_, #L11_108, (math.min(math.max(2, math.round(_FORV_17_ * #L11_108 / (A6_103 + 1)) + _FORV_17_ - 1), #L11_108)))
		local L20_117 = L20_117
		_FOR_ = 1
		for _FORV_25_ = _FOR_, _FOR_, _FOR_ do
			shift(L11_108[_FORV_25_][1], L7_104)
		end
		;({}).startX = L11_108[math.min(math.max(2, math.round(_FORV_17_ * #L11_108 / (A6_103 + 1)) + _FORV_17_ - 1), #L11_108)][1][1]
		;({}).endX = L11_108[math.min(math.max(2, math.round(_FORV_17_ * #L11_108 / (A6_103 + 1)) + _FORV_17_ - 1), #L11_108)][1][1] + L7_104
		;({})[1] = L11_108[math.min(math.max(2, math.round(_FORV_17_ * #L11_108 / (A6_103 + 1)) + _FORV_17_ - 1), #L11_108)][2][1]
		;({}).segmentFunction = PolynomialFunction:new({})
		table.insert(L11_108, math.min(math.max(2, math.round(_FORV_17_ * #L11_108 / (A6_103 + 1)) + _FORV_17_ - 1), #L11_108), {})
		table.insert(L8_105.plateaus, {})
	end
	L26_123 = xFori
	L26_123 = L26_123(L13_110 - 1)
	local L16_113 = L16_113
	local L17_114 = xFori(L13_110 + 1)
	local L18_115 = L18_115
	local L19_116 = L19_116
	;({})[1] = L26_123
	;({})[2] = L16_113
	;({})[3] = L17_114
	local L24_121 = L24_121
	;({})[1] = L18_115
	;({})[2] = L19_116
	local ({})[3], L25_122 = vary(), L25_122
	L25_122[1] = {}
	L25_122[2] = {}
	table.insert(L11_108, L25_122)
	function L23_120(A0_139)
		if A0_139.segmentFunction then
			return A0_139
		else
			local L1_140 = L1_140
			b, a, L1_140 = L1_140(A0_139[1], A0_139[2])
			c = L1_140
			L1_140 = {}
			L1_140.startX = A0_139[1][1]
			L1_140.endX = A0_139[1][3]
			local L2_141, L3_142 = L2_141, L3_142
			local L4_143 = L4_143
			local L5_144 = L5_144
			local L6_145 = L6_145
			L4_143[1] = L5_144
			L4_143[2] = L6_145
			local L4_143[3], L7_146 = a, L7_146
			L2_141 = L2_141(L3_142, L4_143)
			L1_140.segmentFunction = L2_141
			return L1_140
		end
	end
	resolve = L23_120
	L23_120 = 1
	_FOR_ = 1
	for _FORV_24_ = L23_120, _FOR_, _FOR_ do
		table.insert(L8_105.segments, resolve(L11_108[_FORV_24_]))
	end
	return L8_105
end
L2_2 = {}
L2_2.minFunction = nil
L2_2.baseFunction = nil
local L2_2[1], L1_1 = offset, L1_1
DerivedLinearTerrainFunction = L2_2
L2_2 = {}
L1_1 = DerivedLinearTerrainFunction
L2_2.__index = L1_1
DerivedLinearTerrainFunction_mt = L2_2
L2_2 = terrainFunctionClasstable
L1_1 = DerivedLinearTerrainFunction_mt
L2_2.DerivedLinearTerrainFunction = L1_1
L2_2 = DerivedLinearTerrainFunction
function L1_1(A0_147, A1_148, A2_149, A3_150)
	local L4_151
	L4_151 = {}
	L4_151.minFunction = A1_148
	L4_151.baseFunction = A2_149
	L4_151.offset = A3_150
	L4_151.class = "DerivedLinearTerrainFunction"
	local L5_152 = L5_152
	local L6_153 = L6_153
	L5_152(L6_153, DerivedLinearTerrainFunction_mt)
	local L7_154 = L7_154
	return L4_151
end
L2_2.new = L1_1
L2_2 = DerivedLinearTerrainFunction
function L1_1(A0_155, A1_156)
	local L2_157 = L2_157
	L2_157 = L2_157(A0_155.minFunction, A1_156)
	local L3_158, L4_159 = L3_158, L4_159
	local L3_158, L5_160 = L3_158(L4_159, A1_156), L5_160
	L2_157 = L2_157 + L3_158
	L3_158 = A0_155.offset
	L2_157 = L2_157 + L3_158
	base = L2_157
	L2_157 = base
	return L2_157
end
L2_2.valueAt = L1_1
