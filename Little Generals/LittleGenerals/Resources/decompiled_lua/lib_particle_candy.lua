-- Decompiled & AI-Repaired from lib_particle_candy.lu
-- Source disassembly preserved at: disasm/lib_particle_candy.disasm

local L0_0
L0_0 = {}
local L0_0.debug, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43 = true, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43
L0_0.gGravity = 0.98
L0_0.gEmitterColorR = 255
L0_0.gEmitterColorG = 255
L0_0.gEmitterColorB = 255
L0_0.gFXFieldColorR = 0
L0_0.gFXFieldColorG = 255
L0_0.gFXFieldColorB = 255
L4_4 = math
L4_4 = L4_4.atan
L5_5 = 1
L4_4 = L4_4(L5_5)
L4_4 = 4 * L4_4
L0_0.PI = L4_4
L4_4 = L0_0.PI
L4_4 = 2 * L4_4
L0_0.PI2 = L4_4
L4_4 = system
L4_4 = L4_4.getTimer
L4_4 = L4_4()
L0_0.gLastTime = L4_4
L0_0.gSuspTime = 0
L0_0.gLostTime = 0
L0_0.gSystemFrozen = 0
L0_0.gParticlesRendered = 0
L4_4 = {}
L0_0.Emitters = L4_4
L4_4 = {}
L0_0.EmitterIndex = L4_4
L4_4 = {}
L0_0.FXFields = L4_4
L4_4 = {}
L0_0.FXFieldIndex = L4_4
L4_4 = {}
L0_0.ParticleTypes = L4_4
L4_4 = {}
L0_0.ParticleTypeIndex = L4_4
L4_4 = {}
L0_0.Particles = L4_4
L0_0.gMaxParticles = 0
L0_0.gSpriteAPI = nil
L0_0.gCleanUpCalled = false
L0_0.timeScale = 1
L4_4 = math
L4_4 = L4_4.abs
L0_0.Abs = L4_4
L4_4 = math
L4_4 = L4_4.cos
L0_0.Cos = L4_4
L4_4 = math
L4_4 = L4_4.sin
L0_0.Sin = L4_4
L4_4 = math
L4_4 = L4_4.random
L0_0.Rnd = L4_4
L4_4 = math
L4_4 = L4_4.ceil
L0_0.Ceil = L4_4
L4_4 = math
L4_4 = L4_4.atan2
L0_0.Atan2 = L4_4
L4_4 = math
L4_4 = L4_4.sqrt
L0_0.Sqrt = L4_4
L4_4 = screenX
L0_0.gScrLeftX = L4_4
L4_4 = screenX
L5_5 = screenWidth
L4_4 = L4_4 + L5_5
L0_0.gScrRightX = L4_4
L4_4 = display
L4_4 = L4_4.contentWidth
L0_0.gScrW = L4_4
L4_4 = display
L4_4 = L4_4.contentHeight
L0_0.gScrH = L4_4
L4_4 = nil
L5_5 = L0_0.debug
if L5_5 then
	L5_5 = print
	L5_5()
	L5_5 = print
	L5_5()
	L5_5 = print
	L6_6 = "--> PARTICLE SYSTEM READY. LET'S ROCK."
	L5_5(L6_6)
end
function L5_5(A0_48)
	local L1_49, L2_50
	L1_49 = _ENV
	if A0_48 == true then
		L2_50 = true
		if L2_50 then
			goto lbl_8
		end
	end
	L2_50 = false
	::lbl_8::
	L1_49.debug = L2_50
end
L0_0.EnableDebug = L5_5
function L6_6(A0_51, A1_52, A2_53, A3_54, A4_55, A5_56, A6_57, A7_58)
	if _ENV.FXFields[A0_51] ~= nil then
		print("!!! Particles.CreateFXField(): FX FIELD '" .. A0_51 .. "' NOT CREATED - (ALREADY EXISTS)! NAME MUST BE UNIQUE.")
		return
	end
	local L8_59 = L8_59
	L8_59(_ENV.FXFieldIndex, A0_51)
	if A7_58 == nil or not A7_58 then
		A7_58 = 0
	end
	if A6_57 == true then
		L8_59 = true
		if L8_59 then
			goto lbl_30
			A6_57 = L8_59 or A6_57
		end
	end
	A6_57 = false
	::lbl_30::
	if A1_52 == nil or not A1_52 then
		A1_52 = 0
	end
	if A4_55 == nil or not A4_55 then
		A4_55 = 1
	end
	if A5_56 == nil or not A5_56 then
		A5_56 = 1
	end
	L8_59 = _ENV
	L8_59 = L8_59.FXFields
	L8_59[A0_51] = display.newGroup()
	L8_59 = _ENV
	L8_59 = L8_59.FXFields
	L8_59 = L8_59[A0_51]
	L8_59.x = A2_53
	L8_59 = _ENV
	L8_59 = L8_59.FXFields
	L8_59 = L8_59[A0_51]
	L8_59.y = A3_54
	L8_59 = nil
	L8_59 = display.newCircle(0, 0, A5_56)
	L8_59:setFillColor(0, 0, 0, 0)
	local L14_65 = L14_65
	L8_59.strokeWidth = 1
	L14_65 = L8_59.setStrokeColor
	L14_65(L8_59, _ENV.gFXFieldColorR, _ENV.gFXFieldColorG, _ENV.gFXFieldColorB)
	L14_65 = _ENV
	L14_65 = L14_65.FXFields
	L14_65 = L14_65[A0_51]
	L14_65 = L14_65.insert
	L14_65(L14_65, L8_59)
	if A1_52 == 3 or A1_52 == 4 then
		L14_65 = display
		L14_65 = L14_65.newLine
		L14_65 = L14_65(-A5_56 * 0.1, 0, -A5_56 * 0.1, -A5_56 * 0.5)
		L8_59 = L14_65
		L14_65 = L8_59.append
		L14_65(L8_59, -A5_56 * 0.5, -A5_56 * 0.5)
		L14_65 = L8_59.append
		L14_65(L8_59, 0, -A5_56)
		L14_65 = L8_59.append
		L14_65(L8_59, A5_56 * 0.5, -A5_56 * 0.5)
		L14_65 = L8_59.append
		L14_65(L8_59, A5_56 * 0.1, -A5_56 * 0.5)
		L14_65 = L8_59.append
		L14_65(L8_59, A5_56 * 0.1, 0)
		L14_65 = L8_59.append
		L14_65(L8_59, -A5_56 * 0.1, 0)
		L8_59.strokeWidth = 1
		L14_65 = L8_59.setColor
		L14_65(L8_59, _ENV.gFXFieldColorR, _ENV.gFXFieldColorG, _ENV.gFXFieldColorB)
		L14_65 = _ENV
		L14_65 = L14_65.FXFields
		L14_65 = L14_65[A0_51]
		L14_65 = L14_65.insert
		L14_65(L14_65, L8_59)
	end
	L14_65 = _ENV
	L14_65 = L14_65.FXFields
	L14_65 = L14_65[A0_51]
	L14_65.name = A0_51
	L14_65 = _ENV
	L14_65 = L14_65.FXFields
	L14_65 = L14_65[A0_51]
	L14_65.x = A2_53
	L14_65 = _ENV
	L14_65 = L14_65.FXFields
	L14_65 = L14_65[A0_51]
	L14_65.y = A3_54
	L14_65 = _ENV
	L14_65 = L14_65.FXFields
	L14_65 = L14_65[A0_51]
	L14_65.isVisible = A6_57
	L14_65 = _ENV
	L14_65 = L14_65.FXFields
	L14_65 = L14_65[A0_51]
	L14_65.mode = A1_52
	L14_65 = _ENV
	L14_65 = L14_65.FXFields
	L14_65 = L14_65[A0_51]
	L14_65.strength = A4_55
	L14_65 = _ENV
	L14_65 = L14_65.FXFields
	L14_65 = L14_65[A0_51]
	L14_65.radius = A5_56
	L14_65 = _ENV
	L14_65 = L14_65.FXFields
	L14_65 = L14_65[A0_51]
	L14_65.fxID = A7_58
	L14_65 = _ENV
	L14_65 = L14_65.FXFields
	L14_65 = L14_65[A0_51]
	L14_65.enabled = true
	L14_65 = _ENV
	L14_65 = L14_65.FXFields
	L14_65 = L14_65[A0_51]
	L14_65.uniqueID = A2_53 + A3_54 + A5_56 + A7_58 + _ENV.Ceil(_ENV.Rnd() * 5000)
	L14_65 = _ENV
	L14_65 = L14_65.debug
	if L14_65 then
		L14_65 = print
		local L11_62 = L11_62
		local L11_62, L12_63 = L11_62 .. A0_51 .. "'", L12_63
		L14_65(L11_62)
	end
end
L0_0.CreateFXField = L6_6
function L7_7(A0_66)
	local L1_67
	L1_67 = _ENV
	L1_67 = L1_67.FXFields
	L1_67 = L1_67[A0_66]
	return L1_67
end
L0_0.GetFXField = L7_7
function L8_8(A0_68, A1_69)
	if _ENV.FXFields[A0_68] == nil then
		local L2_70 = L2_70
		local L4_72 = L4_72
		local L4_72, L5_73 = L4_72 .. A0_68 .. "' DOES NOT EXIST.", L5_73
		L2_70(L4_72)
	end
	L2_70 = _ENV
	L2_70 = L2_70.FXFields
	L2_70 = L2_70[A0_68]
	if A1_69 == true then
		L4_72 = true
		if L4_72 then
			goto lbl_21
		end
	end
	L4_72 = false
	::lbl_21::
	L2_70.enabled = L4_72
end
L0_0.EnableFXField = L8_8
function L9_9(A0_74)
	if _ENV.FXFields[A0_74] ~= nil then
		_FOR_, _FOR_, _FOR_ = ipairs(_ENV.FXFieldIndex)
		for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_7_ == A0_74 then
				local L8_81 = L8_81
				local L9_82 = L9_82
				table.remove(_ENV.FXFieldIndex, _FORV_6_)
				break
			end
		end
		L10_83 = _ENV
		L10_83 = L10_83.RemoveFXListener
		L10_83(A0_74)
		while true do
			L10_83 = _ENV
			L10_83 = L10_83.FXFields
			L10_83 = L10_83[A0_74]
			L10_83 = L10_83.numChildren
			if not (0 < L10_83) then
				break
			end
			L10_83 = _ENV
			L10_83 = L10_83.FXFields
			L10_83 = L10_83[A0_74]
			L10_83 = L10_83[1]
			L10_83 = L10_83.removeSelf
			L10_83(L10_83)
		end
		L10_83 = _ENV
		L10_83 = L10_83.FXFields
		L10_83 = L10_83[A0_74]
		L10_83 = L10_83.removeSelf
		L10_83(L10_83)
		L10_83 = _ENV
		L10_83 = L10_83.FXFields
		L10_83[A0_74] = nil
		L10_83 = _ENV
		L10_83 = L10_83.debug
		if L10_83 then
			L10_83 = print
			L10_83("--> Particles.DeleteFXField(): DELETED FX FIELD '" .. A0_74 .. "'")
		end
		return
	end
	L8_81 = print
	L9_82 = "!!! Particles.DeleteFXField(): COULD NOT DELETE FX FIELD '"
	L10_83 = A0_74
	L9_82 = L9_82 .. L10_83 .. "' (NOT FOUND)"
	L8_81(L9_82)
end
L0_0.DeleteFXField = L9_9
function L10_10(A0_84, A1_85)
	if _ENV.FXFields[A0_84] == nil then
		print("--> Particles.AddFXListener(): SPECIFIED FX FIELD '" .. A0_84 .. "' DOES NOT EXIST.")
	end
	if A1_85 ~= nil then
		_ENV.FXFields[A0_84].Listener = A1_85
		local L2_86, L3_87 = L2_86, L3_87
		local L4_88 = L4_88
		L2_86(L3_87, L4_88, _ENV.FXFields[A0_84].Listener)
		local L5_89 = L5_89
	end
