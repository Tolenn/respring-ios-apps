local L0_0, L1_1, L3_3, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L40_40, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58 = L0_0, (...), L3_3, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L40_40, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58
L3_3 = package
L3_3 = L3_3.seeall
L0_0(L1_1, L3_3)
L0_0 = display
L0_0 = L0_0.contentHeight
L1_1 = display
L1_1 = L1_1.contentWidth
L3_3 = L0_0
L7_7 = L1_1
L8_8 = require
L9_9 = "socket"
L8_8 = L8_8(L9_9)
L9_9 = require
L10_10 = "json"
L9_9 = L9_9(L10_10)
L10_10 = false
L11_11 = {}
L12_12 = {}
L13_13 = {}
L14_14 = {}
L15_15 = {}
L16_16 = {}
L17_17 = {}
L18_18 = {}
L19_19 = {}
L20_20 = {}
L19_19.system = L20_20
L20_20 = nil
L21_21 = nil
L22_22 = nil
L23_23 = nil
L24_24 = nil
L25_25 = nil
L26_26 = nil
L27_27 = nil
L28_28 = nil
L29_29 = nil
L30_30 = nil
L31_31 = nil
L40_40 = nil
L45_45 = 1
L46_46 = 1
L47_47 = {}
displayNet = L47_47
function L47_47(...)
	local L1_63
	L1_63 = _ENV
	L1_63 = L1_63.noDebug
	if not L1_63 then
		L1_63 = print
		local L2_64 = L2_64
		local L2_64, L3_65 = L2_64(arg)
		L1_63(L2_64, L3_65)
	end
end
L48_48 = system
L48_48 = L48_48.pathForFile
L49_49 = "UltimoteOptions.txt"
L50_50 = system
L50_50 = L50_50.DocumentsDirectory
L48_48 = L48_48(L49_49, L50_50)
L49_49 = io
L49_49 = L49_49.open
L50_50 = L48_48
L51_51 = "r"
L49_49 = L49_49(L50_50, L51_51)
if L49_49 then
	L51_51 = L49_49
	L50_50 = L49_49.read
	L52_52 = "*a"
	L50_50 = L50_50(L51_51, L52_52)
	L51_51 = L9_9.decode
	L52_52 = L50_50
	L51_51 = L51_51(L52_52)
	L15_15 = L51_51
	L51_51 = io
	L51_51 = L51_51.close
	L52_52 = L49_49
	repeat
		L51_51(L52_52)
		do break end -- pseudo-goto
		L15_15.noDebug = false
		L15_15.overrideSystem = true
		L15_15.sendAllObjects = false
		L15_15.noUDPBroadcast = false
		L15_15.fps = 30
	until true
end
function L50_50(A0_66)
	if A0_66.type ~= "applicationStart" then
		local L1_67 = L1_67
		L1_67 = L1_67("UltimoteOptions.txt", system.DocumentsDirectory)
		local L2_68 = L2_68
		L2_68 = L2_68(L1_67, "w")
		if L2_68 then
			local L5_71 = L5_71
			local L6_72 = L6_72
			L5_71(L6_72, _ENV.encode(L15_15))
			L5_71 = io
			L5_71 = L5_71.close
			L6_72 = L2_68
			L5_71(L6_72)
		end
	end
end
function L51_51()
	local L0_73 = L0_73
	L0_73 = L0_73("UltimoteOptions.txt", system.DocumentsDirectory)
	local L1_74 = L1_74
	L1_74 = L1_74(L0_73, "w")
	if L1_74 then
		local L4_77 = L4_77
		local L5_78 = L5_78
		L4_77(L5_78, _ENV.encode(L15_15))
		L4_77 = io
		L4_77 = L4_77.close
		L5_78 = L1_74
		L4_77(L5_78)
	end
