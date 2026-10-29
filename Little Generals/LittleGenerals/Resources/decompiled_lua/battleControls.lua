local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43, L44_44, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61 = L2_2, "widgetTracker", L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43, L44_44, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61
L2_2(L3_3)
L2_2 = require
L3_3 = "battleAvatar"
L2_2(L3_3)
L2_2 = require
L3_3 = "avatar"
L2_2(L3_3)
L2_2 = require
L3_3 = "trashTalk"
L2_2(L3_3)
L2_2 = {}
L3_3 = player
L2_2[1] = L3_3
BattleControls = L2_2
L2_2 = {}
L3_3 = BattleControls
L2_2.__index = L3_3
BattleControls_mt = L2_2
L2_2 = 4
ANGLE_SENSITIVITY = L2_2
L2_2 = 4
POWER_SENSITIVITY = L2_2
L2_2 = nil
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
fireWeaponButton = L12_12
L12_12 = nil
openArmoryButton = L12_12
L12_12 = nil
potMoney = L12_12
L12_12 = nil
L13_13 = nil
L14_14 = nil
L15_15 = nil
L16_16 = nil
L17_17 = nil
L18_18 = nil
L19_19 = nil
L20_20 = nil
L21_21 = nil
L22_22 = nil
L23_23 = nil
L24_24 = nil
L25_25 = nil
L26_26 = nil
L27_27 = nil
L28_28 = nil
L29_29 = 0
L30_30 = nil
shotPath = L30_30
L30_30 = -227
L31_31 = 450
L32_32 = 32
L33_33 = -419
L34_34 = 200
L35_35 = nil
L36_36 = nil
L37_37 = nil
L38_38 = nil
L39_39 = nil
L40_40 = nil
L41_41 = nil
L42_42 = nil
function L43_43()
	Runtime:removeEventListener("enterFrame", updateOutputs)
	local L1_62 = L1_62
	local L2_63 = L2_63
	L1_62(L2_63, "enterFrame", joystickHold)
	local L3_64 = L3_64
end
cleanupBattleListeners = L43_43
function L43_43()
	_ENV = os.time()
end
resetIdle = L43_43
function L43_43(A0_65)
	local L1_66, L2_67
	L1_66 = A0_65 * 800
	L2_67 = screenWidth
	L1_66 = L1_66 / L2_67
	return L1_66
end
correctTouchX = L43_43
function L43_43()
	local L0_68, L1_69, L2_70, L3_71
	L0_68 = _ENV
	if L0_68 then
		L0_68 = _ENV
		L0_68 = L0_68.x
		L1_69 = L30_30
		L0_68 = L0_68 - L1_69
		L1_69 = L31_31
		L0_68 = L0_68 / L1_69
		L1_69 = L10_10
		L2_70 = 1 - L0_68
		L3_71 = L10_10
		L3_71 = L3_71.width
		L2_70 = L2_70 * L3_71
		L2_70 = -L2_70
		L1_69.maskX = L2_70
	end
end
function L44_44()
	sound.playSound(sound.globalSounds.button)
	local L0_72 = L0_72
	;({}).textLine1 = "Surrender?"
	;({}).textLine2 = "Do you wish to forfeit the match?"
	local ({}).icon, L2_74 = utils.DIALOG_SURRENDER, L2_74
	function L2_74.confirmFunction()
		sound.playSound(sound.globalSounds.button)
		tombstone:addToStat("forfeits", 1)
		if getCurrentBattle().isMultiplayer then
			utils.logEvent("BattleForfeit - MP")
			if require("currentBattle").getActivePlayer() == players[2] then
				({}).circumstance = require("currentBattle").END_CONTEXT_SURRENDER
				endGame(players[1], {})
			else
				repeat
					local L5_80 = L5_80
					;({}).circumstance = require("currentBattle").END_CONTEXT_SURRENDER
					endGame(players[2], {})
					do break end -- pseudo-goto
					L5_80 = utils
					L5_80 = L5_80.logEvent
					L5_80("BattleForfeit")
					L5_80 = endGame
					local L1_76 = L1_76
					local L4_79 = L4_79
					L4_79.circumstance = require("currentBattle").END_CONTEXT_SURRENDER
					L5_80(L1_76, L4_79)
				until true
			end
		end
	end
	function L2_74.cancelFunction()
		sound.playSound(sound.globalSounds.button)
		local L1_81 = L1_81
	end
	L0_72(L2_74)
