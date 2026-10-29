local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11 = L2_2, "battleAvatar", L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
L2_2(L3_3)
L2_2 = require
L3_3 = "trashTalk"
L2_2(L3_3)
L2_2 = require
L3_3 = "currentBattle"
L2_2 = L2_2(L3_3)
L3_3 = CUSTOM_OVERRIDES
L3_3 = L3_3.AI_DEBUG
if not L3_3 then
	L3_3 = false
end
L4_4 = L3_3
L5_5 = 0.9
L6_6 = 0.25
L7_7 = 6
L8_8 = false
L9_9 = {}
L10_10 = {}
L11_11 = {}
L11_11.player = nil
L11_11.nextAction = nil
L11_11.delay = nil
L11_11.hitLastTurn = false
L11_11.level = nil
L11_11.weaponHint = nil
L11_11.paused = false
L11_11.gearSheet = nil
L11_11.isAiTurn = false
L11_11.ABORT = false
L11_11.HUMAN_ON_LEFT = true
L11_11.trackedTimers = {}
L11_11.FUDGE = L5_5
L11_11.BASE_FUDGE = L5_5
L11_11.FUDGE_SUBTRACTION = L6_6
L11_11.BASE_FUDGE_DEGREE_WIDTH = L7_7
L11_11.FUDGE_DEGREE_WIDTH = L7_7
L11_11.testHits = {}
L11_11.closeHits = {}
L11_11.testObjects = nil
L11_11.angle = nil
local L12_12 = L12_12
;({})[1] = weaponTypes.BABY_MISSILE
;({})[2] = weaponTypes.BABY_MISSILE
;({})[3] = weaponTypes.BABY_MISSILE
;({})[4] = weaponTypes.MISSILE
;({})[5] = weaponTypes.BABY_ROLLER
;({})[6] = weaponTypes.BIG_ROLLER
;({})[7] = weaponTypes.GRENADE
;({})[8] = weaponTypes.DRILL
local L13_13 = L13_13
local L15_15 = L15_15
local L16_16 = L16_16
local L17_17 = L17_17
local L18_18 = L18_18
local L19_19 = L19_19
local L20_20 = L20_20
local L21_21 = L21_21
local L22_22 = L22_22
local L23_23 = L23_23
local L24_24 = L24_24
local L25_25 = L25_25
local L26_26 = L26_26
local L27_27 = L27_27
local L28_28 = L28_28
local L29_29 = L29_29
local L30_30 = L30_30
local L31_31 = L31_31
local L32_32 = L32_32
local L33_33 = L33_33
local L34_34 = L34_34
local L35_35 = L35_35
L15_15[1] = L16_16
L15_15[2] = L17_17
L15_15[3] = L18_18
L15_15[4] = L19_19
L15_15[5] = L20_20
L15_15[6] = L21_21
L15_15[7] = L22_22
L15_15[8] = L23_23
L15_15[9] = L24_24
L15_15[10] = L25_25
L15_15[11] = L26_26
L15_15[12] = L27_27
L15_15[13] = L28_28
L15_15[14] = L29_29
L15_15[15] = L30_30
L15_15[16] = L31_31
L15_15[17] = L32_32
L15_15[18] = L33_33
L15_15[19] = L34_34
L15_15[20] = L35_35
L15_15[21] = weaponTypes.FUNKY_BOMB
L15_15[22] = weaponTypes.FUNKY_BOMB
L15_15[23] = weaponTypes.NUKE
local L15_15[24], L36_36 = weaponTypes.DEATH_HEAD, L36_36
L16_16 = {}
L17_17 = weaponTypes
L17_17 = L17_17.BABY_SHIELD
L16_16[1] = L17_17
function L17_17(A0_37)
	return A0_37.FUDGE_DEGREE_WIDTH
end
ai_get_fudgeDegreeWidth = L17_17
function L17_17(A0_38, A1_39)
	A0_38.FUDGE_DEGREE_WIDTH = A1_39
end
ai_set_fudgeDegreeWidth = L17_17
function L17_17(A0_40)
	return A0_40.BASE_FUDGE
end
ai_get_baseFudge = L17_17
function L17_17(A0_41, A1_42)
	A0_41.BASE_FUDGE = A1_42
end
ai_set_baseFudge = L17_17
function L17_17(A0_43)
	return A0_43.FUDGE
end
ai_get_fudge = L17_17
function L17_17(A0_44, A1_45)
	A0_44.FUDGE = A1_45
end
ai_set_fudge = L17_17
function L17_17(A0_46)
	return A0_46.FUDGE_SUBTRACTION
end
ai_get_fudgeSubtraction = L17_17
function L17_17(A0_47, A1_48)
	A0_47.FUDGE_SUBTRACTION = A1_48
end
ai_set_fudgeSubtraction = L17_17
function L17_17(A0_49)
	local L1_50 = L1_50
	local L2_51 = L2_51
	local L1_50, L3_52 = L1_50(L2_51, 100), L3_52
	L1_50 = A0_49 >= L1_50
	return L1_50