end
L52_52 = Runtime
L53_53 = L52_52
L52_52 = L52_52.addEventListener
L54_54 = "system"
L55_55 = L50_50
L52_52(L53_53, L54_54, L55_55)
L52_52 = display
L53_53 = display
L53_53 = L53_53.getCurrentStage
L52_52.getCurrentStageNative = L53_53
L52_52 = display
L53_53 = display
L53_53 = L53_53.getCurrentStage
L53_53 = L53_53()
L53_53 = L53_53.setFocus
L52_52.setFocusNative = L53_53
L52_52 = display
function L53_53()
	local L1_80 = display.getCurrentStageNative
	L1_80 = L1_80()
	function L1_80.setFocus(A0_81, A1_82, A2_83)
		if A2_83 then
			_ENV[A2_83] = A1_82
		elseif L21_21 then
			_ENV[L21_21] = A1_82
		end
		local L3_84 = L3_84
		local L4_85 = L4_85
		local L5_86 = L5_86
		do return L3_84(L4_85, L5_86, A2_83) end
		local L6_87 = L6_87
	end
	return L1_80
end
L52_52.getCurrentStage = L53_53
function L52_52(A0_88)
	local L1_89
	L1_89 = _ENV
	L1_89 = L1_89.system
	L1_89.registerEvents = A0_88
	L11_11 = A0_88
end
registerEvents = L52_52
function L52_52()
	local L0_90, L1_91, L2_92
	L0_90 = system
	function L1_91()
		local L1_93
		L1_93 = true
		return L1_93
	end
	L0_90.hasEventSource = L1_91
	L0_90 = system
	L0_90 = L0_90.openURL
	L1_91 = system
	function L2_92(A0_94)
		if _ENV then
			L19_19.system.openURL = A0_94
		else
			local L1_95 = L1_95
			L1_95(A0_94)
			local L2_96 = L2_96
		end
	end
	L1_91.openURL = L2_92
	L1_91 = system
	function L2_92(A0_97)
		local L1_98
		L1_98 = _ENV
		L1_98 = L1_98.system
		L1_98.setAccelerometerInterval = A0_97
	end
	L1_91.setAccelerometerInterval = L2_92
	L1_91 = system
	function L2_92(A0_99)
		local L1_100
		L1_100 = _ENV
		L1_100 = L1_100.system
		L1_100.setGyroscopeInterval = A0_99
	end
	L1_91.setGyroscopeInterval = L2_92
	L1_91 = system
	function L2_92(A0_101)
		local L1_102
		L1_102 = _ENV
		L1_102 = L1_102.system
		L1_102.setIdleTimer = A0_101
	end
	L1_91.setIdleTimer = L2_92
	L1_91 = system
	function L2_92(A0_103)
		local L1_104
		L1_104 = _ENV
		L1_104 = L1_104.system
		L1_104.setLocationAccuracy = A0_103
	end
	L1_91.setLocationAccuracy = L2_92
	L1_91 = system
	function L2_92(A0_105)
		local L1_106
		L1_106 = _ENV
		L1_106 = L1_106.system
		L1_106.setLocationThreshold = A0_105
	end
	L1_91.setLocationThreshold = L2_92
	L1_91 = system
	function L2_92()
		local L0_107, L1_108
		L0_107 = _ENV
		L0_107 = L0_107.system
		L0_107.vibrate = true
	end
	L1_91.vibrate = L2_92
	L1_91 = system
	L2_92 = system
	L2_92 = L2_92.getInfo
	L1_91.getInfoNative = L2_92
	L1_91 = system
	function L2_92(A0_109)
		if _ENV.deviceInfo and _ENV.deviceInfo.getInfo ~= nil and _ENV.deviceInfo.getInfo[A0_109] ~= nil then
			return _ENV.deviceInfo.getInfo[A0_109]
		else
			local L1_110 = L1_110
			do return L1_110(A0_109) end
			local L2_111 = L2_111
		end
	end
	L1_91.getInfo = L2_92
	L1_91 = system
	function L2_92(A0_112, A1_113)
		local L2_114
		L2_114 = _ENV
		L2_114 = L2_114.getPreference
		L2_114 = L2_114[A0_112]
		L2_114 = L2_114[A1_113]
		return L2_114
	end
	L1_91.getPreference = L2_92