end
L0_0.AddFXListener = L10_10
function L11_11(A0_90)
	if _ENV.FXFields[A0_90] == nil then
		print("--> Particles.RemoveFXListener(): SPECIFIED FX FIELD '" .. A0_90 .. "' DOES NOT EXIST.")
	end
	if _ENV.FXFields[A0_90].Listener ~= nil then
		local L1_91, L2_92 = L1_91, L2_92
		local L3_93 = L3_93
		L1_91(L2_92, L3_93, _ENV.FXFields[A0_90].Listener)
		local L4_94 = L4_94
		L1_91 = _ENV
		L1_91 = L1_91.FXFields
		L1_91 = L1_91[A0_90]
		L1_91.Listener = nil
	end
end
L0_0.RemoveFXListener = L11_11
function L12_12(A0_95)
	if _ENV.Emitters[A0_95] == nil then
		local L1_96 = L1_96
		L1_96("!!! Particles.DeleteEmissionShape(): EMITTER '" .. A0_95 .. "' NOT FOUND!")
		return
	end
	L1_96 = _ENV
	L1_96 = L1_96.Emitters
	L1_96 = L1_96[A0_95]
	L1_96 = L1_96.Shape
	if L1_96 == nil then
		return
	end
	L1_96 = nil
	_FOR_ = 1
	for _FORV_5_ = _FOR_, _FOR_, _FOR_ do
		_ENV.Emitters[A0_95].Shape.Segments[_FORV_5_] = nil
	end
	L6_101 = _ENV
	L6_101 = L6_101.Emitters
	L6_101 = L6_101[A0_95]
	L6_101 = L6_101.Shape
	L6_101.Segments = nil
	L6_101 = _ENV
	L6_101 = L6_101.Emitters
	L6_101 = L6_101[A0_95]
	L6_101 = L6_101.Shape
	L6_101 = L6_101.removeSelf
	L6_101(L6_101)
	L6_101 = _ENV
	L6_101 = L6_101.Emitters
	L6_101 = L6_101[A0_95]
	L6_101.Shape = nil
	L6_101 = _ENV
	L6_101 = L6_101.debug
	if L6_101 then
		L6_101 = print
		local L4_99 = L4_99
		local L4_99, L5_100 = L4_99 .. A0_95 .. "'", L5_100
		L6_101(L4_99)
	end
end
L0_0.DeleteEmissionShape = L12_12
function L13_13(A0_102, A1_103, A2_104, A3_105, A4_106, A5_107, A6_108)
	if _ENV.Emitters[A0_102] ~= nil then
		print("!!! Particles.CreateEmitter(): EMITTER '" .. A0_102 .. "' NOT CREATED - (ALREADY EXISTS)! NAME MUST BE UNIQUE.")
		return
	end
	if _ENV.gCleanUpCalled == true then
		_ENV.gLastTime = system.getTimer()
		_ENV.gCleanUpCalled = false
	end
	table.insert(_ENV.EmitterIndex, A0_102)
	_ENV.Emitters[A0_102] = display.newGroup()
	_ENV.Emitters[A0_102].name = A0_102
	_ENV.Emitters[A0_102].PTypes = {}
	_ENV.Emitters[A0_102].PTypeIndex = {}
	_ENV.Emitters[A0_102].PTypeSettings = {}
	_ENV.Emitters[A0_102].active = false
	_ENV.Emitters[A0_102].startTime = 0
	_ENV.Emitters[A0_102].scale = 1
	_ENV.Emitters[A0_102].Listener = nil
	_ENV.Emitters[A0_102].x = A1_103
	_ENV.Emitters[A0_102].y = A2_104
	_ENV.Emitters[A0_102].xOrigin = A1_103 - 8
	_ENV.Emitters[A0_102].xReference = 8
	_ENV.Emitters[A0_102].width = 1
	if A4_106 ~= true or not true then
	end
	_ENV.Emitters[A0_102].isVisible = false
	if A5_107 ~= true or not true then
	end
	_ENV.Emitters[A0_102].loop = false
	if A6_108 ~= true or not true then
	end
	_ENV.Emitters[A0_102].autoDestroy = false
	if A3_105 == nil or not A3_105 then
	end
	_ENV.Emitters[A0_102].rotation = 0
	_ENV.Emitters[A0_102].oneShot = false
	_ENV.Emitters[A0_102].Sound = nil
	_ENV.Emitters[A0_102].SoundProperties = nil
	_ENV.Emitters[A0_102].soundAutoStop = false
	_ENV.Emitters[A0_102].soundDelay = 0
	_ENV.Emitters[A0_102].soundChannel = 0
	_ENV.Emitters[A0_102].FollowObject = nil
	_ENV.Emitters[A0_102].Arrow = display.newLine(0, 0, 16, 0)
	_ENV.Emitters[A0_102].Arrow:setColor(_ENV.gEmitterColorR, _ENV.gEmitterColorG, _ENV.gEmitterColorB, 255)
	local L11_113 = L11_113
	L11_113(_ENV.Emitters[A0_102].Arrow, 8, -24, 0, 0)
	local L12_114 = L12_114
	L11_113 = _ENV
	L11_113 = L11_113.Emitters
	L11_113 = L11_113[A0_102]
	L12_114 = L11_113
	L11_113 = L11_113.insert
	L11_113(L12_114, _ENV.Emitters[A0_102].Arrow)
	L11_113 = _ENV
	L11_113 = L11_113.debug
	if L11_113 then
		L11_113 = print
		L12_114 = "--> Particles.CreateEmitter(): ADDED EMITTER '"
		local L12_114, L10_112 = L12_114 .. A0_102 .. "'", L10_112
		L11_113(L12_114)
	end
end
L0_0.CreateEmitter = L13_13
function L14_14(A0_115)
	if _ENV.Emitters[A0_115] ~= nil then
		_FOR_, _FOR_, _FOR_ = ipairs(_ENV.EmitterIndex)
		for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_7_ == A0_115 then
				local L8_122 = L8_122
				local L9_123 = L9_123
				table.remove(_ENV.EmitterIndex, _FORV_6_)
				break
			end
		end
		L10_124 = _ENV
		L10_124 = L10_124.Emitters
		L10_124 = L10_124[A0_115]
		L10_124 = L10_124.Listener
		if L10_124 ~= nil then
			L10_124 = Runtime
			L10_124 = L10_124.removeEventListener
			L10_124(L10_124, "particleKilled", _ENV.Emitters[A0_115].Listener)
			L10_124 = _ENV
			L10_124 = L10_124.Emitters
			L10_124 = L10_124[A0_115]
			L10_124.Listener = nil
		end
		L10_124 = _ENV
		L10_124 = L10_124.Emitters
		L10_124 = L10_124[A0_115]
		L10_124.Sound = nil
		L10_124 = _ENV
		L10_124 = L10_124.Emitters
		L10_124 = L10_124[A0_115]
		L10_124.SoundProperties = nil
		L10_124 = _ENV
		L10_124 = L10_124.Emitters
		L10_124 = L10_124[A0_115]
		L10_124.FollowObject = nil
		L10_124 = _ENV
		L10_124 = L10_124.Emitters
		L10_124 = L10_124[A0_115]
		L10_124.Arrow = nil
		L10_124 = L12_12
		L10_124(A0_115)
		L10_124 = _ENV
		L10_124 = L10_124.Emitters
		L10_124 = L10_124[A0_115]
		L10_124.PTypes = nil
		L10_124 = _ENV
		L10_124 = L10_124.Emitters
		L10_124 = L10_124[A0_115]
		L10_124.PTypeIndex = nil
		L10_124 = _ENV
		L10_124 = L10_124.Emitters
		L10_124 = L10_124[A0_115]
		L10_124.PTypeSettings = nil
		L10_124 = _ENV
		L10_124 = L10_124.Emitters
		L10_124 = L10_124[A0_115]
		L10_124 = L10_124.removeSelf
		L10_124(L10_124)
		L10_124 = _ENV
		L10_124 = L10_124.Emitters
		L10_124[A0_115] = nil
		L10_124 = _ENV
		L10_124 = L10_124.debug
		if L10_124 then
			L10_124 = print
			L10_124("--> Particles.DeleteEmitter(): DELETED EMITTER '" .. A0_115 .. "'")
		end
		return
	end
	L8_122 = print
	L9_123 = "!!! Particles.DeleteEmitter(): COULD NOT DELETE EMITTER '"
	L10_124 = A0_115
	L9_123 = L9_123 .. L10_124 .. "' (NOT FOUND)"
	L8_122(L9_123)
end
L0_0.DeleteEmitter = L14_14
function L15_15()
	local L0_125, L1_126, L2_127, L3_128, L4_129
	print()
	L8_133 = print
	L9_134 = "---------------------------"
	L8_133(L9_134)
	L8_133 = print
	L9_134 = _ENV
	L9_134 = L9_134.ParticleTypeIndex
	L9_134 = #L9_134
	L14_139 = " PARTICLE TYPES:"
	L9_134 = L9_134 .. L14_139
	L8_133(L9_134)
	L8_133 = pairs
	L9_134 = _ENV
	L9_134 = L9_134.ParticleTypes
	L8_133, L9_134, L14_139 = L8_133(L9_134)
	for _FORV_8_, _FORV_9_ in L8_133, L9_134, L14_139 do
		print("- '" .. _FORV_8_ .. "'")
	end
	L8_133 = print
	L8_133()
	L8_133 = print
	L9_134 = _ENV
	L9_134 = L9_134.EmitterIndex
	L9_134 = #L9_134
	L14_139 = " EMITTERS:"
	L9_134 = L9_134 .. L14_139
	L8_133(L9_134)
	L8_133 = pairs
	L9_134 = _ENV
	L9_134 = L9_134.Emitters
	L8_133, L9_134, L14_139 = L8_133(L9_134)
	for _FORV_8_, _FORV_9_ in L8_133, L9_134, L14_139 do
		print()
		print("EMITTER: '" .. _ENV.Emitters[_FORV_8_].name .. "'")
		_FOR_, _FOR_, _FOR_ = ipairs(_ENV.Emitters[_FORV_8_].PTypeIndex)
		for _FORV_13_, _FORV_14_ in _FOR_, _FOR_, _FOR_ do
			print("|-" .. _FORV_14_ .. "'")
		end
	end
	L8_133 = print
	L9_134 = "---------------------------"
	L8_133(L9_134)
	L8_133 = print
	L8_133()
end
L0_0.ListEmitters = L15_15
function L16_16(A0_144, A1_145)
	local L10_154 = _ENV.gSystemFrozen
	if 0 < L10_154 then
		L10_154 = print
		L10_154("!!! Particles.StartEmitter(): CANNOT START EMITTER WHILE SYSTEM IS FROZEN. RESUME FIRST!")
		return
	end
	L10_154 = _ENV
	L10_154 = L10_154.Emitters
	L10_154 = L10_154[A0_144]
	if L10_154 == nil then
		L10_154 = print
		local L5_149 = "!!! Particles.StartEmitter(): EMITTER '" .. A0_144 .. "' NOT FOUND!"
		L10_154(L5_149)
		return
	end
	L10_154 = system
	L10_154 = L10_154.getTimer
	L10_154 = L10_154()
	L5_149 = _ENV
	L5_149 = L5_149.gLostTime
	L10_154 = L10_154 - L5_149
	L5_149 = nil
	_ENV.Emitters[A0_144].active = true
	_ENV.Emitters[A0_144].startTime = L10_154
	if A1_145 ~= true or not true then
	end
	_ENV.Emitters[A0_144].oneShot = false
	_ENV.Emitters[A0_144].soundChannel = 0
	_FOR_, _FOR_, _FOR_ = ipairs(_ENV.Emitters[A0_144].PTypeIndex)
	for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
		L5_149 = _ENV.Emitters[A0_144].PTypeSettings[_FORV_10_]
		L5_149.startTime = L10_154 + L5_149.delay
		local L12_156 = L12_156
		L5_149.endTime = L10_154 + L5_149.delay + L5_149.duration
		L5_149.particlesToEmit = 0
		L5_149.active = true
	end
	if _ENV.debug then
		local L8_152 = L8_152
		local L9_153 = L9_153
		L9_153("--> Particles.StartEmitter(): EMITTER '" .. A0_144 .. "' STARTED.")
	end
