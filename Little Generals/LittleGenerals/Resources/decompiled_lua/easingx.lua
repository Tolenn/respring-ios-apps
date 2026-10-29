local L0_0, L1_1, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16 = L0_0, (...), L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16
L3_3 = package
L3_3 = L3_3.seeall
L0_0(L1_1, L3_3)
L0_0 = nil
L1_1 = nil
L3_3 = nil
L4_4 = nil
L5_5 = nil
L6_6 = nil
L7_7 = nil
L8_8 = nil
L9_9 = nil
L10_10 = nil
L11_11 = nil
L12_12 = nil
L13_13 = nil
L14_14 = nil
L15_15 = nil
L16_16 = nil
function easeIn(A0_17, A1_18, A2_19, A3_20)
	local L4_21 = L4_21
	local L4_21, L5_22 = L4_21(A0_17 / A1_18), L5_22
	L4_21 = A3_20 * L4_21
	L4_21 = A2_19 + L4_21
	return L4_21
end
function easeOut(A0_23, A1_24, A2_25, A3_26)
	local L4_27 = L4_27
	local L4_27, L5_28 = L4_27(A0_23 / A1_24), L5_28
	L4_27 = A3_26 * L4_27
	L4_27 = A2_25 + L4_27
	return L4_27
end
function easeInOut(A0_29, A1_30, A2_31, A3_32)
	local L4_33 = L4_33
	local L4_33, L5_34 = L4_33(A0_29 / A1_30), L5_34
	L4_33 = A3_32 * L4_33
	L4_33 = A2_31 + L4_33
	return L4_33
end
function easeOutIn(A0_35, A1_36, A2_37, A3_38)
	local L4_39 = L4_39
	local L4_39, L5_40 = L4_39(A0_35 / A1_36), L5_40
	L4_39 = A3_38 * L4_39
	L4_39 = A2_37 + L4_39
	return L4_39
end
function easeInBack(A0_41, A1_42, A2_43, A3_44)
	local L4_45 = L4_45
	local L4_45, L5_46 = L4_45(A0_41 / A1_42), L5_46
	L4_45 = A3_44 * L4_45
	L4_45 = A2_43 + L4_45
	return L4_45
end
function easeOutBack(A0_47, A1_48, A2_49, A3_50)
	local L4_51 = L4_51
	local L4_51, L5_52 = L4_51(A0_47 / A1_48), L5_52
	L4_51 = A3_50 * L4_51
	L4_51 = A2_49 + L4_51
	return L4_51
end
function easeInOutBack(A0_53, A1_54, A2_55, A3_56)
	local L4_57 = L4_57
	local L4_57, L5_58 = L4_57(A0_53 / A1_54), L5_58
	L4_57 = A3_56 * L4_57
	L4_57 = A2_55 + L4_57
	return L4_57
end
function easeOutInBack(A0_59, A1_60, A2_61, A3_62)
	local L4_63 = L4_63
	local L4_63, L5_64 = L4_63(A0_59 / A1_60), L5_64
	L4_63 = A3_62 * L4_63
	L4_63 = A2_61 + L4_63
	return L4_63
end
function easeInElastic(A0_65, A1_66, A2_67, A3_68)
	local L4_69 = L4_69
	local L4_69, L5_70 = L4_69(A0_65 / A1_66), L5_70
	L4_69 = A3_68 * L4_69
	L4_69 = A2_67 + L4_69
	return L4_69
end
function easeOutElastic(A0_71, A1_72, A2_73, A3_74)
	local L4_75 = L4_75
	local L4_75, L5_76 = L4_75(A0_71 / A1_72), L5_76
	L4_75 = A3_74 * L4_75
	L4_75 = A2_73 + L4_75
	return L4_75
end
function easeInOutElastic(A0_77, A1_78, A2_79, A3_80)
	local L4_81 = L4_81
	local L4_81, L5_82 = L4_81(A0_77 / A1_78), L5_82
	L4_81 = A3_80 * L4_81
	L4_81 = A2_79 + L4_81
	return L4_81
end
function easeOutInElastic(A0_83, A1_84, A2_85, A3_86)
	local L4_87 = L4_87
	local L4_87, L5_88 = L4_87(A0_83 / A1_84), L5_88
	L4_87 = A3_86 * L4_87
	L4_87 = A2_85 + L4_87
	return L4_87
