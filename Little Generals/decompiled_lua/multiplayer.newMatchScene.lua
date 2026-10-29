-- Decompiled & AI-Repaired from multiplayer.newMatchScene.lu
-- Source disassembly preserved at: disasm/multiplayer.newMatchScene.disasm

local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28 = L3_3, "facebookSupport", L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28
L3_3(L4_4)
L3_3 = require
L4_4 = "twitterSupport"
L3_3(L4_4)
L3_3 = require
L4_4 = "multiplayer.match"
L3_3 = L3_3(L4_4)
L4_4 = require
L5_5 = "gameNetwork"
L4_4 = L4_4(L5_5)
L5_5 = storyboard
L5_5 = L5_5.newScene
L5_5 = L5_5()
L6_6 = nil
L7_7 = -75
L8_8 = nil
L9_9 = nil
L10_10 = nil
L11_11 = 740
L12_12 = 60
L13_13 = L11_11 - L12_12
L13_13 = L13_13 - 20
L14_14 = L11_11 - 10
L15_15 = nil
L16_16 = nil
L17_17 = nil
L18_18 = false
function L19_19()
	_ENV.showNormal()
	L17_17.showNormal()
end
function L20_20(A0_33, A1_34, A2_35)
	if A0_33 and A0_33.x then
		local L7_40 = L7_40
		local L8_41 = L8_41
		local L7_40, L9_42 = L7_40(L8_41, A1_34, 110, 45, "SingleSleeve", 45), L9_42
		A1_34 = L7_40
		L8_41 = A0_33
		L7_40 = A0_33.insert
		L9_42 = A1_34
		L7_40(L8_41, L9_42)
		if A2_35 then
			L8_41 = A1_34
			L7_40 = A1_34.setTextColor
			L9_42 = unpack
			L9_42 = L9_42(A2_35)
			L7_40(L8_41, L9_42, L9_42(A2_35))
			break -- pseudo-goto
		end
		L8_41 = A1_34
		L7_40 = A1_34.setTextColor
		L9_42 = LITTLE_GENERALS_BROWN_DARK
		L9_42 = L9_42()
		repeat
			L7_40(L8_41, L9_42, L9_42())
		until true
		A0_33.description = A1_34
	end
end
function L21_21(A0_43, A1_44)
	repeat
		if A1_44 then
			({}).normalTopColor, ({})[1] = {}, 253
			;({}).normalTopColor, ({})[2] = {}, 207
			;({}).normalTopColor, ({})[3] = {}, 150
			local L7_50 = L7_50
			;({}).normalBottomColor, ({})[1] = {}, 245
			;({}).normalBottomColor, ({})[2] = {}, 168
			local ({}).normalBottomColor, ({})[3], L8_51 = {}, 89, L8_51
			;({}).normalTextShadowColor = utils.pack(LITTLE_GENERALS_BROWN_DARK())
			;({}).normalBorderColor = utils.pack(LITTLE_GENERALS_BROWN_DARK())
			L7_50(L8_51, {})
			break -- pseudo-goto
		end
		L7_50 = utils
		L7_50 = L7_50.basicButtonModify
		L8_51 = A0_43
		;({}).normalTopColor = utils.pack(LITTLE_GENERALS_LIGHT_GREY())
		;({}).normalBottomColor = utils.pack(LITTLE_GENERALS_MED_GREY())
		;({}).normalBorderColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		local L6_49 = L6_49
		L6_49.normalTextShadowColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		L7_50(L8_51, L6_49)
	until true
end
function L22_22(A0_52, A1_53)
	local L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60, L9_61, L10_62
	L2_54 = false
	L3_55 = 1
	L4_56 = _ENV
	L4_56 = L4_56.jumpButtons
	L4_56 = #L4_56
	L5_57 = 1
	for L6_58 = L3_55, L4_56, L5_57 do
		L7_59 = _ENV
		L7_59 = L7_59.jumpButtons
		L7_59 = L7_59[L6_58]
		L8_60 = 1
		L9_61 = L7_59.jumpTos
		L9_61 = #L9_61
		L10_62 = 1
		for _FORV_11_ = L8_60, L9_61, L10_62 do
			if L7_59.jumpTos[_FORV_11_] == A0_52 then
				local L13_64 = L13_64
				L13_64(L7_59, A1_53)
				local L14_65 = L14_65
				L2_54 = true
				break
			end
		end
		if L2_54 then
			break
		end
	end
