local L0_0, L1_1, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11 = L0_0, (...), L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
L3_3 = package
L3_3 = L3_3.seeall
L0_0(L1_1, L3_3)
function L0_0(A0_12, A1_13)
	return function()
		local L1_14 = L1_14
		do return L1_14(_ENV, A1_13) end
		local L2_15 = L2_15
	end
end
function L1_1(A0_16, A1_17, A2_18, A3_19, A4_20, A5_21)
	local L6_22, L7_23, L8_24, L9_25
	L6_22 = A4_20
	if L6_22 == nil then
		L6_22 = true
	end
	function L7_23(A0_34)
		local L2_35 = type(A0_34)
		if L2_35 == "function" then
			L2_35 = A0_34
			return L2_35()
		else
			return A0_34
		end
	end
	function L8_24()
		local L0_36
		L0_36 = true
		if _ENV then
			L0_36 = false
		end
		local L1_37 = L1_37
		local L2_38 = L2_38
		local L3_39 = L3_39
		local L4_40 = L4_40
		local L5_41 = L5_41
		local L6_42 = L6_42
		L1_37(L2_38, L3_39, L4_40, L5_41, L6_42, L0_36)
		local L7_43 = L7_43
	end
	L9_25 = {}
	L13_29 = L7_23
	L14_30 = A1_17
	L13_29 = L13_29(L14_30)
	L9_25.time = L13_29
	L9_25.delay = 0
	L13_29 = pairs
	L14_30 = A3_19
	L13_29, L14_30, _FOR_ = L13_29(L14_30)
	for _FORV_13_, _FORV_14_ in L13_29, L14_30, _FOR_ do
		if A2_18[_FORV_13_] then
			L9_25[_FORV_13_] = L7_23(A2_18[_FORV_13_])
			if A5_21 then
				L9_25[_FORV_13_] = L9_25[_FORV_13_] - L7_23(_FORV_14_)
			else
				L9_25[_FORV_13_] = L9_25[_FORV_13_] + L7_23(_FORV_14_)
				do break end -- pseudo-goto
				L9_25[_FORV_13_] = L7_23(_FORV_14_)
			end
		end
		repeat
		until true
	end
	if L6_22 then
		L13_29 = L9_25.onComplete
		if not L13_29 then
			L9_25.onComplete = L8_24
		end
	end
	L13_29 = A0_16.transitionHandle
	if L13_29 then
		L13_29 = transition
		L13_29 = L13_29.cancel
		L14_30 = A0_16.transitionHandle
		L13_29(L14_30)
	end
	L13_29 = A0_16.isVisible
	if L13_29 then
		L13_29 = transition
		L13_29 = L13_29.to
		L14_30 = A0_16
		L17_33 = L9_25
		L13_29 = L13_29(L14_30, L17_33)
		A0_16.transitionHandle = L13_29
	end
end
function L3_3(A0_44, A1_45)
	local L2_46
	if A1_45 then
		L2_46 = A0_44.animationHandle
		if L2_46 then
			L2_46 = A0_44.animationHandle
			if L2_46 ~= A1_45 then
				goto lbl_75
			end
		end
	end
	L2_46 = A0_44.avatarGroup
	L2_46.x, L2_46.y = L2_46.origX, L2_46.origY
	L3_47, _FOR_, _FOR_ = L3_47(L2_46.startingLocations)
	for _FORV_6_, _FORV_7_ in L3_47, _FOR_, _FOR_ do
		if L2_46[_FORV_6_] or _FORV_6_ == "self" then
			if _FORV_6_ == "self" then
			end
			L2_46.x, L2_46.y, L2_46.rotation, L2_46.xScale, L2_46.yScale = _FORV_7_.x, _FORV_7_.y, _FORV_7_.rotation, _FORV_7_.xScale, _FORV_7_.yScale
		end
	end
	L3_47 = {}
	L11_55 = L2_46
	L12_56 = L2_46.eyes
	L13_57 = L2_46.nose
	L3_47[1] = L11_55
	L3_47[2] = L12_56
	L3_47[3] = L13_57
	L3_47[4] = L2_46.mouth
	L3_47[5] = L2_46.mustache
	L3_47[6] = L2_46.pipe
	L3_47[7] = L2_46.hat
	L11_55 = select
	L12_56 = "#"
	L13_57 = L3_47
	L11_55 = L11_55(L12_56, L13_57)
	L12_56 = 1
	L13_57 = L11_55
	_FOR_ = 1
	for _FORV_8_ = L12_56, L13_57, _FOR_ do
		if L3_47[_FORV_8_].transitionHandle then
			transition.cancel(L3_47[_FORV_8_].transitionHandle)
		end
	end
	L12_56 = A0_44.speechBubble
	if L12_56 then
		L12_56 = A0_44.speechBubble
		L13_57 = L12_56
		L12_56 = L12_56.cleanUp
		L12_56(L13_57)
	end
	A0_44.animationHandle = nil
	L12_56 = true
	do return L12_56 end
	::lbl_75::
	L2_46 = false
	return L2_46
