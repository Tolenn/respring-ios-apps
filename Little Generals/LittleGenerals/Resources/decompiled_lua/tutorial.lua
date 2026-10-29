local L0_0, L1_1, L3_3, L4_4, L5_5, L6_6 = L0_0, (...), L3_3, L4_4, L5_5, L6_6
L3_3 = package
L3_3 = L3_3.seeall
L0_0(L1_1, L3_3)
L0_0 = {}
function L1_1(A0_7)
	if _ENV and A0_7 then
		L3_10 = pairs
		L4_11 = A0_7
		L3_10, L4_11, L5_12 = L3_10(L4_11)
		for L8_15, L9_16 in L3_10, L4_11, L5_12 do
			L10_17 = pairs
			L10_17, _FOR_, _FOR_ = L10_17(_ENV)
			for _FORV_9_, _FORV_10_ in L10_17, _FOR_, _FOR_ do
				if _FORV_10_.destroy and _FORV_10_.id == L9_16 then
					_FORV_10_:destroy()
				end
			end
		end
	end
end
closeTutorials = L1_1
function L1_1()
	L2_22 = _ENV
	L0_20, L2_22, L3_23 = L0_20(L2_22)
	for L4_24, L5_25 in L0_20, L2_22, L3_23 do
		return true
	end
	L0_20 = false
	return L0_20
end
areTutorialsShowing = L1_1
function L1_1()
	local L0_26
	L0_26 = {}
	local L1_27 = L1_27
	local L2_28 = L2_28
	local L3_29 = L3_29
	local L4_30 = L4_30
	local L5_31 = L5_31
	local L6_32 = L6_32
	local L7_33 = L7_33
	local L8_34 = L8_34
	local L9_35 = L9_35
	L0_26[1] = L1_27
	L0_26[2] = L2_28
	L0_26[3] = L3_29
	L0_26[4] = L4_30
	L0_26[5] = L5_31
	L0_26[6] = L6_32
	L0_26[7] = L7_33
	L0_26[8] = L8_34
	L0_26[9] = L9_35
	local L0_26[10], L10_36 = "missions", L10_36
	return L0_26
end
getBattleTutorialIds = L1_1
function L1_1()
	local L0_37
	L0_37 = {}
	local L1_38 = L1_38
	local L2_39 = L2_39
	local L3_40 = L3_40
	local L4_41 = L4_41
	local L5_42 = L5_42
	L0_37[1] = L1_38
	L0_37[2] = L2_39
	L0_37[3] = L3_40
	L0_37[4] = L4_41
	L0_37[5] = L5_42
	local L0_37[6], L6_43 = "firstFactoryDegrades", L6_43
	return L0_37
