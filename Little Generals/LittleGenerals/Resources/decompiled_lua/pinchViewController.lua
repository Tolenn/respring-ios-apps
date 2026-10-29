-- Decompiled & AI-Repaired from pinchViewController.lu
-- Source disassembly preserved at: disasm/pinchViewController.disasm

local L3_3 = L3_3
L3_3((...), package.seeall)
L3_3 = require
local L3_3, L1_1 = L3_3("easingx"), L1_1
L1_1 = {}
L1_1.ALLOW_DOUBLE_TAP_ZOOM = false
L1_1.ENABLE_SINGLE_TAP_SCROLL = true
L1_1.displayGroup = nil
L1_1.scrollBoundingObject = nil
L1_1.scrollBoundsPadding = 0
L1_1.previousTouch = nil
L1_1.scrollingRateOfChange = 0
L1_1.autoScollTween = nil
L1_1.screenInertia = true
L1_1.useNewLimiting = false
L1_1.xDiff = 0
L1_1.yDiff = 0
L1_1.minScale = 1
L1_1.maxScale = 1
L1_1.parallaxes = {}
L1_1.oldX = 0
View = L1_1
L1_1 = {}
L1_1.__index = View
function View.new(A0_4)
	local L1_5
	L1_5 = {}
	L5_9 = pairs
	L6_10 = View
	L5_9, L6_10, _FOR_ = L5_9(L6_10)
	for _FORV_5_, _FORV_6_ in L5_9, L6_10, _FOR_ do
		L1_5[_FORV_5_] = utils.deepcopy(_FORV_6_)
	end
	L5_9 = setmetatable
	L6_10 = L1_5
	L8_12 = _ENV
	L5_9(L6_10, L8_12)
	return L1_5
end
function View.setScrollBoundsPadding(A0_13, A1_14)
	A0_13.scrollBoundsPadding = A1_14
end
function View.setUseNewLimiting(A0_15, A1_16)
	A0_15.useNewLimiting = A1_16
end
function View.getBoundingObject(A0_17)
	return A0_17.scrollBoundingObject
end
function View.setScaleBounds(A0_18, A1_19, A2_20)
	A0_18.minScale = A1_19
	A0_18.maxScale = A2_20
	local L3_21, L4_22 = L3_21, L4_22
	local L5_23 = L5_23
	L3_21(L4_22, L5_23, A0_18.minScale)
	local L6_24 = L6_24
end
function View.limitScaleToBounds(A0_25, A1_26)
	if A1_26 ~= nil then
		local L2_27 = L2_27
		local L2_27, L3_28 = L2_27(A1_26), L3_28
		L2_27 = not L2_27
		if L2_27 ~= "number" then
			goto lbl_12
		end
	end
	L2_27 = A0_25.maxScale
	do return L2_27 end
	goto lbl_23
	::lbl_12::
	L2_27 = A0_25.minScale
	if A1_26 < L2_27 then
		L2_27 = A0_25.minScale
		return L2_27
	else
		L2_27 = A0_25.maxScale
		if A1_26 > L2_27 then
			L2_27 = A0_25.maxScale
			return L2_27
		end
	end
	::lbl_23::
	return A1_26
end
function View.screenToWorldCoords(A0_29, A1_30, A2_31)
	local L4_32 = L4_32
	local L5_33 = L5_33
	do return L4_32(L5_33, A1_30, A2_31) end
	local L6_34 = L6_34
end
function View.screenXToWorldX(A0_35, A1_36)
	local L2_37, L3_38 = L2_37, L3_38
	local L4_39 = L4_39
	local L2_37, L3_38, L5_40 = L2_37(L3_38, L4_39, 0)
	return L2_37
end
function View.screenYToWorldY(A0_41, A1_42)
	local L2_43, L3_44 = L2_43, L3_44
	local L4_45 = L4_45
	local L2_43, L3_44, L5_46 = L2_43(L3_44, L4_45, A1_42)
	return L3_44
end
function View.worldToScreenCoords(A0_47, A1_48, A2_49)
	local L4_50 = L4_50
	local L5_51 = L5_51
	do return L4_50(L5_51, A1_48, A2_49) end
	local L6_52 = L6_52
