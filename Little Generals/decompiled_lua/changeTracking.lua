local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8 = L2_2, "objectTemplates", L4_4, L5_5, L6_6, L7_7, L8_8
L2_2(L3_3)
L2_2 = require
L3_3 = "json"
L2_2 = L2_2(L3_3)
function L3_3(A0_13)
	do return math.round(A0_13) end
	local L2_14 = L2_14
end
round2 = L3_3
L3_3 = {}
L3_3.oid = 0
L3_3.x = 0
L3_3.y = 0
L3_3.r = 0
L3_3.sx = 0
L3_3.sy = 0
L3_3.ot = 0
L3_3.bt = ""
ObjectRef = L3_3
L3_3 = {}
L4_4 = ObjectRef
L3_3.__index = L4_4
ObjectRef_mt = L3_3
function L3_3(A0_15)
	local L1_16
	if A0_15 == nil then
		L1_16 = nil
		return L1_16
	elseif A0_15 == "static" then
		L1_16 = 0
		return L1_16
	elseif A0_15 == "dynamic" then
		L1_16 = 1
		return L1_16
	else
		L1_16 = 2
		return L1_16
	end
end
function L4_4(A0_17)
	local L1_18
	if A0_17 == -1 then
	elseif A0_17 == 0 then
		L1_18 = "static"
		return L1_18
	elseif A0_17 == 1 then
		L1_18 = "dynamic"
		return L1_18
	else
		L1_18 = "kinematic"
		return L1_18
	end
end
L5_5 = ObjectRef
function L6_6(A0_19)
	local L1_20
	L1_20 = {}
	if not A0_19.gid then
	end
	local L9_28 = L9_28
	if not A0_19.n then
	end
	local L10_29 = L10_29
	if not A0_19.cd then
	end
	local L11_30 = L11_30
	local L12_31 = L12_31
	if not A0_19.owid then
	end
	local L13_32 = L13_32
	if not A0_19.pid then
	end
	L1_20[1] = L2_21
	L1_20[2] = L3_22
	L1_20[3] = L4_23
	L1_20[4] = L5_24
	L1_20[5] = L9_28
	L1_20[6] = L10_29
	L1_20[7] = L11_30
	L1_20[8] = L12_31
	L1_20[9] = L13_32
	L1_20[10] = 0
	L1_20[11] = _ENV(A0_19.bt)
	L1_20[12] = 0
	local L1_20[13], L14_33 = 0, L14_33
	L2_21 = #L1_20
	L3_22 = 9
	L4_23 = -1
	for L5_24 = L2_21, L3_22, L4_23 do
		L9_28 = L1_20[L5_24]
		if L9_28 ~= 0 then
			break
		end
		L9_28 = table
		L9_28 = L9_28.remove
		L10_29 = L1_20
		L11_30 = L5_24
		L9_28(L10_29, L11_30)
		goto lbl_47
		do break end
		::lbl_47::
	end
	return L1_20
end
L5_5.serialize = L6_6
L5_5 = ObjectRef
function L6_6(A0_34, A1_35)
	local L2_36
	L2_36 = A1_35.oid
	if L2_36 then
		return A1_35
	end
	L2_36 = {}
	L2_36.oid = A1_35[1]
	L2_36.gid = A1_35[2]
	L2_36.x = A1_35[3]
	L2_36.y = A1_35[4]
	L2_36.r = A1_35[5]
	L2_36.sx = A1_35[6]
	L2_36.sy = A1_35[7]
	L2_36.ot = A1_35[8]
	if 9 <= #A1_35 then
		if A1_35[9] ~= 0 then
			L2_36.n = A1_35[9]
		end
		if 10 <= #A1_35 then
			if A1_35[10] ~= 0 then
				L2_36.cd = A1_35[10]
			end
			if 11 <= #A1_35 then
				if A1_35[11] ~= 0 then
					local L3_37 = L3_37
					local L3_37, L4_38 = L3_37(A1_35[11]), L4_38
					L2_36.bt = L3_37
				end
				L3_37 = #A1_35
				if 12 <= L3_37 then
					L3_37 = A1_35[12]
					if L3_37 ~= 0 then
						L3_37 = A1_35[12]
						L2_36.owid = L3_37
					end
					L3_37 = #A1_35
					if 13 <= L3_37 then
						L3_37 = A1_35[13]
						if L3_37 ~= 0 then
							L3_37 = A1_35[13]
							L2_36.pid = L3_37
						end
					end
				end
			end
		end
	end
	L3_37 = L2_36.bt
	if not L3_37 then
		L2_36.bt = "static"
	end
	return L2_36