end
function L18_18(A0_53)
	local L1_54, L2_55, L3_56
	L1_54 = false
	local L2_55, L11_64 = false, L11_64
	L3_56 = {}
	L11_64 = {}
	L11_64.rockFound = false
	;({}).rockFound = false
	;({}).rockFound = false
	;({}).rockFound = false
	;({}).rockFound = false
	;({}).rockFound = false
	L3_56[1] = L11_64
	L3_56[2] = {}
	L3_56[3] = {}
	L3_56[4] = {}
	L3_56[5] = {}
	L3_56[6] = {}
	L11_64 = A0_53.tank_body
	L11_64 = L11_64.localToContent
	local L5_58 = L5_58
	L11_64, L5_58 = L11_64(L5_58, 0, 0)
	local L6_59, L7_60 = L6_59, L7_60
	L6_59, L7_60 = L6_59(L7_60, 0, 0)
	L11_64 = L11_64 - A0_53.tank_body.contentBounds.xMin
	L5_58 = L5_58 - A0_53.tank_body.contentBounds.yMin
	L6_59 = A0_53.tank_body.contentBounds.xMax - L6_59
	L7_60 = A0_53.tank_body.contentBounds.yMax - L7_60
	;({}).x = A0_53.x - L11_64
	L3_56[1].p1, ({}).y = {}, A0_53.y - 10
	;({}).x = A0_53.x - L11_64
	L3_56[1].p2, ({}).y = {}, A0_53.y - 60
	;({}).x = A0_53.x
	L3_56[2].p1, ({}).y = {}, A0_53.y - 10
	;({}).x = A0_53.x
	L3_56[2].p2, ({}).y = {}, A0_53.y - 60
	;({}).x = A0_53.x + L6_59
	L3_56[3].p1, ({}).y = {}, A0_53.y - 10
	;({}).x = A0_53.x + L6_59
	L3_56[3].p2, ({}).y = {}, A0_53.y - 60
	;({}).x = A0_53.x - L11_64
	L3_56[4].p1, ({}).y = {}, A0_53.y - 80
	;({}).x = A0_53.x - L11_64
	L3_56[4].p2, ({}).y = {}, A0_53.y - 110
	;({}).x = A0_53.x
	L3_56[5].p1, ({}).y = {}, A0_53.y - 80
	;({}).x = A0_53.x
	L3_56[5].p2, ({}).y = {}, A0_53.y - 110
	;({}).x = A0_53.x + L6_59
	L3_56[6].p1, ({}).y = {}, A0_53.y - 80
	;({}).x = A0_53.x + L6_59
	L3_56[6].p2, ({}).y = {}, A0_53.y - 110
	if CUSTOM_OVERRIDES.AI_SAND_WEDGE_DEBUG then
		_FOR_ = 1
		for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
			display.newLine(A0_53.parent:localToContent(L3_56[_FORV_11_].p1.x, L3_56[_FORV_11_].p1.y)):setColor(0, 255, 0)
			table.insert(_ENV, (display.newLine(A0_53.parent:localToContent(L3_56[_FORV_11_].p1.x, L3_56[_FORV_11_].p1.y))))
		end
	end
	L12_65 = getScreenRocks
	L13_66 = rect
	L12_65 = L12_65(L13_66)
	L13_66 = pairs
	L14_67 = L12_65
	L13_66, L14_67, L15_68 = L13_66(L14_67)
	for _FORV_12_, _FORV_13_ in L13_66, L14_67, L15_68 do
		if _FORV_13_ ~= nil and _FORV_13_.objType == "rock" then
			_FOR_ = 1
			for _FORV_19_ = _FOR_, _FOR_, _FOR_ do
				local L24_77 = L24_77
				L24_77[_FORV_19_] = utils.polygonIntersectsLineSegment(_FORV_13_, L3_56[_FORV_19_], 1, false)
				if not L3_56[_FORV_19_].rockFound then
				end
				L3_56[_FORV_19_].rockFound = L24_77[_FORV_19_]
				if not false then
				end
			end
			if CUSTOM_OVERRIDES.AI_SAND_WEDGE_DEBUG and L24_77[_FORV_19_] then
				if _FORV_13_.setFillColor then
					_FORV_13_:setFillColor(255, 0, 0)
				end
				table.insert(L9_9, _FORV_13_)
			end
		end
		L24_77 = L3_56[2]
		L24_77 = L24_77.rockFound
		if L24_77 then
			L1_54 = true
		end
		L24_77 = L3_56[5]
		L24_77 = L24_77.rockFound
		if L24_77 then
			L2_55 = true
		end
		if L1_54 and L2_55 then
			break
		end
	end
	L13_66 = L1_54
	L14_67 = L2_55
	return L13_66, L14_67
end
function L19_19(A0_78, A1_79)
	local L2_80, L3_81, L4_82, L5_83, L7_84
	if A1_79 == nil then
		L2_80 = weaponTypes
		A1_79 = L2_80.BABY_MISSILE
	end
	L2_80 = false
	L3_81 = 1
	L4_82 = orderedWeaponTypes
	L4_82 = #L4_82
	L5_83 = 1
	for L7_84 = L3_81, L4_82, L5_83 do
		if orderedWeaponTypes[L7_84] == A1_79 then
			L2_80 = true
			break
		end
	end
	if not L2_80 then
		L3_81 = false
		return L3_81
	end
	L3_81 = weaponTypes
	L3_81 = L3_81[A1_79]
	L3_81 = L3_81.unlockable
	if L3_81 == nil then
		L3_81 = true
		return L3_81
	else
		L3_81 = weaponTypes
		L3_81 = L3_81[A1_79]
		L3_81 = L3_81.unlockable
		L3_81 = L3_81.unlockState
		return L3_81
	end