end
function L4_4(A0_58)
	local L1_59, L2_60
	L1_59 = A0_58.avatarGroup
	L2_60 = A0_58.wounded
	A0_58:stopAnimation()
	L1_59.x, L1_59.y = L1_59.origX, L1_59.origY
	;({}).x = L1_59.x
	;({}).rotation = L1_59.rotation
	;({}).x = 1
	;({}).rotation = 7 * A0_58.flip
	;({}).transition = function()
		local L0_69, L1_70
		L0_69 = easing
		L0_69 = L0_69.inOutQuad
		return L0_69
	end
	_ENV(L1_59, 2000, {}, {})
	;({}).x = L1_59.eyes.x
	;({}).y = L1_59.eyes.y
	;({}).x = 0.5
	;({}).y = L0_0(-1.5, 1.5)
	_ENV(L1_59.eyes, 750, {}, {})
	;({}).rotation = L1_59.eyebrow_l.rotation
	;({}).rotation = -20 * A0_58.flip
	_ENV(L1_59.eyebrow_l, 1, {}, {}, false)
	;({}).rotation = L1_59.eyebrow_r.rotation
	;({}).rotation = 20 * A0_58.flip
	_ENV(L1_59.eyebrow_r, 1, {}, {}, false)
	;({}).x = L1_59.mouth.x
	;({}).y = L1_59.mouth.y
	;({}).x = L0_0(-1.5, 1.5)
	;({}).y = 1.5
	_ENV(L1_59.mouth, 1200, {}, {})
	if L1_59.hat then
		({}).x = L1_59.hat.x
		;({}).y = L1_59.hat.y
		;({}).y = L0_0(0, 1.5)
		_ENV(L1_59.hat, 1000, {}, {})
	end
	if L1_59.mustache then
		({}).x = L1_59.mustache.x
		;({}).y = L1_59.mustache.y
		;({}).x = L0_0(-1.5, 1.5)
		_ENV(L1_59.mustache, 500, {}, {})
	end
	if L1_59.pipe then
		({}).x = L1_59.pipe.x
		;({}).y = L1_59.pipe.y
		;({}).y = L0_0(-1, 1)
		L5_63(L6_64, 500, {}, {})
	end
	L5_63 = pairs
	L6_64 = A0_58.avatarGroup
	L6_64 = L6_64.sprites
	L5_63, L6_64, L7_65 = L5_63(L6_64)
	for _FORV_6_, _FORV_7_ in L5_63, L6_64, L7_65 do
		if _FORV_7_ and _FORV_7_.idleAnimation then
			if _FORV_7_.stopAnimation then
				_FORV_7_.stopAnimation(L1_59[_FORV_6_])
			end
			_FORV_7_.idleAnimation(L1_59[_FORV_6_], L2_60)
			local L10_68 = L10_68
		end
	end
end
function L5_5(A0_71)
	local L1_72, L2_73
	L1_72 = A0_71.avatarGroup
	L2_73 = A0_71.wounded
	A0_71:stopAnimation()
	L1_72.x, L1_72.y = L1_72.origX - 15 * A0_71.flip, L1_72.origY - 10
	L1_72.rotation = 35 * A0_71.flip
	;({}).x = L1_72.x
	;({}).rotation = L1_72.rotation
	;({}).x = 1
	;({}).rotation = 1 * A0_71.flip
	;({}).transition = function()
		local L0_82, L1_83
		L0_82 = easing
		L0_82 = L0_82.inOutQuad
		return L0_82
	end
	_ENV(L1_72, 2000, {}, {})
	;({}).x = L1_72.eyes.x
	;({}).y = L1_72.eyes.y
	;({}).x = 0.5
	;({}).y = L0_0(-1.5, 1.5)
	_ENV(L1_72.eyes, 750, {}, {})
	;({}).rotation = L1_72.eyebrow_l.rotation
	;({}).rotation = -20 * A0_71.flip
	_ENV(L1_72.eyebrow_l, 1, {}, {}, false)
	;({}).rotation = L1_72.eyebrow_r.rotation
	;({}).rotation = 20 * A0_71.flip
	_ENV(L1_72.eyebrow_r, 1, {}, {}, false)
	;({}).x = L1_72.mouth.x
	;({}).y = L1_72.mouth.y
	;({}).x = L0_0(-1.5, 1.5)
	;({}).y = 1.5
	_ENV(L1_72.mouth, 1200, {}, {})
	if L1_72.hat then
		({}).x = L1_72.hat.x
		;({}).y = L1_72.hat.y
		;({}).y = L0_0(0, 1.5)
		_ENV(L1_72.hat, 1000, {}, {})
	end
	if L1_72.mustache then
		({}).x = L1_72.mustache.x
		;({}).y = L1_72.mustache.y
		;({}).x = L0_0(-1.5, 1.5)
		_ENV(L1_72.mustache, 500, {}, {})
	end
	if L1_72.pipe then
		({}).x = L1_72.pipe.x
		;({}).y = L1_72.pipe.y
		;({}).y = L0_0(-1, 1)
		L5_76(L6_77, 500, {}, {})
	end
	L5_76 = pairs
	L6_77 = A0_71.avatarGroup
	L6_77 = L6_77.sprites
	L5_76, L6_77, L7_78 = L5_76(L6_77)
	for _FORV_6_, _FORV_7_ in L5_76, L6_77, L7_78 do
		if _FORV_7_ and _FORV_7_.idleAnimation then
			if _FORV_7_.stopAnimation then
				_FORV_7_.stopAnimation(L1_72[_FORV_6_])
			end
			_FORV_7_.idleAnimation(L1_72[_FORV_6_], L2_73)
			local L10_81 = L10_81
		end
	end