end
L5_5.restorePackedRef = L6_6
L5_5 = ObjectRef
function L6_6(A0_39, A1_40, A2_41, A3_42, A4_43, A5_44, A6_45, A7_46, A8_47, A9_48, A10_49, A11_50, A12_51, A13_52)
	local L14_53
	L14_53 = {}
	local L14_53.oid, L19_58 = A1_40, L19_58
	L14_53.gid = A2_41
	L14_53.x = A3_42
	L14_53.y = A4_43
	L14_53.r = A5_44
	L14_53.sx = A6_45
	L14_53.sy = A7_46
	L14_53.ot = A9_48
	L14_53.bt = A10_49
	if A8_47 then
		L14_53.owid = A8_47
	end
	if A11_50 then
		L14_53.pid = A11_50
	end
	if A12_51 then
		L19_58 = {}
		L14_53.n = L19_58
		L19_58 = L14_53.n
		L25_64 = 1
		_FOR_ = 1
		for _FORV_19_ = L25_64, _FOR_, _FOR_ do
			if type(A12_51[_FORV_19_]) == "number" then
				L14_53.n = A12_51
				break
			else
				if A12_51[_FORV_19_].joints then
					_FOR_ = 1
					for _FORV_25_ = _FOR_, _FOR_, _FOR_ do
						if A12_51[_FORV_19_].joints[_FORV_25_].objectId == A1_40 then
							break
						end
					end
					if not true then
					end
				end
				table.insert(L19_58, -A12_51[_FORV_19_].objectId)
			end
		end
	end
	if A13_52 then
		L14_53.cd = A13_52
	end
	L19_58 = setmetatable
	L25_64 = L14_53
	L24_63 = ObjectRef_mt
	L19_58(L25_64, L24_63)
	return L14_53
end
L5_5.new = L6_6
L5_5 = ObjectRef
function L6_6(A0_66)
	A0_66.x = round2(A0_66.x)
	A0_66.y = round2(A0_66.y)
	A0_66.r = round2(A0_66.r)
	if A0_66.sx ~= 0.5 then
		A0_66.sx = round2(A0_66.sx)
	end
	if A0_66.sy ~= 0.5 then
		local L2_67 = round2(A0_66.sy)
		A0_66.sy = L2_67
	end
	A0_66.pack = nil
end
L5_5.pack = L6_6
L5_5 = {}
L5_5.objectId1 = 0
L5_5.objectId2 = 0
JointRef = L5_5
L5_5 = {}
L6_6 = JointRef
L5_5.__index = L6_6
JointRef_mt = L5_5
function L5_5(A0_68)
	local L1_69
	L1_69 = {}
	local L2_70 = L2_70
	local L3_71 = L3_71
	local L4_72 = L4_72
	L1_69[1] = L2_70
	L1_69[2] = L3_71
	L1_69[3] = L4_72
	local L1_69[4], L5_73 = A0_68.cd, L5_73
	return L1_69
end
function L6_6(A0_74, A1_75, A2_76)
	local L3_77, L4_78
	L3_77 = {}
	L3_77.t = A0_74
	L3_77.ct = "dc"
	L3_77.oid = A1_75
	if A2_76 then
		L3_77.cd = A2_76
	end
	function L4_78()
		local L0_79
		L0_79 = _ENV
		local L1_80 = L1_80
		local L1_80, L2_81 = L1_80(_ENV.t), L2_81
		L0_79.t = L1_80
		L0_79 = _ENV
		L0_79.pack = nil
	end
	L3_77.pack = L4_78
	L4_78 = _ENV
	L3_77.serialize = L4_78
	return L3_77
end
newDeletionChange = L6_6
function L6_6(A0_82)
	local L1_83
	L1_83 = {}
	local L5_87 = L5_87
	local L6_88 = L6_88
	local L7_89 = L7_89
	local L8_90 = L8_90
	L1_83[1] = L5_87
	L1_83[2] = L6_88
	L1_83[3] = L7_89
	L1_83[4] = L8_90
	L1_83[5] = A0_82.y
	L1_83[6] = A0_82.r
	L1_83[7] = _ENV(A0_82.bt)
	local L1_83[8], L9_91 = A0_82.cd, L9_91
	L5_87 = #L1_83
	if L5_87 == 7 then
		L5_87 = L1_83[7]
		if L5_87 == nil then
			L5_87 = table
			L5_87 = L5_87.remove
			L6_88 = L1_83
			L7_89 = 7
			L5_87(L6_88, L7_89)
			repeat
				do break end -- pseudo-goto
				L5_87 = #L1_83
				if L5_87 == 8 then
					L5_87 = L1_83[7]
					if L5_87 == nil then
						L1_83[7] = -1
					end
				end
			until true
		end
	end
	return L1_83
end
function L7_7(A0_92, A1_93, A2_94, A3_95, A4_96, A5_97, A6_98)
	local L7_99, L8_100
	L7_99 = {}
	L7_99.t = A0_92
	L7_99.ct = "pc"
	L7_99.oid = A1_93
	L7_99.x = A2_94
	L7_99.y = A3_95
	L7_99.r = A4_96
	L7_99.bt = A5_97
	if A6_98 then
		L7_99.cd = A6_98
	end
	function L8_100()
		local L0_101
		L0_101 = _ENV
		L0_101.t = round2(_ENV.t)
		L0_101 = _ENV
		L0_101.x = round2(_ENV.x)
		L0_101 = _ENV
		L0_101.y = round2(_ENV.y)
		L0_101 = _ENV
		local L1_102 = L1_102
		local L1_102, L2_103 = L1_102(_ENV.r), L2_103
		L0_101.r = L1_102
		L0_101 = _ENV
		L0_101.pack = nil
	end
	L7_99.pack = L8_100
	L8_100 = _ENV
	L7_99.serialize = L8_100
	return L7_99