end
function L45_45(A0_82)
	local L1_83, L2_84, L3_85
	L1_83 = potMoney
	L1_83 = L1_83.x
	L2_84 = potMoney
	L3_85 = L2_84
	L2_84 = L2_84.setText
	local L4_86 = L4_86
	local L4_86, L5_87 = L4_86(A0_82)
	L2_84(L3_85, L4_86, L5_87)
end
updatePotMoney = L45_45
function L45_45()
	local L0_88
	L0_88 = _ENV
	if L0_88 then
		L0_88 = L6_6
		L0_88 = L0_88.power
		local L4_92 = L4_92
		L4_92.x = L30_30 + L0_88 / L34_34 * L31_31
		L4_92 = L43_43
		L4_92()
	end
end
L46_46 = -1
L47_47 = nil
L48_48 = nil
L49_49 = nil
L50_50 = nil
function L51_51(A0_93)
	local L1_94
	L1_94 = 400000
	L4_97 = nil
	_ENV = L4_97
	L4_97 = pairs
	L5_98 = A0_93
	L4_97, L5_98, L6_99 = L4_97(L5_98)
	for L7_100, _FORV_6_ in L4_97, L5_98, L6_99 do
		if L1_94 > _FORV_6_.time then
			L1_94 = _FORV_6_.time
			_ENV = L1_94
		end
	end
end
function L52_52(A0_101, A1_102)
	if not _ENV then
		_ENV = {}
	end
	if A1_102.other.objType == "rock" then
		local L2_103 = L2_103
		L2_103 = L2_103(levelGroup, A1_102.other.x, A1_102.other.y)
		local L8_109 = L8_109
		display.newCircle(L50_50, L2_103, L2_103(levelGroup, A1_102.other.x, A1_102.other.y)):setFillColor(255, 255, 0)
		local L9_110 = L9_110
		L9_110.time = A0_101.time
		L9_110.isVisible = false
		table.insert(_ENV, L9_110)
		local L7_108 = L7_108
	end
	L2_103 = _ENV
	L8_109 = timer
	L8_109 = L8_109.performWithDelay
	L9_110 = 1
	function L7_108(A0_111)
		if _ENV then
			_ENV:removeSelf()
			_ENV = nil
			L51_51(L2_103)
			local L2_112 = L2_112
		end
	end
	L8_109(L9_110, L7_108)
	L8_109 = true
	return L8_109
end
function L53_53(A0_113, A1_114)
	local _ENV, L5_118, L6_119, L12_125, L13_126, L14_127, L15_128 = {}, L5_118, L6_119, L12_125, L13_126, L14_127, L15_128
	L5_118 = L47_47
	if L5_118 then
		L5_118 = L47_47
		L6_119 = L5_118
		L5_118 = L5_118.removeSelf
		L5_118(L6_119)
	end
	L5_118 = L50_50
	if not L5_118 then
		L5_118 = display
		L5_118 = L5_118.newGroup
		L5_118 = L5_118()
		L50_50 = L5_118
	else
		L5_118 = L50_50
		L6_119 = L5_118
		L5_118 = L5_118.removeSelf
		L5_118(L6_119)
		L5_118 = display
		L5_118 = L5_118.newGroup
		L5_118 = L5_118()
		L50_50 = L5_118
	end
	L5_118 = display
	L5_118 = L5_118.newGroup
	L5_118 = L5_118()
	L47_47 = L5_118
	L5_118 = L47_47
	L6_119 = {}
	L5_118.circles = L6_119
	L5_118 = levelGroup
	L6_119 = L5_118
	L5_118 = L5_118.insert
	L12_125 = L47_47
	L5_118(L6_119, L12_125)
	A0_113 = A0_113 * 0.83
	L5_118 = L6_6
	L5_118 = L5_118.rotation
	A1_114 = A1_114 + L5_118
	L5_118 = L6_6
	L6_119 = L5_118
	L5_118 = L5_118.whereMyCannonBeAt
	L5_118, L6_119 = L5_118(L6_119)
	L12_125 = 0
	L13_126 = 10
	L14_127 = math
	L14_127 = L14_127.pi
	L14_127 = A1_114 * L14_127
	L14_127 = L14_127 / 180
	L15_128 = math
	L15_128 = L15_128.cos
	L15_128 = L15_128(L14_127)
	L15_128 = L15_128 * A0_113
	local L11_124 = L11_124
	L46_46 = L46_46 + 0.01
	if 1 < L46_46 then
		L46_46 = -1
	end
	_FOR_ = 0.5
	for _FORV_14_ = _FOR_, _FOR_, _FOR_ do
		stepX = L11_124 * _FORV_14_
		stepY = L15_128 * _FORV_14_ - 5 * _FORV_14_ * _FORV_14_
		if not L47_47.circles[1] then
			if 1 % 2 == 1 then
				display.newCircle(0, 0, 2).x = -4
				display.newCircle(0, 0, 2).y = -4
			else
				display.newCircle(0, 0, 2).x = -2
				display.newCircle(0, 0, 2).y = -2
			end
			display.newCircle(0, 0, 2).time = _FORV_14_
			;({}).isSensor = true
			physics.addBody(display.newCircle(0, 0, 2), {})
			display.newCircle(0, 0, 2).collision = L52_52
			display.newCircle(0, 0, 2):addEventListener("collision", (display.newCircle(0, 0, 2)))
			display.newCircle(0, 0, 2):scale(2, 2)
			local L19_132 = L19_132
			local L17_130 = L17_130
			L47_47:insert((display.newCircle(0, 0, 2)))
			repeat
				L47_47.circles[L17_130] = display.newCircle(0, 0, 2)
				display.newCircle(0, 0, 2).x = stepX + L5_118
				display.newCircle(0, 0, 2).y = L6_119 - stepY
				display.newCircle(0, 0, 2).isVisible = false
				do break end -- pseudo-goto
				L47_47.circles[L17_130].x = stepX + L5_118
				L47_47.circles[L17_130].y = L6_119 - stepY
			until true
		end
		L17_130 = L17_130 + 1
	end