end
getMapTutorialIds = L1_1
L1_1 = {}
L3_3 = "tutorials"
L4_4 = {}
L5_5 = {}
L5_5.direction = "up"
L5_5.text = "Click the [[IMG]] icon to collect Warbux!"
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "money_collection.png"
L4_4.firstWarbux = L5_5
L5_5 = {}
L5_5.direction = "up"
L5_5.text = "Click on a land with a [[IMG]] to attack!"
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "tutorial_arrow.png"
L4_4.firstAttack = L5_5
L5_5 = {}
L5_5.direction = "down"
L5_5.text = "Win the battle to earn these [[IMG]] Warbux!"
L5_5.confirmationRequired = true
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "warbucks_5.png"
L4_4.firstFight0 = L5_5
L5_5 = {}
L5_5.direction = "down"
L5_5.text = "Click [[IMG]] to select weapon."
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "tutorial_babymissile_select.png"
L4_4.firstFight1 = L5_5
L5_5 = {}
L5_5.direction = "down"
L5_5.text = "Select 'light weapons' class."
L4_4.firstFight2 = L5_5
L5_5 = {}
L5_5.direction = "up"
L5_5.text = "Select [[IMG]] to buy weapons."
L5_5.spriteImage = "res/weapons/weapon_icons.png"
L5_5.spriteName = "babymissile.png"
L4_4.firstFight3 = L5_5
L5_5 = {}
L5_5.direction = "up"
L5_5.text = "Select [[IMG]] to confirm purchase."
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "accept_normal_btn.png"
L4_4.firstFight3b = L5_5
L5_5 = {}
L5_5.direction = "up"
L5_5.text = "Drag the [[IMG]] onto your opponent."
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "tutorial_aimline.png"
L4_4.firstFight4 = L5_5
L5_5 = {}
L5_5.direction = "down"
L5_5.text = "Click [[IMG]] to fire your weapon."
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "tutorial_fire_btn.png"
L5_5.scale = 0.8
L4_4.firstFight5 = L5_5
L5_5 = {}
L5_5.direction = "up"
L5_5.text = "Defeat lets enemies capture lands! [[IMG]]"
L5_5.confirmationRequired = true
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "accept_normal_btn.png"
L4_4.firstLoss = L5_5
L5_5 = {}
L5_5.direction = "up"
L5_5.text = "Factory started! Return later to collect weapons. [[IMG]]"
L5_5.confirmationRequired = true
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "accept_normal_btn.png"
L4_4.firstFactory = L5_5
L5_5 = {}
L5_5.direction = "up"
L5_5.text = "Factory done! Collect your weapons!"
L4_4.firstFactoryProduces = L5_5
L5_5 = {}
L5_5.direction = "up"
L5_5.text = "Factory depleted. Conquer more resources! [[IMG]]"
L5_5.confirmationRequired = true
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "accept_normal_btn.png"
L4_4.firstFactoryDegrades = L5_5
L5_5 = {}
L5_5.direction = "up"
L5_5.text = "Spin the wheel for battle bonuses!"
L4_4.firstWheel = L5_5
L5_5 = {}
L5_5.direction = "down"
L5_5.text = "Click [[IMG]] to see your current missions!"
L5_5.confirmationRequired = true
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "missions_normal_btn.png"
L4_4.missions = L5_5
L5_5 = {}
L5_5.direction = "up"
L5_5.text = "Click [[IMG]] to taunt your friends"
L5_5.confirmationRequired = false
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "facebook_icon.png"
L5_5.scale = 0.5
L4_4.brag = L5_5
L5_5 = {}
L5_5.direction = "up"
L5_5.text = "Click [[IMG]] to play your friends!"
L5_5.confirmationRequired = true
L6_6 = UI_SPRITE_SHEET
L5_5.spriteImage = L6_6
L5_5.spriteName = "multiplayer_icon.png"
L4_4.multiplayerAware = L5_5
function L5_5()
	local L0_44, L1_45
	L0_44 = false
	L1_45 = 0
	while "firstFight" do
		local L2_46 = L2_46
		L2_46 = L2_46 .. tostring(L1_45)
		if not _ENV[L2_46] then
			break
		end
		local L3_47 = L3_47
		local L3_47, L4_48 = L3_47(L2_46), L4_48
		if L3_47 then
			L0_44 = true
			goto lbl_20
			break
		end
		::lbl_20::
		L1_45 = L1_45 + 1
	end
	return L0_44
end
isFirstFightTutorialsComplete = L5_5
function L5_5()
	local L0_49 = L0_49
	L0_49("setting all done")
	L0_49 = 0
	while "firstFight" do
		local L1_50 = L1_50
		L1_50 = L1_50 .. tostring(L0_49)
		if not _ENV[L1_50] then
			break
		end
		if not isTutorialComplete(L1_50) then
			print("setting complete", L1_50)
			local L4_53 = L4_53
			L4_53 = setTutorialComplete
			L4_53(L1_50)
			local L3_52 = L3_52
			goto lbl_28
			break
		end
		::lbl_28::
		L0_49 = L0_49 + 1
	end