end
function L23_23(A0_66, A1_67)
	local L3_69 = display.newGroup
	L3_69 = L3_69()
	local L4_70 = L4_70
	display.newRect(L3_69, 0, 0, _ENV + L4_70, 45):setFillColor(LITTLE_GENERALS_LIGHT_GREY())
	if not A0_66.sections then
	end
	A0_66.sections = {}
	table.insert(A0_66.sections, L3_69)
	L3_69.sectionHeader = A1_67
	local L5_71 = L5_71
	;({}).size = 45
	L3_69:insert((utils.getOutlinedText(A1_67, {})))
	utils.getOutlinedText(A1_67, {}).x, utils.getOutlinedText(A1_67, {}).y = 30, L5_71.y - 2
	local L6_72 = L6_72
	L3_69:setReferencePoint(display.TopLeftReferencePoint)
	if 0 < A0_66.height then
	end
	L3_69.y = A0_66.height - 9
	L3_69.x = 2
	local L7_73, L8_74 = L7_73, L8_74
	L8_74(A0_66, L3_69)
	local L9_75 = L9_75
	return L3_69
end
function L24_24(A0_76, A1_77, A2_78, A3_79, A4_80, A5_81, A6_82)
	local L8_84, L9_85 = display.newGroup, L9_85
	L8_84 = L8_84()
	L9_85 = 100
	local L10_86 = L10_86
	;({}).width = _ENV
	;({}).height = L9_85
	;({}).borderWidth = L10_86
	;({}).topColor = utils.pack(LITTLE_GENERALS_BACKGROUND_DARK())
	;({}).bottomColor = utils.pack(LITTLE_GENERALS_BACKGROUND_LIGHT())
	utils.getTwoToneBox({}).x, utils.getTwoToneBox({}).y = utils.getTwoToneBox({}).contentWidth / 2, utils.getTwoToneBox({}).contentHeight / 2
	L8_84:insert((utils.getTwoToneBox({})))
	local L11_87 = L11_87
	display.newLine(L8_84, 0, 0, 0, L9_85).width = L10_86
	display.newLine(L8_84, 0, 0, 0, L9_85):setColor(LITTLE_GENERALS_BROWN_DARK())
	display.newLine(L8_84, 0, 0, 0, L9_85):setReferencePoint(display.CenterReferencePoint)
	display.newLine(L8_84, 0, 0, 0, L9_85).x, liney = 100, L11_87.x + L11_87.contentHeight / 2
	if A4_80.unknownAvatar then
		display.newImageRect("res/avatars/gensilhouette.png", 87, 87).x = L9_85 / 2
		display.newImageRect("res/avatars/gensilhouette.png", 87, 87).y = L9_85 / 2 + 7
		L8_84:insert((display.newImageRect("res/avatars/gensilhouette.png", 87, 87)))
	else
		utils.newButton(A1_77, A2_78, A3_79).x = L9_85 / 2
		utils.newButton(A1_77, A2_78, A3_79).y = L9_85 / 2
		L8_84:insert((utils.newButton(A1_77, A2_78, A3_79)))
	end
	local L12_88 = L12_88
	local L13_89 = utils.getFontForString(A4_80.alias)
	local L14_90 = L14_90
	local L20_96 = display.newText(L8_84, A4_80.alias, L9_85 + 10, 0, L13_89, 45 * L14_90)
	L8_84:insert(L20_96)
	L20_96:setTextColor(0, 0, 0)
	L20_20(L8_84, A5_81, A6_82)
	L8_84:setReferencePoint(display.TopLeftReferencePoint)
	if A0_76.height > 0 then
	end
	L8_84.y = A0_76.height - L10_86 * 2
	L8_84.x = 2
	local L16_92, L17_93 = L16_92, L17_93
	L17_93(A0_76, L8_84)
	local L18_94 = L18_94
	return L8_84