end
function View.drawParallax(A0_53, A1_54, A2_55)
	local L3_56, L4_57, L5_58, L6_59, L7_60
	L3_56 = {}
	A0_53.parallaxes = L3_56
	L3_56 = A0_53.parallaxes
	L4_57 = A0_53.scrollBoundingObject
	L5_58 = BACKGROUND
	L6_59 = A1_54.backgrounds
	L7_60 = #L6_59
	if L7_60 == 0 then
		return
	end
	L7_60 = 1
	L10_63 = #L6_59
	_FOR_ = 1
	for _FORV_10_ = L7_60, L10_63, _FOR_ do
		L3_56[_FORV_10_] = display.newGroup()
		utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L6_59[_FORV_10_].file)).x = L4_57.contentBounds.xMin - utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L6_59[_FORV_10_].file)).contentWidth / 2
		utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L6_59[_FORV_10_].file)).y = 0
		L3_56[_FORV_10_].file = L6_59[_FORV_10_].file
		L3_56[_FORV_10_]:insert((utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L6_59[_FORV_10_].file))))
		while L3_56[_FORV_10_].contentWidth < L4_57.contentWidth + utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L6_59[_FORV_10_].file)).contentWidth do
			utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L6_59[_FORV_10_].file)).x = L4_57.contentBounds.xMin - utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L6_59[_FORV_10_].file)).contentWidth / 2 + utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L6_59[_FORV_10_].file)).contentWidth * 0
			L3_56[_FORV_10_].file = L6_59[_FORV_10_].file
			L3_56[_FORV_10_]:insert((utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L6_59[_FORV_10_].file))))
			utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L6_59[_FORV_10_].file)).y = 0
		end
		L5_58:insert(1, L3_56[_FORV_10_])
		L3_56[_FORV_10_].x = 0
		L3_56[_FORV_10_].y = L4_57.contentHeight / 2 - L3_56[_FORV_10_].contentHeight / 2 - A2_55 - L6_59[_FORV_10_].yPos - 150
		if L6_59[_FORV_10_].topRectColor and L6_59[_FORV_10_].topRectHeight then
			display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].topRectHeight).y = 0 - L3_56[_FORV_10_].contentHeight / 2 - display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].topRectHeight).contentHeight / 2 + 1
			display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].topRectHeight).x = 0
			display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].topRectHeight):setFillColor(L6_59[_FORV_10_].topRectColor[1], L6_59[_FORV_10_].topRectColor[2], L6_59[_FORV_10_].topRectColor[3])
		end
		if L6_59[_FORV_10_].bottomRectColor and L6_59[_FORV_10_].bottomRectHeight then
			display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].bottomRectHeight).y = L3_56[_FORV_10_].contentHeight / 2 + display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].bottomRectHeight).contentHeight / 2 - 1
			display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].bottomRectHeight).x = 0
			L3_56[_FORV_10_]:insert((display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].bottomRectHeight)))
			display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].bottomRectHeight):setFillColor(L6_59[_FORV_10_].bottomRectColor[1], L6_59[_FORV_10_].bottomRectColor[2], L6_59[_FORV_10_].bottomRectColor[3])
		end
		if display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].topRectHeight) then
			L3_56[_FORV_10_]:insert((display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].topRectHeight)))
		end
		if display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].bottomRectHeight) then
			L3_56[_FORV_10_]:insert((display.newRect(0, 0, L3_56[_FORV_10_].contentWidth, L6_59[_FORV_10_].bottomRectHeight)))
		end
		L3_56[_FORV_10_].xAdjustment = L6_59[_FORV_10_].xAdjustment
	end
	L7_60 = -1200
	L10_63 = utils
	L10_63 = L10_63.loadImageSpriteSheet
	L11_64 = "res/themes/clouds.png"
	L10_63, L11_64, L12_65 = L10_63(L11_64)
	L13_66 = 1
	L14_67 = 12
	_FOR_ = 1
	for _FORV_14_ = L13_66, L14_67, _FOR_ do
		sprite.newSprite(L10_63):prepare("cloud" .. math.random(1, 5) .. ".png")
		sprite.newSprite(L10_63).y = 0 - L4_57.contentHeight / 6 + math.random(-50, 50)
		sprite.newSprite(L10_63).x = L7_60 + math.random(0, 100) - 50
		L7_60 = L7_60 + math.random(200, 300)
		sprite.newSprite(L10_63):scale(math.random(1, 2), (math.random(1, 2)))
		local L20_73 = L20_73
		if math.random(1, 2) < 1.7 then
			BACKGROUND_FLAIR:insert(L20_73)
		else
			local L18_71 = L18_71
			TERRAIN_FLAIR:insert(L20_73)
			local L19_72 = L19_72
		end
	end
	A0_53.cloudset = L10_63
	A0_53.cloudsheet = L12_65
end
function View.parallax(A0_75)
	local L1_76, L2_77, L3_78, L4_79, L5_80, L6_81, L7_82, L8_83, L9_84, L10_85, L11_86
	L1_76 = A0_75.displayGroup
	L1_76 = L1_76.x
	L2_77 = A0_75.displayGroup
	L2_77 = L2_77.y
	L3_78 = A0_75.oldY
	if not L3_78 then
		A0_75.oldY = L2_77
	end
	L3_78 = A0_75.oldY
	L3_78 = L2_77 - L3_78
	L4_79 = A0_75.oldX
	L4_79 = L1_76 - L4_79
	A0_75.oldX = L1_76
	A0_75.oldY = L2_77
	L5_80 = 1
	L6_81 = A0_75.parallaxes
	L6_81 = #L6_81
	L7_82 = 1
	for L8_83 = L5_80, L6_81, L7_82 do
		L9_84 = A0_75.parallaxes
		L9_84 = L9_84[L8_83]
		L10_85 = A0_75.parallaxes
		L10_85 = L10_85[L8_83]
		L10_85 = L10_85.x
		L11_86 = A0_75.parallaxes
		L11_86 = L11_86[L8_83]
		L11_86 = L11_86.xAdjustment
		L11_86 = L4_79 * L11_86
		L10_85 = L10_85 - L11_86
		L9_84.x = L10_85
	end
