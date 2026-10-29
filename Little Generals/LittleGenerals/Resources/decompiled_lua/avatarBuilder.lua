local L0_0, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15 = L0_0, "avatar", L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15
L0_0 = L0_0(L3_3)
L3_3 = require
L4_4 = "battleAvatar"
L3_3 = L3_3(L4_4)
L4_4 = storyboard
L4_4 = L4_4.newScene
L4_4 = L4_4()
L5_5 = nil
L6_6 = nil
L7_7 = nil
L8_8 = nil
L9_9 = nil
L10_10 = nil
L11_11 = nil
L12_12 = {}
L12_12.select = "res/sounds/weapon_select.mp3"
function L13_13(A0_20)
	local L1_21, L2_22, L3_23, L4_24, L5_25
	_ENV = A0_20
	L1_21 = 1
	L2_22 = L10_10
	L2_22 = #L2_22
	L3_23 = 1
	for L4_24 = L1_21, L2_22, L3_23 do
		L5_25 = L10_10
		L5_25 = L5_25[L4_24]
		local L7_27 = L7_27
		if L5_25.filterClass == _ENV then
			L7_27 = L5_25.showPressed
			L7_27()
			break -- pseudo-goto
		end
		L7_27 = L5_25.showNormal
		L7_27()
		repeat
		until true
	end
end
function L14_14()
	if _ENV.refreshLayer then
		_ENV.refreshLayer.text = nil
	end
	_ENV.refreshLayer = nil
	if _ENV.allItemsGroup then
		display.remove(_ENV.allItemsGroup)
	end
	_ENV.allItemsGroup = nil
	local L0_28 = L0_28
	L0_28(_ENV)
	local L1_29 = L1_29
	L0_28 = _ENV
	L0_28.buttons = nil
	L0_28 = nil
	_ENV = L0_28