end
newPositionChange = L7_7
function L7_7(A0_104)
	local L1_105
	L1_105 = {}
	local L2_106 = L2_106
	local L3_107 = L3_107
	local L4_108, L5_109 = A0_104.ref:serialize()
	L1_105[1] = L2_106
	L1_105[2] = L3_107
	L1_105[3] = L4_108
	L1_105[4] = L5_109
	return L1_105
end
function L8_8(A0_110, A1_111)
	local L2_112, L3_113
	L2_112 = {}
	L2_112.t = A0_110
	L2_112.ct = "ac"
	L2_112.ref = A1_111
	function L3_113()
		local L2_116 = L2_116
		L2_116.t = round2(_ENV.t)
		L2_116 = _ENV
		L2_116 = L2_116.ref
		L2_116 = L2_116.pack
		L2_116(L2_116)
		local L1_115 = L1_115
		L2_116 = _ENV
		L2_116.pack = nil
	end
	L2_112.pack = L3_113
	L3_113 = _ENV
	L2_112.serialize = L3_113
	return L2_112
end
newAdditionChange = L8_8
function L8_8(A0_117)
	local L1_118
	L1_118 = {}
	local L2_119 = L2_119
	local L3_120 = L3_120
	local L4_121 = L4_121
	L1_118[1] = L2_119
	L1_118[2] = L3_120
	L1_118[3] = L4_121
	local L1_118[4], L5_122 = A0_117.c, L5_122
	return L1_118
end
function newCommandChange(A0_123, A1_124, A2_125)
	local L3_126, L4_127
	L3_126 = {}
	L3_126.t = A0_123
	L3_126.ct = "c"
	L3_126.cid = A1_124
	L3_126.c = A2_125
	L4_127 = _ENV
	L3_126.serialize = L4_127
	return L3_126
end
;({}).scanInterval = 500
;({}).startTrackTime = 0
;({}).trackTime = 0
local L9_9 = L9_9
local L10_10 = L10_10
local L11_11 = L11_11
local L10_10.level, L12_12 = nil, L12_12
L10_10.changeThreshold = 25
L10_10[1] = L11_11
L10_10[2] = L12_12
L10_10[3] = mediumTrackingList
L10_10[4] = fastTrackingList
ChangeSet = L10_10
L10_10 = {}
L11_11 = ChangeSet
L10_10.__index = L11_11
ChangeSet_mt = L10_10
L10_10 = ChangeSet
function L11_11(A0_128, A1_129, A2_130, A3_131, A4_132)
	local L5_133, L6_134, L7_135, L8_136
	L5_133 = A2_130 or nil
	if not A2_130 then
		L5_133 = 500
	end
	L6_134 = A3_131 or L6_134
	if not A3_131 then
		L6_134 = 25
	end
	L7_135 = A4_132 or L7_135
	if not A4_132 then
		L7_135 = 1000
	end
	L8_136 = {}
	L8_136.scanInterval = L5_133
	L8_136.level = A1_129
	L8_136.changeThreshold = L6_134
	L8_136.autoStopThreshold = L7_135
	L8_136.changes = {}
	L8_136.slowTrackingList, ({}).name = {}, "slow"
	L8_136.mediumTrackingList, ({}).name = {}, "medium"
	L8_136.fastTrackingList, ({}).name = {}, "fast"
	L8_136.deletionList = {}
	local L9_137 = L9_137
	local L10_138 = L10_138
	L9_137(L10_138, ChangeSet_mt)
	local L11_139 = L11_139
	return L8_136
end
L10_10.new = L11_11
L10_10 = ChangeSet
function L11_11(A0_140)
	repeat
		local L1_141 = system.getTimer()
		if A0_140.lastEventTime then
			local L2_142 = L2_142
			local L3_143 = L3_143
			local L2_142, L4_144 = L2_142(L3_143, 2000), L4_144
			L3_143 = A0_140.lastRecordedEventTime
			L2_142 = L2_142 + L3_143
			A0_140.lastEventTime = L1_141
			A0_140.lastRecordedEventTime = L2_142
			do return L2_142 end
			break -- pseudo-goto
		end
		A0_140.lastEventTime = L1_141
		A0_140.lastRecordedEventTime = 0
		L2_142 = 0
		return L2_142
	until true
end
L10_10.newEventTime = L11_11
L10_10 = ChangeSet
function L11_11(A0_145, A1_146)
	local L4_149 = L4_149
	if A1_146.isBullet then
		L4_149 = A0_145.fastTrackingList
		return L4_149
	end
	L4_149 = A1_146.getLinearVelocity
	if not L4_149 then
		L4_149 = A0_145.slowTrackingList
		return L4_149
	end
	L4_149 = A1_146.getLinearVelocity
	local L4_149, L3_148 = L4_149(A1_146)
	local L5_150 = L5_150
	local L6_151 = L6_151
	local L7_152 = math.abs(L3_148)
	L5_150 = L5_150(L6_151, L7_152, math.abs(L3_148))
	if 100 < L5_150 then
		L6_151 = A0_145.fastTrackingList
		return L6_151
	elseif 20 < L5_150 then
		L6_151 = A0_145.mediumTrackingList
		return L6_151
	else
		L6_151 = A0_145.slowTrackingList
		return L6_151
	end