end
function View.setViewPortOrigin(A0_87, A1_88, A2_89, A3_90, A4_91, A5_92, A6_93)
	local L7_94, L8_95, L9_96, L10_97
	L7_94 = A3_90.x
	L8_95 = A3_90.y
	L9_96 = A0_87.displayGroup
	L9_96 = L9_96.x
	L10_97 = A0_87.displayGroup
	L10_97 = L10_97.y
	A0_87.displayGroup.x = A1_88
	A0_87.displayGroup.y = A2_89
	local L11_98, L12_99 = L11_98, L12_99
	L11_98, L12_99 = L11_98(L12_99, L7_94, L8_95)
	A0_87.displayGroup.x = L9_96
	A0_87.displayGroup.y = L10_97
	if not A6_93 then
		if 0 < L11_98 and L11_98 < 750 and 50 < L12_99 and L12_99 < 550 then
			A1_88 = A0_87.displayGroup.x
			A2_89 = A0_87.displayGroup.y
		else
			if L11_98 < 125 + screenX then
				A1_88 = A0_87:limitScrollToBoundingObject(A1_88 - (L11_98 - 125 - screenX), 0)
			elseif L11_98 > screenWidth - 125 then
				A1_88 = A0_87:limitScrollToBoundingObject(A1_88 + (screenWidth - L11_98 - 125), 0)
			end
			if L12_99 < 50 then
				A2_89 = A2_89 - (L12_99 - 50)
			elseif L12_99 > display.contentHeight - 250 then
				local L21_108 = L21_108
				local L22_109 = L22_109
				A2_89 = A0_87:limitScrollToBoundingObject(0, A2_89 - (-display.contentHeight + L12_99 + 250))
			end
		end
	end
	if A4_91 then
		L21_108 = A0_87.origScale
		if L21_108 then
			A0_87.zoomTransition = nil
			if A6_93 then
				L21_108 = A0_87.displayGroup
				L21_108.x = A1_88
				L21_108 = A0_87.displayGroup
				L21_108.y = A2_89
				L21_108 = A0_87.displayGroup
				L22_109 = A0_87.origScale
				L21_108.xScale = L22_109
				L21_108 = A0_87.displayGroup
				L22_109 = A0_87.origScale
				L21_108.yScale = L22_109
			else
				L21_108 = transition
				L21_108 = L21_108.to
				L22_109 = A0_87.displayGroup
				;({}).transition = easing.inOutQuad
				;({}).x = A1_88
				;({}).y = A2_89
				;({}).xScale = A0_87.origScale
				;({}).yScale = A0_87.origScale
				;({}).onComplete = function()
					local L0_110, L1_111
					L0_110 = _ENV
					L0_110.scrollTransition = nil
				end
				L21_108 = L21_108(L22_109, {})
				A0_87.scrollTransition = L21_108
			end
	end
	else
		L22_109 = A0_87
		L21_108 = A0_87.limitScrollToBoundingObject
		L21_108, L22_109 = L21_108(L22_109, A1_88, A2_89)
		if A6_93 then
			A0_87.displayGroup.x = L21_108
			A0_87.displayGroup.y = L22_109
		else
			local L15_102 = L15_102
			local L16_103 = L16_103
			local ({}).transition, L18_105 = easing.inOutQuad, L18_105
			L18_105.x = L21_108
			L18_105.y = L22_109
			function L18_105.onComplete()
				local L0_112, L1_113
				L0_112 = _ENV
				L0_112.scrollTransition = nil
			end
			L15_102 = L15_102(L16_103, L18_105)
			A0_87.scrollTransition = L15_102
		end
	end
end
function View.disable(A0_114)
	local L2_115 = L2_115
	local L3_116 = L3_116
	L2_115(L3_116, "touch", A0_114)
	local L4_117 = L4_117
end
function View.enable(A0_118)
	local L2_119 = L2_119
	local L3_120 = L3_120
	L2_119(L3_120, "touch", A0_118)
	local L4_121 = L4_121