end
L53_53 = L15_15.overrideSystem
if L53_53 then
	L53_53 = L52_52
	L53_53()
end
function L53_53(A0_115, A1_116)
	local L3_118, L4_119 = _ENV.tcp, L4_119
	L3_118, L4_119 = L3_118()
	if L3_118 == nil then
		return nil, L4_119
	end
	L3_118:setoption("reuseaddr", true)
	L3_118:setoption("tcp-nodelay", true)
	local L5_120, L6_121 = L5_120, L6_121
	L6_121 = L6_121(L3_118, A0_115, A1_116)
	if L6_121 == nil then
		return nil, L6_121(L3_118, A0_115, A1_116)
	end
	local L7_122, L8_123 = L7_122, L8_123
	local L8_123, L9_124 = L8_123(L3_118, L5_120)
	L7_122 = L9_124
	L6_121 = L8_123
	if L6_121 == nil then
		L8_123 = nil
		L9_124 = L7_122
		return L8_123, L9_124
	end
	return L3_118
end
L54_54 = nil
L55_55 = nil
function L56_56(A0_125)
	local L1_126, L2_127, L3_128, L4_129
	L1_126 = A0_125.screenHeight
	if L1_126 then
		L1_126 = A0_125.screenHeight
		_ENV = L1_126
		L1_126 = A0_125.screenWidth
		L4_4 = L1_126
	end
	L1_126 = display
	L1_126 = L1_126.contentHeight
	L0_0 = L1_126
	L1_126 = display
	L1_126 = L1_126.contentWidth
	L1_1 = L1_126
	L1_126 = L0_0
	L2_127 = L1_1
	L1_126 = L1_126 > L2_127
	L2_127 = _ENV
	L3_128 = L4_4
	L2_127 = L2_127 > L3_128
	if L1_126 == L2_127 then
		L3_128 = true
		L30_30 = L3_128
	else
		L3_128 = false
		L30_30 = L3_128
	end
	L3_128 = _ENV
	L4_129 = L0_0
	L3_128 = L3_128 / L4_129
	L34_34 = L3_128
	L3_128 = L4_4
	L4_129 = L1_1
	L3_128 = L3_128 / L4_129
	L33_33 = L3_128
end
L57_57 = Runtime
L58_58 = L57_57
L57_57 = L57_57.addEventListener
L57_57(L58_58, "orientation", L56_56)
L57_57 = {}
function L58_58(A0_130)
	repeat
		if A0_130.phase == "began" then
			_ENV[A0_130.id] = display.newCircle(A0_130.x, A0_130.y, 20)
			local L6_136 = L6_136
			L6_136(_ENV[A0_130.id], math.random(155) + 100, math.random(155) + 100, math.random(155) + 100)
			L6_136 = transition
			L6_136 = L6_136.from
			;({}).time = 500
			;({}).xScale = 0.001
			;({}).yScale = 0.001
			;({}).transition = easing.outExpo
			L6_136(_ENV[A0_130.id], {})
			break -- pseudo-goto
		end
		L6_136 = A0_130.phase
		if L6_136 == "moved" then
			L6_136 = _ENV
			L6_136 = L6_136[A0_130.id]
			if not L6_136 then
				goto lbl_78
			end
			L6_136 = _ENV
			L6_136 = L6_136[A0_130.id]
			L6_136.x, _ENV[A0_130.id].y = A0_130.x, A0_130.y
			break -- pseudo-goto
		end
		L6_136 = A0_130.phase
		if L6_136 ~= "ended" then
			L6_136 = A0_130.phase
			if L6_136 ~= "cancelled" then
				goto lbl_78
			end
		end
		L6_136 = display
		L6_136 = L6_136.remove
		local L3_133 = _ENV[A0_130.id]
		L6_136(L3_133)
	until true
	::lbl_78::