end
function easeInBounce(A0_89, A1_90, A2_91, A3_92)
	local L4_93 = L4_93
	local L4_93, L5_94 = L4_93(A0_89 / A1_90), L5_94
	L4_93 = A3_92 * L4_93
	L4_93 = A2_91 + L4_93
	return L4_93
end
function easeOutBounce(A0_95, A1_96, A2_97, A3_98)
	local L4_99 = L4_99
	local L4_99, L5_100 = L4_99(A0_95 / A1_96), L5_100
	L4_99 = A3_98 * L4_99
	L4_99 = A2_97 + L4_99
	return L4_99
end
function easeInOutBounce(A0_101, A1_102, A2_103, A3_104)
	local L4_105 = L4_105
	local L4_105, L5_106 = L4_105(A0_101 / A1_102), L5_106
	L4_105 = A3_104 * L4_105
	L4_105 = A2_103 + L4_105
	return L4_105
end
function easeOutInBounce(A0_107, A1_108, A2_109, A3_110)
	local L4_111 = L4_111
	local L4_111, L5_112 = L4_111(A0_107 / A1_108), L5_112
	L4_111 = A3_110 * L4_111
	L4_111 = A2_109 + L4_111
	return L4_111
end
pow = math.pow
sin = math.sin
pi = math.pi
function L13_13(A0_113)
	local L1_114 = L1_114
	local L1_114, L2_115 = L1_114(1 - A0_113), L2_115
	L1_114 = 1 - L1_114
	return L1_114
end
function L14_14(A0_116)
	local L1_117, L2_118, L3_119
	L1_117 = 7.5625
	L2_118 = 2.75
	L3_119 = nil
	if A0_116 < 1 / L2_118 then
		L3_119 = L1_117 * pow(A0_116, 2)
	elseif A0_116 < 2 / L2_118 then
		A0_116 = A0_116 - 1.5 / L2_118
		L3_119 = L1_117 * pow(A0_116, 2) + 0.75
	elseif A0_116 < 2.5 / L2_118 then
		A0_116 = A0_116 - 2.25 / L2_118
		L3_119 = L1_117 * pow(A0_116, 2) + 0.9375
	else
		A0_116 = A0_116 - 2.65 / L2_118
		local L4_120 = L4_120
		local L5_121 = L5_121
		local L4_120, L6_122 = L4_120(L5_121, 2), L6_122
		L4_120 = L1_117 * L4_120
		L3_119 = L4_120 + 0.984375
	end
	return L3_119
end
function L15_15(A0_123)
	if A0_123 < 0.5 then
		return 0.5 * _ENV(A0_123 * 2)
	else
		local L1_124 = L1_124
		local L1_124, L2_125 = L1_124((A0_123 - 0.5) * 2), L2_125
		L1_124 = 0.5 * L1_124
		L1_124 = L1_124 + 0.5
		return L1_124
	end
end
function L16_16(A0_126)
	if A0_126 < 0.5 then
		return 0.5 * _ENV(A0_126 * 2)
	else
		local L1_127 = L1_127
		local L1_127, L2_128 = L1_127((A0_126 - 0.5) * 2), L2_128
		L1_127 = 0.5 * L1_127
		L1_127 = L1_127 + 0.5
		return L1_127
	end
end
function L9_9(A0_129)
	local L1_130, L2_131, L3_132
	if A0_129 == 0 or A0_129 == 1 then
		return A0_129
	end
	L1_130 = 0.3
	L2_131 = L1_130 / 4
	L3_132 = A0_129 - 1
	local L4_133 = L4_133
	L4_133 = L4_133(2, 10 * L3_132)
	L4_133 = -1 * L4_133
	local L5_134 = L5_134
	local L7_136 = (L3_132 - L2_131) * 2 * pi
	L7_136 = L7_136 / L1_130
	L5_134 = L5_134(L7_136)
	L4_133 = L4_133 * L5_134
	return L4_133