end
L10_10.getAppropriateList = L11_11
L10_10 = ChangeSet
function L11_11(A0_153, A1_154, A2_155)
	local L3_156
	A1_154[A2_155] = 1
	L3_156 = A0_153.fastTrackingList
	if A1_154 == L3_156 then
		L3_156 = A0_153.slowTrackingList
		L3_156[A2_155] = nil
		L3_156 = A0_153.mediumTrackingList
		L3_156[A2_155] = nil
	else
		L3_156 = A0_153.mediumTrackingList
		if A1_154 == L3_156 then
			L3_156 = A0_153.slowTrackingList
			L3_156[A2_155] = nil
			L3_156 = A0_153.fastTrackingList
			L3_156[A2_155] = nil
		else
			L3_156 = A0_153.mediumTrackingList
			L3_156[A2_155] = nil
			L3_156 = A0_153.fastTrackingList
			L3_156[A2_155] = nil
		end
	end
end
L10_10.addToList = L11_11
L10_10 = ChangeSet
function L11_11(A0_157, A1_158)
	A0_157:track(A1_158.object1, false)
	local L4_159 = L4_159
	L4_159(A0_157, A1_158.object2, false)
	local L5_160 = L5_160
end
L10_10.postCollision = L11_11
L10_10 = ChangeSet
function L11_11(A0_161)
	local L1_162
	L1_162 = A0_161.fastTrackingList
	A0_161.startTrackTime = system.getTimer()
	A0_161:prepTrackChanges()
	local L2_163 = L2_163
	A0_161.lastSignificantChangeTime = nil
	L2_163 = 0
	function monitor(A0_168)
		local L1_169
		function L1_169(A0_173)
			local L1_174, L2_175, L3_176
			L1_174 = {}
			L2_175 = 0
			L3_176 = 0
			L7_180 = pairs
			L8_181 = A0_173
			L7_180, L8_181, _FOR_ = L7_180(L8_181)
			for _FORV_7_, _FORV_8_ in L7_180, L8_181, _FOR_ do
				if _ENV:track(_FORV_7_, false) and _ENV.lastSignificantChangeTime then
					_ENV.lastSignificantChangeTime = system.getTimer()
				end
				if _ENV:track(_FORV_7_, false) and _ENV:track(_FORV_7_, false) ~= A0_173 then
					L1_174[_FORV_7_] = _ENV:track(_FORV_7_, false)
					L3_176 = L3_176 + 1
				end
				L2_175 = L2_175 + 1
			end
			L7_180 = pairs
			L8_181 = L1_174
			L7_180, L8_181, _FOR_ = L7_180(L8_181)
			for _FORV_7_, _FORV_8_ in L7_180, L8_181, _FOR_ do
				_ENV:addToList(_FORV_8_, _FORV_7_)
				local L12_185 = L12_185
			end
		end
		L1_169(_ENV.fastTrackingList)
		if L2_163 % 2 == 0 then
			L1_169(_ENV.mediumTrackingList)
		end
		if L2_163 % 4 == 0 then
			L1_169(_ENV.slowTrackingList)
		end
		if not (not _ENV.forceStop or _ENV.firstSignificantChangeTime) or _ENV.lastSignificantChangeTime and system.getTimer() - _ENV.lastSignificantChangeTime > 3000 or _ENV.firstSignificantChangeTime and system.getTimer() - _ENV.firstSignificantChangeTime > 20000 then
			_ENV:endTrackChanges()
		else
			local L2_170 = L2_170
			local L3_171 = L3_171
			L2_170(L3_171, monitor)
			local L4_172 = L4_172
		end
		L2_170 = L2_163
		L2_170 = L2_170 + 1
		L2_163 = L2_170
	end
	timer.performWithDelay(A0_161.scanInterval, monitor)
	local L3_164, L4_165 = L3_164, L4_165
	local L5_166 = L5_166
	L3_164(L4_165, L5_166, A0_161)
	local L6_167 = L6_167
end
L10_10.startTrackChanges = L11_11
L10_10 = ChangeSet
function L11_11(A0_186)
	A0_186.lastSignificantChangeTime = system.getTimer()
	A0_186.firstSignificantChangeTime = A0_186.lastSignificantChangeTime
end
L10_10.startTimer = L11_11
L10_10 = ChangeSet
function L11_11(A0_187)
	local L1_188
	A0_187.lastSignificantChangeTime = nil
end
L10_10.pauseTimer = L11_11
L10_10 = ChangeSet
function L11_11(A0_189, A1_190, A2_191)
	if A1_190 == "talk" then
		table.insert(A0_189.changes, newCommandChange(A0_189:newEventTime(), A1_190, A2_191))
	elseif A1_190 == "surrender" or A1_190 == "win" then
		local L5_194 = L5_194
		local L6_195 = L6_195
		local L7_196 = L7_196
		local L7_196, L8_197 = L7_196(A0_189:newEventTime(), A1_190, A2_191)
		L5_194(L6_195, L7_196, L8_197, L7_196(A0_189:newEventTime(), A1_190, A2_191))
		L6_195 = A0_189
		L5_194 = A0_189.startTimer
		L5_194(L6_195)
	end