end
function L54_54(A0_133)
	if A0_133.phase == "began" then
		A0_133.target.lastTouchId = A0_133.id
		p1Avatar:idleAnimation()
		p2Avatar:idleAnimation()
		display.getCurrentStage():setFocus(A0_133.target)
		shotPath.lastX = A0_133.xStart
		shotPath.lastY = A0_133.yStart
		shotPath.origDist = utils.distanceBetweenPoints(_ENV.cannon:localToContent(0, 0))
		shotPath.origPower = _ENV.power
	elseif not A0_133.target.lastTouchId or A0_133.target.lastTouchId ~= A0_133.id then
		return false
	elseif A0_133.phase == "ended" or A0_133.phase == "cancelled" then
		if shotPath.powerCone then
			display.remove(shotPath.powerCone)
		end
		A0_133.target.lastTouchId = nil
		local L1_134, L2_135 = L1_134, L2_135
		L1_134(L2_135, nil)
		local L3_136 = L3_136
		L1_134 = true
		return L1_134
	end
	L1_134 = A0_133.target
	L1_134 = L1_134.t
	if L1_134 == 0 then
		L2_135 = true
		return L2_135
	end
	L2_135 = _ENV
	L2_135 = L2_135.angle
	L3_136 = _ENV
	L3_136 = L3_136.rotation
	L2_135 = L2_135 + L3_136
	L3_136 = _ENV
	L3_136 = L3_136.power
	if shotPath.weaponControlType == "linear" then
		({}).x = shotPath.lastX - _ENV.cannon:localToContent(0, 0)
		;({}).y = shotPath.lastY - _ENV.cannon:localToContent(0, 0)
		;({}).x = A0_133.x - _ENV.cannon:localToContent(0, 0)
		;({}).y = A0_133.y - _ENV.cannon:localToContent(0, 0)
		local L7_140 = L7_140
		if utils.angleOfPoint({}) - utils.angleOfPoint({}) < -300 then
		elseif utils.angleOfPoint({}) - utils.angleOfPoint({}) + 360 > 300 then
		end
		local L2_135, L8_141 = L2_135 + (utils.angleOfPoint({}) - utils.angleOfPoint({}) + 360 - 360), L8_141
		local L9_142, L10_143 = L9_142, L10_143
		local L11_144 = L11_144
		local L12_145 = L12_145
		L3_136 = shotPath.origPower - (shotPath.origDist - utils.distanceBetweenPoints(_ENV.cannon:localToContent(0, 0))) / (POWER_SENSITIVITY / 2)
		if shotPath.powerCone then
			display.remove(shotPath.powerCone)
		end
		if not weaponTypes[_ENV.weaponType].drawPowerCone then
			goto lbl_202
		end
		local L15_148 = L15_148
		local L16_149 = L16_149
		local L17_150 = L17_150
		shotPath.powerCone = weaponTypes[_ENV.weaponType].drawPowerCone(_ENV, L2_135, L3_136)
		break -- pseudo-goto
	end
	repeat
		L7_140 = A0_133.x
		L8_141 = shotPath
		L8_141 = L8_141.lastX
		L7_140 = L7_140 - L8_141
		L8_141 = ANGLE_SENSITIVITY
		L7_140 = L7_140 / L8_141
		L8_141 = A0_133.y
		L9_142 = shotPath
		L9_142 = L9_142.lastY
		L8_141 = L8_141 - L9_142
		L9_142 = POWER_SENSITIVITY
		L8_141 = L8_141 / L9_142
		L2_135 = L2_135 + L7_140
		L3_136 = L3_136 - L8_141
	until true
	::lbl_202::
	L7_140 = shotPath
	L8_141 = A0_133.x
	L7_140.lastX = L8_141
	L7_140 = shotPath
	L8_141 = A0_133.y
	L7_140.lastY = L8_141
	L7_140 = _ENV
	L8_141 = L7_140
	L7_140 = L7_140.adjustToPower
	L9_142 = L3_136
	L7_140(L8_141, L9_142)
	L7_140 = _ENV
	L8_141 = L7_140
	L7_140 = L7_140.adjustToAngle
	L9_142 = L2_135
	L7_140(L8_141, L9_142)
	L7_140 = true
	return L7_140