end
function View.destroy(A0_122)
	L4_126(A0_122, false)
	L4_126 = A0_122.avatarFadeTransition
	if L4_126 then
		L4_126 = transition
		L4_126 = L4_126.cancel
		L4_126(A0_122.avatarFadeTransition)
		A0_122.avatarFadeTransition = nil
	end
	A0_122.displayGroup = nil
	A0_122.scrollBoundingObject = nil
	A0_122.previousTouch = nil
	A0_122.autoScollTween = nil
	A0_122.screenInertia = true
	L4_126 = A0_122.parallaxes
	if L4_126 then
		L4_126 = A0_122.parallaxes
		L4_126 = #L4_126
		_FOR_ = -1
		for _FORV_4_ = L4_126, _FOR_, _FOR_ do
			if A0_122.parallaxes[_FORV_4_].file then
				spritesheetmanager.disposeSpriteSet(A0_122.parallaxes[_FORV_4_].file)
			end
			A0_122.parallaxes[_FORV_4_] = nil
		end
	end
	A0_122.parallaxes = nil
	L4_126 = A0_122.sky
	if L4_126 then
		L4_126 = sky
		L6_128 = L4_126
		L4_126 = L4_126.removeSelf
		L4_126(L6_128)
		L4_126 = nil
		sky = L4_126
	end
	L4_126 = A0_122.bkg
	if L4_126 then
		L4_126 = bkg
		L6_128 = L4_126
		L4_126 = L4_126.removeSelf
		L4_126(L6_128)
		L4_126 = nil
		bkg = L4_126
	end
	L4_126 = A0_122.cloudset
	if L4_126 then
		A0_122.cloudset = nil
		L4_126 = A0_122.cloudsheet
		L6_128 = L4_126
		L4_126 = L4_126.dispose
		L4_126(L6_128)
	end
end
function View.enterFrame(A0_129, A1_130)
	if A0_129.trackedWeapon ~= nil and A0_129.trackedWeapon.getLinearVelocity then
		if SCREENFLOW_RECORDING then
			goto lbl_25
		end
		local L6_135 = L6_135
		local L7_136 = L7_136
		local L8_137 = L8_137
		local L9_138 = L9_138
		local L10_139 = L10_139
		L9_138(L10_139, A0_129.trackedWeapon.x, A0_129.trackedWeapon.y, L6_135, L7_136, L8_137)
		local L11_140 = L11_140
		repeat
			do break end -- pseudo-goto
			A0_129.trackedWeapon = nil
		until true
	end
	::lbl_25::
	L7_136 = A0_129
	L6_135 = A0_129.limitScrollToBoundingObject
	L8_137 = A0_129.displayGroup
	L8_137 = L8_137.x
	L9_138 = A0_129.displayGroup
	L9_138 = L9_138.y
	L6_135, L7_136 = L6_135(L7_136, L8_137, L9_138)
	L8_137 = A0_129.displayGroup
	L8_137.x = L6_135
	L8_137 = A0_129.displayGroup
	L8_137.y = L7_136
	L9_138 = A0_129
	L8_137 = A0_129.parallax
	L8_137(L9_138)
end
function View.init(A0_141, A1_142, A2_143, A3_144, A4_145, A5_146)
	A0_141.displayGroup = A1_142
	if A2_143 ~= nil then
		A0_141.scrollBoundingObject = A2_143
	else
		A0_141.scrollBoundingObject = A0_141.displayGroup
	end
	A0_141.ALLOW_DOUBLE_TAP_ZOOM = A5_146
	A0_141.displayGroup.x = screenX + screenWidth / 2
	A0_141.displayGroup.y = display.contentHeight / 2
	if A3_144 ~= nil then
		A0_141:drawParallax(A3_144.theme, A3_144.groundLevel)
		local L9_150 = L9_150
	end
	A0_141.screenInertia = A4_145
	L9_150 = A0_141.calcWorldDiffFromCenter
	L9_150(A0_141)
	L9_150 = A0_141.setEnterFrameEnabled
	local L7_148 = L7_148
	L9_150(L7_148, true)
	local L8_149 = L8_149
end
function View.setEnterFrameEnabled(A0_151, A1_152)
	if A1_152 then
		Runtime:addEventListener("enterFrame", A0_151)
	else
		local L2_153, L3_154 = L2_153, L3_154
		local L4_155 = L4_155
		L2_153(L3_154, L4_155, A0_151)
		local L5_156 = L5_156
	end
end
function View.calcWorldDiffFromCenter(A0_157)
	local L1_158, L2_159, L3_160, L4_161, L5_162
	L1_158 = A0_157.scrollBoundingObject
	L2_159 = A0_157.displayGroup
	L3_160 = A0_157.displayGroup
	L3_160 = L3_160.contentBounds
	L3_160 = L3_160.xMin
	L4_161 = L1_158.contentBounds
	L4_161 = L4_161.xMin
	L3_160 = L3_160 - L4_161
	L4_161 = L2_159.contentBounds
	L4_161 = L4_161.xMax
	L5_162 = L1_158.contentBounds
	L5_162 = L5_162.xMax
	L4_161 = L4_161 - L5_162
	L3_160 = L3_160 + L4_161
	xDiff = L3_160
	L3_160 = L2_159.contentBounds
	L3_160 = L3_160.yMin
	L4_161 = L1_158.contentBounds
	L4_161 = L4_161.yMin
	L3_160 = L3_160 - L4_161
	L4_161 = L2_159.contentBounds
	L4_161 = L4_161.yMax
	L5_162 = L1_158.contentBounds
	L5_162 = L5_162.yMax
	L4_161 = L4_161 - L5_162
	L3_160 = L3_160 + L4_161
	yDiff = L3_160
	L3_160 = xDiff
	L3_160 = L3_160 / 2
	xDiff = L3_160
	L3_160 = yDiff
	L3_160 = L3_160 / 2
	yDiff = L3_160