end
function L6_6(A0_84)
	local L1_85, L2_86
	L1_85 = A0_84.avatarGroup
	L2_86 = A0_84.wounded
	L7_91 = A0_84.stopAnimation
	L7_91(A0_84)
	L7_91 = L1_85.origX
	L1_85.y = L1_85.origY
	L1_85.x = L7_91
	L7_91 = transition
	L7_91 = L7_91.to
	;({}).time = 500
	;({}).rotation = -10 * A0_84.flip
	;({}).onComplete = function()
		({}).y = L1_85.y
		;({}).y = 3
		;({}).transition = function()
			local L0_103, L1_104
			L0_103 = easing
			L0_103 = L0_103.inOutQuad
			return L0_103
		end
		_ENV(L1_85, 300, {}, {})
		;({}).xScale = L1_85.eyes.xScale
		;({}).yScale = L1_85.eyes.yScale
		;({}).xScale = 0.05
		;({}).yScale = 0.05
		_ENV(L1_85.eyes, 500, {}, {})
		;({}).time = 200
		;({}).delta = true
		;({}).y = 3
		transition.to(L1_85.mouth, {})
		;({}).rotation = L1_85.eyebrow_l.rotation
		;({}).rotation = -15 * A0_84.flip
		_ENV(L1_85.eyebrow_l, 200, {}, {}, false)
		;({}).rotation = L1_85.eyebrow_r.rotation
		;({}).rotation = 15 * A0_84.flip
		_ENV(L1_85.eyebrow_r, 200, {}, {}, false)
		if L1_85.hat then
			({}).y = L1_85.hat.y
			;({}).y = L0_0(0, 1.5)
			_ENV(L1_85.hat, 1000, {}, {})
		end
		if L1_85.mustache then
			({}).x = L1_85.mustache.x
			;({}).y = L1_85.mustache.y
			;({}).x = L0_0(-0.5, 0.5)
			_ENV(L1_85.mustache, 500, {}, {})
		end
		if L1_85.pipe then
			local L0_95 = L0_95
			local L1_96 = L1_96
			local L2_97 = L2_97
			;({}).x = L1_85.pipe.x
			;({}).y = L1_85.pipe.y
			local L3_98 = L3_98
			local L6_101 = L6_101
			local L7_102 = L0_0(-1, 1)
			L6_101.y = L7_102
			L0_95(L1_96, L2_97, L3_98, L6_101)
		end
	end
	L7_91(L1_85, {})
	L7_91 = pairs
	L7_91, _FOR_, _FOR_ = L7_91(A0_84.avatarGroup.sprites)
	for _FORV_6_, _FORV_7_ in L7_91, _FOR_, _FOR_ do
		if _FORV_7_ and _FORV_7_.laughAnimation then
			if _FORV_7_.stopAnimation then
				_FORV_7_.stopAnimation(L1_85[_FORV_6_])
			end
			_FORV_7_.laughAnimation(L1_85[_FORV_6_], L2_86)
		end
	end
	L7_91 = os
	L7_91 = L7_91.time
	L7_91 = L7_91()
	A0_84.animationHandle = L7_91
	L7_91 = A0_84.animationHandle
	return L7_91
end
function L7_7(A0_105)
	local L1_106, L2_107
	L1_106 = A0_105.wounded
	L2_107 = A0_105.avatarGroup
	A0_105:stopAnimation()
	L2_107.x, L2_107.y = L2_107.origX, L2_107.origY
	;({}).x = L2_107.x
	;({}).x = 7
	;({}).transition = function()
		local L0_115, L1_116
		L0_115 = easing
		L0_115 = L0_115.inOutQuad
		return L0_115
	end
	_ENV(L2_107, 100, {}, {})
	;({}).x = L2_107.eyes.x
	;({}).xScale = L2_107.eyes.xScale
	;({}).yScale = L2_107.eyes.yScale
	;({}).x = -3
	;({}).xScale = 0.05
	;({}).yScale = 0.05
	_ENV(L2_107.eyes, 100, {}, {})
	if L2_107.hat then
		({}).time = 125
		;({}).y = L2_107.hat.y - 20
		;({}).transition = easing.outQuad
		;({}).onComplete = function()
			local L0_117 = L0_117
			local L1_118 = L1_118
			;({}).time = 125
			;({}).y = _ENV.hat.y + 20
			local ({}).transition, L3_120 = easing.inQuad, L3_120
			L0_117(L1_118, L3_120)
		end
		transition.to(L2_107.hat, {})
	end
	;({}).rotation = L2_107.eyebrow_l.rotation
	;({}).y = L2_107.eyebrow_l.y
	;({}).rotation = -35 * A0_105.flip
	;({}).y = L2_107.eyebrow_l.y - 20
	_ENV(L2_107.eyebrow_l, 125, {}, {}, false)
	;({}).rotation = L2_107.eyebrow_r.rotation
	;({}).y = L2_107.eyebrow_r.y
	;({}).rotation = 35 * A0_105.flip
	;({}).y = L2_107.eyebrow_r.y - 20
	_ENV(L2_107.eyebrow_r, 125, {}, {}, false)
	if L2_107.pipe then
		({}).rotation = L2_107.pipe.rotation
		;({}).xScale = L2_107.pipe.xScale
		;({}).yScale = L2_107.pipe.yScale
		;({}).rotation = 360
		;({}).xScale = 0.05
		;({}).yScale = 0.05
		L6_111(L7_112, 250, {}, {}, false)
	end
	L6_111 = pairs
	L7_112 = A0_105.avatarGroup
	L7_112 = L7_112.sprites
	L6_111, L7_112, _FOR_ = L6_111(L7_112)
	for _FORV_6_, _FORV_7_ in L6_111, L7_112, _FOR_ do
		if _FORV_7_ and _FORV_7_.stunAnimation then
			if _FORV_7_.stopAnimation then
				_FORV_7_.stopAnimation(L2_107[_FORV_6_])
			end
			_FORV_7_.stunAnimation(L2_107[_FORV_6_])
		end
	end
	L6_111 = os
	L6_111 = L6_111.time
	L6_111 = L6_111()
	A0_105.animationHandle = L6_111
	L6_111 = A0_105.animationHandle
	return L6_111