end
L10_10.trackCommand = L11_11
L10_10 = ChangeSet
function L11_11(A0_198, A1_199)
	A1_199.trackingLastX = nil
	A1_199.trackingLastY = nil
	A1_199.trackingRef = nil
	A1_199.updateTracking = nil
	if A0_198.level.counter then
		local L2_200, L3_201 = L2_200, L3_201
		L2_200(L3_201, A1_199)
		local L4_202 = L4_202
	end
end
L10_10.untrack = L11_11
L10_10 = ChangeSet
function L11_11(A0_203, A1_204, A2_205)
	local L3_206, L4_207, L5_208, L6_209
	L3_206 = A0_203.changes
	L3_206 = #L3_206
	L4_207 = A0_203.autoStopThreshold
	if L3_206 > L4_207 then
		A0_203.forceStop = true
	end
	L3_206 = A2_205 or L3_206
	if not A2_205 then
		L3_206 = A1_204.eagerTracking
	end
	L4_207 = A1_204.objectId
	if L4_207 == nil then
		L5_208 = false
		return L5_208
	end
	L5_208 = nil
	L6_209 = nil
	if A1_204.parent == nil or A1_204.forceRemove then
		if A1_204.trackingRef then
			if objectTemplates.deltaHelpers[A1_204.templateId] then
			end
			L6_209 = newDeletionChange(A0_203:newEventTime(), L4_207, (objectTemplates.deltaHelpers[A1_204.templateId](A1_204, true)))
			A0_203.deletionList[L4_207] = L6_209
			A0_203:untrack(A1_204)
			A0_203.slowTrackingList[A1_204] = nil
			A0_203.mediumTrackingList[A1_204] = nil
			A0_203.fastTrackingList[A1_204] = nil
		end
	else
		if A1_204.parent and A1_204.trackingRef == nil then
			if not A1_204.neighbourIds then
			end
			if objectTemplates.serializeHelpers[A1_204.templateId] then
			end
			local L18_221 = L18_221
			local L19_222 = L19_222
			local L20_223 = L20_223
			local L21_224 = L21_224
			local L22_225 = L22_225
			local L20_223, L23_226 = L20_223(L21_224, L22_225, A1_204.parent.groupId, A1_204.x, A1_204.y, A1_204.rotation, A1_204.xScale, A1_204.yScale, A1_204.ownerId, A1_204.templateId, A1_204.bodyType, A1_204.playerId, L18_221, L19_222), L23_226
			L21_224 = newAdditionChange
			L23_226 = A0_203
			L22_225 = A0_203.newEventTime
			L22_225 = L22_225(L23_226)
			L23_226 = L20_223
			L21_224 = L21_224(L22_225, L23_226)
			L6_209 = L21_224
			L22_225 = A0_203
			L21_224 = A0_203.addToList
			L23_226 = A0_203.fastTrackingList
			L21_224(L22_225, L23_226, A1_204)
			L21_224 = A1_204.x
			A1_204.trackingLastX = L21_224
			L21_224 = A1_204.y
			A1_204.trackingLastY = L21_224
			A1_204.trackingRef = L20_223
			L21_224 = A1_204.bodyType
			A1_204.trackingLastBodyType = L21_224
			break -- pseudo-goto
		end
		L18_221 = A1_204.parent
		if L18_221 and not L3_206 then
			L18_221 = A1_204.suppressNormalTracking
			if L18_221 then
		end
		else
			L18_221 = A1_204.parent
			if L18_221 then
				if L3_206 then
					L18_221 = objectTemplates
					L18_221 = L18_221.deltaHelpers
					L19_222 = A1_204.templateId
					L18_221 = L18_221[L19_222]
					if L18_221 then
						L18_221 = objectTemplates
						L18_221 = L18_221.deltaHelpers
						L19_222 = A1_204.templateId
						L18_221 = L18_221[L19_222]
						L19_222 = A1_204
						L20_223 = false
						L18_221 = L18_221(L19_222, L20_223)
						if L18_221 then
							goto lbl_183
						end
					end
				end
				if L3_206 then
					L18_221 = math
					L18_221 = L18_221.round
					L19_222 = A1_204.x
					L20_223 = A1_204.trackingLastX
					L19_222 = L19_222 - L20_223
					L18_221 = L18_221(L19_222)
					if L18_221 ~= 0 then
						L18_221 = math
						L18_221 = L18_221.round
						L19_222 = A1_204.y
						L20_223 = A1_204.trackingLastY
						L19_222 = L19_222 - L20_223
						L18_221 = L18_221(L19_222)
						if L18_221 ~= 0 then
							goto lbl_183
						end
					end
				end
				L18_221 = math
				L18_221 = L18_221.abs
				L19_222 = A1_204.x
				L20_223 = A1_204.trackingLastX
				L19_222 = L19_222 - L20_223
				L18_221 = L18_221(L19_222)
				L19_222 = A0_203.changeThreshold
				if not (L18_221 > L19_222) then
					L18_221 = math
					L18_221 = L18_221.abs
					L19_222 = A1_204.y
					L20_223 = A1_204.trackingLastY
					L19_222 = L19_222 - L20_223
					L18_221 = L18_221(L19_222)
					L19_222 = A0_203.changeThreshold
					if not (L18_221 > L19_222) then
						goto lbl_252
					end
				end
				::lbl_183::
				L18_221 = nil
				L19_222 = A1_204.bodyType
				if L19_222 then
					L19_222 = A1_204.bodyType
					L20_223 = A1_204.trackingLastBodyType
					if L19_222 ~= L20_223 then
						L18_221 = A1_204.bodyType
						A1_204.trackingLastBodyType = L18_221
					end
				end
				L19_222 = nil
				L20_223 = objectTemplates
				L20_223 = L20_223.deltaHelpers
				L21_224 = A1_204.templateId
				L20_223 = L20_223[L21_224]
				if L20_223 then
					L20_223 = objectTemplates
					L20_223 = L20_223.deltaHelpers
					L21_224 = A1_204.templateId
					L20_223 = L20_223[L21_224]
					L21_224 = A1_204
					L22_225 = true
					L20_223 = L20_223(L21_224, L22_225)
					L19_222 = L20_223
				end
				L20_223 = objectTemplates
				L20_223 = L20_223.positionHelpers
				L21_224 = A1_204.templateId
				L20_223 = L20_223[L21_224]
				if L20_223 then
					L20_223 = objectTemplates
					L20_223 = L20_223.positionHelpers
					L21_224 = A1_204.templateId
					L20_223 = L20_223[L21_224]
					L21_224 = A1_204
					L20_223 = L20_223(L21_224)
					L21_224 = newPositionChange
					L23_226 = A0_203
					L22_225 = A0_203.newEventTime
					L22_225 = L22_225(L23_226)
					L23_226 = L4_207
					L21_224 = L21_224(L22_225, L23_226, L20_223.x, L20_223.y, L20_223.rotation, L18_221, L19_222)
					L6_209 = L21_224
					break -- pseudo-goto
				end
				L20_223 = newPositionChange
				L22_225 = A0_203
				L21_224 = A0_203.newEventTime
				L21_224 = L21_224(L22_225)
				L22_225 = L4_207
				L23_226 = A1_204.x
				L20_223 = L20_223(L21_224, L22_225, L23_226, A1_204.y, A1_204.rotation, L18_221, L19_222)
				repeat
					L6_209 = L20_223
				until true
				L20_223 = A1_204.x
				A1_204.trackingLastX = L20_223
				L20_223 = A1_204.y
				A1_204.trackingLastY = L20_223
				L21_224 = A0_203
				L20_223 = A0_203.getAppropriateList
				L22_225 = A1_204
				L20_223 = L20_223(L21_224, L22_225)
				repeat
					L5_208 = L20_223
					do break end -- pseudo-goto
					::lbl_252::
					L18_221 = A1_204.isBullet
					if not L18_221 then
						L5_208 = A0_203.slowTrackingList
					end
				until true
			end
		end
	end
	if L6_209 then
		L18_221 = table
		L18_221 = L18_221.insert
		L19_222 = A0_203.changes
		L20_223 = L6_209
		L18_221(L19_222, L20_223)
		L18_221 = true
		L19_222 = L5_208
		return L18_221, L19_222
	end
	L18_221 = false
	L19_222 = L5_208
	return L18_221, L19_222