end
setFirstFightTutorialsComplete = L5_5
function L5_5(A0_54)
	A0_54.destroy = nil
	if A0_54.activeArrow then
		A0_54.activeArrow:stop()
		display.remove(A0_54.activeArrow)
		local L2_56 = L2_56
	end
	A0_54.activeArrow = nil
	L2_56 = A0_54.notification
	if L2_56 then
		L2_56 = A0_54.notification
		L2_56 = L2_56.close
		L2_56()
	end
	A0_54.notification = nil
	A0_54.controls = nil
	L2_56 = _ENV
	L2_56[A0_54] = nil
end
L1_1.destroy = L5_5
function L5_5()
	local L0_57, L1_58 = L0_57, L1_58
	local L0_57, L2_59 = L0_57(L1_58, _ENV), L2_59
	if not L0_57 then
		L1_58 = {}
		L0_57 = L1_58
	end
	return L0_57
end
function L6_6(A0_60)
	local L1_61, L2_62 = _ENV(), L2_62
	L2_62 = L1_61[A0_60]
	if not L2_62 then
		L2_62 = false
		return L2_62
	else
		L2_62 = true
		return L2_62
	end
end
isTutorialComplete = L6_6
function L6_6(A0_63)
	print("completing", A0_63)
	local L1_64 = _ENV()
	L1_64[A0_63] = true
	local L4_67 = L4_67
	L4_67(settings, L2_2, L1_64)
	local L5_68 = L5_68
	L4_67 = settings
	L5_68 = L4_67
	L4_67 = L4_67.save
	L4_67(L5_68)
end
setTutorialComplete = L6_6
function L6_6(A0_69)
	local L1_70
	if not A0_69 then
		L1_70 = {}
		A0_69 = L1_70
	end
	L1_70 = {}
	L2_71, _FOR_, _FOR_ = L2_71(_ENV)
	for _FORV_5_, _FORV_6_ in L2_71, _FOR_, _FOR_ do
		if L1_70[_FORV_5_] == nil then
			L1_70[_FORV_5_] = _ENV[_FORV_5_]
		end
	end
	L2_71 = A0_69.id
	L1_70.id = L2_71
	L2_71 = A0_69.x
	L1_70.x = L2_71
	L2_71 = A0_69.y
	L1_70.y = L2_71
	L2_71 = A0_69.rotation
	if not L2_71 then
		L2_71 = 0
	end
	L1_70.rotation = L2_71
	L2_71 = A0_69.controls
	L1_70.controls = L2_71
	L2_71 = A0_69.events
	if not L2_71 then
		L2_71 = {}
		L2_71[1] = "touch"
	end
	L1_70.events = L2_71
	L2_71 = A0_69.onComplete
	if L2_71 then
		L2_71 = A0_69.onComplete
		L1_70.onComplete = L2_71
	else
		L2_71 = L1_70.complete
		L1_70.onComplete = L2_71
	end
	L2_71 = A0_69.isComplete
	L1_70.isComplete = L2_71
	L2_71 = A0_69.notificationParams
	if not L2_71 then
		L2_71 = L4_4[L1_70.id]
	end
	if L2_71 then
		L1_70.notification = utils.getNotificationSlider(L2_71)
	end
	if L1_70.controls or L2_71.confirmationRequired then
		if L2_71.confirmationRequired then
			if not L1_70.controls then
				L1_70.controls = {}
			end
			table.insert(L1_70.controls, L1_70.notification)
		end
		maskFor(L1_70, L1_70.controls)
	end
	if L1_70.x and L1_70.y then
		local L3_72 = L3_72
		local L3_72, L4_73 = L3_72(UI_SPRITE_SHEET)
		local L5_74 = L5_74
		local L6_75 = L6_75
		local L7_76 = L7_76
		local L5_74, L8_77 = L5_74(L6_75, L7_76, "select_arrow.png"), L8_77
		L6_75 = L5_74.height
		L6_75 = L6_75 / 2
		L5_74.yReference = L6_75
		L6_75 = L1_70.rotation
		L5_74.rotation = L6_75
		L6_75 = L1_70.x
		L5_74.x = L6_75
		L6_75 = L1_70.y
		L5_74.y = L6_75
		function L6_75()
			local L0_80, L1_81, L2_82
			L0_80 = -1
			L1_81 = _ENV
			L1_81 = L1_81.bounceUp
			if not L1_81 then
				L0_80 = 1
			end
			L1_81 = _ENV
			L2_82 = _ENV
			L2_82 = L2_82.bounceUp
			L2_82 = not L2_82
			L1_81.bounceUp = L2_82
			L1_81 = -25 * L0_80
			L2_82 = math
			L2_82 = L2_82.sin
			local L3_83 = L3_83
			L3_83 = L3_83(_ENV.rotation)
			L2_82 = L2_82(L3_83, L3_83(_ENV.rotation))
			L2_82 = -1 * L2_82
			L2_82 = L2_82 * L1_81
			L3_83 = math
			L3_83 = L3_83.cos
			local L4_84 = L4_84
			L4_84 = L4_84(_ENV.rotation)
			L3_83 = L3_83(L4_84, L4_84(_ENV.rotation))
			L3_83 = L3_83 * L1_81
			L4_84 = _ENV
			local L5_85 = L5_85
			local L6_86 = L6_86
			;({}).time = 500
			;({}).transition = easing.inOutQuad
			;({}).x = L2_82
			;({}).y = L3_83
			;({}).delta = true
			local ({}).onComplete, L8_88 = L6_75, L8_88
			L5_85 = L5_85(L6_86, L8_88)
			L4_84.transitionHandle = L5_85
		end
		function L7_76()
			if _ENV.transitionHandle then
				local L0_89 = L0_89
				L0_89(_ENV.transitionHandle)
				local L1_90 = L1_90
			end
			L0_89 = _ENV
			L0_89.transitionHandle = nil
		end
		function L8_77()
			local L0_91, L1_92, L2_93, L3_94
			L0_91 = _ENV
			L1_92 = _ENV
			L2_93 = L1_70
			L2_93 = L2_93.x
			L3_94 = L1_70
			L3_94 = L3_94.y
			L1_92.y = L3_94
			L0_91.x = L2_93
		end
		L5_74.bounce = L6_75
		L5_74.stop = L7_76
		L5_74.resetPos = L8_77
		L1_70.activeArrow = L5_74
		L5_74:bounce()
		local L9_78, L10_79 = L9_78, L10_79
	end
	L3_72 = L0_0
	if not L3_72 then
		L3_72 = {}
		L0_0 = L3_72
	end
	L3_72 = L0_0
	L3_72[L1_70] = L1_70
	return L1_70