end
function screenCapture(A0_137)
	local L1_138
	if A0_137 == nil then
		L1_138 = {}
		A0_137 = L1_138
	end
	L1_138 = A0_137.name
	if not L1_138 then
		L1_138 = "default.jpg"
	end
	display.save(display.getCurrentStage(), L1_138, system.DocumentsDirectory)
	local L5_142 = L5_142
	L5_142 = _ENV
	local L3_140 = L3_140
	L3_140[1] = A0_137.name
	L5_142(L3_140, true)
	local L4_141 = L4_141
end
function autoScreenCapture(A0_143)
	local L3_146 = L3_146
	if A0_143 == nil then
		L3_146 = {}
		A0_143 = L3_146
	end
	L3_146 = A0_143.name
	if not L3_146 then
		L3_146 = "default.jpg"
	end
	A0_143.name = L3_146
	L3_146 = A0_143.period
	if not L3_146 then
		L3_146 = 6000
	end
	A0_143.period = L3_146
	L3_146 = _ENV
	if L3_146 then
		L3_146 = timer
		L3_146 = L3_146.cancel
		L3_146(_ENV)
	end
	L3_146 = screenCapture
	L3_146(A0_143)
	L3_146 = timer
	L3_146 = L3_146.performWithDelay
	local L2_145 = L2_145
	local L3_146, L4_147 = L3_146(L2_145, function()
		if _ENV then
			screenCapture(A0_143)
			local L1_148 = L1_148
		end
	end, -1), L4_147
	_ENV = L3_146
end
function stopAutoScreenCapture()
	timer.cancel(_ENV)
	local L1_149 = L1_149
end
function playMacro(A0_150)
	local L1_151
	if A0_150 == nil then
		L1_151 = {}
		A0_150 = L1_151
	end
	L1_151 = A0_150.name
	if not L1_151 then
		L1_151 = "default"
	end
	local L2_152 = L2_152
	L2_152 = L2_152(L1_151 .. ".txt", system.DocumentsDirectory)
	local L3_153 = L3_153
	L3_153 = L3_153(L2_152, "r")
	if L3_153 == nil then
		L2_152 = system.pathForFile(L1_151 .. ".txt", system.ResourcesDirectory)
		L3_153 = io.open(L2_152, "r")
		if L3_153 == nil then
			_ENV("Macro " .. A0_150.name .. " not found, getting from device")
			;({})[1] = A0_150.name
			getMacros({})
			local L4_154 = L4_154
			L4_154(1000, function()
				local L0_159 = L0_159
				local ({}).name, L2_161 = _ENV.name, L2_161
				L0_159(L2_161)
			end)
			return
		end
	end
	L4_154 = 0
	_FOR_, _FOR_, _FOR_ = L3_153:lines()
	for _FORV_8_ in _FOR_, _FOR_, _FOR_ do
		L4_154 = L4_154 + 1
	end
	local L5_155 = L5_155
	L5_155(L3_153)
	L5_155 = L14_14
	L5_155[L1_151] = {}
	L5_155 = L14_14
	L5_155 = L5_155[L1_151]
	L5_155.name = L1_151
	L5_155 = L14_14
	L5_155 = L5_155[L1_151]
	local L6_156 = L6_156
	local L7_157 = L7_157
	local L6_156, L8_158 = L6_156(L7_157, "r"), L8_158
	L5_155.file = L6_156
	L5_155 = L14_14
	L5_155 = L5_155[L1_151]
	L5_155.frame = 0
	L5_155 = L14_14
	L5_155 = L5_155[L1_151]
	L5_155.totalFrames = L4_154
	L5_155 = L14_14
	L5_155 = L5_155[L1_151]
	L6_156 = A0_150.onComplete
	L5_155.onComplete = L6_156