end
function View.getWorldDiffFromCenter(A0_163)
	local L1_164, L2_165
	L1_164 = 0
	L2_165 = 0
	return L1_164, L2_165
end
function View.centerViewPortOn(A0_166, A1_167, A2_168, A3_169, A4_170, A5_171)
	local L6_172
	if A3_169 == nil then
		A3_169 = A0_166.maxScale
	end
	if A5_171 == nil then
		A5_171 = 500
	end
	L6_172 = A0_166.displayGroup
	L6_172 = L6_172.xScale
	L6_172 = A3_169 / L6_172
	A1_167 = screenX - (A1_167 - screenWidth / 2)
	A2_168 = -(A2_168 - display.contentHeight / 2)
	local L7_173 = L7_173
	local L8_174 = L8_174
	;({}).time = A5_171
	local ({}).transition, L10_176 = easing.inOutExpo, L10_176
	L10_176.xScale = A3_169
	L10_176.yScale = A3_169
	L10_176.x = A1_167
	L10_176.y = A2_168
	L10_176.delay = 0
	L10_176.onComplete = A4_170
	L7_173(L8_174, L10_176)
end
function View.centerView(A0_177)
	local L1_178, L2_179
	L1_178 = A0_177.displayGroup
	L2_179 = A0_177.displayGroup
	local L3_180 = A0_177:getCenterX()
	local L4_181, L5_182 = A0_177:getCenterY(), L5_182
	L2_179.y = L4_181
	L1_178.x = L3_180
end
function View.limitScrollToBoundingObject(A0_183, A1_184, A2_185)
	local L3_186, L4_187, L5_188, L6_189, L7_190
	L3_186 = A0_183.scrollBoundingObject
	L4_187 = A0_183.displayGroup
	L5_188 = A1_184
	L6_189 = A2_185
	L7_190 = A0_183.useNewLimiting
	if L7_190 then
		L7_190 = L4_187.y
		L7_190 = A2_185 - L7_190
		L7_190 = L7_190 - L3_186.y
		if L3_186.contentHeight <= display.contentHeight - 2 * A0_183.scrollBoundsPadding then
			L6_189 = A0_183:getCenterY()
		elseif L3_186.contentBounds.yMin + L3_186.y + L7_190 > A0_183.scrollBoundsPadding then
			L6_189 = A0_183:getTopMostY()
		elseif L3_186.contentBounds.yMax + L7_190 < display.contentHeight - A0_183.scrollBoundsPadding then
			L6_189 = A0_183:getBottomMostY()
		end
		if L3_186.contentWidth <= display.contentWidth - 2 * A0_183.scrollBoundsPadding then
			L5_188 = A0_183:getCenterX()
		elseif L3_186.contentBounds.xMin + L3_186.x + (A1_184 - L4_187.x - L3_186.x) - screenX / 2 > A0_183.scrollBoundsPadding then
			L5_188 = A0_183.scrollBoundsPadding - L3_186.x - L3_186.contentBounds.xMin + screenX / 2
			L5_188 = L5_188 + L4_187.x + L3_186.x
		elseif L3_186.contentBounds.xMax + (A1_184 - L4_187.x - L3_186.x) - screenX / 2 < display.contentWidth - A0_183.scrollBoundsPadding then
			L5_188 = display.contentWidth - A0_183.scrollBoundsPadding + screenX / 2 - L3_186.contentBounds.xMax
			L5_188 = L5_188 + L4_187.x + L3_186.x
		end
	else
		L7_190 = L4_187.y
		L7_190 = A2_185 - L7_190
		L7_190 = L7_190 - L3_186.y
		if L3_186.contentHeight <= display.contentHeight - 2 * A0_183.scrollBoundsPadding then
			local L8_191 = L8_191
			repeat
				L8_191 = L8_191(A0_183:getCenterY() + 0.5)
				L6_189 = L8_191
				do break end -- pseudo-goto
				L8_191 = L3_186.contentBounds
				L8_191 = L8_191.yMin
				L8_191 = L8_191 + L3_186.y
				L8_191 = L8_191 + L7_190
				if L8_191 > A0_183.scrollBoundsPadding then
					L8_191 = L3_186.contentBounds
					L8_191 = L8_191.yMin
					L8_191 = -L8_191
					L6_189 = L8_191 - L3_186.y
					L8_191 = L4_187.y
					L8_191 = L6_189 + L8_191
					L6_189 = L8_191 + L3_186.y
				else
					L8_191 = L3_186.contentBounds
					L8_191 = L8_191.yMax
					L8_191 = L8_191 + L7_190
					if L8_191 < display.contentHeight - A0_183.scrollBoundsPadding then
						L8_191 = display
						L8_191 = L8_191.contentHeight
						L6_189 = L8_191 - L3_186.contentBounds.yMax
						L8_191 = L4_187.y
						L8_191 = L6_189 + L8_191
						L6_189 = L8_191 + L3_186.y
					end
				end
			until true
		end
		L8_191 = L4_187.x
		L8_191 = A1_184 - L8_191
		L8_191 = L8_191 - L3_186.x
		if L3_186.width <= screenX + screenWidth - 2 * A0_183.scrollBoundsPadding then
			local L9_192 = A0_183:getCenterX()
			L5_188 = L9_192
			break -- pseudo-goto
		end
		L9_192 = L3_186.contentBounds
		L9_192 = L9_192.xMin
		L9_192 = L9_192 + L8_191
		if L9_192 > screenX + A0_183.scrollBoundsPadding then
			L9_192 = math
			L9_192 = L9_192.floor
			L9_192 = L9_192(A0_183:getRightMostX())
			L5_188 = L9_192
		else
			L9_192 = L3_186.contentBounds
			L9_192 = L9_192.xMax
			L9_192 = L9_192 + L8_191
			if L9_192 < screenX + screenWidth - A0_183.scrollBoundsPadding then
				L9_192 = math
				L9_192 = L9_192.floor
				local L10_193, L11_194 = A0_183:getLeftMostX()
				repeat
					L9_192 = L9_192(L10_193, L11_194)
					L5_188 = L9_192
				until true
			end
		end
	end
	L7_190 = L5_188
	L8_191 = L6_189
	return L7_190, L8_191