end
new = L6_6
function L6_6(A0_95, A1_96)
	local L2_97
	if not A1_96 then
		L2_97 = {}
		A1_96 = L2_97
	end
	L2_97 = A1_96.x
	if not L2_97 then
		L2_97 = A0_95.x
		if not L2_97 then
			L2_97 = 0
		end
	end
	A0_95.x = L2_97
	L2_97 = A1_96.y
	if not L2_97 then
		L2_97 = A0_95.y
		if not L2_97 then
			L2_97 = 0
		end
	end
	A0_95.y = L2_97
	L2_97 = A1_96.rotation
	if not L2_97 then
		L2_97 = A0_95.rotation
		if not L2_97 then
			L2_97 = 0
		end
	end
	A0_95.rotation = L2_97
	L2_97 = A1_96.msg
	if not L2_97 then
		L2_97 = A0_95.msg
		if not L2_97 then
			L2_97 = nil
		end
	end
	A0_95.msg = L2_97
end
function L1_1.complete(A0_98)
	print("complete", A0_98.id)
	local L3_100 = L3_100
	L3_100 = setTutorialComplete
	L3_100(A0_98.id)
	L3_100 = A0_98.destroy
	L3_100(A0_98)
end
function L1_1.changeMsg(A0_101, A1_102)
	local L3_103 = L3_103
	L3_103(A0_101, A1_102)
	local L4_104 = L4_104