end
L15_15 = 0
function L4_4.createScene(A0_30, A1_31)
	local L2_32
	L2_32 = A0_30.view
	local L3_33 = L3_33
	;({}).group = L2_32
	;({}).title = "MY AVATAR"
	;({}).showBottomBar = true
	;({}).onClose = function()
		local L2_54 = sound.playSound
		L2_54(sound.globalSounds.button)
		L2_54 = timer
		L2_54 = L2_54.performWithDelay
		local L1_53 = L1_53
		L2_54(L1_53, function()
			storyboard.gotoScene("campaignMapScene", "fromRight")
			local L2_56 = L2_56
			L2_56 = storyboard
			L2_56 = L2_56.removeScene
			L2_56("avatarBuilder")
		end)
	end
	L3_33 = L3_33({})
	itemContainer = display.newGroup()
	L2_32:insert(itemContainer)
	itemContainer.x, itemContainer.y = 0, display.contentHeight - 120
	local L4_34 = L4_34
	local L4_34, L5_35 = L4_34(UI_SPRITE_SHEET)
	_ENV = display.newGroup()
	_ENV:addEventListener("touch", function()
		local L1_57
		L1_57 = true
		return L1_57
	end)
	L2_32:insert(_ENV)
	local L6_36 = L6_36
	L6_36 = L6_36("res/ui/avatarbuilderframe.png", 230, 403)
	_ENV:insert(L6_36)
	L6_36.x, L6_36.y = 0, 0
	_ENV.x = screenX + _ENV.contentWidth / 2
	_ENV.y = display.contentHeight / 2 + 24
	L6_6 = L0_0.playerAvatar()
	_UPVALUE3_()
	L9_9 = L0_0.changeToSkinTone(L0_0, L0_0.heads(), L6_6.head)
	local L7_37 = L7_37
	L7_37 = L7_37(L4_34, L5_35, "randomize_normal_btn.png", "randomize_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		_ENV, L9_9 = L0_0.randomAvatar()
		_UPVALUE3_()
		L13_13("face_filter.png")
		local L1_59 = L1_59
		local L2_60 = L2_60
		local L4_62 = L4_62
		L1_59(L2_60, L4_62, L0_0.heads("all"), function(A0_63, A1_64)
			local L3_65 = L3_65
			local L4_66 = L4_66
			local L3_65, L5_67 = L3_65(L4_66, L0_0.heads(), A1_64), L5_67
			_ENV = L3_65
		end)
		L1_59 = true
		return L1_59
	end)
	_ENV:insert(L7_37)
	L7_37.xScale, L7_37.yScale = 0.9, 0.9
	L7_37.x = L5_5.x - L7_37.contentWidth / 2 - 10
	L7_37.y = L5_5.y + L7_37.contentHeight / 2 + 20
	local L8_38 = L8_38
	L8_38 = L8_38(L4_34, L5_35, "accept_normal_btn.png", "accept_select_btn.png", function()
		local L2_70 = sound.playSound
		L2_70(_ENV.select)
		L2_70 = L0_0
		L2_70 = L2_70.setPlayerAvatar
		L2_70(L6_6)
		L2_70 = timer
		L2_70 = L2_70.performWithDelay
		L2_70(1, function()
			local L0_71 = storyboard.getCurrentSceneName()
			storyboard.gotoScene(_ENV.previousScene)
			local L1_72 = L1_72
			L1_72(L0_71)
			local L2_73 = L2_73
		end)
		L2_70 = true
		return L2_70
	end)
	local L9_39, L10_40 = L9_39, L10_40
	L9_39(L10_40, L8_38)
	local L11_41 = L11_41
	L9_39 = 0.9
	L8_38.yScale = 0.9
	L8_38.xScale = L9_39
	L9_39 = L5_5
	L9_39 = L9_39.x
	L10_40 = L8_38.contentWidth
	L10_40 = L10_40 / 2
	L9_39 = L9_39 + L10_40
	L9_39 = L9_39 + 10
	L8_38.x = L9_39
	L9_39 = L7_37.y
	L8_38.y = L9_39
	L9_39 = 67
	L10_40 = display
	L10_40 = L10_40.contentHeight
	L10_40 = L10_40 / 2
	L11_41 = L9_39 / 2
	L10_40 = L10_40 - L11_41
	L11_41 = nil
	firstClassFilterButton = L11_41
	L11_41 = {}
	L10_10 = L11_41
	L11_41 = {}
	;({}).filterImage = "face_filter.png"
	;({}).onComplete = function(A0_74)
		_ENV(A0_74.filterClass)
		local L1_75 = L1_75
		local L2_76 = L2_76
		local L3_77 = L3_77
		local L5_79 = L0_0.heads("all")
		L1_75(L2_76, L3_77, L5_79, function(A0_80, A1_81)
			local L3_82 = L3_82
			local L4_83 = L4_83
			local L3_82, L5_84 = L3_82(L4_83, L0_0.heads(), A1_81), L5_84
			_ENV = L3_82
		end)
	end
	;({}).filterImage = "head_filter.png"
	;({}).onComplete = function(A0_85)
		_ENV(A0_85.filterClass)
		local L2_86 = L2_86
		local L3_87 = L3_87
		local L4_88 = L4_88
		L2_86(L3_87, L4_88, L0_0.hats(), nil)
		local L5_89 = L5_89
	end
	;({}).filterImage = "eyebrow_filter.png"
	;({}).onComplete = function(A0_90)
		local L5_95 = L5_95
		L5_95(A0_90.filterClass)
		L5_95 = showItemGroup
		local L2_92 = L2_92
		local L3_93 = L3_93
		local L4_94 = L4_94
		L5_95(L2_92, L3_93, L4_94, function(A0_96)
			local L1_97
			L1_97 = _ENV
			local L2_98 = L0_0.eyebrows_r()
			L2_98 = L2_98[A0_96]
			L1_97.eyebrow_r = L2_98
		end)
	end
	;({}).filterImage = "eyewear_filter.png"
	;({}).onComplete = function(A0_99)
		local L5_104 = L5_104
		L5_104(A0_99.filterClass)
		L5_104 = showItemGroup
		local L2_101 = L2_101
		local L3_102 = L3_102
		local L4_103 = L4_103
		L5_104(L2_101, L3_102, L4_103, function(A0_105)
			repeat
				local L1_106 = _ENV.glasses()
				L1_106 = #L1_106
				if A0_105 > L1_106 then
					L1_106 = L6_6
					L1_106.glasses = nil
					L1_106 = L6_6
					local L3_108 = _ENV.eyemods()[A0_105 - #_ENV.glasses()]
					L1_106.eyemod = L3_108
					break -- pseudo-goto
				end
				L1_106 = L6_6
				L3_108 = _ENV
				L3_108 = L3_108.glasses
				L3_108 = L3_108()
				L3_108 = L3_108[A0_105]
				L1_106.glasses = L3_108
				L1_106 = L6_6
				L1_106.eyemod = nil
			until true
		end)
	end
	;({}).filterImage = "nose_filter.png"
	;({}).onComplete = function(A0_109)
		_ENV(A0_109.filterClass)
		local L2_110 = L2_110
		local L3_111 = L3_111
		local L4_112 = L4_112
		L2_110(L3_111, L4_112, L0_0.noses(L9_9), nil)
		local L5_113 = L5_113
	end
	local L16_46 = L16_46
	;({}).filterImage = "mustache_filter.png"
	;({}).onComplete = function(A0_114)
		_ENV(A0_114.filterClass)
		local L2_115 = L2_115
		local L3_116 = L3_116
		local L4_117 = L4_117
		L2_115(L3_116, L4_117, L0_0.mustaches(), nil)
		local L5_118 = L5_118
	end
	;({}).filterImage = "mouth_filter.png"
	;({}).onComplete = function(A0_119)
		_ENV(A0_119.filterClass)
		local L2_120 = L2_120
		local L3_121 = L3_121
		local L4_122 = L4_122
		L2_120(L3_121, L4_122, L0_0.pipes(), nil)
		local L5_123 = L5_123
	end
	;({}).filterImage = "body_filter.png"
	;({}).onComplete = function(A0_124)
		_ENV(A0_124.filterClass)
		local L2_125 = L2_125
		local L3_126 = L3_126
		local L4_127 = L4_127
		L2_125(L3_126, L4_127, L0_0.bodies(L9_9), nil)
		local L5_128 = L5_128
	end
	L11_41[1] = L12_42
	L11_41[2] = L13_43
	L11_41[3] = L14_44
	L11_41[4] = L15_45
	L11_41[5] = L16_46
	L11_41[6] = {}
	L11_41[7] = {}
	L11_41[8] = {}
	L12_42 = 1
	L13_43 = #L11_41
	L14_44 = 1
	for L15_45 = L12_42, L13_43, L14_44 do
		L16_46 = L11_41[L15_45]
		local L17_47 = L17_47
		;({}).width = L9_39
		;({}).height = L9_39
		;({}).normalTopColor = utils.pack(LITTLE_GENERALS_LIGHT_GREY())
		;({}).normalBottomColor = utils.pack(LITTLE_GENERALS_MED_GREY())
		;({}).normalBorderColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		;({}).pressedBorderColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		;({}).onComplete = function(A0_129)
			sound.playSound(sound.globalSounds.button)
			_ENV.onComplete(A0_129)
			local L2_130 = L2_130
		end
		L17_47 = L17_47({})
		if not firstClassFilterButton then
			firstClassFilterButton = L17_47
		end
		L17_47.filterClass = L16_46.filterImage
		table.insert(L10_10, L17_47)
		local L18_48 = L18_48
		L18_48 = L18_48(L4_34, L5_35, L16_46.filterImage)
		L17_47:insert(L18_48)
		L18_48.x, L18_48.y = 0, 0
		local L19_49, L20_50 = L19_49, L20_50
		L19_49(L20_50, L17_47)
		local L21_51 = L21_51
		L19_49 = screenWidth
		L19_49 = L19_49 / 2
		L20_50 = L17_47.contentWidth
		L20_50 = L20_50 / 2
		L19_49 = L19_49 - L20_50
		L20_50 = #L11_41
		L20_50 = L20_50 - L15_45
		L20_50 = L9_39 * L20_50
		L19_49 = L19_49 - L20_50
		L19_49 = L19_49 - 5
		L17_47.y = L10_40
		L17_47.x = L19_49
	end
end
function getItem(A0_131, A1_132, A2_133, A3_134, A4_135)
	local L5_136 = display.newGroup()
	local L6_137 = L6_137
	;({}).width = 166
	;({}).height = 166
	;({}).innerFillColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
	L6_137 = L6_137({})
	L5_136:insert(L6_137)
	;({}).ignoreFocus = true
	;({}).onComplete = function(A0_144)
		sound.playSound(sound.globalSounds.button)
		_ENV[A3_134] = A2_133
		if A4_135 then
			local L2_146 = L2_146
			L2_146(A1_132, A2_133)
			local L3_147 = L3_147
		end
		L2_146 = _UPVALUE5_
		L2_146()
	end
	L5_136 = utils.newTwoStateButton(L5_136, nil, {})
	L5_136.itemBack = L6_137
	if A2_133 == nil then
		display.newText("None", 0, 0, "SingleSleeve", 60):setTextColor(LITTLE_GENERALS_BROWN())
		L5_136:insert((display.newText("None", 0, 0, "SingleSleeve", 60)))
		display.newText("None", 0, 0, "SingleSleeve", 60).x, display.newText("None", 0, 0, "SingleSleeve", 60).y = L6_137.x, L6_137.y
	else
		local L7_138 = L7_138
		local L7_138, L12_143 = L7_138(L5_136, A2_133 .. ".png", 0, 0, true), L12_143
		L12_143 = L7_138.scale
		local L9_140 = L9_140
		local L10_141 = L10_141
		L12_143(L9_140, L10_141, 0.5)
		local L11_142 = L11_142
		L12_143 = L6_137.x
		L9_140 = L6_137.y
		L7_138.y = L9_140
		L7_138.x = L12_143
	end
	return L5_136
end
function showItemGroup(A0_148, A1_149, A2_150, A3_151)
	if _ENV then
		L14_14()
		local L4_152 = L4_152
	end
	L4_152 = screenWidth
	L4_152 = L4_152 - L7_7.contentWidth
	L4_152 = L4_152 - 25
	;({}).width = L4_152
	;({}).height = 400
	;({}).maskFile = "res/mask1000x400.png"
	;({}).bgColor, ({})[1] = {}, 255
	;({}).bgColor, ({})[2] = {}, 255
	;({}).bgColor, ({})[3] = {}, 255
	local ({}).bgColor, ({})[4], L11_159 = {}, 0, L11_159
	;({}).listener = utils.scrollViewListener
	L11_159 = L11_159({})
	_ENV = L11_159
	L11_159 = _ENV
	L11_159.buttons = {}
	L11_159 = _ENV
	L11_159 = L11_159.setReferencePoint
	L11_159(L11_159, display.TopCenterReferencePoint)
	L11_159 = A0_148.insert
	L11_159(A0_148, _ENV)
	L11_159 = _ENV
	L11_159.x = L7_7.x + L7_7.contentWidth / 2 + _ENV.contentWidth / 2
	L11_159 = _ENV
	L11_159.y = 120
	L11_159 = display
	L11_159 = L11_159.newGroup
	L11_159 = L11_159()
	local L6_154, L7_155 = L6_154, L7_155
	L6_154(L7_155, L11_159)
	L6_154 = _ENV
	L6_154 = L6_154.content
	L6_154.verticalScrollDisabled = true
	L6_154 = _ENV
	L6_154.allItemsGroup = L11_159
	L6_154 = 15
	L7_155 = 0
	_FOR_ = 1
	for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
		table.insert(_ENV.buttons, (getItem(A0_148, _FORV_11_, A2_150[_FORV_11_], A1_149, A3_151)))
		getItem(A0_148, _FORV_11_, A2_150[_FORV_11_], A1_149, A3_151).x = getItem(A0_148, _FORV_11_, A2_150[_FORV_11_], A1_149, A3_151).itemBack.outerRect.contentWidth / 2 + getItem(A0_148, _FORV_11_, A2_150[_FORV_11_], A1_149, A3_151).itemBack.outerRect.contentWidth * math.floor(L7_155 / 2) + 10
		if 0 < math.floor(L7_155 / 2) then
			getItem(A0_148, _FORV_11_, A2_150[_FORV_11_], A1_149, A3_151).x = getItem(A0_148, _FORV_11_, A2_150[_FORV_11_], A1_149, A3_151).x + L6_154 * math.floor(L7_155 / 2)
		end
		if L7_155 % 2 == 0 then
			getItem(A0_148, _FORV_11_, A2_150[_FORV_11_], A1_149, A3_151).y = _ENV.contentHeight / 2 - getItem(A0_148, _FORV_11_, A2_150[_FORV_11_], A1_149, A3_151).itemBack.outerRect.contentHeight / 2 - 10
		else
			getItem(A0_148, _FORV_11_, A2_150[_FORV_11_], A1_149, A3_151).y = _ENV.contentHeight / 2 + getItem(A0_148, _FORV_11_, A2_150[_FORV_11_], A1_149, A3_151).itemBack.outerRect.contentHeight / 2 + 10
		end
		L11_159:insert((getItem(A0_148, _FORV_11_, A2_150[_FORV_11_], A1_149, A3_151)))
		local L16_164 = L16_164
		L7_155 = L7_155 + 1
	end
	L10_158 = L7_7
	L17_165 = L10_158
	L10_158 = L10_158.toFront
	L10_158(L17_165)
end
function L4_4.enterScene(A0_166, A1_167)
	local L2_168
	L2_168 = A0_166.view
	L2_168.previousScene = storyboard.getPrevious()
	_ENV = utils.deepcopy(L0_0.playerAvatar())
	_UPVALUE2_()
	L13_13("face_filter.png")
	local L3_169 = L3_169
	local L4_170 = L4_170
	local L5_171 = L5_171
	local L7_173 = L0_0.heads("all")
	L3_169(L4_170, L5_171, L7_173, function(A0_174, A1_175)
		local L3_176 = L3_176
		local L4_177 = L4_177
		local L3_176, L5_178 = L3_176(L4_177, L0_0.heads(), A1_175), L5_178
		_ENV = L3_176
	end)
end
function L4_4.exitScene(A0_179, A1_180)
	if pageTransition then
		local L2_181 = L2_181
		L2_181(pageTransition)
	end
	L2_181 = nil
	pageTransition = L2_181
	L2_181 = A0_179.view
	_ENV:stopAnimation()
	_ENV:removeSelf()
	local L3_182, L4_183 = L3_182, L4_183
	L3_182 = nil
	_ENV = L3_182
end
function L4_4.destroyScene(A0_184, A1_185)
	local L2_186, L3_187
	L2_186 = A0_184.view
	L3_187 = nil
	_ENV = L3_187
	L3_187 = nil
	L0_0 = L3_187
	L3_187 = nil
	L5_5 = L3_187
	L3_187 = nil
	L1_1 = L3_187
	L3_187 = nil
	L12_12 = L3_187
	L3_187 = nil
	L2_2 = L3_187
	L3_187 = nil
	L6_6 = L3_187
	L3_187 = nil
	itemGroup = L3_187
	L3_187 = nil
	itemContainer = L3_187
	L3_187 = nil
	L9_9 = L3_187
	L3_187 = nil
	buttonSpacing = L3_187
	L3_187 = nil
	pageTransition = L3_187
end
L4_4:addEventListener("createScene", L4_4)
L4_4:addEventListener("enterScene", L4_4)
L4_4:addEventListener("exitScene", L4_4)
local L16_16, L17_17 = L16_16, L17_17
local L18_18 = L18_18
L18_18(L4_4, "destroyScene", L4_4)
local L19_19 = L19_19
return L4_4