end
L10_10.track = L11_11
L10_10 = ChangeSet
function L11_11(A0_227)
	local L6_233 = physics.pause
	L6_233()
	function L6_233(A0_239)
		local L2_240 = L2_240
		local L3_241 = L3_241
		L2_240(L3_241, A0_239, true)
		local L4_242 = L4_242
	end
	local L2_229 = A0_227.level.counter:highestObjectId()
	_FOR_ = 1
	for _FORV_6_ = _FOR_, _FOR_, _FOR_ do
		if A0_227.level.counter:object(_FORV_6_) and A0_227.level.counter:object(_FORV_6_).parent then
			A0_227:track(A0_227.level.counter:object(_FORV_6_), true)
			A0_227.level.counter:object(_FORV_6_).updateTracking = L6_233
		end
	end
	L8_235 = table
	L8_235 = L8_235.insert
	L9_236 = A0_227.changes
	L10_237 = {}
	L10_237.ct = "sf"
	L8_235(L9_236, L10_237)
	L8_235 = physics
	L8_235 = L8_235.start
	L8_235()
end
L10_10.prepTrackChanges = L11_11
L10_10 = ChangeSet
function L11_11(A0_243)
	if A0_243.finished then
		return
	end
	A0_243.finished = true
	Runtime:removeEventListener("postCollision", A0_243)
	A0_243.trackTime = A0_243:newEventTime()
	_FOR_ = 1
	for _FORV_4_ = _FOR_, _FOR_, _FOR_ do
		A0_243:track(A0_243.level.players[_FORV_4_], true)
	end
	local L1_244 = A0_243.level.counter:objects()
	L2_245, L3_246, _FOR_ = L2_245(L1_244)
	for _FORV_5_, _FORV_6_ in L2_245, L3_246, _FOR_ do
		A0_243:track(_FORV_6_, true)
	end
	L2_245 = {}
	A0_243.slowTrackingList = L2_245
	L2_245 = {}
	A0_243.mediumTrackingList = L2_245
	L2_245 = {}
	A0_243.fastTrackingList = L2_245
	L2_245 = A0_243.onData
	if not L2_245 then
		function L2_245(A0_255)
			local L1_256
			L1_256 = print
			local L2_257 = L2_257
			local L2_257, L3_258 = L2_257(A0_255)
			L1_256(L2_257, L3_258)
		end
	end
	L3_246 = false
	L7_250 = 1
	_FOR_ = 1
	for _FORV_7_ = L7_250, _FOR_, _FOR_ do
		if A0_243.changes[_FORV_7_].ct == "ac" and L3_246 then
			if A0_243.deletionList[A0_243.changes[_FORV_7_].ref.oid] and A0_243.deletionList[A0_243.changes[_FORV_7_].ref.oid].t - A0_243.changes[_FORV_7_].t < 250 then
				A0_243.deletionList[A0_243.changes[_FORV_7_].ref.oid].remove = true
			end
		elseif (nil).ct == "dc" and L3_246 then
			if (nil).remove then
			end
		else
			if (nil).ct == "pc" and L3_246 then
				if not (A0_243.deletionList[(nil).oid] and A0_243.deletionList[(nil).oid].remove) then
					goto lbl_108
				end
				break -- pseudo-goto
			end
			repeat
				if (nil).ct == "sf" then
					L3_246 = true
				end
			until true
		end
		::lbl_108::
		if nil then
			if (nil).pack then
				(nil).pack()
			end
			if (nil).serialize then
				L2_245((nil):serialize())
				break -- pseudo-goto
			end
			L2_245(nil)
			local L10_253 = L10_253
		end
		repeat
		until true
	end
	L7_250 = {}
	A0_243.changes = L7_250
	L7_250 = {}
	A0_243.deletionList = L7_250
	L7_250 = A0_243.level
	L7_250.changeSet = nil
	L7_250 = A0_243.onComplete
	if L7_250 then
		L7_250 = A0_243.onComplete
		L7_250()
	end