end
function L1_1.showMsg(A0_105, A1_106)
	local L3_107 = L3_107
	L3_107(A0_105, A1_106)
	local L4_108 = L4_108
end
function L1_1.hideMsg(A0_109, A1_110)
	local L3_111 = L3_111
	L3_111(A0_109, A1_110)
	local L4_112 = L4_112
end
function L1_1.hideArrow(A0_113, A1_114)
	if not A1_114 then
		A1_114 = {}
	end
	if not A1_114.time then
		A1_114.time = 500
	end
	if not A1_114.onComplete then
		A1_114.onComplete = A0_113.activeArrow.bounce
	end
	local L2_115 = L2_115
	local L3_116 = L3_116
	;({}).time = A1_114.time
	;({}).transition = easing.outQuad
	;({}).alpha = 0
	local ({}).onComplete, L5_118 = A1_114.onComplete, L5_118
	L2_115(L3_116, L5_118)
end
function L1_1.showArrow(A0_119, A1_120)
	if not A1_120 then
		A1_120 = {}
	end
	if not A1_120.time then
		A1_120.time = 500
	end
	if not A1_120.onComplete then
		A1_120.onComplete = A0_119.activeArrow.bounce
	end
	local L2_121 = L2_121
	local L3_122 = L3_122
	;({}).time = A1_120.time
	;({}).transition = easing.outQuad
	;({}).alpha = 1
	local ({}).onComplete, L5_124 = A1_120.onComplete, L5_124
	L2_121(L3_122, L5_124)
end
function L1_1.moveArrow(A0_125, A1_126, A2_127)
	_ENV(A0_125, A1_126)
	if not A2_127 then
		A2_127 = {}
	end
	if not A2_127.time then
		A2_127.time = 500
	end
	A0_125.activeArrow:stop()
	local L3_128 = L3_128
	L3_128 = A0_125.activeArrow
	local L4_129 = L4_129
	local L5_130 = L5_130
	;({}).time = A2_127.time
	;({}).transition = easing.inOutQuad
	;({}).x = A0_125.x
	;({}).y = A0_125.y
	;({}).rotation = A0_125.rotation
	;({}).delta = A2_127.delta
	local ({}).onComplete, L7_132 = A0_125.activeArrow.bounce, L7_132
	L4_129 = L4_129(L5_130, L7_132)
	L3_128.transitionHandle = L4_129