end
function L20_20(A0_85, A1_86)
	local L2_87, L3_88
	L3_88 = 0
	while L2_87 == nil do
		L2_87 = math.random(1, #A1_86)
		local L4_89 = L4_89
		local L5_90 = L5_90
		local L4_89, L6_91 = L4_89(L5_90, A1_86[L2_87]), L6_91
		if not L4_89 then
			L2_87 = nil
			L3_88 = L3_88 + 1
		end
		if 50 < L3_88 then
			L4_89 = nil
			return L4_89
		end
	end
	L4_89 = A1_86[L2_87]
	return L4_89
end
function L21_21(A0_92)
	if _ENV(A0_92, L14_14) == nil then
		local L2_93 = L2_93
		local L3_94 = L3_94
		do return L3_94(A0_92, L13_13) end
		local L4_95 = L4_95
	end
	return L2_93
end
function L22_22(A0_96, A1_97, A2_98)
	if A0_96.weaponHint ~= nil and _ENV(A0_96, A0_96.weaponHint) then
		return A0_96.weaponHint
	end
	if not A2_98 then
		A2_98 = 70
	end
	if A0_96.player.shotHistory and #A0_96.player.shotHistory > 1 and A1_97 and 1 > math.abs(A1_97) and L17_17(A2_98) then
		return L21_21(A0_96)
	else
		local L3_99 = L3_99
		local L4_100 = L4_100
		do return L3_99(L4_100, L13_13) end
		local L5_101 = L5_101
	end
end
function L23_23(A0_102)
	local L1_103, L2_104 = L1_103, L2_104
	local L3_105 = L3_105
	L1_103, L2_104 = L1_103(L2_104, L3_105, players[1].y)
	L3_105 = 70
	if A0_102.shouldTakeSameShot then
		local L4_106 = L4_106
		local L4_106, L5_107 = L4_106(10), L5_107
		if not L4_106 then
			L4_106 = A0_102.FUDGE
			if 0.2 < L4_106 then
				A0_102.FUDGE = 0.2
			else
				A0_102.FUDGE = 0
			end
			L3_105 = 100
		end
	end
	L4_106 = nil
	L5_107 = 500
	_FOR_, _FOR_, _FOR_ = pairs(A0_102.closeHits)
	for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
		if not _FORV_10_.distance then
			_FORV_10_.distance = utils.distanceBetweenPoints(L1_103, L2_104, _FORV_10_.x, _FORV_10_.y)
		end
		if L5_107 > _FORV_10_.distance then
			L4_106 = _FORV_10_.shot
			L5_107 = _FORV_10_.distance
			if _FORV_10_.distance < 16 then
				_FORV_10_:setFillColor(0, 0, 255)
				L12_12("Found an angle that will come really close to player")
				A0_102.ABORT = true
				break
			end
		end
	end
	L13_115 = A0_102.ABORT
	if L13_115 then
		if not L4_106 then
			L13_115 = {}
			L14_116 = math
			L14_116 = L14_116.random
			L15_117 = -90
			L14_116 = L14_116(L15_117, 0)
			L13_115.angle = L14_116
			L4_106 = L13_115
			L13_115 = L12_12
			L14_116 = "No 'closest shot' detected...firing wildly. Why did this happen?"
			L13_115(L14_116)
		end
		L13_115 = A0_102.player
		L14_116 = L13_115
		L13_115 = L13_115.fire
		L15_117 = {}
		L15_117.weaponType = L22_22(A0_102, fudge, L3_105)
		L15_117.angle = L4_106.angle + A0_102.player.rotation
		L15_117.useFudge = true
		L13_115(L14_116, L15_117)
		L13_115 = timer
		L13_115 = L13_115.cancel
		L14_116 = A0_102.trackedTimers
		L14_116 = L14_116.abortTimer
		L13_115(L14_116)
		L13_115 = {}
		A0_102.closeHits = L13_115
		L13_115 = display
		L13_115 = L13_115.remove
		L14_116 = A0_102.testObjects
		L13_115(L14_116)
		A0_102.testObjects = nil
		return
	end
	L13_115 = A0_102.HUMAN_ON_LEFT
	if L13_115 then
		L13_115 = A0_102.angle
		L13_115 = L13_115 - 0.5
		A0_102.angle = L13_115
	else
		L13_115 = A0_102.angle
		L13_115 = L13_115 + 0.5
		A0_102.angle = L13_115
	end
	L13_115 = A0_102.trackedTimers
	L14_116 = timer
	L14_116 = L14_116.performWithDelay
	L15_117 = 1
	L14_116 = L14_116(L15_117, function(A0_118)
		if _ENV.player then
			local L2_119 = L2_119
			local L3_120 = L3_120
			L2_119(L3_120, _ENV.player.power, _ENV.angle)
			local L4_121 = L4_121
		end
	end)
	L13_115.testPathTimer = L14_116
end
function L24_24(A0_122)
	local L1_123
	L1_123 = {}
	_FOR_, _FOR_, _FOR_ = pairs(A0_122.testHits)
	for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
		if not L1_123[_FORV_6_.shot] then
			L1_123[_FORV_6_.shot] = _FORV_6_
		end
		if L1_123[_FORV_6_.shot].time > _FORV_6_.time then
			L1_123[_FORV_6_.shot] = _FORV_6_
		end
	end
	_FOR_, _FOR_, _FOR_ = pairs(L1_123)
	for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_6_.setFillColor then
			_FORV_6_:setFillColor(0, 255, 0)
		end
		table.insert(A0_122.closeHits, _FORV_6_)
	end
	L3_125 = pcall
	function L10_132()
		_ENV(A0_122)
		local L1_134 = L1_134
	end
	L3_125, L10_132 = L3_125(L10_132)
	if not L3_125 then
		L11_133 = print
		L9_131 = "AI Failed (probably exploded while thinking)"
		L11_133(L9_131, L10_132)
	end
end
function L25_25(A0_135, A1_136)
	local L2_137
	L2_137 = A1_136.other
	L2_137 = L2_137.objType
	if L2_137 ~= "rock" then
		return
	end
	L2_137 = A0_135.AI
	if not L2_137.testObjects then
		L2_137.testObjects = display.newGroup()
	end
	local L3_138, L4_139 = L3_138, L4_139
	L3_138, L4_139 = L3_138(L4_139, A1_136.other.x, A1_136.other.y)
	local L5_140 = L5_140
	L5_140 = L5_140(L2_137.testObjects, L3_138, L4_139, 5)
	L5_140:setFillColor(255, 0, 0)
	local L10_145 = L10_145
	L10_145 = A0_135.time
	L5_140.time = L10_145
	L10_145 = A0_135.shot
	L5_140.shot = L10_145
	L10_145 = _ENV
	L5_140.isVisible = L10_145
	L10_145 = table
	L10_145 = L10_145.insert
	local L7_142 = L7_142
	L10_145(L7_142, L5_140)
	L10_145 = A0_135.group
	L7_142 = L2_137.trackedTimers
	local L8_143 = L8_143
	local L9_144 = L9_144
	L8_143 = L8_143(L9_144, function(A0_146)
		if _ENV.parent then
			display.remove(_ENV)
			L24_24(L2_137)
			local L2_147 = L2_147
		end
	end)
	L7_142.pathCollisionTimer = L8_143
	L7_142 = L2_137.trackedTimers
	L7_142 = L7_142.pathCollisionTimer
	L8_143 = {}
	L8_143.AI = L2_137
	L7_142.params = L8_143
end
function L26_26(A0_148, A1_149, A2_150)
	local L7_155, L11_159, L12_160, L13_161, L14_162, L15_163, L16_164 = display.newGroup, L11_159, L12_160, L13_161, L14_162, L15_163, L16_164
	L7_155 = L7_155()
	L11_159 = {}
	L7_155.circles = L11_159
	L11_159 = levelGroup
	L12_160 = L11_159
	L11_159 = L11_159.insert
	L13_161 = L7_155
	L11_159(L12_160, L13_161)
	L11_159 = {}
	L11_159.power = A1_149
	L11_159.angle = A2_150
	A1_149 = A1_149 * 0.812
	L12_160 = A0_148.player
	L12_160 = L12_160.rotation
	A2_150 = A2_150 + L12_160
	L12_160 = A0_148.player
	L13_161 = L12_160
	L12_160 = L12_160.whereMyCannonBeAt
	L12_160, L13_161 = L12_160(L13_161)
	L14_162 = math
	L14_162 = L14_162.pi
	L14_162 = A2_150 * L14_162
	L14_162 = L14_162 / 180
	L15_163 = math
	L15_163 = L15_163.cos
	L16_164 = L14_162
	L15_163 = L15_163(L16_164)
	L15_163 = L15_163 * A1_149
	L16_164 = math
	L16_164 = L16_164.sin
	L16_164 = L16_164(L14_162)
	L16_164 = L16_164 * A1_149
	_FOR_ = 0.5
	for _FORV_16_ = _FOR_, _FOR_, _FOR_ do
		stepX = L16_164 * _FORV_16_
		stepY = L15_163 * _FORV_16_ - 5 * _FORV_16_ * _FORV_16_
		local L17_165 = L17_165
		if L17_165 % 2 == 1 then
			display.newCircle(0, 0, 2).x = -4
			display.newCircle(0, 0, 2).y = -4
		else
			display.newCircle(0, 0, 2).x = -2
			display.newCircle(0, 0, 2).y = -2
		end
		display.newCircle(0, 0, 2).time = _FORV_16_
		;({}).isSensor = true
		physics.addBody(display.newCircle(0, 0, 2), {})
		display.newCircle(0, 0, 2).AI = A0_148
		display.newCircle(0, 0, 2).collision = _ENV
		display.newCircle(0, 0, 2):addEventListener("collision", (display.newCircle(0, 0, 2)))
		display.newCircle(0, 0, 2):scale(2, 2)
		L7_155:insert((display.newCircle(0, 0, 2)))
		L7_155.circles[L17_165] = display.newCircle(0, 0, 2)
		display.newCircle(0, 0, 2).x = stepX + L12_160
		display.newCircle(0, 0, 2).y = L13_161 - stepY
		display.newCircle(0, 0, 2).power = A1_149
		display.newCircle(0, 0, 2).shot = L11_159
		display.newCircle(0, 0, 2).hits = hits
		display.newCircle(0, 0, 2).group = L7_155
		display.newCircle(0, 0, 2).isVisible = L1_1
		local L18_166 = L18_166
		if L18_166 > display.newCircle(0, 0, 2).x or 1800 < display.newCircle(0, 0, 2).x then
			A0_148.ABORT = true
			local L19_167 = L19_167
			L12_12("ABORT - reached edge of level map", display.newCircle(0, 0, 2).x, L18_166, L19_167)
			repeat
				do return end
				break -- pseudo-goto
			until true
		end
		L17_165 = L17_165 + 1
	end
end
testPath = L26_26
function L26_26(A0_172)
	local L2_173 = L2_173
	L2_173(p2Avatar, A0_172)
	local L3_174 = L3_174
end
function L27_27(A0_175, A1_176)
	local L2_177, L3_178, L4_179
	L2_177 = A1_176.AI
	if not L2_177 then
		return
	end
	L2_177.hitLastTurn = true
	L3_178 = L2_177.player
	if A1_176 ~= L3_178 then
		L3_178 = currentShot
		if L3_178 ~= nil then
			L3_178 = currentShot
			L3_178.hit = true
			L3_178 = currentShot
			L4_179 = currentShot
			L4_179 = L4_179.damage
			L4_179 = L4_179 + A0_175
			L3_178.damage = L4_179
		end
	end
end
ai_tank_damage = L27_27
function L27_27(A0_180, A1_181)
	local L3_183, L4_184, L7_187 = _ENV.isGameOver, L4_184, L7_187
	L3_183 = L3_183()
	if not L3_183 then
		L3_183 = A1_181.shotData
		if L3_183 and A0_180 then
			L3_183 = A0_180.player
			if L3_183 then
				goto lbl_15
			end
		end
	end
	do return end
	::lbl_15::
	L3_183 = A1_181.shotData
	L4_184 = L3_183.tankPositions
	L7_187 = player
	L4_184 = L4_184[L7_187]
	L7_187 = L4_184.distanceFromTarget
	if not (512 < L7_187) then
		L7_187 = L3_183.outOfBounds
		if not L7_187 then
			goto lbl_49
		end
	end
	L7_187 = L8_8
	if not L7_187 then
		L7_187 = A0_180.isAiTurn
		if not L7_187 then
			L7_187 = A0_180.trackedTimers
			L7_187.aiTalkTimer = timer.performWithDelay(500, function()
				local L0_188
				L0_188 = _ENV
				local L1_189, L2_190 = trashTalk.MISSED_SHOT:random()
				L0_188(L1_189, L2_190)
			end)
		else
			L7_187 = A0_180.trackedTimers
			local L6_186 = L6_186
			L6_186 = L6_186(500, function()
				local L0_191, L1_192
				L0_191 = battleAvatar
				L0_191 = L0_191.voiceQueue
				L1_192 = p1Avatar
				local L2_193, L3_194 = trashTalk.MISSED_SHOT:random()
				L0_191(L1_192, L2_193, L3_194)
			end)
			L7_187.aiTalkTimer = L6_186
		end
		L7_187 = true
		L8_8 = L7_187
	end
	::lbl_49::
end
ai_weapon_update = L27_27
function L27_27(A0_195)
	local L1_196
	L1_196 = A0_195.player
	L1_196 = L1_196.gas
	L1_196 = 0 < L1_196
	return L1_196
end
function L28_28(A0_197)
	if A0_197 and A0_197.bubbleGroup then
		local L3_200 = L3_200
		L3_200(Runtime, "enterFrame", A0_197.bubbleGroup.enterFrame)
		local L4_201 = L4_201
		L3_200 = display
		L3_200 = L3_200.remove
		L4_201 = A0_197.bubbleGroup
		L3_200(L4_201)
		A0_197.bubbleGroup = nil
	end
end
function L29_29(A0_202, A1_203)
	local L2_204 = L2_204
	L2_204 = L2_204(_ENV)
	A1_203.AI = L2_204
	L2_204.player = A1_203
	L2_204.player.gas = players[1].gas
	if L27_27(L2_204) then
		L12_12("canDrive!")
	else
		L12_12("can't Drive!")
	end
	L2_204.trackedTimers = {}
	L2_204.level = A0_202
	L2_204.FUDGE_DEGREE_WIDTH = L7_7
	L2_204.hitLastTurn = false
	L2_204.isAiTurn = false
	L2_204.paused = false
	local L3_205 = L3_205
	L3_205(L2_204.player, -45)
	L3_205 = L2_204.player
	L3_205 = L3_205.fire
	function L2_204.player.fire(A0_208, A1_209)
		local L2_210, L3_211, L4_212, L5_213
		L2_210 = A0_208.AI
		L3_211 = A1_209.weaponType
		L4_212 = A1_209.useFudge
		if not L4_212 then
			L4_212 = true
		end
		L5_213 = A1_209.angle
		_ENV(L2_210)
		if player and player.preAIFire then
			player:preAIFire()
		end
		if L4_212 then
			if ARCADE_MODE then
			end
			L5_213 = L5_213 + (math.random(0, L2_210.FUDGE_DEGREE_WIDTH * 10) / 10 - L2_210.FUDGE_DEGREE_WIDTH / 2) * L2_210.FUDGE * 1.5
		end
		local L6_214 = L6_214
		L6_214(A0_208, L5_213)
		L6_214 = A0_208.weaponType
		A0_208.weaponType = L3_211
		Weapon.loadWeapon(A0_208.weaponType)
		L3_205(A0_208)
		if player and player.postAIFire then
			player:postAIFire()
			local L7_215, L8_216 = L7_215, L8_216
		end
	end
	local L4_206 = L4_206
	local L4_206, L5_207 = L4_206("res/controls/gears.png"), L5_207
	L2_204.gearSheet = L4_206
end
ai_init = L29_29
function L29_29(A0_217)
	local L4_221, L1_218 = "ai_destroy", L1_218
	L1_218(L4_221)
	L1_218 = A0_217.AI
	A0_217.AI = nil
	L4_221 = L28_28
	L5_222 = L1_218
	L4_221(L5_222)
	L1_218.gearSheet = nil
	L1_218.hitLastTurn = false
	L1_218.level = nil
	L1_218.nextAction = nil
	L4_221 = pairs
	L5_222 = L1_218.trackedTimers
	L4_221, L5_222, L6_223 = L4_221(L5_222)
	for _FORV_5_, _FORV_6_ in L4_221, L5_222, L6_223 do
		if _FORV_6_ then
			timer.cancel(_FORV_6_)
		end
		L1_218.trackedTimers[_FORV_5_] = nil
	end
end
ai_destroy = L29_29
function L29_29()
	local L0_226, L1_227
	_ENV = L0_226
	L0_226 = nil
	L10_10 = L0_226
end
ai_destroyLocals = L29_29
function L29_29()
	local L0_228, L1_229
	L0_228 = players
	L0_228 = L0_228[1]
	L0_228 = L0_228.x
	L1_229 = players
	L1_229 = L1_229[1]
	L1_229 = L1_229.y
	return L0_228, L1_229
end
function L30_30(A0_230, A1_231)
	local L3_233, L5_235, L6_236 = L3_233, L5_235, L6_236
	if A0_230.player == nil then
		return
	end
	L3_233 = physics
	L3_233 = L3_233.getGravity
	L3_233, L5_235 = L3_233()
	L6_236 = _ENV
	L6_236 = L6_236()
	if L6_236 == nil or L6_236() == nil then
		return 0
	end
	L6_236 = L6_236 - A0_230.player.x
	L6_236 = -L6_236
	L5_235 = -L5_235
	local L7_237 = L7_237
	local L10_240 = L10_240
	local L9_239 = L9_239
	L9_239 = math.atan((L10_240 * L10_240 + math.sqrt(A1_231 * A1_231 * A1_231 * A1_231 - L5_235 * (L5_235 * L6_236 * L6_236 + 2 * L7_237 * A1_231 * A1_231))) / (L5_235 * L6_236))
	L9_239 = L9_239 * 180 / math.pi
	return L9_239
end
function L31_31(A0_241)
	local L1_242, L2_243
	L1_242 = A0_241.player
	local L1_242, L5_246, L6_247 = L1_242.shotHistory, L5_246, L6_247
	L2_243 = #L1_242
	if L2_243 == 0 then
		L5_246 = _ENV
		L6_247 = "shouldTakeSameShot - this is first shot - false"
		L5_246(L6_247)
		L5_246 = false
		return L5_246
	end
	L5_246 = players
	L5_246 = L5_246[1]
	L5_246 = L5_246.x
	L6_247 = players
	L6_247 = L6_247[1]
	L6_247 = L6_247.y
	if L1_242[L2_243].tankPositions[player].distanceFromTarget ~= nil and L1_242[L2_243].tankPositions[player].distanceFromTarget < 384 or L1_242[L2_243].tankPositions[player].hit then
		if L1_242[L2_243].humanPos and utils.distanceBetweenPoints(L5_246, L6_247, L1_242[L2_243].tankPositions[player].x, L1_242[L2_243].tankPositions[player].y) > 64 then
			_ENV("shouldTakeSameShot - player moved, recalc")
			return false
		end
		if L1_242[L2_243].aiPos then
			local L9_250 = L9_250
			local L10_251 = L10_251
			local L11_252 = utils.distanceBetweenPoints(A0_241.player.x, A0_241.player.y, L1_242[L2_243].tankPositions[A0_241.player].x, L1_242[L2_243].tankPositions[A0_241.player].y)
			if 64 < L11_252 then
				L11_252 = _ENV
				L11_252("shouldTakeSameShot - ai moved, re-calc")
				L11_252 = false
				return L11_252
			end
		end
		L11_252 = _ENV
		L11_252("shouldTakeSameShot - true")
		L11_252 = true
		return L11_252
	end
	L11_252 = _ENV
	L11_252("shouldTakeSameShot - last shot too far away")
	L11_252 = false
	return L11_252
end
function L32_32(A0_253)
	local L1_254, L2_255
	if true then
		if A0_253 then
			L1_254 = A0_253.player
			if L1_254 then
				goto lbl_7
			end
		end
		do return end
		::lbl_7::
		L1_254 = false
		L2_255 = false
		if _ENV(A0_253, weaponTypes.DRILL) or _ENV(A0_253, weaponTypes.SAND_WEDGE) then
			L1_254, L2_255 = L18_18(A0_253.player)
			L12_12("aiIsBuried, aiIsVeryBuried", L1_254, L2_255, A0_253.player.rotation)
		end
		if (L1_254 or L2_255) and A0_253.player.rotation >= -95 and A0_253.player.rotation <= 95 then
			local L3_256 = L3_256
			L3_256("trying to sand-wedge/drill the heck outta here")
			local L4_257 = L4_257
			L3_256 = 0
			L4_257 = Tank
			L4_257 = L4_257.MIN_POWER
			if L2_255 then
				if L1_254 then
					L4_257 = Tank.MIN_POWER + 30
				else
					L4_257 = Tank.MIN_POWER + 100
					L3_256 = -A0_253.player.rotation
				end
			end
			if _ENV(A0_253, weaponTypes.SAND_WEDGE) then
				A0_253.weaponHint = weaponTypes.SAND_WEDGE
			else
				A0_253.weaponHint = weaponTypes.DRILL
			end
			A0_253.player:adjustToPower(L4_257)
			local L5_258 = L5_258
			;({}).weaponType = A0_253.weaponHint
			;({}).useFudge = false
			;({}).angle = L3_256
			L5_258(A0_253.player, {})
		end
	else
		L3_256 = 150
		L4_257 = 200
		L5_258 = A0_253.player
		L5_258 = L5_258.shotHistory
		if L5_258 and 0 < #L5_258 then
			if L5_258[#L5_258].tankPositions[player] and L5_258[#L5_258].tankPositions[A0_253.player] then
				local L15_268 = L15_268
			end
			if 100 < math.abs(utils.distanceBetweenPoints(player.x, player.y, A0_253.player.x, A0_253.player.y) - utils.distanceBetweenPoints(L5_258[#L5_258].tankPositions[player].x, L5_258[#L5_258].tankPositions[player].y, L5_258[#L5_258].tankPositions[A0_253.player].x, L5_258[#L5_258].tankPositions[A0_253.player].y)) then
				A0_253.FUDGE = L5_5
			else
				if not (0 < A0_253.FUDGE) then
					goto lbl_181
				end
				A0_253.FUDGE = A0_253.FUDGE - A0_253.FUDGE_SUBTRACTION
				_FOR_ = -1
				for _FORV_15_ = _FOR_, _FOR_, _FOR_ do
					local L16_269 = L16_269
					if L5_258[_FORV_15_].hitX ~= nil then
						break
					end
				end
				if not (L5_258[_FORV_15_] and L5_258[_FORV_15_].power) then
					goto lbl_181
				end
				repeat
					if L5_258[_FORV_15_].hitX > player.x then
						L3_256 = L5_258[_FORV_15_].power
						break -- pseudo-goto
					end
					L4_257 = L5_258[_FORV_15_].power
					do break end -- pseudo-goto
					L15_268 = A0_253.BASE_FUDGE
					A0_253.FUDGE = L15_268
				until true
			end
		end
		::lbl_181::
		L15_268 = math
		L15_268 = L15_268.random
		L16_269 = L3_256
		L15_268 = L15_268(L16_269, L4_257)
		A0_253.ABORT = false
		L16_269 = A0_253.trackedTimers
		L16_269.abortTimer = timer.performWithDelay(10000, function(A0_270)
			local L1_271
			L1_271 = _ENV
			L1_271.ABORT = true
		end)
		L16_269 = L30_30
		L16_269 = L16_269(A0_253.player, L15_268)
		A0_253.player:adjustToPower(L15_268)
		A0_253.closeHits = {}
		A0_253.testHits = {}
		if A0_253.HUMAN_ON_LEFT then
			A0_253.angle = -5 - A0_253.player.rotation
		else
			A0_253.angle = 5 - A0_253.player.rotation
		end
		local L8_261 = L8_261
		local L9_262 = L9_262
		local L10_263 = L10_263
		L8_261(L9_262, L10_263, A0_253.angle)
		local L11_264 = L11_264
	end
end
function L33_33(A0_272)
	local L2_274 = A0_272.gearSheet.getSpriteSet
	L2_274 = L2_274()
	local L3_275 = L3_275
	local L4_276 = L4_276
	L4_276:insert((utils.newButton(L2_274, L3_275, "bubble03.png")))
	local L5_277 = L5_277
	L4_276:insert((utils.newButton(L2_274, L3_275, "bubble02.png")))
	utils.newButton(L2_274, L3_275, "bubble02.png").x = -L5_277.width / 2 - 10
	utils.newButton(L2_274, L3_275, "bubble02.png").y = 20
	local L6_278 = L6_278
	L4_276:insert((utils.newButton(L2_274, L3_275, "bubble01.png")))
	utils.newButton(L2_274, L3_275, "bubble01.png").x = L6_278.x - 15
	utils.newButton(L2_274, L3_275, "bubble01.png").y = L6_278.y + 20
	A0_272.bubbleGroup = L4_276
	A0_272.player.parent:insert(L4_276)
	sprite.add(L2_274, "think", 4, 8, 500, 0)
	local L7_279 = L7_279
	L4_276:insert((sprite.newSprite(L2_274)))
	sprite.newSprite(L2_274):prepare("think")
	sprite.newSprite(L2_274):play()
	if CUSTOM_OVERRIDES.AI_SAND_WEDGE_DEBUG then
		_FOR_ = -1
		for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
			if _ENV[_FORV_11_].setFillColor then
				local L15_287 = L15_287
				_ENV[_FORV_11_]:setFillColor(255, 255, 255)
			end
			table.remove(_ENV, _FORV_11_)
		end
		L16_288 = L10_10
		L16_288 = #L16_288
		_FOR_ = -1
		for _FORV_11_ = L16_288, _FOR_, _FOR_ do
			display.remove(L10_10[_FORV_11_])
			table.remove(L10_10, _FORV_11_)
		end
	end
	L16_288 = A0_272.player
	L16_288 = L16_288.y
	L14_286 = A0_272.player
	L14_286 = L14_286.height
	L14_286 = 2 * L14_286
	L14_286 = L14_286 / 3
	L16_288 = L16_288 - L14_286
	L4_276.y = L16_288
	L16_288 = A0_272.player
	L16_288 = L16_288.x
	L16_288 = L16_288 + 100
	L4_276.x = L16_288
	function L16_288(A0_289)
		if not _ENV.player then
			local L1_290, L2_291 = L1_290, L2_291
			local L3_292 = L3_292
			L1_290(L2_291, L3_292, L4_276.enterFrame)
			local L4_293 = L4_293
			return
		end
		L1_290 = L4_276
		L2_291 = _ENV
		L2_291 = L2_291.player
		L2_291 = L2_291.y
		L3_292 = _ENV
		L3_292 = L3_292.player
		L3_292 = L3_292.height
		L3_292 = 2 * L3_292
		L3_292 = L3_292 / 3
		L2_291 = L2_291 - L3_292
		L1_290.y = L2_291
		L1_290 = L4_276
		L2_291 = _ENV
		L2_291 = L2_291.player
		L2_291 = L2_291.x
		L2_291 = L2_291 + 100
		L1_290.x = L2_291
	end
	L4_276.enterFrame = L16_288
	L16_288 = Runtime
	L14_286 = L16_288
	L16_288 = L16_288.addEventListener
	L16_288(L14_286, "enterFrame", L4_276.enterFrame)
	L16_288 = L32_32
	L14_286 = A0_272
	L16_288(L14_286)
	A0_272.nextAction = nil
	A0_272.delay = nil
end
function L34_34(A0_294)
	local L1_295 = L1_295
	L1_295 = L1_295(3000, 5000)
	A0_294.delay = L1_295
	L1_295 = 66
	local L2_296 = L2_296
	local L3_297 = L3_297
	L2_296 = L2_296(L3_297, 25)
	L2_296 = L2_296 + 50
	L3_297 = player
	L3_297 = L3_297.shotHistory
	L3_297 = L3_297[#player.shotHistory]
	if L3_297 and L3_297.tankPositions and L3_297.tankPositions[A0_294.player] then
		if not L3_297.tankPositions[A0_294.player].distanceFromTarget or L3_297.tankPositions[A0_294.player].distanceFromTarget > 512 then
			_ENV("driving alot")
		elseif 512 < 64 then
			_ENV("driving not so much")
		end
		L2_296 = L2_296 + math.random() * (64 / 256) * 25
		if not L3_297.toTheLeft then
			L2_296 = -L2_296
		elseif A0_294.player.x > 700 then
			L2_296 = -L2_296
			_ENV("we're near the right side edege")
			local L8_302 = L8_302
		end
	end
	if 0 < L2_296 then
		L8_302 = L26_26
		L8_302(trashTalk.MOVING_BACKWARD:random())
	else
		L8_302 = L26_26
		L8_302(trashTalk.MOVING_FORWARD:random())
	end
	L2_296 = L2_296 / 100
	L8_302 = math
	L8_302 = L8_302.floor
	L8_302 = L8_302(A0_294.delay / L1_295)
	local L9_303 = L9_303
	L9_303.driveTimer = timer.performWithDelay(L1_295, function(A0_304)
		if _ENV.player then
			if A0_304.count >= L4_298 then
				_ENV.player:stopDriving()
			else
				local L2_305 = L2_305
				L2_305(_ENV.player, L2_296)
				local L3_306 = L3_306
			end
		end
	end, L8_302)
	L9_303 = L17_17
	L9_303 = L9_303(20)
	if L9_303 then
		L9_303 = L20_20
		L9_303 = L9_303(A0_294, L16_16)
		A0_294.weaponHint = L9_303
		L9_303 = _ENV
		L9_303("deploying shield")
		local L6_300 = L6_300
	end
	function L9_303()
		_ENV(A0_294)
		local L1_307 = L1_307
	end
	A0_294.nextAction = L9_303
	L9_303 = A0_294.delay
	L9_303 = L9_303 + 2000
	A0_294.delay = L9_303
end
function L35_35(A0_308)
	local L2_310 = _ENV.isGameOver
	L2_310 = L2_310()
	if L2_310 then
		return
	end
	L2_310 = false
	if player.shotHistory and #player.shotHistory > 0 and player.shotHistory[#player.shotHistory].tankPositions[A0_308.player] and player.shotHistory[#player.shotHistory].tankPositions[A0_308.player].distanceFromTarget and player.shotHistory[#player.shotHistory].tankPositions[A0_308.player].distanceFromTarget < 256 then
		L2_310 = true
	end
	if A0_308.hitLastTurn or A0_308.wasLastShotClose then
		local L3_311 = L3_311
		if L27_27(A0_308) then
			function A0_308.nextAction()
				_ENV(A0_308)
				local L1_315 = L1_315
			end
			A0_308.delay = 20
	end
	else
		if not A0_308.player.shotHistory or #A0_308.player.shotHistory == 0 and L17_17(20) and L19_19(A0_308, weaponTypes.SMOKE_TRACER) then
			A0_308.weaponHint = weaponTypes.SMOKE_TRACER
		end
		function A0_308.nextAction()
			_ENV(A0_308)
			local L1_316 = L1_316
		end
		local L4_312 = L4_312
		local L5_313 = L5_313
		local L5_313, L6_314 = L5_313(1000, 2000), L6_314
		A0_308.delay = L5_313
	end
	A0_308.hitLastTurn = false
end
function L36_36(A0_317)
	repeat
		_ENV("runAction()")
		if not (A0_317 and not A0_317.paused and not L0_0.isGameOver() and A0_317.player) or A0_317.player.health <= 0 then
			_ENV("runAction - aborting")
			return
		end
		resetIdle(A0_317)
		local L1_318 = L1_318
		local L1_318, L2_319 = L1_318(A0_317.nextAction)
		if not L1_318 then
			print("AI Failed nextAction call (probably exploded while thinking)", L2_319)
		end
		if A0_317.player == nil then
			return
		end
		if A0_317.nextAction ~= nil then
			local L3_320 = L3_320
			L3_320("runAction waiting for: " .. A0_317.delay)
			L3_320 = A0_317.trackedTimers
			L3_320.aiTimer = timer.performWithDelay(A0_317.delay, function()
				_ENV(A0_317)
				local L1_325 = L1_325
			end)
			break -- pseudo-goto
		end
		L3_320 = ARCADE_MODE
		if L3_320 then
			L3_320 = A0_317.trackedTimers
			local L4_321 = L4_321
			local L6_323 = L6_323
			local L6_323, L7_324 = L6_323(2000, 3000), L7_324
			function L7_324()
				ai_turn(_ENV)
				local L1_326 = L1_326
			end
			L4_321 = L4_321(L6_323, L7_324)
			L3_320.aiTimer = L4_321
		end
	until true
end
function ai_pause(A0_327)
	_ENV("ai_pause()")
	local L2_328 = L2_328
	if not A0_327 then
		return
	end
	A0_327.paused = true
end
function ai_resume(A0_329)
	local L4_333 = L4_333
	if not A0_329 then
		return
	end
	A0_329.paused = false
	L4_333 = _ENV
	L4_333("ai_resume()")
	L4_333 = A0_329.isAiTurn
	if L4_333 then
		L4_333 = A0_329.nextAction
		if L4_333 then
			L4_333 = L0_0
			L4_333 = L4_333.isGameOver
			L4_333 = L4_333()
			if not L4_333 then
				L4_333 = _ENV
				L4_333("nextAction != nil")
				L4_333 = A0_329.trackedTimers
				local L2_331 = L2_331
				local L3_332 = L3_332
				L2_331 = L2_331(L3_332, function()
					_ENV(A0_329)
					local L1_334 = L1_334
				end)
				L4_333.aiTimer = L2_331
			end
		end
	end
end
function ai_player_turn(A0_335)
	local L1_336
	if A0_335 then
		A0_335.isAiTurn = false
	end
end
function ai_turn(A0_337)
	collectgarbage()
	local L4_341 = L4_341
	if not A0_337 then
		return
	end
	L4_341 = false
	_ENV = L4_341
	L4_341 = L12_12
	L4_341("ai_turn()")
	L4_341 = A0_337.isAiTurn
	if L4_341 then
		L4_341 = L12_12
		L4_341("ai_turn() was called twice and shouldn't have been. How?")
	end
	L4_341 = L0_0
	L4_341 = L4_341.isGameOver
	L4_341 = L4_341()
	if not L4_341 then
		L4_341 = A0_337.player
		if L4_341 then
			L4_341 = A0_337.player
			L4_341 = L4_341.dead
			if not L4_341 then
				goto lbl_33
			end
		end
	end
	L4_341 = L12_12
	L4_341("ai_turn aborting, isGame")
	do return end
	::lbl_33::
	A0_337.isAiTurn = true
	A0_337.weaponHint = nil
	L4_341 = L31_31
	L4_341 = L4_341(A0_337)
	A0_337.shouldTakeSameShot = L4_341
	L4_341 = player
	if L4_341 then
		L4_341 = player
		L4_341 = L4_341.x
		if L4_341 then
			L4_341 = A0_337.player
			L4_341 = L4_341.x
			if L4_341 then
				L4_341 = player
				L4_341 = L4_341.x
				if L4_341 < A0_337.player.x then
					A0_337.HUMAN_ON_LEFT = true
				else
					A0_337.HUMAN_ON_LEFT = false
				end
			end
		end
	end
	L4_341 = L0_0
	L4_341 = L4_341.beginTurn
	L4_341()
	L4_341 = L35_35
	L4_341(A0_337)
	L4_341 = A0_337.trackedTimers
	local L2_339 = L2_339
	local L3_340 = L3_340
	L2_339 = L2_339(L3_340, function()
		_ENV(A0_337)
		local L1_342 = L1_342
	end)
	L4_341.aiTimer = L2_339
end