end
L10_10.endTrackChanges = L11_11
function L10_10(A0_259, A1_260, A2_261)
	local L3_262, L4_263, L5_264, L6_265, L7_266, L8_267, L9_268
	function L3_262()
		return system.getTimer()
	end
	L4_263 = A1_260.counter
	L5_264 = nil
	L6_265 = {}
	L7_266 = {}
	L8_267 = {}
	L9_268 = true
	L13_272 = A0_259
	L21_280 = nil
	L22_281 = nil
	for L23_282 in L13_272, L21_280, L22_281 do
		L6_265[#L6_265 + 1] = L9_9((_ENV.decode(L23_282)))
		if L9_9((_ENV.decode(L23_282))).ct == "pc" then
			if not L9_9((_ENV.decode(L23_282))).oid then
			end
			if not L7_266[L9_9((_ENV.decode(L23_282))).ref.oid] then
				local L7_266[L9_9((_ENV.decode(L23_282))).ref.oid], L16_275 = {}, L16_275
			end
			local L17_276 = L17_276
			local L18_277 = L18_277
			local L19_278 = L19_278
			L19_278({}, 1, L16_275)
			local L20_279 = L20_279
		end
	end
	L13_272 = L3_262
	L13_272 = L13_272()
	L21_280 = 50
	L22_281 = {}
	L23_282 = {}
	function L16_275(A0_284, A1_285)
		local L2_286
		if not A1_285 then
			return
		end
		A0_284.bodyType = A1_285
		L2_286 = _ENV
		L2_286[A0_284] = true
	end
	function L17_276(A0_287)
		local L1_288, L2_289
		local L5_292, L3_290, L9_296 = A0_287, L3_290, L9_296
		L3_290 = L3_290(L5_292)
		if L3_290 == "table" then
			L1_288 = A0_287.oid
			L2_289 = A0_287
		else
			L1_288 = A0_287
			L2_289 = nil
		end
		L3_290 = _ENV
		L3_290 = L3_290[L1_288]
		if L3_290 then
			L5_292 = #L3_290
			L6_293 = 1
			L7_294 = -1
			for L8_295 = L5_292, L6_293, L7_294 do
				L9_296 = L3_290[L8_295]
				if L9_296 == L2_289 then
					L3_290[L8_295] = nil
				else
					L9_296 = L3_290[L8_295]
					if L9_296 then
						L9_296 = L3_290[L8_295]
						L10_297 = L9_296.processed
						if not L10_297 then
							L10_297 = 1
							L11_298 = #L3_290
							L12_299 = 1
							for L13_300 = L10_297, L11_298, L12_299 do
								if L3_290[L13_300] then
									L3_290[L13_300].processed = true
								end
							end
						end
						L3_290[L8_295] = nil
						return L9_296
					end
				end
			end
		end
		L5_292 = nil
		return L5_292
	end
	function L18_277(A0_301, A1_302)
		if A1_302.cd then
			_FOR_, _FOR_, _FOR_ = pairs(A1_302.cd)
			for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
				A0_301[_FORV_5_] = _FORV_6_
			end
			L4_305 = A0_301.refreshProperties
			if L4_305 then
				L4_305 = A0_301.refreshProperties
				L4_305(A0_301)
				local L3_304 = L3_304
			end
		end
	end
	function L19_278(A0_306)
		local L1_307
		L1_307 = A0_306.objectId
		local L4_310, L5_311, L6_312 = _ENV, L5_311, L6_312
		L5_311 = L1_307
		L4_310 = L4_310(L5_311)
		if L4_310 then
			L5_311 = L3_262
			L5_311 = L5_311()
			L6_312 = L10_269
			L5_311 = L5_311 - L6_312
			L6_312 = L4_310.t
			L6_312 = L6_312 - L5_311
			if L6_312 < 2000 then
				if 1000 < L6_312 then
				end
				L4_310.processed = true
				L16_275(A0_306, L4_310.bt)
				;({}).transition = easing.outExpo
				;({}).time = L6_312
				;({}).x = L4_310.x
				;({}).y = L4_310.y
				local ({}).onComplete, ({}).rotation, L10_316 = function()
					local L4_321 = L4_321
					local L4_321.x, L5_322.y, _ENV.rotation, L5_322 = L2_308.x, L2_308.y, L2_308.r, L5_322
					L4_321 = L18_277
					L5_322 = _ENV
					L4_321(L5_322, L2_308)
					L4_321 = _ENV
					L4_321 = L4_321.moveTo
					if L4_321 then
						L4_321 = _ENV
						L5_322 = L4_321
						L4_321 = L4_321.moveTo
						L4_321(L5_322, L2_308.x, L2_308.y)
					end
					L4_321 = L19_278
					L5_322 = _ENV
					L4_321(L5_322)
				end, L4_310.r, L10_316
				transition.to(A0_306, {})
				break -- pseudo-goto
			end
			local L8_314 = L8_314
			repeat
				timer.performWithDelay(L6_312 - 1500, function()
					local L0_323 = L0_323
					local L1_324 = L1_324
					;({}).transition = L7_313
					;({}).time = 500
					;({}).x = L2_308.x
					;({}).y = L2_308.y
					;({}).rotation = L2_308.r
					local ({}).onComplete, L3_326 = L8_314, L3_326
					L0_323(L1_324, L3_326)
				end)
			until true
		end
	end
	function L20_279(A0_327)
		local L1_328
		if true then
			L1_328 = A0_327.oid
			local L2_329 = L2_329
			L2_329 = L2_329(_ENV, L1_328)
			if L2_329 then
				if L2_329.moveTo then
					L2_329:moveTo(A0_327.x, A0_327.y)
					local L6_333 = L6_333
					repeat
						do break end -- pseudo-goto
						L6_333 = A0_327.x
						L2_329.x = L6_333
						L6_333 = A0_327.y
						L2_329.y = L6_333
					until true
				end
				L6_333 = A0_327.r
				L2_329.rotation = L6_333
				L6_333 = L18_277
				L6_333(L2_329, A0_327)
				L6_333 = L16_275
				L6_333(L2_329, A0_327.bt)
				L6_333 = L19_278
				L6_333(L2_329)
			end
		else
			L6_333 = print
			local L4_331 = L4_331
			L6_333(L4_331, A0_327)
			local L5_332 = L5_332
		end
	end
	;(function()
		if _ENV then
			L3_337 = L3_262
			L3_337 = L3_337()
			L3_337 = L3_337 - L10_269
			if L3_337 > _ENV.t then
				L3_337 = _ENV
				L3_337 = L3_337.processed
				if not L3_337 then
					L3_337 = _ENV
					L3_337.processed = true
					L3_337 = _UPVALUE3_
					L3_337(_ENV)
				end
				L3_337 = nil
				_ENV = L3_337
			else
				L3_337 = timer
				L3_337 = L3_337.performWithDelay
				L3_337(L12_271, _UPVALUE5_)
				return
			end
		end
		L3_337 = _UPVALUE6_
		_FOR_ = 1
		for _FORV_3_ = L3_337, _FOR_, _FOR_ do
			if L9_268 == false then
				function A1_260.resumePlayback()
					_ENV = nil
					A1_260.resumePlayback = nil
					local L2_347 = L2_347
					L2_347 = L2_347 + L6_265[_UPVALUE5_].t
					L10_269 = L2_347
					L2_347 = _UPVALUE6_
					L2_347()
				end
				return
			end
			if not (L9_268 ~= true and L6_265[_FORV_3_].t) or L3_262() - L10_269 > L6_265[_FORV_3_].t then
				if L6_265[_FORV_3_].processed then
				end
				if L6_265[_FORV_3_].processed then
					goto lbl_107
				end
				L6_265[_FORV_3_].processed = true
				if _UPVALUE3_(L6_265[_FORV_3_]) or L9_268 == false then
					goto lbl_107
				end
				timer.performWithDelay(1000, _UPVALUE5_)
				do break end
				break -- pseudo-goto
			end
			if L9_268 == nil then
				_ENV = L6_265[_FORV_3_]
				_UPVALUE6_ = _FORV_3_ + 1
				timer.performWithDelay(math.max(1, _ENV.t - (L3_262() - L10_269)), _UPVALUE5_)
				repeat
					return
				until true
			end
			::lbl_107::
		end
		L3_337 = pairs
		L4_338 = L15_274
		L3_337, L4_338, L10_344 = L3_337(L4_338)
		for L8_342, _FORV_4_ in L3_337, L4_338, L10_344 do
			if L8_342.neighbours and type(L8_342.neighbours) == "function" then
				L8_342.neighbours()
			end
		end
		L3_337 = A2_261
		if L3_337 then
			L3_337 = A2_261
			L3_337()
		end
	end)()
	local L24_283 = L24_283
	return L8_267
end
loadLevel = L10_10