end
function L8_8(A0_121)
	local L1_122, L2_123
	L1_122 = wound
	if not L1_122 then
		L1_122 = A0_121.wounded
	end
	L2_123 = A0_121.avatarGroup
	A0_121:stopAnimation()
	L2_123.x, L2_123.y = L2_123.origX, L2_123.origY
	;({}).y = L2_123.y
	;({}).xScale = L2_123.xScale
	;({}).yScale = L2_123.yScale
	;({}).y = 10
	;({}).xScale = 0.1
	;({}).yScale = 0.1
	_ENV(L2_123, 100, {}, {})
	;({}).x = L2_123.eyes.x
	;({}).xScale = L2_123.eyes.xScale
	;({}).yScale = L2_123.eyes.yScale
	;({}).x = 3
	;({}).xScale = 0.06
	;({}).yScale = 0.06
	_ENV(L2_123.eyes, 100, {}, {})
	;({}).rotation = L2_123.eyebrow_l.rotation
	;({}).rotation = 35 * A0_121.flip
	_ENV(L2_123.eyebrow_l, 200, {}, {}, false)
	;({}).rotation = L2_123.eyebrow_r.rotation
	;({}).rotation = -35 * A0_121.flip
	_ENV(L2_123.eyebrow_r, 200, {}, {}, false)
	if L2_123.hat then
		({}).y = L2_123.hat.y
		;({}).rotation = L2_123.hat.rotation
		;({}).y = 10
		;({}).rotation = 15
		_ENV(L2_123.hat, 125, {}, {})
	end
	if L2_123.pipe then
		({}).rotation = L2_123.pipe.rotation
		;({}).xScale = L2_123.pipe.xScale
		;({}).yScale = L2_123.pipe.yScale
		;({}).rotation = 360
		;({}).xScale = 0.05
		;({}).yScale = 0.05
		L6_127(L2_123.pipe, 350, {}, {})
	end
	L6_127 = pairs
	L7_128 = A0_121.avatarGroup
	L7_128 = L7_128.sprites
	L6_127, L7_128, _FOR_ = L6_127(L7_128)
	for _FORV_6_, _FORV_7_ in L6_127, L7_128, _FOR_ do
		if _FORV_7_ and _FORV_7_.angerAnimation then
			if _FORV_7_.stopAnimation then
				_FORV_7_.stopAnimation(L2_123[_FORV_6_])
			end
			_FORV_7_.angerAnimation(L2_123[_FORV_6_])
		end
	end
	L6_127 = os
	L6_127 = L6_127.time
	L6_127 = L6_127()
	A0_121.animationHandle = L6_127
	L6_127 = A0_121.animationHandle
	return L6_127