end
function maskFor(A0_133, A1_134)
	local L7_140 = display.newRect
	L7_140 = L7_140(screenX, 0, screenWidth, display.contentHeight)
	local L3_136 = L3_136
	L3_136(display.getCurrentStage(), L7_140)
	L7_140.alpha = 0
	function L3_136(A0_145)
		local L1_146, L2_147
		L1_146 = {}
		L2_147 = 1
		L6_151 = 1
		_FOR_ = 1
		for _FORV_6_ = L6_151, _FOR_, _FOR_ do
			if _ENV[_FORV_6_].contentBounds then
				local L14_159 = L14_159
				local L15_160 = L15_160
				local L16_161 = L16_161
				local L17_162 = L17_162
				L15_160[1] = L16_161
				L15_160[2] = L17_162
				L15_160[3] = _ENV[_FORV_6_].contentBounds.xMin
				L15_160[4] = _ENV[_FORV_6_].contentBounds.yMax
				L15_160[5] = _ENV[_FORV_6_].contentBounds.xMax
				L15_160[6] = _ENV[_FORV_6_].contentBounds.yMax
				L15_160[7] = _ENV[_FORV_6_].contentBounds.xMax
				L15_160[8] = L14_159.yMin
				L15_160[9] = L14_159.xMin
				local L15_160[10], L18_163 = L14_159.yMin, L18_163
				L1_146[L2_147] = L15_160
				L2_147 = L2_147 + 1
			end
		end
		L6_151 = A0_145.phase
		if L6_151 ~= "began" then
			L6_151 = A0_145.phase
			if L6_151 ~= "moved" then
				goto lbl_86
			end
		end
		L6_151 = A0_133
		L6_151 = L6_151.isComplete
		if L6_151 then
			L6_151 = A0_133
			L11_156 = L6_151
			L6_151 = L6_151.isComplete
			L6_151 = L6_151(L11_156)
			if not L6_151 then
				L6_151 = 1
				L11_156 = #L1_146
				L12_157 = 1
				for L13_158 = L6_151, L11_156, L12_157 do
					L14_159 = utils
					L14_159 = L14_159.pointInPolygon
					L15_160 = L1_146[L13_158]
					L16_161 = A0_145.x
					L17_162 = A0_145.y
					L14_159 = L14_159(L15_160, L16_161, L17_162)
					if L14_159 then
						L14_159 = _ENV
						L14_159 = L14_159[L13_158]
						L15_160 = L14_159
						L14_159 = L14_159.dispatchEvent
						L16_161 = A0_145
						L14_159(L15_160, L16_161)
						L14_159 = display
						L14_159 = L14_159.getCurrentStage
						L14_159 = L14_159()
						L15_160 = L14_159
						L14_159 = L14_159.setFocus
						L16_161 = L2_135
						L14_159(L15_160, L16_161)
					end
				end
			else
				L6_151 = L2_135
				L11_156 = L6_151
				L6_151 = L6_151.removeSelf
				L6_151(L11_156)
				L6_151 = display
				L6_151 = L6_151.getCurrentStage
				L6_151 = L6_151()
				L11_156 = L6_151
				L6_151 = L6_151.setFocus
				L12_157 = nil
				L6_151(L11_156, L12_157)
				L6_151 = A0_133
				L11_156 = L6_151
				L6_151 = L6_151.onComplete
				L6_151(L11_156)
				L6_151 = false
				do return L6_151 end
				goto lbl_136
				::lbl_86::
				L6_151 = A0_145.phase
				if L6_151 ~= "ended" then
					L6_151 = A0_145.phase
					if L6_151 ~= "cancelled" then
						L6_151 = A0_145.name
						if L6_151 ~= "tap" then
							goto lbl_136
						end
					end
				end
				L6_151 = 1
				L11_156 = #L1_146
				L12_157 = 1
				for L13_158 = L6_151, L11_156, L12_157 do
					L14_159 = utils
					L14_159 = L14_159.pointInPolygon
					L15_160 = L1_146[L13_158]
					L16_161 = A0_145.x
					L17_162 = A0_145.y
					L14_159 = L14_159(L15_160, L16_161, L17_162)
					if L14_159 then
						L14_159 = A0_133
						L14_159 = L14_159.isComplete
						if L14_159 then
							L14_159 = A0_133
							L15_160 = L14_159
							L14_159 = L14_159.isComplete
							L14_159 = L14_159(L15_160)
							if not L14_159 then
								goto lbl_135
							end
						end
						L14_159 = L2_135
						L15_160 = L14_159
						L14_159 = L14_159.removeSelf
						L14_159(L15_160)
						L14_159 = display
						L14_159 = L14_159.getCurrentStage
						L14_159 = L14_159()
						L15_160 = L14_159
						L14_159 = L14_159.setFocus
						L16_161 = nil
						L14_159(L15_160, L16_161)
						L14_159 = _ENV
						L14_159 = L14_159[L13_158]
						L15_160 = L14_159
						L14_159 = L14_159.dispatchEvent
						L16_161 = A0_145
						L14_159(L15_160, L16_161)
						L14_159 = A0_133
						L15_160 = L14_159
						L14_159 = L14_159.onComplete
						L14_159(L15_160)
						L14_159 = false
						return L14_159
					end
					::lbl_135::
				end
			end
		end
		::lbl_136::
		L6_151 = true
		return L6_151
	end
	_FOR_ = 1
	for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
		L7_140:addEventListener(A0_133.events[_FORV_7_], L3_136)
		local L11_144 = L11_144
	end
	L8_141 = L7_140
	L6_139 = L7_140.toFront
	L6_139(L8_141)
end
