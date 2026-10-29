local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38
L0_0 = true
L1_1 = true
L2_2 = {}
L3_3 = {}
L3_3.button = "res/sounds/button1.mp3"
L3_3.ding = "res/sounds/ding.mp3"
L2_2.globalSounds = L3_3
L3_3 = {}
L4_4 = {}
L5_5 = 0.85
L6_6 = 0.85
L7_7 = L5_5
L8_8 = L6_6
L9_9 = 1
L10_10 = 1
function L11_11()
	if audio.supportsSessionProperty then
		audio.setSessionProperty(audio.MixMode, audio.AmbientMixMode)
		local L3_41 = L3_41
	end
	audio.reserveChannels(_ENV)
	L2_2.loadSoundSettings()
end
L2_2.initialize = L11_11
function L12_12()
	if audio.supportsSessionProperty then
		local L0_42 = L0_42
		local L0_42, L1_43 = L0_42(audio.OtherAudioIsPlaying), L1_43
		if L0_42 == 1 then
			L0_42 = false
			return L0_42
		end
	end
	L0_42 = true
	return L0_42
end
L2_2.shouldPlayMusic = L12_12
function L13_13()
	local L1_44
	L1_44 = _ENV
	return L1_44
end
L2_2.getTrackedChannels = L13_13
function L14_14(A0_45)
	local L1_46
	L1_46 = _ENV
	L1_46 = L1_46[A0_45]
	return L1_46
end
L2_2.getChannelSound = L14_14
function L15_15(A0_47, A1_48, A2_49)
	local L3_50 = L3_50
	L3_50(A0_47)
	local L4_51 = L4_51
	L3_50 = L3_3
	L4_51 = {}
	L4_51.fileName = A0_47
	L4_51.handle = A1_48
	L4_51.args = A2_49
	L3_50[A0_47] = L4_51
end
L2_2.cacheSound = L15_15
function L16_16()
	do return utils.deepcopy(_ENV) end
	local L1_52 = L1_52
end
L2_2.getSoundCacheCopy = L16_16
function L17_17(A0_53)
	if A0_53 == null then
		audio.stop()
	else
		audio.stop(A0_53)
		local L2_54 = L2_54
	end
end
L2_2.stop = L17_17
function L18_18()
	L2_57 = _ENV
	L0_55, L2_57, L3_58 = L0_55(L2_57)
	for _FORV_3_, _FORV_4_ in L0_55, L2_57, L3_58 do
		L2_2.dispose(_FORV_3_)
	end
	L0_55 = {}
	_ENV = L0_55
end
L2_2.disposeAllSounds = L18_18
function L19_19(A0_61)
	L3_64 = _ENV
	L1_62, L3_64, L4_65 = L1_62(L3_64)
	for L5_66, _FORV_5_ in L1_62, L3_64, L4_65 do
		if not A0_61 or not A0_61[L5_66] then
			L2_2.dispose(L5_66)
			local L7_68 = L7_68
			L7_68 = _ENV
			L7_68[L5_66] = nil
		end
	end
end
L2_2.disposeAllSounds = L18_18
function L20_20(A0_69)
	if _ENV[A0_69] and _ENV[A0_69].handle then
		local L1_70 = L1_70
		L1_70(_ENV[A0_69].handle)
		local L2_71 = L2_71
		L1_70 = _ENV
		L1_70[A0_69] = nil
	end
end
L2_2.dispose = L20_20
function L21_21(A0_72, A1_73)
	if _ENV.isSoundEnabled() then
		if not L3_3[A0_72] then
			local L2_74 = L2_74
			local L3_75 = L3_75
			local L4_76 = L4_76
			L2_74(L3_75, L4_76, A1_73)
			local L5_77 = L5_77
		end
		L2_74 = L3_3
		L2_74 = L2_74[A0_72]
		return L2_74
	end
	L2_74 = nil
	return L2_74
end
L2_2.loadStream = L21_21
function L22_22(A0_78, A1_79)
	if _ENV.isSoundEnabled() then
		if not L3_3[A0_78] then
			local L2_80 = L2_80
			local L3_81 = L3_81
			local L4_82 = L4_82
			L2_80(L3_81, L4_82, A1_79)
			local L5_83 = L5_83
		end
		L2_80 = L3_3
		L2_80 = L2_80[A0_78]
		return L2_80
	end
	L2_80 = nil
	return L2_80
end
L2_2.loadSound = L22_22
function L23_23(A0_84)
	local L1_85
	if A0_84 then
		L1_85 = A0_84.channel
		if L1_85 then
			local L2_86 = L2_86
			local L2_86, L3_87 = L2_86(L1_85), L3_87
			if not L2_86 then
				L2_86 = _ENV
				L2_86[L1_85] = nil
			end
		end
	end
end
L2_2.removeTrackedChannel = L23_23
function L24_24(A0_88, A1_89)
	if not A1_89 then
		A1_89 = A0_88.args
	end
	if not A1_89 then
		A1_89 = {}
	end
	if not A1_89.channel then
	end
	A1_89.channel = audio.findFreeChannel(_ENV + 1)
	if A1_89.onComplete then
		function A1_89.onComplete(A0_93)
			_ENV.removeTrackedChannel(A0_93)
			_UPVALUE1_(A0_93)
			local L2_94 = L2_94
		end
	else
		A1_89.onComplete = L2_2.removeTrackedChannel
	end
	local L2_90 = L2_90
	local L3_91 = L3_91
	L2_90(L3_91, A1_89)
	local L4_92 = L4_92
	L2_90 = L4_4
	L3_91 = A1_89.channel
	L4_92 = A0_88.fileName
	L2_90[L3_91] = L4_92
	L2_90 = A1_89.channel
	return L2_90