end
L0_0.StartEmitter = L16_16
function L17_17(A0_157)
	local L7_164 = _ENV.Emitters
	L7_164 = L7_164[A0_157]
	if L7_164 == nil then
		L7_164 = print
		L7_164("!!! Particles.StopEmitter(): EMITTER '" .. A0_157 .. "' NOT FOUND!")
		return
	end
	L7_164 = _ENV
	L7_164 = L7_164.Emitters
	L7_164 = L7_164[A0_157]
	L7_164 = L7_164.soundAutoStop
	if L7_164 == true then
		L7_164 = _ENV
		L7_164 = L7_164.Emitters
		L7_164 = L7_164[A0_157]
		L7_164 = L7_164.soundChannel
		if 0 < L7_164 then
			L7_164 = audio
			L7_164 = L7_164.stop
			L7_164(_ENV.Emitters[A0_157].soundChannel)
			local L2_159 = L2_159
			L7_164 = _ENV
			L7_164 = L7_164.Emitters
			L7_164 = L7_164[A0_157]
			L7_164.soundChannel = 0
		end
	end
	L7_164 = nil
	L2_159 = nil
	_FOR_, _FOR_, _FOR_ = ipairs(_ENV.Emitters[A0_157].PTypeIndex)
	for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
		_ENV.Emitters[A0_157].PTypeSettings[_FORV_7_].active = false
	end
	L8_165 = _ENV
	L8_165 = L8_165.Emitters
	L8_165 = L8_165[A0_157]
	L8_165.active = false
	L8_165 = _ENV
	L8_165 = L8_165.debug
	if L8_165 then
		L8_165 = print
		local L5_162 = L5_162
		local L5_162, L6_163 = L5_162 .. A0_157 .. "' STOPPED.", L6_163
		L8_165(L5_162)
	end
end
L0_0.StopEmitter = L17_17
function L18_18(A0_166, A1_167, A2_168, A3_169, A4_170)
	local L5_171
	L5_171 = _ENV
	L5_171 = L5_171.Emitters
	L5_171 = L5_171[A0_166]
	if L5_171 == nil then
		local L9_175 = L9_175
		L9_175("!!! Particles.AddCustomEmissionShape(): EMITTER '" .. A0_166 .. "' NOT FOUND!")
		return
	end
	L9_175 = display
	L9_175 = L9_175.newGroup
	L9_175 = L9_175()
	L5_171.Shape = L9_175
	L9_175 = L5_171.Shape
	L9_175.myWidth = 0
	L9_175 = L5_171.Shape
	L9_175.myAngle = 0
	L9_175 = L5_171.Shape
	L9_175.Segments = {}
	L9_175 = L5_171.Shape
	L9_175.x = 8
	L9_175 = L5_171.insert
	local L7_173 = L7_173
	L9_175(L7_173, L5_171.Shape)
	local L8_174 = L8_174
	L9_175 = L5_171.Shape
	if A2_168 == true then
		L7_173 = true
		if L7_173 then
			goto lbl_36
		end
	end
	L7_173 = false
	::lbl_36::
	L9_175.useEmitterRotation = L7_173
	L9_175 = L5_171.Shape
	if A3_169 == true then
		L7_173 = true
		if L7_173 then
			goto lbl_44
		end
	end
	L7_173 = false
	::lbl_44::
	L9_175.cornersOnly = L7_173
	L9_175 = nil
	L7_173 = nil
	L8_174 = nil
	L8_174 = 1
	while L8_174 < #A1_167 do
		L9_175 = display.newGroup()
		L9_175.myWidth = A1_167[L8_174]
		L9_175.myAngle = A1_167[L8_174 + 1]
		table.insert(L5_171.Shape.Segments, L9_175)
		L5_171.Shape:insert(L9_175)
		L9_175.x = L5_171.Shape.myWidth
		L9_175.rotation = L5_171.Shape.myAngle * -1 + L9_175.myAngle
		if A4_170 == true then
			L7_173 = display.newLine(0, 0, L9_175.myWidth, 0)
			local L14_180 = L14_180
			L7_173:setColor(255, 255, 0, 255)
			local L15_181 = L15_181
			L15_181 = L9_175.insert
			L15_181(L9_175, L7_173)
		end
		L14_180 = L9_175
		L8_174 = L8_174 + 2
	end
	L15_181 = _ENV
	L15_181 = L15_181.debug
	if L15_181 then
		L15_181 = print
		local L13_179 = "--> Particles.AddCustomEmissionShape(): ADDED EMISSION SHAPE TO EMITTER '" .. A0_166 .. "'"
		L15_181(L13_179)
	end
end
L0_0.DefineEmissionShape = L18_18
function L19_19(A0_182)
	local L1_183
	L1_183 = _ENV
	L1_183 = L1_183.Emitters
	L1_183 = L1_183[A0_182]
	return L1_183
end
L0_0.GetEmitter = L19_19
function L20_20(A0_184)
	if _ENV.Emitters[A0_184] ~= nil then
		return _ENV.Emitters[A0_184].active
	end
	local L1_185 = L1_185
	local L3_187 = L3_187
	local L3_187, L4_188 = L3_187 .. A0_184 .. "'", L4_188
	L1_185(L3_187)
end
L0_0.EmitterIsActive = L20_20
function L21_21(A0_189, A1_190)
	if _ENV.Emitters[A0_189] ~= nil then
		_ENV.Emitters[A0_189].scale = A1_190
		_ENV.Emitters[A0_189].xScale = A1_190
		_ENV.Emitters[A0_189].yScale = A1_190
		return
	end
	local L2_191 = L2_191
	local L4_193 = L4_193
	local L4_193, L5_194 = L4_193 .. A0_189 .. "'", L5_194
	L2_191(L4_193)
end
L0_0.SetEmitterScale = L21_21
function L22_22(A0_195, A1_196)
	if _ENV.Emitters[A0_195] ~= nil then
		return _ENV.Emitters[A0_195].scale
	end
	local L2_197 = L2_197
	local L4_199 = L4_199
	local L4_199, L5_200 = L4_199 .. A0_195 .. "'", L5_200
	L2_197(L4_199)
end
L0_0.GetEmitterScale = L22_22
function L23_23(A0_201, A1_202)
	if _ENV.Emitters[A0_201] ~= nil then
		if _ENV.Emitters[A0_201].Listener ~= nil then
			Runtime:removeEventListener("particleKilled", _ENV.Emitters[A0_201].Listener)
			_ENV.Emitters[A0_201].Listener = nil
		end
		if A1_202 ~= nil then
			_ENV.Emitters[A0_201].Listener = A1_202
			Runtime:addEventListener("particleKilled", _ENV.Emitters[A0_201].Listener)
		end
		return
	end
	local L2_203 = L2_203
	local L4_205 = L4_205
	local L4_205, L5_206 = L4_205 .. A0_201 .. "'", L5_206
	L2_203(L4_205)
end
L0_0.SetEmitterListener = L23_23
function L24_24(A0_207, A1_208, A2_209, A3_210, A4_211)
	if _ENV.Emitters[A0_207] ~= nil then
		if soundID == nil and A3_210 == nil and A4_211 == nil then
			_ENV.Emitters[A0_207].Sound = nil
			_ENV.Emitters[A0_207].SoundProperties = nil
			_ENV.Emitters[A0_207].soundAutoStop = false
			_ENV.Emitters[A0_207].soundDelay = 0
			if _ENV.debug then
				print("--> Particles.SetEmitterSound(): REMOVED SOUND FROM EMITTER '" .. A0_207 .. "'.")
			end
			return
		end
		if A1_208 ~= nil then
			if A4_211 == nil then
				({}).channel = 1
				;({}).loops = 1
				A4_211, ({}).fadeIn = {}, 1000
			end
			_ENV.Emitters[A0_207].Sound = nil
			_ENV.Emitters[A0_207].SoundProperties = nil
			_ENV.Emitters[A0_207].Sound = A1_208
			_ENV.Emitters[A0_207].SoundProperties = A4_211
			if A2_209 == nil or not A2_209 then
			end
			_ENV.Emitters[A0_207].soundDelay = 0
			if A3_210 ~= true or not true then
			end
			_ENV.Emitters[A0_207].soundAutoStop = false
			if _ENV.debug then
				print("--> Particles.SetEmitterSound(): ATTACHED SOUND TO EMITTER '" .. A0_207 .. "'.")
			end
			return
		end
	end
	local L5_212 = L5_212
	local L7_214 = L7_214
	local L7_214, L8_215 = L7_214 .. A0_207 .. "' OR MISSING SOUND ID.", L8_215
	L5_212(L7_214)
end
L0_0.SetEmitterSound = L24_24
function L25_25(A0_216, A1_217, A2_218, A3_219, A4_220, A5_221)
	local L6_222
	L6_222 = _ENV
	L6_222 = L6_222.Emitters
	L6_222 = L6_222[A0_216]
	if L6_222 == nil then
		local L7_223 = L7_223
		local L9_225 = L9_225
		local L9_225, L10_226 = L9_225 .. A0_216 .. "' NOT FOUND.", L10_226
		L7_223(L9_225)
		return
	end
	if A1_217 == nil then
		L6_222.FollowObject = nil
		L6_222.followRotation = false
		L6_222.followRotationOffset = 0
		return
	end
	L6_222.FollowObject = A1_217
	L6_222.followRotation = A2_218
	L7_223 = A3_219 or L7_223
	if A3_219 == nil or not A3_219 then
		L7_223 = 0
	end
	L6_222.followRotationOffset = L7_223
	L7_223 = A4_220 or L7_223
	if A4_220 == nil or not A4_220 then
		L7_223 = 0
	end
	L6_222.followXOff = L7_223
	L7_223 = A5_221 or L7_223
	if A5_221 == nil or not A5_221 then
		L7_223 = 0
	end
	L6_222.followYOff = L7_223
end
L0_0.SetEmitterTarget = L25_25
function L26_26(A0_227, A1_228, A2_229)
	local L3_230, L4_231
	L3_230 = _ENV
	L3_230 = L3_230.Emitters
	L3_230 = L3_230[A0_227]
	L4_231 = L3_230.PTypeSettings
	L4_231 = L4_231[A1_228]
	if L3_230 == nil then
		print("!!! Particles.SetEmissionRate(): EMITTER '" .. A0_227 .. "' NOT FOUND.")
		return
	end
	if L4_231 == nil then
		if _ENV.debug then
			local L5_232 = L5_232
			local L7_234 = L7_234
			local L8_235 = L8_235
			local L9_236 = L9_236
			local L7_234, L10_237 = L7_234 .. L8_235 .. L9_236 .. A0_227 .. "'.", L10_237
			L5_232(L7_234)
		end
		return
	end
	L5_232 = A2_229 / 1000
	L4_231.emissionRate = L5_232