end
function L25_25()
	if _ENV then
		if _ENV.refreshLayer then
			_ENV.refreshLayer.text = nil
		end
		_ENV.refreshLayer = nil
		if _ENV.allItemsGroup then
			display.remove(_ENV.allItemsGroup)
		end
		_ENV.allItemsGroup = nil
		local L0_97 = L0_97
		L0_97(_ENV)
		local L1_98 = L1_98
	end
	L0_97 = nil
	_ENV = L0_97
end
function L26_26(A0_99, A1_100)
	if A0_99.actionImage then
		display.remove(A0_99.actionImage)
		A0_99.actionImage = nil
	end
	display.remove(A0_99.description)
	local L2_101 = L2_101
	local L3_102 = L3_102
	local L4_103 = L4_103
	local L5_104 = L5_104
	local L6_105 = L6_105
	local L7_106 = L7_106
	L5_104[1] = L6_105
	L5_104[2] = L7_106
	local L5_104[3], L8_107 = 170, L8_107
	L2_101(L3_102, L4_103, L5_104)
end
function L27_27(A0_108, A1_109)
	if A0_108.actionImage then
		display.remove(A0_108.actionImage)
		A0_108.actionImage = nil
	end
	display.remove(A0_108.description)
	local L2_110 = L2_110
	local L3_111 = L3_111
	local L4_112 = L4_112
	local L5_113 = L5_113
	local L6_114 = L6_114
	local L7_115 = L7_115
	L5_113[1] = L6_114
	L5_113[2] = L7_115
	local L5_113[3], L8_116 = 170, L8_116
	L2_110(L3_111, L4_112, L5_113)
end
function L28_28(A0_117, A1_118)
	if A0_117.actionImage then
		A0_117.actionImage.alpha = 1
		A0_117.actionImage.isHitTestable = true
	end
	display.remove(A0_117.description)
	local L2_119 = L2_119
	local L3_120 = L3_120
	local L4_121 = L4_121
	local L5_122 = L5_122
	local L6_123 = L6_123
	local L7_124 = L7_124
	L5_122[1] = L6_123
	L5_122[2] = L7_124
	local L5_122[3], L8_125 = 170, L8_125
	L2_119(L3_120, L4_121, L5_122)