end
function View.trackObject(A0_195, A1_196)
	if A1_196 then
	else
	end
	A0_195.trackedWeapon = A1_196
end
function View.ensureVisible(A0_197, A1_198, A2_199, A3_200, A4_201)
	if A0_197.scrollTransition then
		if A0_197.scrollTransition.finalY then
			A0_197.displayGroup.y = A0_197.scrollTransition.finalY
		end
		transition.cancel(A0_197.scrollTransition)
		A0_197.scrollTransition = nil
	end
	local L5_202, L6_203 = L5_202, L6_203
	local L7_204 = L7_204
	L5_202, L6_203 = L5_202(L6_203, L7_204, A2_199)
	L7_204 = p1Avatar
	if L7_204 then
		L7_204 = p2Avatar
		if L7_204 then
			L7_204 = 5
			if L5_202 > p1Avatar.rect:localToContent(0, 0) - p1Avatar.rect.contentWidth / 2 - L7_204 and L5_202 < p1Avatar.rect:localToContent(0, 0) + p1Avatar.rect.contentWidth / 2 + L7_204 and L6_203 > p1Avatar.rect:localToContent(0, 0) - p1Avatar.rect.contentHeight / 2 - L7_204 and L6_203 < p1Avatar.rect:localToContent(0, 0) + p1Avatar.rect.contentHeight / 2 + L7_204 then
				({}).time = 50
				;({}).alpha = 0.25
				A0_197.avatarFadeTransition = transition.to(p1Avatar, {})
			else
				({}).time = 50
				;({}).alpha = 1
				A0_197.avatarFadeTransition = transition.to(p1Avatar, {})
			end
			local L14_211 = L14_211
			if L5_202 > p2Avatar.rect:localToContent(0, 0) - p2Avatar.rect.contentWidth / 2 - L7_204 and L5_202 < p2Avatar.rect:localToContent(0, 0) + p2Avatar.rect.contentWidth / 2 + L7_204 and L6_203 > p2Avatar.rect:localToContent(0, 0) - p2Avatar.rect.contentHeight / 2 - L7_204 and L6_203 < p2Avatar.rect:localToContent(0, 0) + p2Avatar.rect.contentHeight / 2 + L7_204 then
				({}).time = 50
				;({}).alpha = 0.25
				A0_197.avatarFadeTransition = transition.to(p2Avatar, {})
			else
				({}).time = 50
				;({}).alpha = 1
				A0_197.avatarFadeTransition = transition.to(p2Avatar, {})
			end
		end
	end
	L7_204 = 0.6
	if L6_203 < 100 then
		L14_211 = A0_197.zoomTransition
		if not L14_211 then
			L14_211 = A0_197.displayGroup
			L14_211 = L14_211.xScale
			if L7_204 < L14_211 and A4_201 < 0 then
				L14_211 = A0_197.zoomedOut
				if not L14_211 then
					L14_211 = A0_197.displayGroup
					L14_211 = L14_211.xScale
					A0_197.origScale = L14_211
					L14_211 = transition
					L14_211 = L14_211.to
					;({}).time = 1000
					;({}).x = A0_197.displayGroup.x - A3_200 * L7_204
					;({}).delay = 1
					;({}).xScale = L7_204
					;({}).yScale = L7_204
					;({}).onComplete = function()
						local L0_216, L1_217
						L0_216 = _ENV
						L0_216.zoomTransition = nil
					end
					;({}).transition = easing.inOutQuad
					L14_211 = L14_211(A0_197.displayGroup, {})
					A0_197.zoomTransition = L14_211
					A0_197.zoomedOut = true
				end
			end
		end
	end
	if 0 <= A4_201 then
		L14_211 = A0_197.zoomTransition
		if not L14_211 then
			L14_211 = A0_197.origScale
			if L14_211 then
				A0_197.zoomedOut = false
				L14_211 = A0_197.origScale
				local L9_206 = L9_206
				local L10_207 = L10_207
				;({}).transition = easing.inOutQuad
				;({}).time = 1000
				local L13_210 = L13_210
				L13_210.x = A0_197.displayGroup.x - A3_200 * L14_211
				L13_210.xScale = L14_211
				L13_210.yScale = L14_211
				function L13_210.onComplete()
					local L0_218, L1_219
					L0_218 = _ENV
					L0_218.zoomTransition = nil
				end
				L9_206 = L9_206(L10_207, L13_210)
				A0_197.zoomTransition = L9_206
				A0_197.origScale = nil
			end
		end
	end
	L14_211 = 150
	L9_206 = 150
	L10_207 = 50
	L13_210 = 250
	if L5_202 < L14_211 + screenX and A3_200 < 0 then
		A0_197.displayGroup.x = A0_197:limitScrollToBoundingObject(A0_197.displayGroup.x - (L5_202 - L14_211 - screenX), 0)
	elseif L5_202 > screenWidth - L9_206 then
		A0_197.displayGroup.x = A0_197:limitScrollToBoundingObject(A0_197.displayGroup.x + (screenWidth - L5_202 - L9_206), 0)
	end
	if L6_203 < L10_207 and A4_201 < -1 then
		({}).y, ({}).time = A0_197.displayGroup.y - (L6_203 - L10_207), 150
		A0_197.scrollTransition = transition.to(A0_197.displayGroup, {})
		A0_197.scrollTransition.finalY = A0_197.displayGroup.y - (L6_203 - L10_207)
	elseif 0 < A4_201 and L6_203 > display.contentHeight - L13_210 then
		({}).y, ({}).time = A0_197:limitScrollToBoundingObject(0, A0_197.displayGroup.y - (-display.contentHeight + L6_203 + L13_210))
		A0_197.scrollTransition = transition.to(A0_197.displayGroup, {})
		A0_197.scrollTransition.finalY = A0_197:limitScrollToBoundingObject(0, A0_197.displayGroup.y - (-display.contentHeight + L6_203 + L13_210))
	elseif A4_201 < 0 and L6_203 > display.contentHeight - L13_210 / 2 then
		local L18_215 = L18_215
		local L16_213 = L16_213
		;({}).y, ({}).time = A0_197:limitScrollToBoundingObject(0, A0_197.displayGroup.y - (-display.contentHeight + L6_203 + L13_210))
		local L17_214 = L17_214
		repeat
			A0_197.scrollTransition = transition.to(A0_197.displayGroup, {})
			A0_197.scrollTransition.finalY = L17_214
			do break end -- pseudo-goto
			if not (L6_203 > L10_207) or 0.5 <= A4_201 then
			end
		until true
	end
	L16_213 = A0_197.displayGroup
	L16_213 = L16_213.x
	A0_197.lastX = L16_213