end
L0_0.ChangeEmissionRate = L26_26
function L27_27(A0_238)
	if _ENV.ParticleTypes[A0_238] == nil then
		local L4_242 = L4_242
		L4_242("!!! Particles.PrepareParticleSettings(): PARTICLE TYPE '" .. A0_238 .. "' NOT FOUND!")
		return
	end
	L4_242 = _ENV
	L4_242 = L4_242.ParticleTypes
	L4_242 = L4_242[A0_238]
	L4_242 = L4_242.scaleStart
	if L4_242 <= 0 then
		L4_242 = _ENV
		L4_242 = L4_242.ParticleTypes
		L4_242 = L4_242[A0_238]
		L4_242.scaleStart = 1.0E-4
	end
	L4_242 = type
	local L4_242, L2_240 = L4_242(_ENV.ParticleTypes[A0_238].imagePath), L2_240
	if L4_242 ~= "table" then
		L4_242 = _ENV
		L4_242 = L4_242.ParticleTypes
		L4_242 = L4_242[A0_238]
		L2_240 = {}
		local L2_240[1], L3_241 = _ENV.ParticleTypes[A0_238].imagePath, L3_241
		L4_242.imagePath = L2_240
	end
	L4_242 = _ENV
	L4_242 = L4_242.ParticleTypes
	L4_242 = L4_242[A0_238]
	L2_240 = _ENV
	L2_240 = L2_240.ParticleTypes
	L2_240 = L2_240[A0_238]
	L2_240 = L2_240.velocityStart
	L2_240 = L2_240 / 1000
	L4_242.vs = L2_240
	L4_242 = _ENV
	L4_242 = L4_242.ParticleTypes
	L4_242 = L4_242[A0_238]
	L2_240 = _ENV
	L2_240 = L2_240.ParticleTypes
	L2_240 = L2_240[A0_238]
	L2_240 = L2_240.velocityChange
	L2_240 = L2_240 / 1000
	L4_242.vc = L2_240
	L4_242 = _ENV
	L4_242 = L4_242.ParticleTypes
	L4_242 = L4_242[A0_238]
	L2_240 = _ENV
	L2_240 = L2_240.ParticleTypes
	L2_240 = L2_240[A0_238]
	L2_240 = L2_240.velocityVariation
	L2_240 = L2_240 / 1000
	L4_242.vv = L2_240
	L4_242 = _ENV
	L4_242 = L4_242.ParticleTypes
	L4_242 = L4_242[A0_238]
	L2_240 = _ENV
	L2_240 = L2_240.ParticleTypes
	L2_240 = L2_240[A0_238]
	L2_240 = L2_240.rotationChange
	L2_240 = L2_240 / 1000
	L4_242.rc = L2_240
	L4_242 = _ENV
	L4_242 = L4_242.ParticleTypes
	L4_242 = L4_242[A0_238]
	L2_240 = _ENV
	L2_240 = L2_240.ParticleTypes
	L2_240 = L2_240[A0_238]
	L2_240 = L2_240.fadeInSpeed
	L2_240 = L2_240 / 1000
	L4_242.fi = L2_240
	L4_242 = _ENV
	L4_242 = L4_242.ParticleTypes
	L4_242 = L4_242[A0_238]
	L2_240 = _ENV
	L2_240 = L2_240.ParticleTypes
	L2_240 = L2_240[A0_238]
	L2_240 = L2_240.fadeOutSpeed
	L2_240 = L2_240 / 1000
	L4_242.fo = L2_240
	L4_242 = _ENV
	L4_242 = L4_242.ParticleTypes
	L4_242 = L4_242[A0_238]
	L2_240 = _ENV
	L2_240 = L2_240.ParticleTypes
	L2_240 = L2_240[A0_238]
	L2_240 = L2_240.scaleInSpeed
	L2_240 = L2_240 / 1000
	L4_242.si = L2_240
	L4_242 = _ENV
	L4_242 = L4_242.ParticleTypes
	L4_242 = L4_242[A0_238]
	L2_240 = _ENV
	L2_240 = L2_240.ParticleTypes
	L2_240 = L2_240[A0_238]
	L2_240 = L2_240.scaleOutSpeed
	L2_240 = L2_240 / 1000
	L4_242.so = L2_240
	L4_242 = _ENV
	L4_242 = L4_242.ParticleTypes
	L4_242 = L4_242[A0_238]
	L2_240 = _ENV
	L2_240 = L2_240.ParticleTypes
	L2_240 = L2_240[A0_238]
	L2_240 = L2_240.weight
	L2_240 = L2_240 / 1000
	L4_242.we = L2_240
	L4_242 = _ENV
	L4_242 = L4_242.ParticleTypes
	L4_242 = L4_242[A0_238]
	L4_242 = L4_242.colorChange
	if L4_242 ~= 0 then
		L4_242 = _ENV
		L4_242 = L4_242.ParticleTypes
		L4_242 = L4_242[A0_238]
		L2_240 = _ENV
		L2_240 = L2_240.ParticleTypes
		L2_240 = L2_240[A0_238]
		L2_240 = L2_240.colorChange
		L2_240 = L2_240[1]
		L2_240 = L2_240 / 1000
		L4_242.ccR = L2_240
		L4_242 = _ENV
		L4_242 = L4_242.ParticleTypes
		L4_242 = L4_242[A0_238]
		L2_240 = _ENV
		L2_240 = L2_240.ParticleTypes
		L2_240 = L2_240[A0_238]
		L2_240 = L2_240.colorChange
		L2_240 = L2_240[2]
		L2_240 = L2_240 / 1000
		L4_242.ccG = L2_240
		L4_242 = _ENV
		L4_242 = L4_242.ParticleTypes
		L4_242 = L4_242[A0_238]
		L2_240 = _ENV
		L2_240 = L2_240.ParticleTypes
		L2_240 = L2_240[A0_238]
		L2_240 = L2_240.colorChange
		L2_240 = L2_240[3]
		L2_240 = L2_240 / 1000
		L4_242.ccB = L2_240
	end
end
L0_0.PrepareParticleSettings = L27_27
function L28_28(A0_243, A1_244)
	local L8_251 = _ENV.ParticleTypes
	L8_251 = L8_251[A0_243]
	if L8_251 ~= nil then
		L8_251 = print
		L8_251("!!! Particles.CreateParticleType(): PARTICLE TYPE '" .. A0_243 .. "' NOT CREATED - (ALREADY EXISTS)! NAME MUST BE UNIQUE.")
		return
	else
		if A1_244 ~= nil then
			L8_251 = type
			L8_251 = L8_251(A1_244)
			if L8_251 == "table" then
				goto lbl_28
			end
		end
		L8_251 = print
		L8_251("!!! Particles.CreateParticleType(): '" .. A0_243 .. "' NOT CREATED - PLEASE SPECIFY A PROPERTIES TABLE AS PARAMETER!")
		return
	end
	::lbl_28::
	L8_251 = table
	L8_251 = L8_251.insert
	local L3_246 = L3_246
	L8_251(L3_246, A0_243)
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L3_246 = {}
	L8_251[A0_243] = L3_246
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.name = A0_243
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L3_246 = {}
	L8_251.imagePath = L3_246
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.imageWidth = 16
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.imageHeight = 16
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.xReference = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.yReference = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.SpriteSet = nil
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.ImageSheet = nil
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.SheetInfo = nil
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.AnimationInfo = nil
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.frames = nil
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.animSequence = ""
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.weight = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.velocityStart = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.velocityChange = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.velocityVariation = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.directionVariation = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.rotationStart = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.rotationVariation = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.rotationChange = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.autoOrientation = false
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.useEmitterRotation = true
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.alphaStart = 1
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.alphaVariation = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.fadeInSpeed = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.fadeOutSpeed = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.fadeOutDelay = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.scaleStart = 1
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.scaleVariation = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.scaleInSpeed = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.scaleMax = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.scaleOutSpeed = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.scaleOutDelay = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.bounceX = false
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.bounceY = false
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.bounciness = 1
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.emissionShape = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.emissionRadius = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.killOutsideScreen = true
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.lifeTime = 1000
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.faceEmitter = false
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.fxID = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.PhysicsMaterial = nil
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.PhysicsProperties = nil
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.randomMotionMode = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.randomMotionInterval = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.randomMotionAmount = 0
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.text = nil
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L3_246 = native
	L3_246 = L3_246.systemFont
	L8_251.font = L3_246
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.fontSize = 12
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L3_246 = {}
	L3_246[1] = 255
	L3_246[2] = 255
	L3_246[3] = 255
	L8_251.textColor = L3_246
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.blendMode = "normal"
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L3_246 = {}
	L3_246[1] = 255
	L3_246[2] = 255
	L3_246[3] = 255
	L8_251.colorStart = L3_246
	L8_251 = _ENV
	L8_251 = L8_251.ParticleTypes
	L8_251 = L8_251[A0_243]
	L8_251.colorChange = 0
	L8_251 = nil
	L3_246 = nil
	_FOR_, _FOR_, _FOR_ = pairs(A1_244)
	for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
		_ENV.ParticleTypes[A0_243][_FORV_7_] = _FORV_8_
	end
	L9_252 = L27_27
	L9_252(A0_243)
	L9_252 = _ENV
	L9_252 = L9_252.debug
	if L9_252 then
		L9_252 = print
		local L6_249 = L6_249
		local L6_249, L7_250 = L6_249 .. A0_243 .. "'.", L7_250
		L9_252(L6_249)
	end
end
L0_0.CreateParticleType = L28_28
function L29_29(A0_253)
	local L9_262 = _ENV.ParticleTypes
	L9_262 = L9_262[A0_253]
	if L9_262 ~= nil then
		L9_262 = nil
		_FOR_, _FOR_, _FOR_ = pairs(_ENV.EmitterIndex)
		for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
			if _ENV.Emitters[_FORV_9_].PTypes[A0_253] ~= nil then
				_ENV.Emitters[_FORV_9_].PTypes[A0_253] = nil
				_ENV.Emitters[_FORV_9_].PTypeSettings[A0_253] = nil
				_FOR_, _FOR_, _FOR_ = ipairs(_ENV.Emitters[_FORV_9_].PTypeIndex)
				for _FORV_13_, _FORV_14_ in _FOR_, _FOR_, _FOR_ do
					if _FORV_14_ == A0_253 then
						local L16_268 = L16_268
						table.remove(_ENV.Emitters[_FORV_9_].PTypeIndex, _FORV_13_)
						local L17_269 = L17_269
						break
					end
				end
				if not _ENV.debug then
					break
				end
				print("--> Particles.DeleteParticleType(): REMOVING '" .. A0_253 .. "' FROM EMITTER '" .. _ENV.Emitters[_FORV_9_].name .. "'")
				break
			end
		end
		_FOR_, _FOR_, _FOR_ = ipairs(_ENV.ParticleTypeIndex)
		for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_9_ == A0_253 then
				table.remove(_ENV.ParticleTypeIndex, _FORV_8_)
				break
			end
		end
		_FOR_, _FOR_, _FOR_ = pairs(_ENV.ParticleTypes[A0_253])
		for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
			_ENV.ParticleTypes[A0_253][_FORV_8_] = nil
		end
		_ENV.ParticleTypes[A0_253] = nil
		if _ENV.debug then
			print("--> Particles.DeleteParticleType(): DELETED PARTICLE TYPE '" .. A0_253 .. "'")
		end
		return
	end
	L9_262 = print
	L16_268 = "!!! Particles.DeleteEmitter(): COULD NOT DELETE PARTICLE TYPE '"
	L17_269 = A0_253
	L16_268 = L16_268 .. L17_269 .. "' (NOT FOUND)"
	L9_262(L16_268)
end
L0_0.DeleteParticleType = L29_29
function L30_30(A0_270, A1_271, A2_272)
	local L3_273
	L3_273 = _ENV
	L3_273 = L3_273.ParticleTypes
	L3_273 = L3_273[A0_270]
	if L3_273 ~= nil then
		if L3_273[A1_271] == nil then
			print("!!! Particles.SetParticleProperty(): YOU TRIED TO SET AN UNKNOWN PROPERTY: ")
			print(A1_271)
			return
		end
		L3_273[A1_271] = A2_272
		L27_27(A0_270)
		if _ENV.debug then
			local L8_278 = L8_278
			local L9_279 = L9_279
			local L10_280 = L10_280
			local L9_279, L11_281 = L9_279 .. L10_280 .. "." .. A1_271 .. " (" .. type(A2_272) .. ").", L11_281
			L8_278(L9_279)
		end
		return
	end
	L8_278 = print
	L9_279 = "!!! Particles.SetParticleProperty(): COULD NOT FIND PARTICLE TYPE '"
	L10_280 = A0_270
	L11_281 = "'"
	L9_279 = L9_279 .. L10_280 .. L11_281
	L8_278(L9_279)