end
function stopPlayingMacro(A0_162)
	local L1_163
	L1_163 = A0_162.name
	if not L1_163 then
		L1_163 = "default"
	end
	local L2_164 = L2_164
	L2_164(_ENV[L1_163].file)
	L2_164 = _ENV
	L2_164 = L2_164[L1_163]
	L2_164 = L2_164.onComplete
	_ENV[L1_163] = nil
	if L2_164 then
		local L3_165 = L3_165
		L3_165(L1_163)
		local L4_166 = L4_166
	end
end
function recordMacro(A0_167)
	local L1_168, L2_169
	if A0_167 == nil then
		L1_168 = {}
		A0_167 = L1_168
	end
	L1_168 = A0_167.name
	if not L1_168 then
		L1_168 = "default"
	end
	L2_169 = A0_167.frames
	if not L2_169 then
		L2_169 = 1000
	end
	local L3_170 = L3_170
	local L4_171 = L4_171
	L3_170 = L3_170(L4_171, system.DocumentsDirectory)
	L4_171 = _ENV
	L4_171[L1_168] = {}
	L4_171 = _ENV
	L4_171 = L4_171[L1_168]
	local L5_172 = L5_172
	local L6_173 = L6_173
	local L5_172, L7_174 = L5_172(L6_173, "w"), L7_174
	L4_171.file = L5_172
	L4_171 = _ENV
	L4_171 = L4_171[L1_168]
	L4_171.frames = 1
	L4_171 = _ENV
	L4_171 = L4_171[L1_168]
	L4_171.initFrames = L2_169
	L4_171 = _ENV
	L4_171 = L4_171[L1_168]
	L4_171.name = L1_168
	L4_171 = _ENV
	L4_171 = L4_171[L1_168]
	L5_172 = A0_167.onComplete
	L4_171.onComplete = L5_172
end
function stopRecordingMacro(A0_175)
	local L1_176
	L1_176 = A0_175.name
	if not L1_176 then
		L1_176 = "default"
	end
	local L2_177 = L2_177
	L2_177(_ENV[L1_176].file)
	L2_177 = _ENV
	L2_177 = L2_177[L1_176]
	L2_177 = L2_177.onComplete
	_ENV[L1_176] = nil
	if L2_177 then
		local L3_178 = L3_178
		L3_178(L1_176)
		local L4_179 = L4_179
	end