end
function View.getCenterX(A0_220)
	local L1_221, L2_222 = L1_221, L2_222
	local L3_223 = L3_223
	local L1_221, L2_222, L4_224 = L1_221(L2_222, L3_223, 0)
	L3_223 = screenX
	L4_224 = screenWidth
	L4_224 = L4_224 / 2
	L3_223 = L3_223 + L4_224
	L4_224 = A0_220.scrollBoundingObject
	L4_224 = L4_224.contentWidth
	L4_224 = L4_224 / 2
	L3_223 = L3_223 - L4_224
	L4_224 = A0_220.scrollBoundingObject
	L4_224 = L4_224.contentBounds
	L4_224 = L4_224.xMin
	L4_224 = L1_221 - L4_224
	L3_223 = L3_223 + L4_224
	return L3_223
end
function View.getCenterY(A0_225)
	local L1_226, L2_227 = L1_226, L2_227
	local L3_228 = L3_228
	local L1_226, L2_227, L4_229 = L1_226(L2_227, L3_228, 0)
	L3_228 = display
	L3_228 = L3_228.contentHeight
	L3_228 = L3_228 / 2
	L4_229 = A0_225.scrollBoundingObject
	L4_229 = L4_229.contentHeight
	L4_229 = L4_229 / 2
	L3_228 = L3_228 - L4_229
	L4_229 = A0_225.scrollBoundingObject
	L4_229 = L4_229.contentBounds
	L4_229 = L4_229.yMin
	L4_229 = L2_227 - L4_229
	L3_228 = L3_228 + L4_229
	return L3_228