end
function L9_9(A0_131, A1_132, A2_133)
	local L3_134, L4_135, L10_141, L11_142, L12_143, L13_144, L14_145, L16_147 = A1_132:upper(), L4_135, L10_141, L11_142, L12_143, L13_144, L14_145, L16_147
	function L4_135(A0_154)
		local L1_155, L2_156, L3_157, L4_158 = A0_154:len(), L2_156, L3_157, L4_158
		L2_156 = {}
		L3_157 = 1
		L4_158 = ""
		L8_162 = 1
		_FOR_ = 1
		for _FORV_8_ = L8_162, _FOR_, _FOR_ do
			if A0_154:sub(_FORV_8_, _FORV_8_) == " " then
				if L4_158:len() > 0 then
					table.insert(L2_156, L4_158)
					L4_158 = ""
				end
				L3_157 = L3_157 + 1
				break -- pseudo-goto
			end
			L4_158 = L4_158 .. A0_154:sub(_FORV_8_, _FORV_8_)
			repeat
			until true
		end
		L9_163 = L4_158
		L8_162 = L4_158.len
		L8_162 = L8_162(L9_163)
		if 0 < L8_162 then
			L8_162 = table
			L8_162 = L8_162.insert
			L9_163 = L2_156
			L12_166 = L4_158
			L8_162(L9_163, L12_166)
		end
		L8_162 = L2_156
		L9_163 = L3_157
		return L8_162, L9_163
	end
	L10_141 = TextCandy
	L10_141 = L10_141.GetLineWidth
	L11_142 = FONT_NAME
	L12_143 = L3_134
	L10_141 = L10_141(L11_142, L12_143)
	L11_142 = nil
	L12_143 = nil
	L13_144 = L4_135
	L14_145 = L3_134
	L13_144, L14_145 = L13_144(L14_145)
	L12_143 = L14_145
	L11_142 = L13_144
	L13_144 = 680
	L14_145 = 200
	L16_147 = L13_144
	if L10_141 <= L14_145 then
		L16_147 = L14_145
		if A0_131.flip == -1 then
		end
	else
		if L10_141 >= L13_144 then
		else
		end
		if A0_131.flip == -1 then
		end
	end
	A0_131.speechBubble = display.newGroup()
	A0_131.speechBubble.text = L3_134
	A0_131.speechBubble.onComplete = A2_133
	if L16_147 == L13_144 then
	else
	end
	display.newImage("res/avatars/speech_small.png").accelerate = true
	A0_131.speechBubble:insert((display.newImage("res/avatars/speech_small.png")))
	if L10_141 > L13_144 * 2 then
		arrow = display.newImage("res/controls/text_arrow.png")
		A0_131.speechBubble:insert(arrow)
		arrow.xReference = arrow.width / 2
		arrow.x = 40 + (L13_144 - L10_141) / 2 * 0.5 - 21 + L13_144 / 2 * 0.5
		arrow.y = display.newImage("res/avatars/speech_small.png").height - arrow.height - 2
	end
	local L17_148 = L17_148
	;({}).x, ({}).fontName = 40 + (L13_144 - L10_141) / 2 * 0.5 - 21, FONT_NAME
	;({}).y = L17_148
	;({}).text = " "
	;({}).originY, ({}).originX = "TOP", "LEFT"
	;({}).textFlow = "LEFT"
	;({}).wrapWidth = L16_147
	;({}).fixedWidth = math.min(L16_147, L10_141)
	;({}).charBaseLine = "CENTER"
	;({}).showOrigin = false
	TextCandy.CreateText({}):scale(0.5, 0.5)
	TextCandy.CreateText({}):setVisibleLines(1, 2)
	TextCandy.CreateText({}):setColor(0, 0, 0)
	A0_131.speechBubble:insert((TextCandy.CreateText({})))
	A0_131:insert(A0_131.speechBubble)
	if A0_131.flip == -1 then
		display.newImage("res/avatars/speech_small.png"):scale(-1, 1)
		A0_131.speechBubble:setReferencePoint(display.CenterRightReferencePoint)
		A0_131.speechBubble.x = A0_131.x - A0_131.rect.contentWidth / 2
		if A0_131.bubblePositioningHack then
			A0_131.speechBubble.x = A0_131.speechBubble.x - 135
		end
	else
		A0_131.speechBubble:setReferencePoint(display.CenterLeftReferencePoint)
		A0_131.speechBubble.x = A0_131.x + A0_131.rect.contentWidth / 2
		if A0_131.bubblePositioningHack then
			A0_131.speechBubble.x = A0_131.speechBubble.x + 135
		end
	end
	function A0_131.speechBubble.cleanUp()
		local L0_167
		L0_167 = _ENV
		L0_167 = L0_167.speechBubble
		L0_167 = L0_167.onComplete
		_UPVALUE1_:delete()
		_UPVALUE1_ = nil
		_ENV.speechBubble:removeSelf()
		_ENV.speechBubble = nil
		_ENV:idleAnimation()
		local L2_169 = L2_169
		if L0_167 then
			L2_169 = L0_167
			L2_169()
		end
	end
	local L18_149, L19_150 = L18_149, L19_150
	local L20_151 = L20_151
	A0_131.speechBubble:scale(2, 2)
	function sayWord(A0_170)
		local L1_171, L2_172 = _ENV:getText(), L2_172
		L2_172 = L6_137
		L2_172 = L2_172[A0_170]
		if not L2_172 or not L1_171 then
			print("TEXT", L1_171)
			print("WORD", L2_172)
		end
		if not L1_171 then
			L1_171 = "ERROR"
		end
		if not L2_172 then
			L2_172 = "ERROR"
		end
		if A0_170 == 1 then
			_ENV:setText(L2_172)
		else
			_ENV:setText(L1_171 .. " " .. L2_172)
		end
		if A0_170 + 1 <= #L6_137 then
			_ENV:setText(L3_134)
		end
		local L3_173 = L3_173
		L3_173 = L3_173(L5_136 / L8_139)
		local L4_174 = _ENV:getNumLines()
		if L4_174 > _UPVALUE5_ then
			if not _UPVALUE6_.accelerate then
				_UPVALUE5_ = L4_174
				if 2 < _UPVALUE5_ then
					_ENV:scroll(1)
				end
				if arrow and L4_174 == L3_173 then
					arrow.isVisible = false
				end
			else
				local L7_177 = L7_177
				timer.performWithDelay(2500, function()
					if _ENV.speechBubble == _UPVALUE1_ then
						if _ENV:getScroll() == _ENV:getMaxScroll() then
							_ENV.speechBubble.cleanUp()
							return
						end
						_ENV:scroll(1)
						if arrow and _ENV:getScroll() == _ENV:getMaxScroll() then
							arrow.isVisible = false
						end
						local L0_179 = L0_179
						local L1_180 = L1_180
						L0_179(L1_180, _UPVALUE3_)
						local L2_181 = L2_181
					end
				end)
				local L8_178 = L8_178
			end
		end
		L7_177 = _UPVALUE6_
		L7_177 = L7_177.accelerate
		if not L7_177 then
			L7_177 = A0_170 + 1
			L8_178 = L6_137
			L8_178 = #L8_178
			if L7_177 > L8_178 then
				L7_177 = timer
				L7_177 = L7_177.performWithDelay
				L8_178 = 2500
				L7_177(L8_178, function()
					local L1_182 = L1_182
					if _ENV.speechBubble == _UPVALUE1_ then
						L1_182 = _ENV
						L1_182 = L1_182.speechBubble
						L1_182 = L1_182.cleanUp
						L1_182()
					end
				end)
				return
			end
		end
	end
	require("soundSpeech").say(L12_143)
	local L21_152 = L21_152
	sayWord(1)
	local L22_153 = L22_153