end
function L55_55(A0_151, A1_152)
	local L2_153, L3_154, L4_155
	L2_153 = weaponTypes
	local L3_154, L8_159, L9_160, L10_161, L11_162, L12_163, L13_164, L14_165, L19_170, L20_171, L21_172, L22_173 = _ENV, L8_159, L9_160, L10_161, L11_162, L12_163, L13_164, L14_165, L19_170, L20_171, L21_172, L22_173
	L3_154 = L3_154.weaponType
	L2_153 = L2_153[L3_154]
	L3_154 = L2_153.weaponControlType
	L4_155 = L3_154 == "linear"
	if L4_155 then
		L8_159 = L2_153.allowLinearPower
		if not L8_159 then
			A0_151 = 125
		end
	end
	L8_159 = shotPath
	if L8_159 then
		L8_159 = shotPath
		L8_159 = L8_159.weaponControlType
		if L8_159 == L3_154 then
			goto lbl_48
		end
	end
	L8_159 = shotPath
	if L8_159 then
		L8_159 = display
		L8_159 = L8_159.remove
		L9_160 = shotPath
		L8_159(L9_160)
	end
	L8_159 = display
	L8_159 = L8_159.newGroup
	L8_159 = L8_159()
	shotPath = L8_159
	L8_159 = shotPath
	L8_159.weaponControlType = L3_154
	L8_159 = shotPath
	L9_160 = {}
	L8_159.circles = L9_160
	L8_159 = shotPath
	L8_159.lastX = 0
	L8_159 = shotPath
	L8_159.lastY = 0
	L8_159 = TERRAIN_FLAIR
	L9_160 = L8_159
	L8_159 = L8_159.insert
	L10_161 = shotPath
	L8_159(L9_160, L10_161)
	goto lbl_54
	::lbl_48::
	L8_159 = L1_1
	L8_159 = L8_159.enabled
	if L8_159 then
		L8_159 = shotPath
		L8_159.isVisible = true
	end
	::lbl_54::
	L8_159 = tutorial
	L8_159 = L8_159.isFirstFightTutorialsComplete
	L8_159 = L8_159()
	A0_151 = A0_151 * 0.812
	L9_160 = _ENV
	L9_160 = L9_160.rotation
	A1_152 = A1_152 + L9_160
	L9_160 = _ENV
	L10_161 = L9_160
	L9_160 = L9_160.whereMyCannonBeAt
	L9_160, L10_161 = L9_160(L10_161)
	L11_162 = 0
	L12_163 = 10
	L13_164 = math
	L13_164 = L13_164.pi
	L13_164 = A1_152 * L13_164
	L13_164 = L13_164 / 180
	L14_165 = 0
	L19_170 = 0
	L20_171 = 0
	L21_172 = 0
	if L4_155 then
		L22_173 = math
		L22_173 = L22_173.sin
		L22_173 = L22_173(math.rad(A1_152))
		L22_173 = L22_173 * A0_151
		L14_165 = L22_173 / 2
		L22_173 = math
		L22_173 = L22_173.cos
		L22_173 = L22_173(math.abs(math.rad(A1_152)))
		L22_173 = L22_173 * A0_151
		L19_170 = L22_173 / 2
		break -- pseudo-goto
	end
	L22_173 = math
	L22_173 = L22_173.cos
	L22_173 = L22_173(L13_164)
	L20_171 = L22_173 * A0_151
	L22_173 = math
	L22_173 = L22_173.sin
	repeat
		L22_173 = L22_173(L13_164)
		L21_172 = L22_173 * A0_151
	until true
	L22_173 = 2 * A0_151
	L22_173 = L22_173 * math.cos(L13_164)
	repeat
		if L8_159 or getCurrentBattle().isMultiplayer then
			L22_173 = L22_173 / 10
			break -- pseudo-goto
		end
		L22_173 = L22_173 / 4
	until true
	L22_173 = L22_173 * 0.66
	if L22_173 < 10 then
		L22_173 = 10
	end
	L46_46 = L46_46 + 0.01
	if 1 < L46_46 then
		L46_46 = -1
	end
	if L49_49 then
		L22_173 = L49_49 * 0.66
	end
	_FOR_ = 0.5
	for _FORV_22_ = _FOR_, _FOR_, _FOR_ do
		if L4_155 then
			stepX = L14_165 * _FORV_22_
			stepY = L19_170 * _FORV_22_
		else
			stepX = L21_172 * _FORV_22_
			stepY = L20_171 * _FORV_22_ - 5 * _FORV_22_ * _FORV_22_
		end
		if not shotPath.circles[1] then
			display.newGroup().x, display.newGroup().y = stepX + L9_160, L10_161 - stepY
			if 1 % 2 == 1 then
				display.newImage("res/largecircle.png").x = -4
				display.newImage("res/largecircle.png").y = -4
			else
				display.newImage("res/smallcircle.png").x = -2
				display.newImage("res/smallcircle.png").y = -2
			end
			display.newImage("res/smallcircle.png"):scale(2, 2)
			display.newImage("res/smallcircle.png").t = _FORV_22_
			display.newImage("res/smallcircle.png").yvel = A0_151 * math.cos(L13_164)
			display.newGroup():insert((display.newImage("res/smallcircle.png")))
			display.newCircle(40, 40, 160).alpha = 0
			display.newCircle(40, 40, 160).x, display.newCircle(40, 40, 160).y = display.newImage("res/smallcircle.png").x, display.newImage("res/smallcircle.png").y
			display.newGroup().touch, display.newCircle(40, 40, 160).isHitTestable = display.newCircle(40, 40, 160), true
			display.newCircle(40, 40, 160):addEventListener("touch", L54_54)
			display.newGroup():insert((display.newCircle(40, 40, 160)))
			shotPath:insert((display.newGroup()))
			shotPath.circles[1] = display.newGroup()
		else
			if shotPath.testFunction then
				local L25_176 = L25_176
				shotPath.testFunction(shotPath, A0_151, A1_152, shotPath.circles[1])
			end
			shotPath.circles[1].x = stepX + L9_160
			shotPath.circles[1].y = L10_161 - stepY
		end
		if _FORV_22_ < L22_173 then
			L25_176 = _FORV_22_ / (L22_173 + 10)
			L25_176 = 1 - L25_176
			shotPath.circles[1].xScale = L25_176
			shotPath.circles[1].yScale = L25_176
		end
		if players[1] == require("currentBattle").getActivePlayer() then
		end
		if not require("currentBattle").getActivePlayer() or not players[2] then
			return
		end
		if shotPath.weaponControlType == "linear" then
		else
			local L26_177 = L26_177
			local L27_178 = L27_178
		end
		if L27_178 then
			L27_178 = utils.distanceBetweenPoints(shotPath.circles[L26_177].x, shotPath.circles[L26_177].y, require("currentBattle").getActivePlayer().x, require("currentBattle").getActivePlayer().y) < 300 or utils.distanceBetweenPoints(shotPath.circles[L26_177].x, shotPath.circles[L26_177].y, players[2].x, players[2].y) > 500
		end
		shotPath.circles[L26_177].isVisible = 0.5 < _FORV_22_ and _FORV_22_ < L22_173 and (not L8_159 or L27_178)
		L26_177 = L26_177 + 1
	end