end
L0_0.SetParticleProperty = L30_30
function L31_31(A0_282, A1_283, A2_284, A3_285, A4_286)
	local L5_287, L6_288
	L5_287 = _ENV
	L5_287 = L5_287.Emitters
	L5_287 = L5_287[A0_282]
	L6_288 = _ENV
	L6_288 = L6_288.ParticleTypes
	L6_288 = L6_288[A1_283]
	if L5_287 == nil then
		print("!!! Particles.AddParticleType(): EMITTER '" .. A0_282 .. "' NOT FOUND.")
		return
	end
	if L6_288 == nil then
		local L7_289 = L7_289
		L7_289("!!! Particles.AddParticleType(): PARTICLE TYPE '" .. A1_283 .. "' NOT FOUND.")
		local L8_290 = L8_290
		return
	end
	L7_289 = nil
	L8_290 = nil
	_FOR_, _FOR_, _FOR_ = ipairs(L5_287.PTypeIndex)
	for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_13_ == A1_283 then
			print("!!! Particles.AddParticleType(): PARTICLE TYPE '" .. A1_283 .. "' ALREADY ATTACHED TO EMITTER '" .. A0_282 .. "'.")
			return
		end
	end
	L16_297 = table
	L16_297 = L16_297.insert
	L17_298 = L5_287.PTypeIndex
	L18_299 = A1_283
	L16_297(L17_298, L18_299)
	L16_297 = L5_287.PTypes
	L16_297[A1_283] = L6_288
	L16_297 = L5_287.PTypeSettings
	L17_298 = {}
	L16_297[A1_283] = L17_298
	L16_297 = L5_287.PTypeSettings
	L16_297 = L16_297[A1_283]
	L16_297.name = A1_283
	L16_297 = L5_287.PTypeSettings
	L16_297 = L16_297[A1_283]
	L17_298 = A2_284 / 1000
	L16_297.emissionRate = L17_298
	L16_297 = L5_287.PTypeSettings
	L16_297 = L16_297[A1_283]
	L16_297.delay = A4_286
	L16_297 = L5_287.PTypeSettings
	L16_297 = L16_297[A1_283]
	L16_297.duration = A3_285
	L16_297 = L5_287.PTypeSettings
	L16_297 = L16_297[A1_283]
	L16_297.startTime = 0
	L16_297 = L5_287.PTypeSettings
	L16_297 = L16_297[A1_283]
	L16_297.endTime = 0
	L16_297 = L5_287.PTypeSettings
	L16_297 = L16_297[A1_283]
	L16_297.particlesToEmit = 0
	L16_297 = L5_287.PTypeSettings
	L16_297 = L16_297[A1_283]
	L16_297.active = false
	L16_297 = _ENV
	L16_297 = L16_297.debug
	if L16_297 then
		L16_297 = print
		L17_298 = "--> Particles.AddParticleType(): ADDED PARTICLE TYPE '"
		L18_299 = A1_283
		L19_300 = "' TO EMITTER '"
		L17_298 = L17_298 .. L18_299 .. L19_300 .. A0_282 .. "'."
		L16_297(L17_298)
	end
end
L0_0.AttachParticleType = L31_31
function L32_32(A0_301, A1_302, A2_303)
	local L3_304, L4_305, L5_306, L6_307
	L3_304 = _ENV
	L3_304 = L3_304.Emitters
	L3_304 = L3_304[A0_301]
	L4_305 = 0
	L5_306 = nil
	L6_307 = nil
	if L3_304 == nil then
		print("!!! Particles.RemoveParticleType(): EMITTER '" .. A0_301 .. "' NOT FOUND.")
		return
	end
	L17_17(A0_301)
	if A2_303 ~= true then
		L24_24(A0_301)
	end
	if A1_302 == nil or A1_302 == "" then
		_FOR_, _FOR_, _FOR_ = ipairs(L3_304.PTypeIndex)
		for _FORV_10_, _FORV_11_ in _FOR_, _FOR_, _FOR_ do
			L3_304.PTypes[_FORV_11_] = nil
			L3_304.PTypeSettings[_FORV_11_] = nil
			L4_305 = L4_305 + 1
		end
		while 0 < #L3_304.PTypeIndex do
			table.remove(L3_304.PTypeIndex, 1)
		end
	elseif L3_304.PTypes[A1_302] ~= nil then
		L3_304.PTypes[A1_302] = nil
		L3_304.PTypeSettings[A1_302] = nil
		_FOR_, _FOR_, _FOR_ = ipairs(L3_304.PTypeIndex)
		for _FORV_10_, _FORV_11_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_11_ == A1_302 then
				table.remove(L3_304.PTypeIndex, _FORV_10_)
				break
			end
		end
		L4_305 = 1
	end
	L13_314 = _ENV
	L13_314 = L13_314.debug
	if L13_314 then
		L13_314 = print
		L14_315 = "--> Particles.RemoveParticleType(): REMOVED "
		local L10_311 = L10_311
		local L11_312 = L11_312
		local L14_315, L12_313 = L14_315 .. L10_311 .. L11_312 .. A0_301 .. "'.", L12_313
		L13_314(L14_315)
	end
end
L0_0.DetachParticleTypes = L32_32
function L33_33(A0_316)
	if _ENV.Particles[A0_316] ~= nil then
		if _ENV.Particles[A0_316].PType.TapListener ~= nil then
			local L3_319 = L3_319
			L3_319(_ENV.Particles[A0_316], "tap", _ENV.Particles[A0_316].PType.TapListener)
			local L4_320 = L4_320
		end
		L3_319 = _ENV
		L3_319 = L3_319.Particles
		L3_319 = L3_319[A0_316]
		L3_319.Emitter = nil
		L3_319 = _ENV
		L3_319 = L3_319.Particles
		L3_319 = L3_319[A0_316]
		L3_319.PType = nil
		L3_319 = _ENV
		L3_319 = L3_319.Particles
		L3_319 = L3_319[A0_316]
		L3_319.Listener = nil
		L3_319 = _ENV
		L3_319 = L3_319.Particles
		L3_319 = L3_319[A0_316]
		L4_320 = L3_319
		L3_319 = L3_319.removeSelf
		L3_319(L4_320)
		L3_319 = _ENV
		L3_319 = L3_319.Particles
		L3_319[A0_316] = nil
	end
end
L0_0.DeleteParticle = L33_33
function L34_34(A0_321)
	local L1_322
	if A0_321 == nil then
		L5_326 = 1
		_FOR_ = 1
		for _FORV_5_ = L5_326, _FOR_, _FOR_ do
			L33_33(_FORV_5_)
		end
		L5_326 = _ENV
		L5_326.gMaxParticles = 0
		break -- pseudo-goto
	end
	L5_326 = 1
	_FOR_ = 1
	for _FORV_5_ = L5_326, _FOR_, _FOR_ do
		if _ENV.Particles[_FORV_5_] ~= nil and _ENV.Particles[_FORV_5_].emitterName == A0_321 then
			L33_33(_FORV_5_)
		end
		repeat
		until true
	end
	L5_326 = collectgarbage
	L6_327 = "collect"
	L5_326(L6_327)
	L5_326 = _ENV
	L5_326 = L5_326.debug
	if L5_326 then
		L5_326 = print
		L6_327 = "--> Particles.ClearParticles()"
		L5_326(L6_327)
	end
end
L0_0.ClearParticles = L34_34
function L35_35()
	_ENV()
	L34_34()
	while #L0_0.FXFieldIndex > 0 do
		L9_9(L0_0.FXFieldIndex[1])
	end
	while 0 < #L0_0.ParticleTypeIndex do
		L29_29(L0_0.ParticleTypeIndex[1])
	end
	while 0 < #L0_0.EmitterIndex do
		L14_14(L0_0.EmitterIndex[1])
	end
	L0_0.gLostTime = 0
	L0_0.gSystemFrozen = 0
	L0_0.gParticlesRendered = 0
	L0_0.gCleanUpCalled = true
	collectgarbage("collect")
	if L0_0.debug then
		local L0_329 = L0_329
		L0_329("--> Particles.CleanUp(): FINISHED.")
		local L1_330 = L1_330
	end