end
function L10_10(A0_183, A1_184, A2_185)
	A0_183:stopAnimation()
	local L3_186 = L3_186
	L3_186 = A1_184 ~= nil
	if not L3_186 then
		A0_183:idleAnimation()
	else
		A0_183.avatarGroup.x, A0_183.avatarGroup.y = A0_183.avatarGroup.origX, A0_183.avatarGroup.origY
		;({}).y = A0_183.avatarGroup.y
		;({}).x = A0_183.avatarGroup.x
		;({}).rotation = A0_183.avatarGroup.rotation
		;({}).x = -1 * A0_183.flip
		;({}).y = 1
		_ENV(A0_183.avatarGroup, 250, {}, {})
		;({}).rotation = A0_183.avatarGroup.eyebrow_l.rotation
		;({}).rotation = 5 * A0_183.flip
		_ENV(A0_183.avatarGroup.eyebrow_l, 400, {}, {})
		;({}).rotation = A0_183.avatarGroup.eyebrow_r.rotation
		;({}).rotation = -5 * A0_183.flip
		_ENV(A0_183.avatarGroup.eyebrow_r, 400, {}, {})
		_FOR_, _FOR_, _FOR_ = pairs(A0_183.avatarGroup.sprites)
		for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_9_ and _FORV_9_.stopAnimation then
				_FORV_9_.stopAnimation(A0_183.avatarGroup[_FORV_8_])
			end
			if _FORV_9_ and _FORV_9_.talkAnimation then
				_FORV_9_.talkAnimation(A0_183.avatarGroup[_FORV_8_], L3_186)
			end
		end
		if A0_183.pipe and L3_186 then
			({}).rotation = A0_183.pipe.rotation
			;({}).xScale = A0_183.avatarGroup.pipe.xScale
			;({}).yScale = A0_183.avatarGroup.pipe.yScale
			local L11_194 = L11_194
			local L12_195 = L12_195
			;({}).rotation = L0_0(-15, 15)
			;({}).xScale = 0.02
			;({}).yScale = 0.02
			L12_195(A0_183.avatarGroup.pipe, 150, {}, {})
		end
		L12_195 = A0_183.showSpeechBubble
		local L7_190 = L7_190
		L12_195(L7_190, A1_184, A2_185)
		local L8_191 = L8_191
	end
	L11_194 = os
	L11_194 = L11_194.time
	L11_194 = L11_194()
	A0_183.animationHandle = L11_194
	L11_194 = A0_183.animationHandle
	return L11_194
end
function L11_11(A0_196, A1_197)
	local L2_198
	if A1_197 then
		L2_198 = A0_196.rect
		L2_198 = L2_198.activeRect
		L2_198.alpha = 1
	else
		L2_198 = A0_196.rect
		L2_198 = L2_198.activeRect
		L2_198.alpha = 0
	end
	A0_196.isActive = A1_197