end
function L25_25(A0_95, A1_96)
	local L2_97 = _ENV.isSoundEnabled()
	if L2_97 then
		L2_97 = L3_3
		L2_97 = L2_97[A0_95]
		if not L2_97 then
			L2_97 = _ENV.loadStream(A0_95, A1_96)
		end
		local L3_98 = L3_98
		local L4_99 = L4_99
		do return L3_98(L4_99, A1_96) end
		local L5_100 = L5_100
	end
	L2_97 = nil
	return L2_97
end
L2_2.playStream = L25_25
function L26_26(A0_101, A1_102)
	local L2_103 = _ENV.isSoundEnabled()
	if L2_103 then
		L2_103 = L3_3
		L2_103 = L2_103[A0_101]
		if not L2_103 then
			L2_103 = _ENV.loadSound(A0_101, A1_102)
		end
		local L3_104 = L3_104
		local L4_105 = L4_105
		do return L3_104(L4_105, A1_102) end
		local L5_106 = L5_106
	end
	L2_103 = nil
	return L2_103
end
L2_2.playSound = L26_26
function L27_27(A0_107)
	L3_110 = _ENV.isSoundEnabled
	L3_110 = L3_110()
	if L3_110 and A0_107 then
		L3_110 = pairs
		L4_111 = A0_107
		L3_110, L4_111, L5_112 = L3_110(L4_111)
		for _FORV_4_, _FORV_5_ in L3_110, L4_111, L5_112 do
			if type(_FORV_5_) == "string" then
				_ENV.loadSound(_FORV_5_)
			elseif _FORV_5_.fileName then
				if _FORV_5_.isStream then
					_ENV.loadStream(_FORV_5_.fileName, _FORV_5_.args)
				else
					_ENV.loadSound(_FORV_5_.fileName, _FORV_5_.args)
					local L8_115 = L8_115
				end
			end
		end
	end
end
L2_2.loadSoundBatch = L27_27
function L28_28(...)
	local L1_116
	L1_116 = audio
	L1_116 = L1_116.fadeOut
	local L2_117 = L2_117
	local L2_117, L3_118 = L2_117(arg)
	L1_116(L2_117, L3_118)
end
L2_2.fadeOut = L28_28
function L29_29(...)
	local L1_119
	L1_119 = audio
	L1_119 = L1_119.setVolume
	local L2_120 = L2_120
	local L2_120, L3_121 = L2_120(arg)
	L1_119(L2_120, L3_121)
end
L2_2.setVolume = L29_29
function L30_30(A0_122)
	if A0_122 then
		L3_125 = pairs
		L4_126 = A0_122
		L3_125, L4_126, L5_127 = L3_125(L4_126)
		for _FORV_4_, _FORV_5_ in L3_125, L4_126, L5_127 do
			if type(_FORV_5_) == "string" then
				_ENV(_FORV_5_)
			elseif _FORV_5_.fileName then
				_ENV(_FORV_5_.fileName)
			end
		end
	end
end
L2_2.disposeSoundBatch = L30_30
function L31_31()
	_ENV = settings:get("sound_volume")
	if _ENV == nil then
		_ENV = L5_5
	end
	L2_2.setSoundVolume(_ENV)
	local L2_131 = settings:get("speech_volume")
	L8_8 = L2_131
	L2_131 = L8_8
	if L2_131 == nil then
		L2_131 = L6_6
		L8_8 = L2_131
	end
	L2_131 = L2_2
	L2_131 = L2_131.setSpeechVolume
	L2_131(L8_8)
end
L2_2.loadSoundSettings = L31_31
function L32_32()
	local L1_132
	L1_132 = _ENV
	return L1_132
end
L2_2.isSoundEnabled = L32_32
function L33_33()
	local L1_133
	L1_133 = _ENV
	return L1_133
end
L2_2.isSpeechEnabled = L33_33
function L34_34()
	local L1_134
	L1_134 = _ENV
	return L1_134
end
L2_2.getSpeechChannel = L34_34
function L35_35()
	local L1_135
	L1_135 = _ENV
	return L1_135
end
L2_2.getSpeechVolume = L35_35
function L36_36()
	local L1_136
	L1_136 = _ENV
	return L1_136
end
L2_2.getSoundVolume = L36_36
function L37_37(A0_137)
	if 0 < A0_137 then
		_ENV = true
	else
		_ENV = false
	end
	L7_7 = A0_137
	audio.setVolume(A0_137)
	local L1_138, L2_139 = L1_138, L2_139
	local L3_140 = L3_140
	L1_138(L2_139, L3_140, L7_7)
	local L4_141 = L4_141
end
L2_2.setSoundVolume = L37_37
function L38_38(A0_142)
	if 0 < A0_142 then
		_ENV = true
	else
		_ENV = false
	end
	L8_8 = A0_142
	;({}).channel = L10_10
	audio.setVolume(A0_142, {})
	local L1_143, L2_144 = L1_143, L2_144
	local L3_145 = L3_145
	L1_143(L2_144, L3_145, L8_8)
	local L4_146 = L4_146
end
L2_2.setSpeechVolume = L38_38
return L2_2