end
function L56_56()
	local L0_183
	L0_183 = _ENV
	local L3_186, L4_187 = getCurrentBattle, L4_187
	L3_186 = L3_186()
	L3_186 = L3_186.isMultiplayer
	if L3_186 then
		L3_186 = require
		L4_187 = "currentBattle"
		L3_186 = L3_186(L4_187)
		L3_186 = L3_186.getActivePlayer
		L3_186 = L3_186()
		L0_183 = L3_186
	end
	L3_186 = L0_183.gas
	if L3_186 < 0 then
		L3_186 = 0
	end
	L4_187 = L8_8
	L4_187.maskY = 4 + L8_8.height - L8_8.height * L3_186
end
function L57_57(A0_188)
	local L1_189 = require("currentBattle").getActivePlayer()
	if not (L1_189 and L1_189.isHuman) or not tutorial.isFirstFightTutorialsComplete() then
		return
	end
	local L2_190 = os.time()
	L2_190 = L2_190 - _ENV
	if os.time() - _ENV >= 45 and p2Avatar then
		local L6_194 = L6_194
		local L7_195 = L7_195
		L6_194(L7_195, trashTalk.IDLE:random(3))
		L6_194 = os
		L6_194 = L6_194.time
		L6_194 = L6_194()
		_ENV = L6_194
	end
	L6_194 = timer
	L6_194 = L6_194.performWithDelay
	L7_195 = 5000
	L6_194(L7_195, L57_57)
	local L5_193 = L5_193