end
setActive = L11_11
function L11_11(A0_199, A1_200, A2_201, A3_202)
	local L4_203, L5_204, L6_205, L7_206
	L4_203 = A1_200 or nil
	local L34_233 = L34_233
	if not A1_200 then
		L4_203 = 1
	end
	L5_204 = A2_201 or L5_204
	if not A2_201 then
		L5_204 = "left"
	end
	L6_205 = 1
	L7_206 = false
	if A3_202 == nil or not A3_202 then
		L7_206 = true
	end
	if L5_204 == "right" then
		L6_205 = -1
	end
	L34_233 = display
	L34_233 = L34_233.newGroup
	L34_233 = L34_233()
	local L9_208 = display.newGroup()
	L9_208.sprites = {}
	local L10_209 = L10_209
	local L10_209, L11_210 = L10_209(UI_SPRITE_SHEET)
	local L12_211 = L12_211
	L12_211 = L12_211(L10_209, L11_210, "frame.png")
	local L13_212 = L13_212
	L13_212 = L13_212(L11_210, "frame.png")
	L12_211.width = L13_212.spriteSourceSize.width
	L12_211.height = L13_212.spriteSourceSize.height
	local L14_213 = display.newGroup()
	local L15_214 = L15_214
	L15_214(L14_213, L12_211)
	L15_214 = 10
	local L16_215 = L16_215
	L16_215 = L16_215(L14_213, 0, 0, L12_211.width - L15_214, L12_211.height - L15_214)
	L16_215.alpha = 0
	L16_215.x, L16_215.y = 0, 0
	L16_215.strokeWidth = L15_214
	L16_215:setStrokeColor(255, 0, 0)
	L16_215:setFillColor(0, 0, 0, 0)
	L14_213.activeRect = L16_215
	L14_213:setReferencePoint(display.CenterReferencePoint)
	L14_213.xOrigin = L14_213.width / 2
	L14_213.yOrigin = L14_213.height / 2
	L14_213:scale(L6_205 * 1.25, 1.25)
	local L17_216 = L17_216
	L17_216(L9_208, L14_213)
	L9_208.rect = L14_213
	if L7_206 then
		L14_213.isVisible = false
	end
	L9_208.avatarGroup = L34_233
	function L17_216(A0_234)
		L4_238 = _ENV
		L3_237 = _ENV.stopAnimation
		L3_237(L4_238)
		L3_237 = 1
		L4_238 = A0_234.sprites
		L4_238 = #L4_238
		_FOR_ = 1
		for _FORV_4_ = L3_237, L4_238, _FOR_ do
			if A0_234.sprites[_FORV_4_].dispose then
				A0_234.sprites[_FORV_4_]:dispose()
			else
				print("why am I here at all?")
			end
		end
		L3_237 = _ENV
		L3_237.sprites = nil
	end
	L9_208.dispose = L17_216
	L17_216 = _ENV
	L9_208.idleAnimation = L17_216
	L17_216 = L2_2
	L9_208.stopAnimation = L17_216
	L17_216 = L5_5
	L9_208.shameAnimation = L17_216
	L17_216 = L10_10
	L9_208.talkAnimation = L17_216
	L17_216 = L7_7
	L9_208.stunAnimation = L17_216
	L17_216 = L6_6
	L9_208.laughAnimation = L17_216
	L17_216 = L8_8
	L9_208.angerAnimation = L17_216
	L17_216 = L9_9
	L9_208.showSpeechBubble = L17_216
	L17_216 = L14_213.width
	L9_208.xReference = L17_216
	L9_208.yReference = 0
	L9_208.flip = L6_205
	L17_216 = setActive
	L9_208.setActive = L17_216
	function L17_216(A0_241)
		repeat
			local L1_242 = L1_242
			local L1_242, L2_243 = L1_242(A0_241), L2_243
			if L1_242 ~= "string" then
				return
			end
			L1_242 = pcall
			L2_243 = require
			L1_242, L2_243 = L1_242(L2_243, string.gsub(A0_241, "/", "."))
			if L1_242 and L2_243 and L2_243.getSpriteSheetData then
				L2_243.buildAnimations((sprite.newSpriteSet(sprite.newSpriteSheetFromData(A0_241 .. ".png", L2_243.getSpriteSheetData()), 1, #L2_243.getSpriteSheetData().frames)))
				table.insert(_ENV.sprites, (sprite.newSpriteSheetFromData(A0_241 .. ".png", L2_243.getSpriteSheetData())))
				local L7_248 = L7_248
				do return sprite.newSprite((sprite.newSpriteSet(sprite.newSpriteSheetFromData(A0_241 .. ".png", L2_243.getSpriteSheetData()), 1, #L2_243.getSpriteSheetData().frames))), L2_243 end
				break -- pseudo-goto
			end
			L7_248 = display
			L7_248 = L7_248.newImage
			local L5_246 = A0_241 .. ".png"
			L7_248 = L7_248(L5_246)
			L5_246 = false
			return L7_248, L5_246
		until true
	end
	L34_233.sprites = {}
	L18_217, _FOR_, _FOR_ = L18_217(A0_199)
	for _FORV_21_, _FORV_22_ in L18_217, _FOR_, _FOR_ do
		if L17_216(_FORV_22_) then
			L34_233[_FORV_21_], L34_233.sprites[_FORV_21_] = L17_216(_FORV_22_)
		end
	end
	L18_217 = utils
	L18_217 = L18_217.deepcopy
	L21_220 = L21_220(string.gsub(A0_199.head, "/", "."))
	L18_217 = L18_217(L21_220, L21_220(string.gsub(A0_199.head, "/", ".")))
	if L6_205 == -1 then
		L21_220 = pairs
		L21_220, L20_219, _FOR_ = L21_220(L18_217)
		for _FORV_22_, _FORV_23_ in L21_220, L20_219, _FOR_ do
			_FORV_23_.x = L34_233.head.width - _FORV_23_.x
		end
	end
	L21_220 = 0.75
	function L20_219(A0_249)
		local L1_250, L2_251
		L1_250 = _ENV
		local L1_250, L9_258, L10_259 = L1_250[A0_249], L9_258, L10_259
		L2_251 = L18_217
		L2_251 = L2_251[A0_249]
		if not L2_251 then
			L2_251 = _ENV
			L2_251 = L2_251[A0_249]
		end
		L9_258 = L2_251.reference
		if L9_258 then
			L10_259 = L1_250
			L9_258 = L1_250.setReferencePoint
			L9_258(L10_259, L2_251.reference)
		end
		L9_258 = L2_251.x
		L10_259 = L4_203
		L9_258 = L9_258 * L10_259
		L10_259 = L19_218
		L9_258 = L9_258 * L10_259
		L10_259 = L2_251.y
		L10_259 = L10_259 * L4_203
		L10_259 = L10_259 * L19_218
		L1_250.y = L10_259
		L1_250.x = L9_258
		L9_258 = pcall
		L10_259 = require
		local L6_255 = L6_255
		local L7_256 = L7_256
		local L6_255, L7_256, L8_257 = L6_255(L7_256, "/", ".")
		L9_258, L10_259 = L9_258(L10_259, L6_255, L7_256, L8_257, L6_255(L7_256, "/", "."))
		if L9_258 and L10_259 then
			L6_255 = L10_259.getPositioning
			if L6_255 then
				L6_255 = L10_259.getPositioning
				L6_255 = L6_255()
				L7_256 = L6_255.xShift
				if not L7_256 then
					L7_256 = 0
				end
				L8_257 = L6_255.yShift
				if not L8_257 then
					L8_257 = 0
				end
				L1_250.x, L1_250.y = L1_250.x + L7_256 * L6_205 * L19_218, L1_250.y + L8_257 * L19_218
				if not L6_255.xScale then
				end
				if not L6_255.xScale then
				end
				L1_250.xScale, L1_250.yScale = L1_250.xScale * 1, L1_250.yScale * 1
			end
		end
	end
	local L29_228 = L29_228
	local L30_229 = L30_229
	local L31_230 = L31_230
	local L32_231 = L32_231
	L30_229(L31_230, L32_231, L34_233.eyemod, L34_233.eyebrow_r, L34_233.eyebrow_l, L34_233.glasses, L34_233.mouth, L34_233.hat, L34_233.pipe, L34_233.mustache, L34_233.nose)
	local L33_232 = L33_232
	L30_229 = L20_219
	L31_230 = "head"
	L30_229(L31_230)
	L30_229 = L20_219
	L31_230 = "eyes"
	L30_229(L31_230)
	L30_229 = L34_233.eyemod
	if L30_229 then
		L30_229 = L20_219
		L31_230 = "eyemod"
		L30_229(L31_230)
	end
	L30_229 = L20_219
	L31_230 = "eyebrow_l"
	L30_229(L31_230)
	L30_229 = L20_219
	L31_230 = "eyebrow_r"
	L30_229(L31_230)
	L30_229 = L34_233.mustache
	if L30_229 then
		L30_229 = L20_219
		L31_230 = "mustache"
		L30_229(L31_230)
	end
	L30_229 = L34_233.glasses
	if L30_229 then
		L30_229 = L20_219
		L31_230 = "glasses"
		L30_229(L31_230)
	end
	L30_229 = L20_219
	L31_230 = "nose"
	L30_229(L31_230)
	L30_229 = L20_219
	L31_230 = "mouth"
	L30_229(L31_230)
	L30_229 = L34_233.hat
	if L30_229 then
		L30_229 = L20_219
		L31_230 = "hat"
		L30_229(L31_230)
	end
	L30_229 = L34_233.pipe
	if L30_229 then
		L30_229 = L20_219
		L31_230 = "pipe"
		L30_229(L31_230)
	end
	L30_229 = L9_208.height
	L30_229 = L30_229 * 0.1
	L31_230 = L18_217.origin
	L31_230 = L31_230.x
	L31_230 = L31_230 * L21_220
	L32_231 = L31_230
	L33_232 = L18_217.origin
	L33_232 = L33_232.y
	L33_232 = L33_232 * L21_220
	L34_233.yReference = L33_232
	L34_233.xReference = L32_231
	L32_231 = L34_233.body
	L33_232 = L32_231
	L32_231 = L32_231.setReferencePoint
	L32_231(L33_232, display.BottomCenterReferencePoint)
	if L6_205 then
		L32_231 = L34_233.body
		L33_232 = L32_231
		L32_231 = L32_231.scale
		L32_231(L33_232, L4_203 * L6_205 * L21_220, L4_203 * L21_220)
	else
		L32_231 = L34_233.body
		L33_232 = L32_231
		L32_231 = L32_231.scale
		L32_231(L33_232, L4_203 * L21_220, L4_203 * L21_220)
	end
	L33_232 = L9_208
	L32_231 = L9_208.insert
	L32_231(L33_232, L34_233.body)
	L32_231 = L34_233.body
	L33_232 = L34_233.body
	L32_231.x, L33_232.y = L14_213.width / 2, L14_213.contentBounds.yMax - L30_229 - 1
	L32_231 = L14_213.width
	L32_231 = L32_231 / 2
	L33_232 = L34_233.body
	L33_232 = L33_232.width
	L33_232 = L33_232 * L21_220
	L33_232 = L33_232 / 2
	L33_232 = L33_232 * 1
	L33_232 = L33_232 / 15
	L32_231 = L32_231 + L33_232
	L32_231 = L32_231 - 5
	if L6_205 == -1 then
		L33_232 = L14_213.width
		L33_232 = L33_232 / 2
		L33_232 = L33_232 - L34_233.body.width * L21_220 / 2 * 1 / 15
		L32_231 = L33_232 + 5
	end
	L33_232 = L34_233.body
	L33_232 = L33_232.y
	L33_232 = L33_232 - L34_233.body.contentHeight / 2
	L33_232 = L33_232 + 20
	L34_233.xReference = L34_233.head.x
	L34_233.yReference = L34_233.head.y + L34_233.head.contentHeight / 2
	L34_233.origX, L34_233.origY = L32_231, L33_232
	L34_233.x, L34_233.y = L32_231, L33_232
	L9_208:insert(L34_233)
	L34_233.startingLocations = {}
	L27_226, _FOR_, _FOR_ = pairs(L18_217)
	for _FORV_29_, _FORV_30_ in L27_226, _FOR_, _FOR_ do
		if L34_233[_FORV_29_] then
			({}).x = L34_233[_FORV_29_].x
			;({}).y = L34_233[_FORV_29_].y
			;({}).rotation = L34_233[_FORV_29_].rotation
			;({}).xScale = L34_233[_FORV_29_].xScale
			L34_233.startingLocations[_FORV_29_], ({}).yScale = {}, L34_233[_FORV_29_].yScale
		end
	end
	L27_226 = L34_233
	;({}).x = L27_226.x
	;({}).y = L27_226.y
	;({}).rotation = L27_226.rotation
	;({}).xScale = L27_226.xScale
	L34_233.startingLocations.self, ({}).yScale = {}, L27_226.yScale
	return L9_208
end
buildUi = L11_11
L11_11 = nil
function voiceQueue(A0_260, A1_261, A2_262, A3_263)
	local L7_267 = L7_267
	if not A1_261 then
		if A2_262 then
			L7_267 = A2_262
			L7_267()
		end
		return
	end
	L7_267 = _ENV
	if L7_267 then
		L7_267 = _ENV
		L7_267 = L7_267.speechBubble
		if L7_267 then
			if A3_263 then
				L7_267 = _ENV
				L7_267 = L7_267.idleAnimation
				L7_267(L7_267)
			else
				return
			end
		end
	end
	_ENV = A0_260
	L7_267 = A0_260.talkAnimation
	local L5_265 = L5_265
	local L6_266 = L6_266
	L7_267(L5_265, L6_266, function()
		_ENV = nil
		if A2_262 then
			A2_262()
			local L0_268 = L0_268
		end
	end)
end