end
function getMacros(A0_180)
	L3_183 = _ENV.getMacros
	if L3_183 == nil then
		L3_183 = _ENV
		L4_184 = {}
		L3_183.getMacros = L4_184
	end
	L3_183 = ipairs
	L4_184 = A0_180
	L3_183, L4_184, L5_185 = L3_183(L4_184)
	for L6_186, L7_187 in L3_183, L4_184, L5_185 do
		_ENV.getMacros[#_ENV.getMacros + 1] = L7_187
	end
end
function connect()
	_ENV = true
	L26_26, _ = L43_43("*", 0)
	L27_27, L28_28 = L26_26:getsockname()
	local L2_190 = L2_190
	local L3_191 = L3_191
	L2_190(L3_191, L27_27, "server port= ", L28_28)
	local L4_192 = L4_192
	L2_190 = {}
	L2_190.version = "1.0"
	L2_190.application = "corona ultimote"
	L3_191 = L28_28
	L2_190.port = L3_191
	L29_29 = L2_190
	L2_190 = _UPVALUE6_
	L2_190()
end
function disconnect()
	local L1_193
	L1_193 = false
	_ENV = L1_193
end
local L59_59, L60_60 = L59_59, L60_60
local L61_61 = L61_61
Runtime:addEventListener("enterFrame", function()
	local L5_199 = display.getCurrentStageNative
	L5_199 = L5_199()
	_ENV = {}
	_UPVALUE1_(L5_199, _ENV)
	if L10_10 then
		_UPVALUE3_()
		_UPVALUE4_()
		local L1_195 = L1_195
	end
	L1_195 = "connected. "
	L24_24 = L1_195
	L1_195 = false
	_FOR_, _FOR_, _FOR_ = pairs(L14_14)
	for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
		L1_195 = true
		if _FORV_6_.data == nil then
			if _FORV_6_.file:read("*l") then
				_FORV_6_.data = L6_6.decode((_FORV_6_.file:read("*l")))
			end
			if _FORV_6_.frame == 0 then
				_FORV_6_.fpsFraction = _FORV_6_.data.fps / L15_15.fps
				if _FORV_6_.file:read("*l") then
					_FORV_6_.data = L6_6.decode((_FORV_6_.file:read("*l")))
				end
			end
		end
		_FORV_6_.frame = _FORV_6_.frame + _FORV_6_.fpsFraction
		L35_35("playing " .. _FORV_6_.name .. " frame #" .. _FORV_6_.frame)
		if _FORV_6_.data and _FORV_6_.data.frameNum <= _FORV_6_.frame then
			_UPVALUE10_(_FORV_6_.data)
			L24_24 = L24_24 .. "play macro " .. _FORV_5_ .. " frame " .. _FORV_6_.frame .. "/" .. _FORV_6_.totalFrames .. " . "
			if _FORV_6_.file:read("*l") then
				_FORV_6_.data = L6_6.decode((_FORV_6_.file:read("*l")))
			else
				({}).name = _FORV_5_
				stopPlayingMacro({})
			end
		end
	end
	L14_208 = _UPVALUE11_
	if L14_208 == _UPVALUE12_ then
		L14_208 = pairs
		L14_208, _FOR_, _FOR_ = L14_208(L12_12)
		for _FORV_5_, _FORV_6_ in L14_208, _FOR_, _FOR_ do
			L24_24 = L24_24 .. "record macro " .. _FORV_5_
			if _FORV_6_.frames then
				L35_35("recording " .. _FORV_6_.name .. " frame #" .. _FORV_6_.frames)
				if _FORV_6_.frames == 1 then
					({}).fps = L15_15.fps
					_FORV_6_.file:write(L6_6.encode({}) .. "\n")
				end
				L24_24 = L24_24 .. " frame " .. _FORV_6_.frames .. "/" .. _FORV_6_.initFrames
				if next(L23_23.events) ~= nil then
					({}).events = L23_23.events
					;({}).frameNum = _FORV_6_.frames
					_FORV_6_.file:write(L6_6.encode({}) .. "\n")
				end
				_FORV_6_.frames = _FORV_6_.frames + 1
				if _FORV_6_.frames == _FORV_6_.initFrames then
					({}).name = _FORV_5_
					stopRecordingMacro({})
				end
			end
			L24_24 = L24_24 .. ". "
		end
		L14_208 = L23_23
		if L14_208 then
			L14_208 = _UPVALUE15_
			L7_201 = L23_23
			L14_208(L7_201)
			L14_208 = L23_23
			L14_208 = L14_208.screenWidth
			if L14_208 then
				L14_208 = L23_23
				L14_208 = L14_208.screenHeight
				if L14_208 then
					L14_208 = L56_56
					L7_201 = L23_23
					L14_208(L7_201)
				end
			end
			if not L1_195 then
				L14_208 = _UPVALUE10_
				L7_201 = L23_23
				L14_208(L7_201)
				L14_208 = nil
				L23_23 = L14_208
			end
		end
	end
end)
local L62_62 = L62_62
function getAllMacros()
	local L0_209, L1_210
	L0_209 = _ENV
	L0_209.getAllMacros = true
end
function setTimeouts(A0_211)
	local L1_212
	L1_212 = _ENV
	L1_212.timeout = A0_211
end
function setOption(A0_213)
	L5_218 = A0_213
	L4_217, L5_218, _FOR_ = L4_217(L5_218)
	for _FORV_4_, _FORV_5_ in L4_217, L5_218, _FOR_ do
		_ENV[_FORV_4_] = _FORV_5_
	end
	L4_217 = _ENV
	L4_217 = L4_217.overrideSystem
	if L4_217 then
		L4_217 = L42_42
		L4_217()
	end
end
function sendObject(A0_220)
	local L1_221, L2_222
	if A0_220 then
		L1_221 = A0_220.object
		if L1_221 then
			L1_221 = A0_220.object
			L1_221.ultimoteObject = true
			L1_221 = A0_220.object
			L2_222 = A0_220.image
			L1_221.ultimoteImage = L2_222
		end
	end
end
function playGoogleEarthMacro(A0_223)
	local L1_224
	local L16_239, L17_240 = L16_239, L17_240
	if A0_223 == nil then
		L1_224 = {}
		A0_223 = L1_224
	end
	L1_224 = A0_223.name
	if not L1_224 then
		L1_224 = "default"
	end
	L16_239 = system
	L16_239 = L16_239.pathForFile
	L17_240 = L1_224
	L17_240 = L17_240 .. ".kml"
	L16_239 = L16_239(L17_240, system.DocumentsDirectory)
	L17_240 = io
	L17_240 = L17_240.open
	L17_240 = L17_240(L16_239, "r")
	if L17_240 == nil then
		L16_239 = system.pathForFile(L1_224 .. ".kml", system.ResourcesDirectory)
		L17_240 = io.open(L16_239, "r")
		if L17_240 == nil then
			_ENV("Google macro " .. A0_223.name .. ".kml not found")
			return
		end
	end
	L16_239 = system.pathForFile("UltimoteGPSPath.txt", system.DocumentsDirectory)
	local L4_227 = L4_227
	L4_227 = L4_227(L16_239, "w")
	;({}).fps = L15_15.fps
	L4_227:write(L6_6.encode({}) .. "\n")
	local L7_230 = L7_230
	L7_230 = L17_240.read
	local L7_230, L6_229 = L7_230(L17_240), L6_229
	L6_229 = {}
	L6_229.events, ({})[1] = {}, {}
	L6_229.frameNum = 1
	if not A0_223.frameRatio then
	end
	while L7_230 do
		if L7_230:find("coordinates") then
			L7_230 = L17_240:read()
			local L11_234 = L11_234
			local L12_235 = L12_235
			local _FOR_, _FOR_, L13_236 = nil, nil, L13_236
			local L14_237, L15_238 = L14_237, L15_238
			for _FORV_16_, _FORV_17_ in _FOR_, _FOR_, _FOR_ do
				local L18_241 = L18_241
				if 0 > math.atan2(_FORV_16_ - L14_237, L12_235() - L13_236) * 57 then
				end
				;({}).altitude, ({}).latitude, ({}).longitude = L12_235(), L12_235(), _FORV_16_
				if not A0_223.speed then
				end
				;({}).speed = ((L12_235() - L13_236) * (L12_235() - L13_236) + (_FORV_16_ - L14_237) * (_FORV_16_ - L14_237)) * L18_241 * L18_241 + (L12_235() - L15_238) * (L12_235() - L15_238)
				if not A0_223.direction then
				end
				;({}).direction = math.atan2(_FORV_16_ - L14_237, L12_235() - L13_236) * 57 + 360 + 90
				;({}).name = "location"
				;({}).time = L6_229.frameNum
				if not A0_223.accuracy then
				end
				L6_229.events[1], ({}).accuracy = {}, 10
				L6_229.frameNum = L6_229.frameNum + L11_234
				L13_236, L14_237, previousAlt = L12_235(), _FORV_16_, L12_235()
				local L24_247, L25_248 = L24_247, L25_248
				local L27_250 = L27_250
				L4_227:write(L6_6.encode(L6_229) .. "\n")
			end
		end
		L13_236 = L17_240
		L12_235 = L17_240.read
		L12_235 = L12_235(L13_236)
		L7_230 = L12_235
	end
	L12_235 = io
	L12_235 = L12_235.close
	L13_236 = L17_240
	L12_235(L13_236)
	L12_235 = io
	L12_235 = L12_235.close
	L13_236 = L4_227
	L12_235(L13_236)
	L12_235 = playMacro
	L13_236 = {}
	L13_236.name = "UltimoteGPSPath"
	L12_235(L13_236)
end