end
function View.getRightMostX(A0_230)
	local L1_231, L2_232 = L1_231, L2_232
	local L3_233 = L3_233
	local L1_231, L2_232, L4_234 = L1_231(L2_232, L3_233, 0)
	L3_233 = A0_230.useNewLimiting
	if L3_233 then
		L3_233 = screenX
		L4_234 = A0_230.scrollBoundsPadding
		L3_233 = L3_233 + L4_234
		L4_234 = A0_230.scrollBoundingObject
		L4_234 = L4_234.contentBounds
		L4_234 = L4_234.xMin
		L4_234 = L1_231 - L4_234
		L3_233 = L3_233 + L4_234
		L4_234 = screenX
		L4_234 = L4_234 / 2
		L3_233 = L3_233 + L4_234
		return L3_233
	else
		L3_233 = screenX
		L4_234 = A0_230.scrollBoundsPadding
		L3_233 = L3_233 + L4_234
		L4_234 = A0_230.scrollBoundingObject
		L4_234 = L4_234.contentBounds
		L4_234 = L4_234.xMin
		L4_234 = L1_231 - L4_234
		L3_233 = L3_233 + L4_234
		return L3_233
	end
end
function View.getRightScaled(A0_235, A1_236)
	local L4_238 = L4_238
	return L4_238(screenX + A0_235.scrollBoundingObject.width * A1_236 / 2 + 0.5)
end
function View.getLeftScaled(A0_239, A1_240)
	local L4_242 = L4_242
	return L4_242(display.contentWidth - A0_239.scrollBoundingObject.width * A1_240 / 2 + 0.5)
end
function View.getBottomMostY(A0_243)
	local L5_248 = A0_243.scrollBoundingObject.localToContent
	local L2_245 = L2_245
	local L3_246 = L3_246
	local L5_248, L2_245, L4_247 = L5_248(L2_245, L3_246, 0)
	L3_246 = display
	L3_246 = L3_246.contentHeight
	L4_247 = A0_243.scrollBoundingObject
	L4_247 = L4_247.contentBounds
	L4_247 = L4_247.yMax
	L4_247 = L4_247 - L2_245
	L4_247 = L4_247 + A0_243.scrollBoundsPadding
	L3_246 = L3_246 - L4_247
	return L3_246
end
function View.getLeftMostX(A0_249)
	local L5_254 = A0_249.scrollBoundingObject.localToContent
	local L2_251 = L2_251
	local L3_252 = L3_252
	local L5_254, L2_251, L4_253 = L5_254(L2_251, L3_252, 0)
	L3_252 = screenX
	L4_253 = screenWidth
	L3_252 = L3_252 + L4_253
	L4_253 = A0_249.scrollBoundingObject
	L4_253 = L4_253.contentBounds
	L4_253 = L4_253.xMax
	L4_253 = L4_253 - L5_254
	L4_253 = L4_253 - A0_249.scrollBoundsPadding
	L3_252 = L3_252 - L4_253
	return L3_252
end
function View.getTopMostY(A0_255)
	repeat
		if A0_255.useNewLimiting then
			local L1_256, L2_257 = L1_256, L2_257
			L1_256, L2_257 = L1_256(L2_257, 0, 0)
			local L3_258 = L3_258
			local L5_260 = 0 + A0_255.scrollBoundsPadding + (L2_257 - A0_255.scrollBoundingObject.contentBounds.yMin)
			L5_260 = L5_260 + 0.5
			do return L3_258(L5_260) end
			break -- pseudo-goto
		end
		L1_256 = A0_255.scrollBoundingObject
		L1_256 = L1_256.contentBounds
		L1_256 = L1_256.yMin
		L1_256 = -L1_256
		L2_257 = A0_255.displayGroup
		L2_257 = L2_257.y
		L1_256 = L1_256 + L2_257
		return L1_256
	until true
end
function View.getTopScaled(A0_261, A1_262)
	local L2_263, L3_264
	L2_263 = A0_261.scrollBoundingObject
	L2_263 = L2_263.height
	L2_263 = -L2_263
	L2_263 = L2_263 / 2
	L2_263 = L2_263 * A1_262
	L3_264 = A0_261.scrollBoundingObject
	L3_264 = L3_264.y
	L2_263 = L2_263 + L3_264
	return L2_263
end


-- [End of decompiled block; see disassembly for inner stripped closures]