end
L58_58 = BattleControls
function L59_59(A0_196)
	local L1_197, L2_198
	L1_197 = _ENV
	L1_197 = L1_197.isHuman
	if L1_197 then
		L1_197 = _ENV
		return L1_197
	else
		L1_197 = _ENV
		L2_198 = players
		L2_198 = L2_198[1]
		if L1_197 == L2_198 then
			L1_197 = players
			L1_197 = L1_197[2]
			return L1_197
		else
			L1_197 = players
			L1_197 = L1_197[1]
			return L1_197
		end
	end
end
L58_58.getLocalPlayer = L59_59
L58_58 = BattleControls
function L59_59(A0_199, A1_200)
	local L2_201
	L2_201 = players
	L2_201 = L2_201[2]
	if A1_200 == players[2] then
		L2_201 = players[1]
	end
	p1Avatar.alpha = 1
	p2Avatar.alpha = 1
	if A1_200 == players[1] then
		p1Avatar:setActive(true)
		p2Avatar:setActive(false)
	else
		p1Avatar:setActive(false)
		p2Avatar:setActive(true)
	end
	if A1_200.isHuman then
		_ENV = A1_200
	end
	if require("currentBattle").isLocalPlayer(A1_200) and not A1_200.dead then
		L19_19 = os.time()
		timer.performWithDelay(10000, L57_57)
		if L9_9 ~= nil then
			L45_45()
		end
		BattleControls:setParachute(A1_200.hasParachute)
		BattleControls:setBattery(A1_200.hasBattery)
		if SCREENFLOW_RECORDING then
		else
			if not shotPath then
				L55_55(_ENV.power, _ENV.angle)
			end
			shotPath.isVisible = true
			shotPath.alpha = 0
			;({}).alpha = 1
			;({}).delay = 100
			;({}).transition = easing.inOutQuad
			transition.to(shotPath, {})
		end
		L7_7:removeEventListener("touch", joystickTouch)
		L7_7:addEventListener("touch", joystickTouch)
		Runtime:removeEventListener("enterFrame", updateOutputs)
		Runtime:addEventListener("enterFrame", updateOutputs)
	else
		if shotPath then
			shotPath.isVisible = false
		end
		L7_7:removeEventListener("touch", joystickTouch)
		Runtime:removeEventListener("enterFrame", updateOutputs)
		local L6_205 = L6_205
		L6_205 = BattleControls
		L6_205 = L6_205.joystickRelease
		;({}).allowStat = false
		L6_205(L6_205, {})
		local L5_204 = L5_204
	end
	L6_205 = updateOutputs
	L6_205()
end
L58_58.setPlayer = L59_59
L58_58 = BattleControls