end
function L10_10(A0_137)
	local L1_138, L2_139
	if A0_137 == 0 or A0_137 == 1 then
		return A0_137
	end
	L1_138 = 0.3
	L2_139 = L1_138 / 4
	local L3_140 = L3_140
	L3_140 = L3_140(2, -10 * A0_137)
	L3_140 = -1 * L3_140
	local L4_141 = L4_141
	local L6_143 = (A0_137 - L2_139) * 2 * pi
	L6_143 = L6_143 / L1_138
	L4_141 = L4_141(L6_143)
	L3_140 = L3_140 * L4_141
	L3_140 = L3_140 + 1
	return L3_140
end
function L11_11(A0_144)
	if A0_144 < 0.5 then
		return 0.5 * _ENV(A0_144 * 2)
	else
		local L1_145 = L1_145
		local L1_145, L2_146 = L1_145((A0_144 - 0.5) * 2), L2_146
		L1_145 = 0.5 * L1_145
		L1_145 = L1_145 + 0.5
		return L1_145
	end
end
function L12_12(A0_147)
	if A0_147 < 0.5 then
		return 0.5 * _ENV(A0_147 * 2)
	else
		local L1_148 = L1_148
		local L1_148, L2_149 = L1_148((A0_147 - 0.5) * 2), L2_149
		L1_148 = 0.5 * L1_148
		L1_148 = L1_148 + 0.5
		return L1_148
	end
end
function L0_0(A0_150)
	local L1_151
	L1_151 = A0_150 * A0_150
	L1_151 = L1_151 * A0_150
	return L1_151
end
function L1_1(A0_152)
	local L1_153, L2_154
	L1_153 = A0_152 - 1
	L2_154 = L1_153 * L1_153
	L2_154 = L2_154 * L1_153
	L2_154 = L2_154 + 1
	return L2_154
end
function L3_3(A0_155)
	if A0_155 < 0.5 then
		return 0.5 * _ENV(A0_155 * 2)
	else
		local L1_156 = L1_156
		local L1_156, L2_157 = L1_156((A0_155 - 0.5) * 2), L2_157
		L1_156 = 0.5 * L1_156
		L1_156 = L1_156 + 0.5
		return L1_156
	end
end
function L4_4(A0_158)
	if A0_158 < 0.5 then
		return 0.5 * _ENV(A0_158 * 2)
	else
		local L1_159 = L1_159
		local L1_159, L2_160 = L1_159((A0_158 - 0.5) * 2), L2_160
		L1_159 = 0.5 * L1_159
		L1_159 = L1_159 + 0.5
		return L1_159
	end
end
function L5_5(A0_161)
	local L1_162
	L1_162 = 1.70158
	local L2_163 = L2_163
	local L3_164 = L3_164
	local L2_163, L4_165 = L2_163(L3_164, 2), L4_165
	L3_164 = L1_162 + 1
	L3_164 = L3_164 * A0_161
	L3_164 = L3_164 - L1_162
	L2_163 = L2_163 * L3_164
	return L2_163
end
function L6_6(A0_166)
	local L1_167, L2_168
	L1_167 = A0_166 - 1
	L2_168 = 1.70158
	local L3_169 = L3_169
	local L4_170 = L4_170
	local L3_169, L5_171 = L3_169(L4_170, 2), L5_171
	L4_170 = L2_168 + 1
	L4_170 = L4_170 * L1_167
	L4_170 = L4_170 - L2_168
	L3_169 = L3_169 * L4_170
	L3_169 = L3_169 + 1
	return L3_169
end
function L7_7(A0_172)
	if A0_172 < 0.5 then
		return 0.5 * _ENV(A0_172 * 2)
	else
		local L1_173 = L1_173
		local L1_173, L2_174 = L1_173((A0_172 - 0.5) * 2), L2_174
		L1_173 = 0.5 * L1_173
		L1_173 = L1_173 + 0.5
		return L1_173
	end
end
function L8_8(A0_175)
	if A0_175 < 0.5 then
		return 0.5 * _ENV(A0_175 * 2)
	else
		local L1_176 = L1_176
		local L1_176, L2_177 = L1_176((A0_175 - 0.5) * 2), L2_177
		L1_176 = 0.5 * L1_176
		L1_176 = L1_176 + 0.5
		return L1_176
	end
end