end
L0_0.CleanUp = L35_35
function L36_36()
	local L0_331
	L0_331 = _ENV
	local L0_331, L2_333, L3_334, L4_335, L5_336, L6_337, L7_338, L8_339, L9_340, L10_341, L11_342, L12_343, L13_344, L14_345, L15_346, L16_347, L17_348, L18_349, L19_350, L22_353 = L0_331.gSystemFrozen, L2_333, L3_334, L4_335, L5_336, L6_337, L7_338, L8_339, L9_340, L10_341, L11_342, L12_343, L13_344, L14_345, L15_346, L16_347, L17_348, L18_349, L19_350, L22_353
	if 0 < L0_331 then
		return
	end
	L0_331 = nil
	L2_333 = system
	L2_333 = L2_333.getTimer
	L2_333 = L2_333()
	L3_334 = _ENV
	L3_334 = L3_334.gLostTime
	L2_333 = L2_333 - L3_334
	L3_334 = _ENV
	L3_334 = L3_334.gLastTime
	L3_334 = L2_333 - L3_334
	L4_335 = _ENV
	L4_335 = L4_335.timeScale
	L3_334 = L3_334 * L4_335
	L4_335 = _ENV
	L4_335.gLastTime = L2_333
	L4_335 = nil
	L5_336 = nil
	L6_337 = nil
	L7_338 = nil
	L8_339 = nil
	L9_340 = nil
	L10_341 = nil
	L11_342 = nil
	L12_343 = nil
	L13_344 = nil
	L14_345 = nil
	L15_346 = nil
	L16_347 = nil
	L17_348 = nil
	L18_349 = nil
	L19_350 = nil
	L22_353 = nil
	L23_354 = ipairs
	L24_355 = _ENV
	L24_355 = L24_355.EmitterIndex
	L23_354, L24_355, _FOR_ = L23_354(L24_355)
	for _FORV_23_, _FORV_24_ in L23_354, L24_355, _FOR_ do
		L0_331 = _ENV.Emitters[_FORV_24_]
		if L0_331.active then
			L12_343 = L0_331.x
			L13_344 = L0_331.y
			L15_346 = L0_331.scale
			L16_347 = L0_331.alpha
			L14_345 = L0_331.rotation
			L17_348 = L0_331.parent
			if L0_331.FollowObject ~= nil then
				L12_343, L13_344 = L0_331.FollowObject.parent:localToContent(L0_331.FollowObject.x + L0_331.followXOff, L0_331.FollowObject.y + L0_331.followYOff)
				L12_343, L13_344 = L17_348:contentToLocal(L12_343, L13_344)
				L0_331.x, L0_331.y = L12_343, L13_344
				if L0_331.followRotation == true then
					L14_345 = L0_331.FollowObject.rotation + L0_331.followRotationOffset
					L0_331.rotation = L14_345
				end
			end
			if L0_331.Sound ~= nil and L0_331.soundChannel == 0 and L2_333 - L0_331.startTime > L0_331.soundDelay then
				if 0 < L0_331.SoundProperties.channel then
					audio.stop(L0_331.SoundProperties.channel)
				end
				L0_331.soundChannel = audio.play(L0_331.Sound, L0_331.SoundProperties)
			end
			_FOR_, _FOR_, _FOR_ = ipairs(L0_331.PTypeIndex)
			for _FORV_28_, _FORV_29_ in _FOR_, _FOR_, _FOR_ do
				if L0_331.PTypeSettings[_FORV_29_].active == true and L2_333 > L0_331.PTypeSettings[_FORV_29_].startTime then
					if L0_331.oneShot == true then
						L0_331.PTypeSettings[_FORV_29_].particlesToEmit = L0_331.PTypeSettings[_FORV_29_].emissionRate * 1000
					else
						L0_331.PTypeSettings[_FORV_29_].particlesToEmit = L0_331.PTypeSettings[_FORV_29_].particlesToEmit + L3_334 * L0_331.PTypeSettings[_FORV_29_].emissionRate
					end
					L11_342 = _ENV.ParticleTypes[_FORV_29_].emissionRadius * L15_346
					while L0_331.PTypeSettings[_FORV_29_].particlesToEmit >= 1 do
						while _ENV.Particles[1] ~= nil do
						end
						if 1 + 1 > _ENV.gMaxParticles then
							_ENV.gMaxParticles = 1 + 1
						end
						if L0_331.Shape ~= nil then
							if L22_353 == nil then
								L22_353 = display.newGroup()
							end
							L18_349 = _ENV.Ceil(_ENV.Rnd() * #L0_331.Shape.Segments)
							L19_350 = L0_331.Shape.Segments[L18_349]
							if L0_331.Shape.cornersOnly == false then
								L12_343, L13_344 = L19_350:localToContent(_ENV.Rnd() * L19_350.myWidth, 0)
							else
								L12_343, L13_344 = L19_350:localToContent(0, 0)
							end
							L12_343, L13_344 = L17_348:contentToLocal(L12_343, L13_344)
							L19_350:insert(L22_353)
							if L0_331.Shape.useEmitterRotation ~= true then
								L14_345 = L14_345 + L19_350.myAngle
							end
						end
						if _ENV.ParticleTypes[_FORV_29_].ImageSheet ~= nil then
							if _ENV.ParticleTypes[_FORV_29_].AnimationInfo == nil then
								_ENV.Particles[1 + 1] = display.newImageRect(_ENV.ParticleTypes[_FORV_29_].ImageSheet, _ENV.ParticleTypes[_FORV_29_].frames[_ENV.Rnd(1, #_ENV.ParticleTypes[_FORV_29_].frames)], _ENV.ParticleTypes[_FORV_29_].SheetInfo.frames[_ENV.ParticleTypes[_FORV_29_].frames[_ENV.Rnd(1, #_ENV.ParticleTypes[_FORV_29_].frames)]].width, _ENV.ParticleTypes[_FORV_29_].SheetInfo.frames[_ENV.ParticleTypes[_FORV_29_].frames[_ENV.Rnd(1, #_ENV.ParticleTypes[_FORV_29_].frames)]].height)
							else
								_ENV.Particles[1 + 1] = display.newSprite(_ENV.ParticleTypes[_FORV_29_].ImageSheet, _ENV.ParticleTypes[_FORV_29_].AnimationInfo)
								_ENV.Particles[1 + 1]:play()
							end
							_ENV.Particles[1 + 1].xReference = _ENV.ParticleTypes[_FORV_29_].xReference
							_ENV.Particles[1 + 1].yReference = _ENV.ParticleTypes[_FORV_29_].yReference
						elseif _ENV.ParticleTypes[_FORV_29_].text ~= nil then
							_ENV.Particles[1 + 1] = display.newText(_ENV.ParticleTypes[_FORV_29_].text, L12_343, L13_344, _ENV.ParticleTypes[_FORV_29_].font, _ENV.ParticleTypes[_FORV_29_].fontSize)
							_ENV.Particles[1 + 1]:setTextColor(_ENV.ParticleTypes[_FORV_29_].textColor[1], _ENV.ParticleTypes[_FORV_29_].textColor[2], _ENV.ParticleTypes[_FORV_29_].textColor[3])
							_ENV.Particles[1 + 1].xReference = _ENV.ParticleTypes[_FORV_29_].xReference
							_ENV.Particles[1 + 1].yReference = _ENV.ParticleTypes[_FORV_29_].yReference
						elseif _ENV.ParticleTypes[_FORV_29_].SpriteSet == nil then
							_ENV.Particles[1 + 1] = display.newImageRect(_ENV.ParticleTypes[_FORV_29_].imagePath[_ENV.Rnd(1, #_ENV.ParticleTypes[_FORV_29_].imagePath)], _ENV.ParticleTypes[_FORV_29_].imageWidth, _ENV.ParticleTypes[_FORV_29_].imageHeight)
							_ENV.Particles[1 + 1].xReference = _ENV.ParticleTypes[_FORV_29_].xReference
							_ENV.Particles[1 + 1].yReference = _ENV.ParticleTypes[_FORV_29_].yReference
						elseif _ENV.gSpriteAPI ~= nil then
							_ENV.Particles[1 + 1] = _ENV.gSpriteAPI.newSprite(_ENV.ParticleTypes[_FORV_29_].SpriteSet)
							_ENV.Particles[1 + 1]:prepare(_ENV.ParticleTypes[_FORV_29_].animSequence)
							_ENV.Particles[1 + 1]:play()
						else
							print("--------------------------------------------------------")
							print("!!! Particles.Update(): SPRITE API NOT SET! USE UseSpriteAPI() TO SET A REFERENCE!")
							print("--------------------------------------------------------")
						end
						_ENV.Particles[1 + 1].blendMode = _ENV.ParticleTypes[_FORV_29_].blendMode
						if _ENV.Particles[1 + 1].setFillColor ~= nil then
							_ENV.Particles[1 + 1].currColor, ({})[1] = {}, _ENV.ParticleTypes[_FORV_29_].colorStart[1]
							_ENV.Particles[1 + 1].currColor, ({})[2] = {}, _ENV.ParticleTypes[_FORV_29_].colorStart[2]
							_ENV.Particles[1 + 1].currColor, ({})[3] = {}, _ENV.ParticleTypes[_FORV_29_].colorStart[3]
							_ENV.Particles[1 + 1]:setFillColor(_ENV.ParticleTypes[_FORV_29_].colorStart[1], _ENV.ParticleTypes[_FORV_29_].colorStart[2], _ENV.ParticleTypes[_FORV_29_].colorStart[3])
						end
						if _ENV.ParticleTypes[_FORV_29_].TapListener ~= nil then
							_ENV.Particles[1 + 1]:addEventListener("tap", _ENV.ParticleTypes[_FORV_29_].TapListener)
						end
						if _ENV.ParticleTypes[_FORV_29_].emissionShape == 0 then
							_ENV.Particles[1 + 1].x = L12_343
							_ENV.Particles[1 + 1].y = L13_344
						elseif _ENV.ParticleTypes[_FORV_29_].emissionShape == 1 then
							_ENV.Particles[1 + 1].x = L12_343 + _ENV.Sin(_ENV.PI - (L14_345 - 90) / 360 * _ENV.PI2) * L11_342 - _ENV.Sin(_ENV.PI - (L14_345 - 90) / 360 * _ENV.PI2) * (_ENV.Rnd() * L11_342 * 2)
							_ENV.Particles[1 + 1].y = L13_344 + _ENV.Cos(_ENV.PI - (L14_345 - 90) / 360 * _ENV.PI2) * L11_342 - _ENV.Cos(_ENV.PI - (L14_345 - 90) / 360 * _ENV.PI2) * (_ENV.Rnd() * L11_342 * 2)
						elseif _ENV.ParticleTypes[_FORV_29_].emissionShape == 2 then
							_ENV.Particles[1 + 1].x = L12_343 + _ENV.Sin(_ENV.PI - _ENV.Rnd() * 360 / 360 * _ENV.PI2) * L11_342
							_ENV.Particles[1 + 1].y = L13_344 + _ENV.Cos(_ENV.PI - _ENV.Rnd() * 360 / 360 * _ENV.PI2) * L11_342
						elseif _ENV.ParticleTypes[_FORV_29_].emissionShape == 3 then
							_ENV.Particles[1 + 1].x = L12_343 + _ENV.Sin(_ENV.PI - _ENV.Rnd() * 360 / 360 * _ENV.PI2) * (_ENV.Rnd() * L11_342)
							_ENV.Particles[1 + 1].y = L13_344 + _ENV.Cos(_ENV.PI - _ENV.Rnd() * 360 / 360 * _ENV.PI2) * (_ENV.Rnd() * L11_342)
						end
						_ENV.Particles[1 + 1].alfa = _ENV.ParticleTypes[_FORV_29_].alphaStart + _ENV.Rnd() * _ENV.ParticleTypes[_FORV_29_].alphaVariation
						_ENV.Particles[1 + 1].scale = _ENV.ParticleTypes[_FORV_29_].scaleStart + _ENV.Rnd() * _ENV.ParticleTypes[_FORV_29_].scaleVariation
						_ENV.Particles[1 + 1].emitterAlpha = L16_347
						_ENV.Particles[1 + 1].emitterScale = L15_346
						if _ENV.ParticleTypes[_FORV_29_].faceEmitter == false then
							_ENV.Particles[1 + 1].rotation = _ENV.ParticleTypes[_FORV_29_].rotationStart + _ENV.Ceil(_ENV.Rnd() * _ENV.ParticleTypes[_FORV_29_].rotationVariation)
							if _ENV.ParticleTypes[_FORV_29_].useEmitterRotation then
								_ENV.Particles[1 + 1].rotation = _ENV.Particles[1 + 1].rotation + L14_345
							end
							L10_341 = L14_345
						else
							_ENV.Particles[1 + 1].rotation = _ENV.Atan2(_ENV.Particles[1 + 1].y - L13_344, _ENV.Particles[1 + 1].x - L12_343) * (180 / _ENV.PI) - 90
							L10_341 = _ENV.Particles[1 + 1].rotation
						end
						L10_341 = L10_341 - _ENV.ParticleTypes[_FORV_29_].directionVariation * 0.5 + _ENV.Rnd() * _ENV.ParticleTypes[_FORV_29_].directionVariation
						L10_341 = _ENV.PI - L10_341 / 360 * _ENV.PI2
						_ENV.Particles[1 + 1].xSpeed = _ENV.Sin(L10_341) * (_ENV.ParticleTypes[_FORV_29_].vs + _ENV.Rnd() * _ENV.ParticleTypes[_FORV_29_].vv)
						_ENV.Particles[1 + 1].ySpeed = _ENV.Cos(L10_341) * (_ENV.ParticleTypes[_FORV_29_].vs + _ENV.Rnd() * _ENV.ParticleTypes[_FORV_29_].vv)
						_ENV.Particles[1 + 1].weight = _ENV.ParticleTypes[_FORV_29_].we * _ENV.gGravity
						_ENV.Particles[1 + 1].startTime = L2_333
						_ENV.Particles[1 + 1].killTime = L2_333 + _ENV.ParticleTypes[_FORV_29_].lifeTime
						_ENV.Particles[1 + 1].fadeOutTime = L2_333 + _ENV.ParticleTypes[_FORV_29_].fadeOutDelay
						_ENV.Particles[1 + 1].PType, _ENV.Particles[1 + 1].scaleOutTime = _ENV.ParticleTypes[_FORV_29_], L2_333 + _ENV.ParticleTypes[_FORV_29_].scaleOutDelay
						_ENV.Particles[1 + 1].lastX = _ENV.Particles[1 + 1].x
						_ENV.Particles[1 + 1].lastY = _ENV.Particles[1 + 1].y
						_ENV.Particles[1 + 1].emitterName = L0_331.name
						_ENV.Particles[1 + 1].Listener = L0_331.Listener
						_ENV.Particles[1 + 1].currFXField = 0
						if _ENV.ParticleTypes[_FORV_29_].randomMotionMode ~= 0 then
							_ENV.Particles[1 + 1].lastRandomMotion = -1000
							_ENV.Particles[1 + 1].nextRandomDir = _ENV.Particles[1 + 1].rotation
							_ENV.Particles[1 + 1].currRandomDir = _ENV.Particles[1 + 1].rotation
						end
						L17_348:insert(_ENV.Particles[1 + 1])
						if _ENV.ParticleTypes[_FORV_29_].PhysicsMaterial ~= nil then
							_ENV.Particles[1 + 1].isPhysicsParticle = true
							physics.addBody(_ENV.Particles[1 + 1], "dynamic", _ENV.ParticleTypes[_FORV_29_].PhysicsMaterial)
							_ENV.Particles[1 + 1]:setLinearVelocity(_ENV.Particles[1 + 1].xSpeed * 1000, _ENV.Particles[1 + 1].ySpeed * 1000)
							_ENV.Particles[1 + 1].angularVelocity = _ENV.ParticleTypes[_FORV_29_].rc * 1000
							if _ENV.ParticleTypes[_FORV_29_].PhysicsProperties then
								_FOR_, _FOR_, _FOR_ = pairs(_ENV.ParticleTypes[_FORV_29_].PhysicsProperties)
								for _FORV_37_, _FORV_38_ in _FOR_, _FOR_, _FOR_ do
									_ENV.Particles[1 + 1][_FORV_37_] = _FORV_38_
								end
							end
						else
							_ENV.Particles[1 + 1].isPhysicsParticle = false
						end
						L0_331.PTypeSettings[_FORV_29_].particlesToEmit = L0_331.PTypeSettings[_FORV_29_].particlesToEmit - 1
					end
					if L2_333 > L0_331.PTypeSettings[_FORV_29_].endTime or L0_331.oneShot == true then
						L0_331.PTypeSettings[_FORV_29_].active = false
					end
				end
			end
			_FOR_, _FOR_, _FOR_ = ipairs(L0_331.PTypeIndex)
			for _FORV_29_, _FORV_30_ in _FOR_, _FOR_, _FOR_ do
				if L0_331.PTypeSettings[_FORV_30_].active == true then
				end
			end
			if 0 + 1 == 0 then
				if L0_331.loop then
					L16_16(L0_331.name, L0_331.oneShot)
				else
					L17_17(L0_331.name)
					if L0_331.autoDestroy then
						L14_14(L0_331.name)
					end
				end
			end
		end
	end
	L23_354 = _ENV
	L23_354.gParticlesRendered = 0
	L23_354 = nil
	L24_355 = nil
	L25_356 = nil
	L26_357 = nil
	_FOR_ = 1
	for _FORV_29_ = _FOR_, _FOR_, _FOR_ do
		if _ENV.Particles[_FORV_29_] ~= nil then
			local L30_361 = L30_361
			_ENV.gParticlesRendered = _ENV.gParticlesRendered + 1
			if _ENV.Particles[_FORV_29_].isPhysicsParticle ~= true then
				_ENV.Particles[_FORV_29_].lastX = _ENV.Particles[_FORV_29_].x
				_ENV.Particles[_FORV_29_].lastY = _ENV.Particles[_FORV_29_].y
				_ENV.Particles[_FORV_29_].x = _ENV.Particles[_FORV_29_].x + L3_334 * (_ENV.Particles[_FORV_29_].xSpeed * _ENV.Particles[_FORV_29_].emitterScale)
				_ENV.Particles[_FORV_29_].y = _ENV.Particles[_FORV_29_].y + L3_334 * (_ENV.Particles[_FORV_29_].ySpeed * _ENV.Particles[_FORV_29_].emitterScale)
				if _ENV.Particles[_FORV_29_].PType.vc ~= 0 then
					_ENV.Particles[_FORV_29_].xSpeed = _ENV.Particles[_FORV_29_].xSpeed + L3_334 * (_ENV.Particles[_FORV_29_].xSpeed * _ENV.Particles[_FORV_29_].PType.vc)
					_ENV.Particles[_FORV_29_].ySpeed = _ENV.Particles[_FORV_29_].ySpeed + L3_334 * (_ENV.Particles[_FORV_29_].ySpeed * _ENV.Particles[_FORV_29_].PType.vc)
				end
				if _ENV.Particles[_FORV_29_].PType.randomMotionMode ~= 0 then
					if _ENV.Particles[_FORV_29_].PType.randomMotionMode == 1 then
						if L2_333 - _ENV.Particles[_FORV_29_].lastRandomMotion > _ENV.Particles[_FORV_29_].PType.randomMotionInterval then
							_ENV.Particles[_FORV_29_].lastRandomMotion = L2_333
							_ENV.Particles[_FORV_29_].nextRandomDir = _ENV.Particles[_FORV_29_].nextRandomDir - _ENV.Particles[_FORV_29_].PType.randomMotionAmount * 0.5 + _ENV.Rnd() * _ENV.Particles[_FORV_29_].PType.randomMotionAmount
							L10_341 = _ENV.PI - _ENV.Particles[_FORV_29_].nextRandomDir / 360 * _ENV.PI2
							L30_361 = _ENV.Sqrt(_ENV.Particles[_FORV_29_].xSpeed * _ENV.Particles[_FORV_29_].xSpeed + _ENV.Particles[_FORV_29_].ySpeed * _ENV.Particles[_FORV_29_].ySpeed)
							_ENV.Particles[_FORV_29_].xSpeed = _ENV.Sin(L10_341) * L30_361
							_ENV.Particles[_FORV_29_].ySpeed = _ENV.Cos(L10_341) * L30_361
						end
					else
						if L2_333 - _ENV.Particles[_FORV_29_].lastRandomMotion > _ENV.Particles[_FORV_29_].PType.randomMotionInterval then
							_ENV.Particles[_FORV_29_].lastRandomMotion = L2_333
							_ENV.Particles[_FORV_29_].nextRandomDir = _ENV.Particles[_FORV_29_].currRandomDir - _ENV.Particles[_FORV_29_].PType.randomMotionAmount * 0.5 + _ENV.Rnd() * _ENV.Particles[_FORV_29_].PType.randomMotionAmount
						end
						_ENV.Particles[_FORV_29_].currRandomDir = _ENV.Particles[_FORV_29_].currRandomDir + (_ENV.Particles[_FORV_29_].nextRandomDir - _ENV.Particles[_FORV_29_].currRandomDir) / 8
						L10_341 = _ENV.PI - _ENV.Particles[_FORV_29_].currRandomDir / 360 * _ENV.PI2
						L30_361 = _ENV.Sqrt(_ENV.Particles[_FORV_29_].xSpeed * _ENV.Particles[_FORV_29_].xSpeed + _ENV.Particles[_FORV_29_].ySpeed * _ENV.Particles[_FORV_29_].ySpeed)
						_ENV.Particles[_FORV_29_].xSpeed = _ENV.Sin(L10_341) * L30_361
						_ENV.Particles[_FORV_29_].ySpeed = _ENV.Cos(L10_341) * L30_361
					end
				end
				_ENV.Particles[_FORV_29_].ySpeed = _ENV.Particles[_FORV_29_].ySpeed + L3_334 * _ENV.Particles[_FORV_29_].weight
				if L2_333 < _ENV.Particles[_FORV_29_].scaleOutTime or _ENV.Particles[_FORV_29_].PType.so == 0 then
					_ENV.Particles[_FORV_29_].scale = _ENV.Particles[_FORV_29_].scale + L3_334 * _ENV.Particles[_FORV_29_].PType.si
				else
					_ENV.Particles[_FORV_29_].scale = _ENV.Particles[_FORV_29_].scale + L3_334 * _ENV.Particles[_FORV_29_].PType.so
					if _ENV.Particles[_FORV_29_].scale < 0.001 then
						_ENV.Particles[_FORV_29_].scale = 0.001
						_ENV.Particles[_FORV_29_].killTime = L2_333
					end
				end
				if 0 < _ENV.Particles[_FORV_29_].PType.scaleMax and _ENV.Particles[_FORV_29_].scale > _ENV.Particles[_FORV_29_].PType.scaleMax then
					_ENV.Particles[_FORV_29_].scale = _ENV.Particles[_FORV_29_].PType.scaleMax
				end
				_ENV.Particles[_FORV_29_].xScale = _ENV.Particles[_FORV_29_].emitterScale * _ENV.Particles[_FORV_29_].scale
				_ENV.Particles[_FORV_29_].yScale = _ENV.Particles[_FORV_29_].xScale
				if _ENV.Particles[_FORV_29_].PType.autoOrientation == false then
					_ENV.Particles[_FORV_29_].rotation = _ENV.Particles[_FORV_29_].rotation + L3_334 * _ENV.Particles[_FORV_29_].PType.rc
				else
					_ENV.Particles[_FORV_29_].rotation = _ENV.Atan2(_ENV.Particles[_FORV_29_].lastY - _ENV.Particles[_FORV_29_].y, _ENV.Particles[_FORV_29_].lastX - _ENV.Particles[_FORV_29_].x) * (180 / _ENV.PI) - 90
				end
			elseif _ENV.Particles[_FORV_29_].PType.randomMotionMode ~= 0 and L2_333 - _ENV.Particles[_FORV_29_].lastRandomMotion > _ENV.Particles[_FORV_29_].PType.randomMotionInterval then
				_ENV.Particles[_FORV_29_].lastRandomMotion = L2_333
				_ENV.Particles[_FORV_29_].nextRandomDir = _ENV.Particles[_FORV_29_].nextRandomDir - _ENV.Particles[_FORV_29_].PType.randomMotionAmount * 0.5 + _ENV.Rnd() * _ENV.Particles[_FORV_29_].PType.randomMotionAmount
				L10_341 = _ENV.PI - _ENV.Particles[_FORV_29_].nextRandomDir / 360 * _ENV.PI2
				L30_361 = _ENV.Sqrt(_ENV.Particles[_FORV_29_]:getLinearVelocity() * _ENV.Particles[_FORV_29_]:getLinearVelocity() + _ENV.Particles[_FORV_29_]:getLinearVelocity() * _ENV.Particles[_FORV_29_]:getLinearVelocity())
				_ENV.Particles[_FORV_29_]:setLinearVelocity(_ENV.Sin(L10_341) * L30_361, _ENV.Cos(L10_341) * L30_361)
			end
			if L2_333 < _ENV.Particles[_FORV_29_].fadeOutTime or _ENV.Particles[_FORV_29_].PType.fo == 0 then
				_ENV.Particles[_FORV_29_].alfa = _ENV.Particles[_FORV_29_].alfa + L3_334 * _ENV.Particles[_FORV_29_].PType.fi
			else
				_ENV.Particles[_FORV_29_].alfa = _ENV.Particles[_FORV_29_].alfa + L3_334 * _ENV.Particles[_FORV_29_].PType.fo
				if 0 > _ENV.Particles[_FORV_29_].alfa then
					_ENV.Particles[_FORV_29_].alfa = 0
					_ENV.Particles[_FORV_29_].killTime = L2_333
				end
			end
			if 1 < _ENV.Particles[_FORV_29_].alfa then
				_ENV.Particles[_FORV_29_].alfa = 1
			end
			_ENV.Particles[_FORV_29_].alpha = _ENV.Particles[_FORV_29_].emitterAlpha * _ENV.Particles[_FORV_29_].alfa
			_FOR_, _FOR_, _FOR_ = ipairs(_ENV.FXFieldIndex)
			for _FORV_35_, _FORV_36_ in _FOR_, _FOR_, _FOR_ do
				Field = _ENV.FXFields[_FORV_36_]
				if Field.enabled and _ENV.Particles[_FORV_29_].PType.fxID == Field.fxID then
					L23_354 = _ENV.Abs(Field.x - _ENV.Particles[_FORV_29_].x)
					L24_355 = _ENV.Abs(Field.y - _ENV.Particles[_FORV_29_].y)
					L25_356 = (L23_354 * L23_354 + L24_355 * L24_355) ^ 0.5
					if L25_356 > Field.radius then
						if _ENV.Particles[_FORV_29_].currFXField == Field.uniqueID and Field.Listener ~= nil then
							({}).name = Field.name
							;({}).phase = "leave"
							;({}).Particle, ({}).FXField = _ENV.Particles[_FORV_29_], Field
							;({}).particleType = _ENV.Particles[_FORV_29_].PType.name
							Field:dispatchEvent({})
							_ENV.Particles[_FORV_29_].currFXField = 0
						end
					else
						if Field.Listener ~= nil then
							if _ENV.Particles[_FORV_29_].currFXField == 0 then
								({}).name = Field.name
								;({}).phase = "enter"
								;({}).Particle, ({}).FXField = _ENV.Particles[_FORV_29_], Field
								;({}).particleType = _ENV.Particles[_FORV_29_].PType.name
								Field:dispatchEvent({})
							end
							_ENV.Particles[_FORV_29_].currFXField = Field.uniqueID
						end
						if _ENV.Particles[_FORV_29_].isPhysicsParticle == true then
							if Field.mode == 0 and 16 < L25_356 then
								L26_357 = (1 - L25_356 / Field.radius) * Field.strength
								_ENV.Particles[_FORV_29_]:applyForce((Field.x - _ENV.Particles[_FORV_29_].x) * L26_357, (Field.y - _ENV.Particles[_FORV_29_].y) * L26_357, _ENV.Particles[_FORV_29_].x, _ENV.Particles[_FORV_29_].y)
							elseif Field.mode == 1 then
								L26_357 = (1 - L25_356 / Field.radius) * Field.strength
								_ENV.Particles[_FORV_29_]:applyForce((_ENV.Particles[_FORV_29_].x - Field.x) * L26_357, (_ENV.Particles[_FORV_29_].y - Field.y) * L26_357, _ENV.Particles[_FORV_29_].x, _ENV.Particles[_FORV_29_].y)
							elseif Field.mode == 2 then
								_ENV.Particles[_FORV_29_].killTime = L2_333
							elseif Field.mode == 3 then
								L26_357 = (1 - L25_356 / Field.radius) * Field.strength
								L10_341 = _ENV.PI - Field.rotation / 360 * _ENV.PI2
								_ENV.Particles[_FORV_29_]:applyForce(_ENV.Sin(L10_341) * L26_357, _ENV.Cos(L10_341) * L26_357, _ENV.Particles[_FORV_29_].x, _ENV.Particles[_FORV_29_].y)
							else
								if Field.mode ~= 4 then
									goto lbl_1421
								end
								L10_341 = _ENV.PI - Field.rotation / 360 * _ENV.PI2
								_ENV.Particles[_FORV_29_]:setLinearVelocity(_ENV.Sin(L10_341) * Field.strength, _ENV.Cos(L10_341) * Field.strength, _ENV.Particles[_FORV_29_].x, _ENV.Particles[_FORV_29_].y)
								local L42_373 = L42_373
								do break end -- pseudo-goto
								if Field.mode == 0 and 16 < L25_356 then
									L26_357 = (1 - L25_356 / Field.radius) * (Field.strength / 1500)
									_ENV.Particles[_FORV_29_].xSpeed = _ENV.Particles[_FORV_29_].xSpeed + (Field.x - _ENV.Particles[_FORV_29_].x) * L26_357
									_ENV.Particles[_FORV_29_].ySpeed = _ENV.Particles[_FORV_29_].ySpeed + (Field.y - _ENV.Particles[_FORV_29_].y) * L26_357
								else
									if Field.mode == 1 then
										_ENV.Particles[_FORV_29_].xSpeed = _ENV.Sin(_ENV.PI - (_ENV.Atan2(Field.y - _ENV.Particles[_FORV_29_].y, Field.x - _ENV.Particles[_FORV_29_].x) * (180 / _ENV.PI) - 90) / 360 * _ENV.PI2) * (_ENV.Abs(_ENV.Particles[_FORV_29_].xSpeed) * _ENV.Particles[_FORV_29_].PType.bounciness)
										_ENV.Particles[_FORV_29_].ySpeed = _ENV.Cos(_ENV.PI - (_ENV.Atan2(Field.y - _ENV.Particles[_FORV_29_].y, Field.x - _ENV.Particles[_FORV_29_].x) * (180 / _ENV.PI) - 90) / 360 * _ENV.PI2) * (_ENV.Abs(_ENV.Particles[_FORV_29_].ySpeed) * _ENV.Particles[_FORV_29_].PType.bounciness)
										break -- pseudo-goto
									end
									if Field.mode == 2 then
										_ENV.Particles[_FORV_29_].killTime = L2_333
									else
										if Field.mode == 3 then
											L26_357 = (1 - L25_356 / Field.radius) * (Field.strength / 1500)
											L10_341 = _ENV.PI - Field.rotation / 360 * _ENV.PI2
											_ENV.Particles[_FORV_29_].xSpeed = _ENV.Particles[_FORV_29_].xSpeed - (_ENV.Particles[_FORV_29_].xSpeed - _ENV.Sin(L10_341)) * L26_357
											_ENV.Particles[_FORV_29_].ySpeed = _ENV.Particles[_FORV_29_].ySpeed - (_ENV.Particles[_FORV_29_].ySpeed - _ENV.Cos(L10_341)) * L26_357
											break -- pseudo-goto
										end
										if Field.mode == 4 then
											repeat
												L10_341 = _ENV.PI - Field.rotation / 360 * _ENV.PI2
												_ENV.Particles[_FORV_29_].xSpeed = _ENV.Sin(L10_341) * (Field.strength / 1000)
												_ENV.Particles[_FORV_29_].ySpeed = _ENV.Cos(L10_341) * (Field.strength / 1000)
											until true
										end
									end
								end
								_ENV.Particles[_FORV_29_].x = _ENV.Particles[_FORV_29_].lastX + _ENV.Particles[_FORV_29_].xSpeed * L3_334
								_ENV.Particles[_FORV_29_].y = _ENV.Particles[_FORV_29_].lastY + _ENV.Particles[_FORV_29_].ySpeed * L3_334
							end
						end
					end
				end
				::lbl_1421::
				repeat
				until true
			end
			if _ENV.Particles[_FORV_29_].setFillColor ~= nil and _ENV.Particles[_FORV_29_].PType.colorChange ~= 0 then
				_ENV.Particles[_FORV_29_].currColor[1] = _ENV.Particles[_FORV_29_].currColor[1] + _ENV.Particles[_FORV_29_].PType.ccR * L3_334
				_ENV.Particles[_FORV_29_].currColor[2] = _ENV.Particles[_FORV_29_].currColor[2] + _ENV.Particles[_FORV_29_].PType.ccG * L3_334
				_ENV.Particles[_FORV_29_].currColor[3] = _ENV.Particles[_FORV_29_].currColor[3] + _ENV.Particles[_FORV_29_].PType.ccB * L3_334
				if _ENV.Particles[_FORV_29_].currColor[1] > 255 then
					_ENV.Particles[_FORV_29_].currColor[1] = 255
				elseif 0 > _ENV.Particles[_FORV_29_].currColor[1] then
					_ENV.Particles[_FORV_29_].currColor[1] = 0
				end
				if _ENV.Particles[_FORV_29_].currColor[2] > 255 then
					_ENV.Particles[_FORV_29_].currColor[2] = 255
				elseif 0 > _ENV.Particles[_FORV_29_].currColor[2] then
					_ENV.Particles[_FORV_29_].currColor[2] = 0
				end
				if _ENV.Particles[_FORV_29_].currColor[3] > 255 then
					_ENV.Particles[_FORV_29_].currColor[3] = 255
				elseif 0 > _ENV.Particles[_FORV_29_].currColor[3] then
					_ENV.Particles[_FORV_29_].currColor[3] = 0
				end
				_ENV.Particles[_FORV_29_]:setFillColor(_ENV.Particles[_FORV_29_].currColor[1], _ENV.Particles[_FORV_29_].currColor[2], _ENV.Particles[_FORV_29_].currColor[3])
			end
			if _ENV.Particles[_FORV_29_].PType.killOutsideScreen == true or _ENV.Particles[_FORV_29_].PType.bounceX == true or _ENV.Particles[_FORV_29_].PType.bounceY == true then
				if _ENV.Particles[_FORV_29_]:localToContent(0, 0) < _ENV.gScrLeftX or _ENV.Particles[_FORV_29_]:localToContent(0, 0) > _ENV.gScrRightX then
					if _ENV.Particles[_FORV_29_].PType.bounceX == true and _ENV.Particles[_FORV_29_].isPhysicsParticle ~= true then
						_ENV.Particles[_FORV_29_].xSpeed = _ENV.Particles[_FORV_29_].PType.bounciness * _ENV.Particles[_FORV_29_].xSpeed * -1
						_ENV.Particles[_FORV_29_].x = _ENV.Particles[_FORV_29_].lastX
					elseif _ENV.Particles[_FORV_29_].PType.killOutsideScreen == true then
						_ENV.Particles[_FORV_29_].killTime = L2_333
					end
				elseif 0 > _ENV.Particles[_FORV_29_]:localToContent(0, 0) or _ENV.Particles[_FORV_29_]:localToContent(0, 0) > _ENV.gScrH then
					if _ENV.Particles[_FORV_29_].PType.bounceY == true and _ENV.Particles[_FORV_29_].isPhysicsParticle ~= true then
						_ENV.Particles[_FORV_29_].ySpeed = _ENV.Particles[_FORV_29_].PType.bounciness * _ENV.Particles[_FORV_29_].ySpeed * -1
						_ENV.Particles[_FORV_29_].y = _ENV.Particles[_FORV_29_].lastY
					elseif _ENV.Particles[_FORV_29_].PType.killOutsideScreen == true then
						_ENV.Particles[_FORV_29_].killTime = L2_333
					end
				end
			end
			if L2_333 >= _ENV.Particles[_FORV_29_].killTime then
				if _ENV.Particles[_FORV_29_].Listener ~= nil then
					({}).name = "particleKilled"
					;({}).x = _ENV.Particles[_FORV_29_].x
					;({}).y = _ENV.Particles[_FORV_29_].y
					;({}).rotation = _ENV.Particles[_FORV_29_].rotation
					;({}).alpha = _ENV.Particles[_FORV_29_].alpha
					;({}).scale = _ENV.Particles[_FORV_29_].xScale
					;({}).xSpeed = _ENV.Particles[_FORV_29_].xSpeed
					;({}).ySpeed = _ENV.Particles[_FORV_29_].ySpeed
					;({}).typeName = _ENV.Particles[_FORV_29_].PType.name
					;({}).particleIndex = _FORV_29_
					;({}).emitterName = _ENV.Particles[_FORV_29_].emitterName
					Runtime:dispatchEvent({})
				end
				L33_33(_FORV_29_)
			end
		end
	end
	L33_364 = _ENV
	L33_364 = L33_364.gMaxParticles
	_FOR_ = -1
	for _FORV_30_ = _FOR_, _FOR_, _FOR_ do
		_ENV.gMaxParticles = _FORV_30_
		if _ENV.Particles[_FORV_30_] ~= nil then
			break
		end
	end
	if L22_353 ~= nil then
		L22_353:removeSelf()
		L22_353 = nil
	end
end
L0_0.Update = L36_36
function L37_37()
	local L0_374, L1_375
	L0_374 = _ENV
	L0_374 = L0_374.gParticlesRendered
	return L0_374
end
L0_0.CountParticles = L37_37
function L38_38(A0_376)
	local L1_377
	L1_377 = _ENV
	L1_377 = L1_377.gMaxParticles
	return L1_377
end
L0_0.GetMaxParticles = L38_38
function L39_39(A0_378)
	local L1_379
	L1_379 = _ENV
	L1_379 = L1_379.Particles
	L1_379 = L1_379[A0_378]
	return L1_379
end
L0_0.GetParticle = L39_39
function L40_40(A0_380)
	if _ENV.gSystemFrozen > 0 then
		return
	end
	if A0_380 == true then
		_ENV.gSystemFrozen = 2
	else
		_ENV.gSystemFrozen = 1
	end
	_ENV.gSuspTime = system.getTimer()
	if _ENV.debug then
		local L1_381 = L1_381
		L1_381("--> Particles.Freeze() - PARTICLE SYSTEM FROZEN.")
		local L2_382 = L2_382
	end
end
L0_0.Freeze = L40_40
function L41_41(A0_383)
	if _ENV.gSystemFrozen == 0 then
		return
	end
	if A0_383 == true and _ENV.gSystemFrozen == 1 then
		return
	end
	_ENV.gSystemFrozen = 0
	local L3_386 = L3_386
	L3_386.gLostTime = _ENV.gLostTime + system.getTimer() - _ENV.gSuspTime
	L3_386 = _ENV
	L3_386 = L3_386.debug
	if L3_386 then
		L3_386 = print
		L3_386("--> Particles.WakeUp() - PARTICLE SYSTEM RESUMED.")
		local L2_385 = L2_385
	end
end
L0_0.WakeUp = L41_41
function L42_42(A0_387, A1_388, A2_389)
	local L3_390, L4_391
	_ENV.gEmitterColorR = A0_387
	L7_394 = _ENV
	L7_394.gEmitterColorG = A1_388
	L7_394 = _ENV
	L7_394.gEmitterColorB = A2_389
	L7_394 = ipairs
	L8_395 = _ENV
	L8_395 = L8_395.EmitterIndex
	L7_394, L8_395, L9_396 = L7_394(L8_395)
	for _FORV_8_, _FORV_9_ in L7_394, L8_395, L9_396 do
		local L12_399 = L12_399
		local L13_400 = L13_400
		L12_399(L13_400, _ENV.gEmitterColorR, _ENV.gEmitterColorG, _ENV.gEmitterColorB)
		local L14_401 = L14_401
	end
end
L0_0.SetEmitterColor = L42_42
function L43_43(A0_402)
	if A0_402 == nil then
		print("--> Particles.UseSpriteAPI() - SPRITE API NOT FOUND!")
		return
	end
	_ENV.gSpriteAPI = A0_402
	if _ENV.debug then
		local L1_403 = L1_403
		L1_403("--> Particles.UseSpriteAPI() - SPRITE API SET.")
		local L2_404 = L2_404
	end
end
L0_0.UseSpriteAPI = L43_43
function L0_0.StartAutoUpdate()
	local L1_405 = L1_405
	local L2_406 = L2_406
	L1_405(L2_406, "enterFrame", _ENV)
	local L3_407 = L3_407
end
function L4_4()
	local L1_408 = L1_408
	local L2_409 = L2_409
	L1_408(L2_409, "enterFrame", _ENV)
	local L3_410 = L3_410
end
L0_0.StopAutoUpdate = L4_4
function L0_0.onSuspend(A0_411)
	if A0_411.type == "applicationSuspend" then
		_ENV(true)
	elseif A0_411.type == "applicationResume" then
		L41_41(true)
		local L2_412 = L2_412
	end
end


-- [End of decompiled block; see disassembly for inner stripped closures]