end
function L5_5.createScene(A0_126, A1_127)
	local L2_128 = L2_128
	L10_10, L2_128 = L2_128(UI_SPRITE_SHEET)
	_ENV = L2_128
	L2_128 = A1_127.params
	L18_18 = L2_128.isFacebook
	L2_2.delegate = L2_128.delegate
	local L3_129 = storyboard.getPrevious()
	A0_126.previousScene = L3_129
	L3_129 = A0_126.view
	local L4_130 = L4_130
	;({}).group = L3_129
	;({}).title = L2_128.title
	;({}).showBottomBar = false
	;({}).onClose = function()
		local L2_150 = timer.performWithDelay
		L2_150(1, function()
			storyboard.removeScene("multiplayer.newMatchScene")
			local L1_151 = L1_151
		end)
		L2_150 = storyboard
		L2_150 = L2_150.gotoScene
		L2_150("multiplayer.multiplayerSelectScene")
		local L1_149 = L1_149
	end
	L4_130 = L4_130({})
	L8_8 = display.newGroup()
	L3_129:insert(L8_8)
	local L5_131, L6_132 = L5_131, L6_132
	L5_131, L6_132 = L5_131(L6_132, 0, 0)
	L8_8.x, L8_8.y = screenX + screenWidth / 2, L6_132 + L4_130.titleBar.contentHeight / 2 + newMatchButton.contentHeight / 2 + 10
	if L2_2.delegate.search then
	end
	if L18_18 then
		L14_14 = L13_13 - 10
		;({}).buttonText = "PLAY"
		;({}).width = 100
		;({}).onComplete = function(A0_152)
			_ENV = true
			L19_19()
			A0_152.showPressed()
			L25_25()
			_UPVALUE3_()
			local L1_153 = L1_153
			local L2_154 = L2_154
			;({}).installed = true
			L1_153(L2_154, {})
			local L3_155 = L3_155
		end
		L16_16 = utils.getBasicButton({})
		L16_16:setReferencePoint(display.CenterLeftReferencePoint)
		L16_16.x, L16_16.y = -L11_11 / 2, 0
		L8_8:insert(L16_16)
		;({}).buttonText = "INVITE"
		;({}).width = 100
		;({}).onComplete = function(A0_156)
			_ENV = false
			L19_19()
			A0_156.showPressed()
			L25_25()
			_UPVALUE3_()
			local L1_157 = L1_157
			local L2_158 = L2_158
			;({}).installed = false
			L1_157(L2_158, {})
			local L3_159 = L3_159
		end
		L17_17 = utils.getBasicButton({})
		L17_17:setReferencePoint(display.CenterLeftReferencePoint)
		L17_17.x, L17_17.y = L16_16.x + L16_16.contentWidth - 5, L16_16.y
		L8_8:insert(L17_17)
		local L7_133 = L7_133
		;({}).buttonText = "SHARE"
		;({}).width = 100
		;({}).onComplete = function()
			local L0_160 = L0_160
			local L1_161 = L1_161
			;({}).name = facebookSupport.SHARE_TITLE
			;({}).link = utils.getExternalStoreLink()
			;({}).caption = facebookSupport.SHARE_CAPTION
			local ({}).description, L3_163 = facebookSupport.SHARE_TEXT, L3_163
			L0_160(L1_161, L3_163, function(A0_164)
				repeat
					if A0_164.didComplete and not A0_164.isError then
						utils.logEvent("Facebook SHARE Button")
						local L2_165 = L2_165
						break -- pseudo-goto
					end
				until true
			end)
		end
		L7_133 = L7_133({})
		L7_133:setReferencePoint(display.CenterRightReferencePoint)
		L7_133.x, L7_133.y = L11_11 / 2, L16_16.y
		local L8_134 = L8_134
		L8_134(L8_8, L7_133)
		L8_134 = L8_8
		L8_134.jumpButtons = {}
		L8_134 = {}
		;({}).jumpTo, ({})[1] = {}, "A"
		;({}).jumpTo, ({})[2] = {}, "B"
		;({}).jumpTo, ({})[3] = {}, "C"
		;({}).label = "ABC"
		;({}).jumpTo, ({})[1] = {}, "D"
		;({}).jumpTo, ({})[2] = {}, "E"
		;({}).jumpTo, ({})[3] = {}, "F"
		;({}).label = "DEF"
		;({}).jumpTo, ({})[1] = {}, "G"
		;({}).jumpTo, ({})[2] = {}, "H"
		;({}).jumpTo, ({})[3] = {}, "I"
		;({}).label = "GHI"
		;({}).jumpTo, ({})[1] = {}, "J"
		;({}).jumpTo, ({})[2] = {}, "K"
		;({}).jumpTo, ({})[3] = {}, "L"
		;({}).label = "JKL"
		;({}).jumpTo, ({})[1] = {}, "M"
		;({}).jumpTo, ({})[2] = {}, "N"
		;({}).jumpTo, ({})[3] = {}, "O"
		;({}).label = "MNO"
		;({}).jumpTo, ({})[1] = {}, "p"
		;({}).jumpTo, ({})[2] = {}, "Q"
		;({}).jumpTo, ({})[3] = {}, "R"
		;({}).jumpTo, ({})[4] = {}, "S"
		;({}).label = "PQRS"
		;({}).jumpTo, ({})[1] = {}, "T"
		;({}).jumpTo, ({})[2] = {}, "U"
		;({}).jumpTo, ({})[3] = {}, "V"
		;({}).label = "TUV"
		local L20_146 = L20_146
		;({}).jumpTo, ({})[1] = {}, "W"
		;({}).jumpTo, ({})[2] = {}, "X"
		;({}).jumpTo, ({})[3] = {}, "Y"
		local ({}).jumpTo, ({})[4], L21_147 = {}, "Z", L21_147
		;({}).label = "WXYZ"
		;({}).jumpTo, ({})[1] = {}, "#"
		;({}).label = "#"
		L8_134[1] = L9_135
		L8_134[2] = L10_136
		L8_134[3] = L11_137
		L8_134[4] = L12_138
		L8_134[5] = L20_146
		L8_134[6] = L21_147
		L8_134[7] = {}
		L8_134[8] = {}
		L8_134[9] = {}
		L9_135 = 1
		L10_136 = #L8_134
		L11_137 = 1
		for L12_138 = L9_135, L10_136, L11_137 do
			L20_146 = utils
			L20_146 = L20_146.getBasicButton
			L21_147 = {}
			L21_147.buttonText = L8_134[L12_138].label
			L21_147.buttonTextSize = 36
			L21_147.height = 40
			L21_147.width = 55
			function L21_147.onComplete(A0_166)
				local L1_167, L2_168, L3_169, L4_170, L5_171, L6_172, L7_173, L8_174, L9_175
				L1_167 = _ENV
				L1_167 = L1_167.allItemsGroup
				L2_168 = L1_167.jumpButton
				if L2_168 ~= A0_166 then
					L1_167.jumpButton = A0_166
					L1_167.jumpButtonPushed = 0
				else
					L2_168 = L1_167.jumpButtonPushed
					L2_168 = L2_168 + 1
					L1_167.jumpButtonPushed = L2_168
				end
				L2_168 = L1_167.jumpButtonPushed
				L3_169 = L8_134
				L4_170 = L12_138
				L3_169 = L3_169[L4_170]
				L3_169 = L3_169.jumpTo
				L3_169 = #L3_169
				L2_168 = L2_168 % L3_169
				L2_168 = L2_168 + 1
				L3_169 = L8_134
				L4_170 = L12_138
				L3_169 = L3_169[L4_170]
				L3_169 = L3_169.jumpTo
				L3_169 = L3_169[L2_168]
				L4_170 = L1_167.sections
				if L4_170 then
					L4_170 = 1
					L5_171 = L1_167.sections
					L5_171 = #L5_171
					L6_172 = 1
					for L7_173 = L4_170, L5_171, L6_172 do
						L8_174 = L1_167.sections
						L8_174 = L8_174[L7_173]
						L8_174 = L8_174.sectionHeader
						if L8_174 == L3_169 then
							L8_174 = L1_167.sections
							L8_174 = L8_174[L7_173]
							L8_174 = L8_174.x
							L9_175 = L1_167.sections
							L9_175 = L9_175[L7_173]
							L9_175 = L9_175.y
							local L10_176, L11_177 = L10_176, L11_177
							local L12_178 = L12_178
							L10_176(L11_177, L12_178, -L9_175 - 9)
							local L13_179 = L13_179
						end
					end
				end
			end
			L20_146 = L20_146(L21_147)
			L21_147 = L8_134[L12_138]
			L21_147 = L21_147.jumpTo
			L20_146.jumpTos = L21_147
			L21_147 = table
			L21_147 = L21_147.insert
			L21_147(L8_8.jumpButtons, L20_146)
			L21_147 = L8_8
			L21_147 = L21_147.insert
			local L15_141 = L15_141
			L21_147(L15_141, L20_146)
			local L16_142 = L16_142
			L21_147 = L7_133.x
			L15_141 = L20_146.contentWidth
			L15_141 = L15_141 / 2
			L21_147 = L21_147 - L15_141
			L20_146.x = L21_147
			L21_147 = L7_133.contentHeight
			L21_147 = L21_147 / 2
			L21_147 = L21_147 + 20
			L15_141 = L12_138 - 1
			L16_142 = L20_146.contentHeight
			L16_142 = L16_142 - 6
			L15_141 = L15_141 * L16_142
			L21_147 = L21_147 + L15_141
			L15_141 = L20_146.contentHeight
			L15_141 = L15_141 / 2
			L21_147 = L21_147 + L15_141
			L20_146.y = L21_147
		end
	end
end
function L5_5.enterScene(A0_180, A1_181)
	local L2_182
	L2_182 = A1_181.params
	local L3_183 = L3_183
	L3_183("battlefieldScene")
	L3_183 = A0_180.view
	if _ENV == nil then
		_ENV = true
		if L16_16 then
			L19_19()
			L16_16.showPressed()
		end
	end
	_UPVALUE3_()
	local L4_184 = L4_184
	local L5_185 = L5_185
	local ({}).installed, L7_187 = _ENV, L7_187
	L4_184(L5_185, L7_187)
end
function L5_5.exitScene(A0_188, A1_189)
	if loadingText then
		loadingText:destroy()
		local L3_190 = L3_190
	end
	L3_190 = nil
	loadingText = L3_190
	L3_190 = _ENV
	L3_190()
end


-- [End of decompiled block; see disassembly for inner stripped closures]
