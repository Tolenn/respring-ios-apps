local L0_0, L1_1
function L0_0(A0_16)
	local L1_17
	L1_17 = {}
	L4_20 = A0_16.name
	L1_17.name = L4_20
	L4_20 = A0_16.avatar
	if not L4_20 then
		L4_20 = "talkAnimation"
	end
	A0_16.avatar = L4_20
	L4_20 = A0_16.audienceSound
	if not L4_20 then
		L4_20 = "audienceHooray"
	end
	A0_16.audienceSound = L4_20
	L4_20 = A0_16.isBonusAvailable
	if not L4_20 then
		function L4_20()
			local L1_21
			L1_21 = true
			return L1_21
		end
	end
	A0_16.isBonusAvailable = L4_20
	L4_20 = A0_16.active
	if not L4_20 then
		L4_20 = false
	end
	A0_16.active = L4_20
	L4_20 = A0_16.apply
	if not L4_20 then
		L4_20 = nil
	end
	A0_16.apply = L4_20
	L4_20 = A0_16.alertMsgParams
	if not L4_20 then
		L4_20 = nil
	end
	A0_16.alertMsgParams = L4_20
	L4_20 = A0_16.spriteSheet
	if not L4_20 then
		L4_20 = "res/wheel/modes.png"
	end
	A0_16.spriteSheet = L4_20
	L4_20 = pairs
	L4_20, L3_19, _FOR_ = L4_20(A0_16)
	for _FORV_5_, _FORV_6_ in L4_20, L3_19, _FOR_ do
		L1_17[_FORV_5_] = _FORV_6_
	end
	return L1_17
end
L1_1 = {}
local L2_2 = L2_2
local L6_6 = L6_6
local L7_7 = L7_7
local L8_8 = L8_8
local L9_9 = L9_9
local L10_10 = L10_10
local L11_11 = L11_11
local L12_12 = L12_12
local L13_13 = L13_13
local L14_14 = L14_14
L1_1[1] = L2_2
L1_1[2] = L6_6
L1_1[3] = L7_7
L1_1[4] = L8_8
L1_1[5] = L9_9
L1_1[6] = L10_10
L1_1[7] = L11_11
L1_1[8] = L12_12
L1_1[9] = L13_13
L1_1[10] = L14_14
L1_1[11] = "babyMisslesOnlyForPlayer"
L1_1[12] = "swapTankPositions"
L1_1[13] = "bonus500Warbux"
local L1_1[14], L15_15 = "bonus1000Warbux", L15_15
L2_2 = {}
L6_6 = L0_0
L7_7 = {}
L7_7.name = "2X Points"
L7_7.avatar = "laughAnimation"
L7_7.symbol = "2xpoints.png"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "2X warbux!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/chime.mp3"
L6_6 = L6_6(L7_7)
L2_2.points2x = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "4X Points"
L7_7.avatar = "laughAnimation"
L7_7.symbol = "4xpoints.png"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "4X warbux!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/chime.mp3"
L6_6 = L6_6(L7_7)
L2_2.points4x = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "No Driving"
L7_7.avatar = "angerAnimation"
L7_7.symbol = "nodriving.png"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "No driving for you!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/buzzer.mp3"
L7_7.audienceSound = "audienceShock"
L6_6 = L6_6(L7_7)
L2_2.noDriving = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "No Shields"
L7_7.avatar = "angerAnimation"
L7_7.symbol = "noshields.png"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "No shields allowed!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/buzzer.mp3"
L7_7.audienceSound = "audienceShock"
function L8_8()
	if not Weapon.isUnlocked(weaponTypes.BABY_SHIELD) then
		local L0_22 = L0_22
		local L0_22, L1_23 = L0_22(weaponTypes.BIG_SHIELD), L1_23
	end
	return L0_22
end
L7_7.isBonusAvailable = L8_8
function L8_8(A0_24)
	if players[1].weaponType == weaponTypes.BABY_SHIELD or players[1].weaponType == weaponTypes.BIG_SHIELD then
		players[1].weaponType = weaponTypes.BABY_MISSILE
		Weapon.loadWeapon(players[1].weaponType)
		BattleControls:updateWeapon()
		local L1_25, L2_26 = L1_25, L2_26
	end
end
L7_7.apply = L8_8
L6_6 = L6_6(L7_7)
L2_2.noShields = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "Both Tanks Double Health"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "Double Health for Both Tanks!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/chime.mp3"
L7_7.avatar = "talkAnimation"
L7_7.symbol = "2xhealth.png"
function L8_8(A0_27)
	local L3_30 = timer.performWithDelay
	local L2_29 = L2_29
	L3_30 = L3_30(L2_29, function(A0_31)
		local L1_32, L2_33, L3_34, L4_35, L5_36, L6_37, L7_38
		L1_32 = 1
		L2_33 = players
		L2_33 = #L2_33
		L3_34 = 1
		for L4_35 = L1_32, L2_33, L3_34 do
			L5_36 = players
			L5_36 = L5_36[L4_35]
			L6_37 = L5_36.maxHealth
			L6_37 = L6_37 * 2
			L5_36.maxHealth = L6_37
			L6_37 = L5_36.maxHealth
			L5_36.health = L6_37
			L6_37 = L5_36.x
			L7_38 = L5_36.y
			local L8_39 = L8_39
			local L9_40 = L9_40
			local L10_41 = L10_41
			local L11_42 = L11_42
			local L13_44 = L13_44
			local L14_45 = L14_45
			local L15_46 = L15_46
			local L16_47 = L16_47
			L14_45[1] = L15_46
			L14_45[2] = L16_47
			L14_45[3] = 0
			local L14_45[4], L17_48 = 255, L17_48
			L13_44.color = L14_45
			L8_39(L9_40, L10_41, L11_42, L13_44)
		end
	end)
	A0_27.wheelApplyTimer = L3_30
end
L7_7.apply = L8_8
L6_6 = L6_6(L7_7)
L2_2.bothTanksDoubleHealth = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "Player Double Health"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "Double Health for Player!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/chime.mp3"
L7_7.avatar = "laughAnimation"
L7_7.symbol = "p2xhealth.png"
function L8_8(A0_49)
	local L3_52 = timer.performWithDelay
	local L2_51 = L2_51
	L3_52 = L3_52(L2_51, function(A0_53)
		local L1_54, L2_55, L3_56
		L1_54 = players
		L1_54 = L1_54[1]
		L2_55 = L1_54.maxHealth
		L2_55 = L2_55 * 2
		L1_54.maxHealth = L2_55
		L2_55 = L1_54.maxHealth
		L1_54.health = L2_55
		L2_55 = L1_54.x
		L3_56 = L1_54.y
		local L4_57 = L4_57
		local L5_58 = L5_58
		local L6_59 = L6_59
		local L7_60 = L7_60
		local L9_62 = L9_62
		local L10_63 = L10_63
		local L11_64 = L11_64
		local L12_65 = L12_65
		L10_63[1] = L11_64
		L10_63[2] = L12_65
		L10_63[3] = 0
		local L10_63[4], L13_66 = 255, L13_66
		L9_62.color = L10_63
		L4_57(L5_58, L6_59, L7_60, L9_62)
	end)
	A0_49.wheelApplyTimer = L3_52
end
L7_7.apply = L8_8
L6_6 = L6_6(L7_7)
L2_2.playerDoubleHealth = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "CPU Double Health"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "Double Health for Enemy!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/buzzer.mp3"
L7_7.avatar = "angerAnimation"
L7_7.symbol = "cpu2xhealth.png"
L7_7.audienceSound = "audienceShock"
function L8_8(A0_67)
	local L3_70 = timer.performWithDelay
	local L2_69 = L2_69
	L3_70 = L3_70(L2_69, function(A0_71)
		local L1_72, L2_73, L3_74
		L1_72 = players
		L1_72 = L1_72[2]
		L2_73 = L1_72.maxHealth
		L2_73 = L2_73 * 2
		L1_72.maxHealth = L2_73
		L2_73 = L1_72.maxHealth
		L1_72.health = L2_73
		L2_73 = L1_72.x
		L3_74 = L1_72.y
		local L4_75 = L4_75
		local L5_76 = L5_76
		local L6_77 = L6_77
		local L7_78 = L7_78
		local L9_80 = L9_80
		local L10_81 = L10_81
		local L11_82 = L11_82
		local L12_83 = L12_83
		L10_81[1] = L11_82
		L10_81[2] = L12_83
		L10_81[3] = 0
		local L10_81[4], L13_84 = 255, L13_84
		L9_80.color = L10_81
		L4_75(L5_76, L6_77, L7_78, L9_80)
	end)
	A0_67.wheelApplyTimer = L3_70
end
L7_7.apply = L8_8
L6_6 = L6_6(L7_7)
L2_2.cpuDoubleHealth = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "Both Tanks Half Health"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "1/2 Health for Both Tanks!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/buzzer.mp3"
L7_7.avatar = "stunAnimation"
L7_7.symbol = "halfhealth.png"
L7_7.audienceSound = "audienceShock"
function L8_8(A0_85)
	local L3_88 = timer.performWithDelay
	local L2_87 = L2_87
	L3_88 = L3_88(L2_87, function(A0_89)
		_FOR_ = 1
		for _FORV_4_ = L4_93, _FOR_, _FOR_ do
			players[_FORV_4_].health = players[_FORV_4_].maxHealth / 2
			local L8_97 = L8_97
			local L9_98 = L9_98
			local L10_99 = L10_99
			local L11_100 = L11_100
			local L13_102 = L13_102
			local L14_103 = L14_103
			local L15_104 = L15_104
			local L16_105 = L16_105
			;({})[1] = 255
			;({})[2] = 0
			;({})[3] = 0
			local ({})[4], L17_106 = 255, L17_106
			L16_105.color = L17_106
			L11_100(L13_102, L14_103, L15_104, L16_105)
		end
		L4_93 = p1Avatar
		L4_93 = L4_93.healthBar
		L4_93 = L4_93.update
		L5_94 = players
		L5_94 = L5_94[1]
		L5_94 = L5_94.health
		L6_95 = players
		L6_95 = L6_95[1]
		L6_95 = L6_95.maxHealth
		L5_94 = L5_94 / L6_95
		L4_93(L5_94)
		L4_93 = p2Avatar
		L4_93 = L4_93.healthBar
		L4_93 = L4_93.update
		L5_94 = players
		L5_94 = L5_94[2]
		L5_94 = L5_94.health
		L6_95 = players
		L6_95 = L6_95[2]
		L6_95 = L6_95.maxHealth
		L5_94 = L5_94 / L6_95
		L4_93(L5_94)
	end)
	A0_85.wheelApplyTimer = L3_88
end
L7_7.apply = L8_8
L6_6 = L6_6(L7_7)
L2_2.bothTanksHalfHealth = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "Player Half Health"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "1/2 Health for Player!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/buzzer.mp3"
L7_7.avatar = "angerAnimation"
L7_7.symbol = "phalfhealth.png"
L7_7.audienceSound = "audienceShock"
function L8_8(A0_107)
	local L3_110 = timer.performWithDelay
	local L2_109 = L2_109
	L3_110 = L3_110(L2_109, function(A0_111)
		local L1_112, L2_113, L3_114
		L1_112 = players
		L1_112 = L1_112[1]
		L2_113 = L1_112.maxHealth
		L2_113 = L2_113 / 2
		L1_112.health = L2_113
		L2_113 = L1_112.x
		L3_114 = L1_112.y
		local L7_118 = L7_118
		local L9_120 = L9_120
		local L10_121 = L10_121
		local L11_122 = L11_122
		local L12_123 = L12_123
		;({})[1] = 255
		;({})[2] = 0
		;({})[3] = 0
		local ({})[4], L13_124 = 255, L13_124
		L12_123.color = L13_124
		L7_118(L9_120, L10_121, L11_122, L12_123)
		L7_118 = p1Avatar
		L7_118 = L7_118.healthBar
		L7_118 = L7_118.update
		L9_120 = L1_112.health
		L10_121 = L1_112.maxHealth
		L9_120 = L9_120 / L10_121
		L7_118(L9_120)
	end)
	A0_107.wheelApplyTimer = L3_110
end
L7_7.apply = L8_8
L6_6 = L6_6(L7_7)
L2_2.playerHalfHealth = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "Opponent Half Health"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "1/2 Health for Enemy!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/chime.mp3"
L7_7.avatar = "laughAnimation"
L7_7.symbol = "cpuhalfhealth.png"
function L8_8(A0_125)
	local L3_128 = timer.performWithDelay
	local L2_127 = L2_127
	L3_128 = L3_128(L2_127, function(A0_129)
		local L1_130, L2_131, L3_132
		L1_130 = players
		L1_130 = L1_130[2]
		L2_131 = L1_130.maxHealth
		L2_131 = L2_131 / 2
		L1_130.health = L2_131
		L2_131 = L1_130.x
		L3_132 = L1_130.y
		local L7_136 = L7_136
		local L9_138 = L9_138
		local L10_139 = L10_139
		local L11_140 = L11_140
		local L12_141 = L12_141
		;({})[1] = 255
		;({})[2] = 0
		;({})[3] = 0
		local ({})[4], L13_142 = 255, L13_142
		L12_141.color = L13_142
		L7_136(L9_138, L10_139, L11_140, L12_141)
		L7_136 = p2Avatar
		L7_136 = L7_136.healthBar
		L7_136 = L7_136.update
		L9_138 = L1_130.health
		L10_139 = L1_130.maxHealth
		L9_138 = L9_138 / L10_139
		L7_136(L9_138)
	end)
	A0_125.wheelApplyTimer = L3_128
end
L7_7.apply = L8_8
L6_6 = L6_6(L7_7)
L2_2.cpuHalfHealth = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "Baby Missles Only"
L7_7.avatar = "angerAnimation"
L7_7.symbol = "babymissileonly.png"
L7_7.audienceSound = "audienceShock"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "Only Baby Missiles for you!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/buzzer.mp3"
function L8_8(A0_143)
	if players[1].weaponType ~= weaponTypes.BABY_MISSILE then
		players[1].weaponType = weaponTypes.BABY_MISSILE
		local L3_146 = L3_146
		L3_146(settings, "defaultWeapon", weaponTypes.BABY_MISSILE)
		local L4_147 = L4_147
		L3_146 = Weapon
		L3_146 = L3_146.loadWeapon
		L4_147 = players
		L4_147 = L4_147[1]
		L4_147 = L4_147.weaponType
		L3_146(L4_147)
		L3_146 = BattleControls
		L4_147 = L3_146
		L3_146 = L3_146.updateWeapon
		L3_146(L4_147)
	end
end
L7_7.apply = L8_8
L6_6 = L6_6(L7_7)
L2_2.babyMisslesOnlyForPlayer = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "Night Mode"
L7_7.avatar = "talkAnimation"
L7_7.symbol = "nighttime.png"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "Night Mode!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/chime.mp3"
L6_6 = L6_6(L7_7)
L2_2.nightMode = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "Rainbow Mode"
L7_7.avatar = "talkAnimation"
L7_7.symbol = "nighttime.png"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "Rainbow Mode!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/chime.mp3"
L6_6 = L6_6(L7_7)
L2_2.rainbowMode = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "Tank Position Swap"
L7_7.avatar = "talkAnimation"
L7_7.symbol = "swappositions.png"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "Tanks Swap Sides!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/chime.mp3"
L7_7.audienceSound = "audienceShock"
function L8_8(A0_148)
	local L3_151 = timer.performWithDelay
	local L2_150 = L2_150
	L3_151 = L3_151(L2_150, function(A0_152)
		local L1_153, L2_154, L3_155, L4_156
		L1_153 = players
		local L1_153, L7_159, L8_160, L9_161, L10_162, L11_163 = L1_153[1], L7_159, L8_160, L9_161, L10_162, L11_163
		L1_153 = L1_153.x
		L2_154 = players
		L2_154 = L2_154[1]
		L2_154 = L2_154.y
		L3_155 = players
		L3_155 = L3_155[2]
		L3_155 = L3_155.x
		L4_156 = players
		L4_156 = L4_156[2]
		L4_156 = L4_156.y
		L7_159 = getP1ScoreGroup
		L7_159 = L7_159()
		L8_160 = getP2ScoreGroup
		L8_160 = L8_160()
		L9_161 = L7_159.x
		L10_162 = L7_159.y
		L11_163 = L8_160.x
		local L12_164 = L12_164
		;({}).time = 750
		;({}).alpha = 0
		;({}).onComplete = function()
			local L0_170, L1_171
			L0_170 = _ENV
			L1_171 = L4_156
			L1_171 = L1_171 - 70
			local L2_172 = L2_172
			L2_172 = L2_172 .. "_poof"
			local L9_179 = L9_179
			L9_179(L2_172, L0_170, L1_171, 0, false, false, true)
			local L10_180 = L10_180
			L9_179 = Particles
			L9_179 = L9_179.SetEmitterScale
			L10_180 = L2_172
			L9_179(L10_180, 1.5)
			L9_179 = BEHIND_TANK
			L10_180 = L9_179
			L9_179 = L9_179.insert
			L9_179(L10_180, Particles.GetEmitter(L2_172))
			L9_179 = Particles
			L9_179 = L9_179.AttachParticleType
			L10_180 = L2_172
			L9_179(L10_180, "GenericWhiteExplosionSmoke", 50, 400, 0)
			L9_179 = Particles
			L9_179 = L9_179.StartEmitter
			L10_180 = L2_172
			L9_179(L10_180)
			L9_179 = "res/sounds/wheel/plungerPop.mp3"
			L10_180 = sound
			L10_180 = L10_180.playSound
			;({}).onComplete = function()
				sound.dispose(_ENV)
				local L1_181 = L1_181
			end
			L10_180(L9_179, {})
			L10_180 = players
			L10_180 = L10_180[1]
			L10_180 = L10_180.moveTo
			local L5_175 = L5_175
			local L6_176 = L6_176
			L10_180(L5_175, L6_176, L1_171)
			local L7_177 = L7_177
			L10_180 = players
			L10_180 = L10_180[1]
			L10_180.alpha = 1
		end
		A0_152.source.params.wheel.trackedTransitions[transition.to(players[1], {})] = transition.to(players[1], {})
		;({}).time = 750
		;({}).x = L11_163
		;({}).y = L12_164
		;({}).xScale = L7_159.xScale * -1
		;({}).onComplete = function()
			local L0_182
			L0_182 = p1Avatar
			L0_182 = L0_182.isActive
			if not L0_182 then
				L0_182 = false
			end
			BattleControls:buildP1Avatar("right")
			p1Avatar.bubblePositioningHack = true
			local L1_183, L2_184 = L1_183, L2_184
			L1_183(L2_184, L0_182)
			local L3_185 = L3_185
		end
		A0_152.source.params.wheel.trackedTransitions[transition.to(L7_159, {})] = transition.to(L7_159, {})
		local L13_165 = L13_165
		;({}).time = 750
		;({}).alpha = 0
		;({}).onComplete = function()
			local L0_186, L1_187
			L0_186 = _ENV
			L1_187 = L2_154
			L1_187 = L1_187 - 70
			local L2_188 = L2_188
			L2_188 = L2_188 .. "_poof"
			local L9_195 = L9_195
			L9_195(L2_188, L0_186, L1_187, 0, false, false, true)
			local L10_196 = L10_196
			L9_195 = Particles
			L9_195 = L9_195.SetEmitterScale
			L10_196 = L2_188
			L9_195(L10_196, 1.5)
			L9_195 = BEHIND_TANK
			L10_196 = L9_195
			L9_195 = L9_195.insert
			L9_195(L10_196, Particles.GetEmitter(L2_188))
			L9_195 = Particles
			L9_195 = L9_195.AttachParticleType
			L10_196 = L2_188
			L9_195(L10_196, "GenericWhiteExplosionSmoke", 50, 400, 0)
			L9_195 = Particles
			L9_195 = L9_195.StartEmitter
			L10_196 = L2_188
			L9_195(L10_196)
			L9_195 = players
			L9_195 = L9_195[2]
			L10_196 = L9_195
			L9_195 = L9_195.moveTo
			local L5_191 = L5_191
			L9_195(L10_196, L5_191, L1_187)
			local L6_192 = L6_192
			L9_195 = players
			L9_195 = L9_195[2]
			L9_195.alpha = 1
		end
		L13_165.trackedTransitions[transition.to(players[2], {})] = transition.to(players[2], {})
		local L14_166 = L14_166
		local L15_167 = L15_167
		;({}).time = 750
		;({}).x = L9_161
		;({}).y = L10_162
		local ({}).xScale, L17_169 = L8_160.xScale * -1, L17_169
		;({}).onComplete = function()
			local L0_197
			L0_197 = p2Avatar
			L0_197 = L0_197.isActive
			if not L0_197 then
				L0_197 = false
			end
			BattleControls:buildP2Avatar("left")
			p2Avatar.bubblePositioningHack = true
			local L1_198, L2_199 = L1_198, L2_199
			L1_198(L2_199, L0_197)
			local L3_200 = L3_200
		end
		L17_169 = L17_169(L8_160, {})
		L15_167 = L17_169
		L17_169 = L13_165.trackedTransitions
		L17_169[L15_167] = L15_167
	end)
	A0_148.wheelApplyTimer = L3_151
	L3_151 = A0_148.wheelApplyTimer
	L2_150 = {}
	L2_150.wheel = A0_148
	L3_151.params = L2_150
end
L7_7.apply = L8_8
L6_6 = L6_6(L7_7)
L2_2.swapTankPositions = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "Arcade Mode"
L7_7.avatar = "laughAnimation"
L7_7.symbol = "arcademode.png"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "Arcade Mode!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/chime.mp3"
function L8_8(A0_201)
	local L3_204 = timer.performWithDelay
	local L2_203 = L2_203
	L3_204 = L3_204(L2_203, function(A0_205)
		local L1_206
		L1_206 = A0_205.source
		local L1_206, L6_211 = L1_206.params, L6_211
		L1_206 = L1_206.wheel
		L6_211 = TextCandy
		L6_211 = L6_211.CreateText
		;({}).fontName = "gameplay"
		;({}).text = "ARCADE   MODE!   READY?"
		;({}).originX = "CENTER"
		;({}).textFlow = "RIGHT"
		;({}).charBaseLine = "CENTER"
		;({}).showOrigin = false
		L6_211 = L6_211({})
		L6_211.x = screenX + screenWidth / 2
		L6_211.y = display.contentHeight / 2
		L1_206.trackedText[L6_211] = L6_211
		local L3_208 = L3_208
		local L4_209 = L4_209
		;({}).time = 1500
		;({}).alpha = 0
		;({}).onComplete = function(A0_212)
			local L5_217 = L5_217
			if A0_212.delete then
				L5_217 = A0_212.delete
				L5_217(A0_212)
			end
			L5_217 = _ENV
			L5_217 = L5_217.trackedText
			L5_217[A0_212] = nil
			L5_217 = TextCandy
			L5_217 = L5_217.CreateText
			;({}).fontName = "gameplay"
			;({}).text = "GO!"
			;({}).originX = "CENTER"
			;({}).textFlow = "RIGHT"
			;({}).charBaseLine = "CENTER"
			;({}).showOrigin = false
			L5_217 = L5_217({})
			L5_217.x = screenX + screenWidth / 2
			L5_217.y = display.contentHeight / 2
			_ENV.trackedText[L5_217] = L5_217
			local L2_214 = L2_214
			local L3_215 = L3_215
			;({}).time = 750
			;({}).alpha = 0
			;({}).onComplete = function(A0_218)
				if A0_218.delete then
					A0_218:delete()
				end
				_ENV.trackedText[A0_218] = nil
				local L1_219 = L1_219
				L1_219(players[2].AI)
				local L2_220 = L2_220
			end
			local L2_214, L4_216 = L2_214(L3_215, {}), L4_216
			transition1 = L2_214
		end
		local L3_208, L5_210 = L3_208(L4_209, {}), L5_210
		L4_209 = L1_206.trackedTransitions
		L4_209[L3_208] = L3_208
	end)
	A0_201.wheelApplyTimer = L3_204
	L3_204 = A0_201.wheelApplyTimer
	L2_203 = {}
	L2_203.wheel = A0_201
	L3_204.params = L2_203
end
L7_7.apply = L8_8
L6_6 = L6_6(L7_7)
L2_2.arcadeMode = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "Bonus 500 Warbux"
L7_7.avatar = "laughAnimation"
L7_7.symbol = "potbonus.png"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "Bonus 500 Warbux!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/chime.mp3"
function L8_8(A0_221)
	local L3_224 = timer.performWithDelay
	local L2_223 = L2_223
	L3_224 = L3_224(L2_223, function(A0_225)
		getCurrentBattle().addToPot(500)
		local L1_226 = L1_226
		local L2_227 = L2_227
		local L3_228 = L3_228
		local L4_229 = L4_229
		;({}).scale = 2
		local L6_231 = L6_231
		local L7_232 = L7_232
		local L8_233 = L8_233
		local L9_234 = L9_234
		L7_232[1] = L8_233
		L7_232[2] = L9_234
		L7_232[3] = 0
		local L7_232[4], L10_235 = 255, L10_235
		L6_231.color = L7_232
		L1_226(L2_227, L3_228, L4_229, L6_231)
	end)
	A0_221.wheelApplyTimer = L3_224
end
L7_7.apply = L8_8
L6_6 = L6_6(L7_7)
L2_2.bonus500Warbux = L6_6
L6_6 = L0_0
L7_7 = {}
L7_7.name = "Bonus 1000 Warbux"
L7_7.avatar = "laughAnimation"
L7_7.symbol = "potbonus.png"
L8_8 = {}
L8_8.direction = "down"
L8_8.text = "Bonus 1000 Warbux!"
L7_7.alertMsgParams = L8_8
L7_7.alertMsgSound = "res/sounds/wheel/chime.mp3"
function L8_8(A0_236)
	local L3_239 = timer.performWithDelay
	local L2_238 = L2_238
	L3_239 = L3_239(L2_238, function(A0_240)
		getCurrentBattle().addToPot(1000)
		local L1_241 = L1_241
		local L2_242 = L2_242
		local L3_243 = L3_243
		local L4_244 = L4_244
		;({}).scale = 2
		local L6_246 = L6_246
		local L7_247 = L7_247
		local L8_248 = L8_248
		local L9_249 = L9_249
		L7_247[1] = L8_248
		L7_247[2] = L9_249
		L7_247[3] = 0
		local L7_247[4], L10_250 = 255, L10_250
		L6_246.color = L7_247
		L1_241(L2_242, L3_243, L4_244, L6_246)
	end)
	A0_236.wheelApplyTimer = L3_239
end
L7_7.apply = L8_8
L6_6 = L6_6(L7_7)
L2_2.bonus1000Warbux = L6_6
L6_6 = {}
L6_6.selectedMode = nil
function L7_7(A0_251, A1_252)
	local L2_253
	L2_253 = A0_251.gameModes
	L2_253 = L2_253[A1_252]
	if L2_253 then
		L2_253 = A0_251.gameModes
		L2_253 = L2_253[A1_252]
		L2_253 = L2_253.active
	end
	return L2_253
end
L6_6.isActive = L7_7
function L7_7(A0_254, A1_255)
	local L2_256
	L2_256 = {}
	L2_256.selectedMode = nil
	_FOR_, _FOR_, _FOR_ = pairs(_ENV)
	for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
		L2_256[_FORV_6_] = _FORV_7_
	end
	L2_256.gameModes = {}
	L2_256.trackedTransitions = {}
	L2_256.trackedText = {}
	local L3_257 = L3_257
	L3_257 = L3_257(L1_1)
	L4_258 = #L3_257
	_FOR_ = -1
	for _FORV_7_ = L4_258, _FOR_, _FOR_ do
		if not L2_2[L3_257[_FORV_7_]] or not L2_2[L3_257[_FORV_7_]].isBonusAvailable() then
			table.remove(L3_257, _FORV_7_)
		end
	end
	L4_258 = 0
	while A1_255 > L4_258 do
		L9_263 = #L3_257
		if not (0 < L9_263) then
			break
		end
		L9_263 = math
		L9_263 = L9_263.random
		L9_263 = L9_263(L6_260, #L3_257)
		L9_263 = L3_257[L9_263]
		L6_260 = #L3_257
		_FOR_ = -1
		for _FORV_9_ = L6_260, _FOR_, _FOR_ do
			if L3_257[_FORV_9_] == L9_263 then
				table.remove(L3_257, _FORV_9_)
			end
		end
		L6_260 = L2_256.gameModes
		L10_264 = utils
		L10_264 = L10_264.deepcopy
		L11_265 = L2_2
		L11_265 = L11_265[L9_263]
		L10_264 = L10_264(L11_265)
		L6_260[L9_263] = L10_264
		L4_258 = L4_258 + 1
	end
	L2_256.numModes = L4_258
	return L2_256
end
L6_6.new = L7_7
function L7_7(A0_267)
	if not A0_267.applied and A0_267.selectedMode and A0_267.gameModes[A0_267.selectedMode].apply then
		A0_267.gameModes[A0_267.selectedMode].apply(A0_267)
		local L2_268 = L2_268
	end
	A0_267.applied = true
end
L6_6.apply = L7_7
function L7_7(A0_269)
	L3_272 = A0_269.gameModes
	L1_270, L3_272, L4_273 = L1_270(L3_272)
	for L5_274, L6_275 in L1_270, L3_272, L4_273 do
		A0_269.gameModes[L5_274].active = false
	end
end
L6_6.resetWheel = L7_7
function L7_7(A0_276)
	if A0_276.alertMsgTimer then
		timer.cancel(A0_276.alertMsgTimer)
		local L2_277 = L2_277
	end
	A0_276.alertMsgTimer = nil
	L2_277 = A0_276.alertMsg
	if L2_277 then
		L2_277 = A0_276.alertMsg
		L2_277 = L2_277.close
		L2_277()
	end
	A0_276.alertMsg = nil
end
L6_6.dismissAlertMsg = L7_7
function L7_7(A0_278, A1_279)
	local L18_296 = L18_296
	if not A1_279 then
		A1_279 = 3000
	end
	L18_296 = A0_278.dismissAlertMsg
	L18_296(A0_278)
	L18_296 = A0_278.selectedMode
	if L18_296 then
		L18_296 = A0_278.gameModes
		if L18_296 then
			L18_296 = A0_278.gameModes
			L18_296 = L18_296[A0_278.selectedMode]
			L18_296 = L18_296.alertMsgSound
			if L18_296 then
				local L3_281 = L3_281
				L3_281(L18_296)
			end
			L3_281 = A0_278.gameModes
			L3_281 = L3_281[A0_278.selectedMode]
			L3_281 = L3_281.alertMsgParams
			if L3_281 then
				local L4_282 = display.newGroup()
				local L5_283 = L5_283
				L5_283 = L5_283(L4_282, 0, 0, 520, 150)
				L5_283.x, L5_283.y = 0, 0
				L5_283.strokeWidth = 5
				L5_283:setStrokeColor(0, 0, 0)
				L5_283:setFillColor(229, 188, 14)
				L5_283 = display.newRect(L4_282, 0, 0, 470, 100)
				L5_283.x, L5_283.y = 0, 0
				L5_283.strokeWidth = 5
				L5_283:setStrokeColor(88, 68, 29)
				L5_283:setFillColor(253, 209, 152)
				local L6_284 = L6_284
				local L6_284, L7_285 = L6_284("res/wheel/blinkinglight.png")
				local L8_286 = L8_286
				local L9_287 = L9_287
				local L10_288 = L10_288
				local L11_289 = L11_289
				local L12_290 = L12_290
				local L13_291 = L13_291
				L8_286(L9_287, L10_288, L11_289, L12_290, L13_291, -1)
				local L14_292 = L14_292
				L8_286 = 275
				L9_287 = 0
				L10_288 = 20
				L11_289 = 5
				L12_290 = L4_282.contentWidth
				L12_290 = L12_290 - 30
				L13_291 = L4_282.contentHeight
				L13_291 = L13_291 - 30
				L14_292 = 15
				_FOR_ = 1
				for _FORV_18_ = _FOR_, _FOR_, _FOR_ do
					L4_282:insert((sprite.newSprite(L6_284)))
					sprite.newSprite(L6_284).currentFrame = L9_287 % 4 + 1
					sprite.newSprite(L6_284).x, sprite.newSprite(L6_284).y = -L12_290 / 2 + L12_290 / L10_288 * (_FORV_18_ - 1), L4_282.contentHeight / 2 - L14_292
					L9_287 = L9_287 + 1
					sprite.newSprite(L6_284).xScale, sprite.newSprite(L6_284).yScale = 0.3, 0.3
					sprite.newSprite(L6_284):play()
				end
				_FOR_ = 1
				for _FORV_18_ = _FOR_, _FOR_, _FOR_ do
					L4_282:insert((sprite.newSprite(L6_284)))
					sprite.newSprite(L6_284).currentFrame = L9_287 % 4 + 1
					sprite.newSprite(L6_284).x, sprite.newSprite(L6_284).y = -L4_282.contentWidth / 2 + L14_292, L13_291 / 2 - L13_291 / L11_289 * (_FORV_18_ - 1)
					L9_287 = L9_287 + 1
					sprite.newSprite(L6_284).xScale, sprite.newSprite(L6_284).yScale = 0.3, 0.3
					sprite.newSprite(L6_284):play()
				end
				_FOR_ = 1
				for _FORV_18_ = _FOR_, _FOR_, _FOR_ do
					L4_282:insert((sprite.newSprite(L6_284)))
					sprite.newSprite(L6_284).currentFrame = L9_287 % 4 + 1
					sprite.newSprite(L6_284).x, sprite.newSprite(L6_284).y = L12_290 / 2 - L12_290 / L10_288 * (_FORV_18_ - 1), -L4_282.contentHeight / 2 + L14_292
					L9_287 = L9_287 + 1
					sprite.newSprite(L6_284).xScale, sprite.newSprite(L6_284).yScale = 0.3, 0.3
					sprite.newSprite(L6_284):play()
				end
				_FOR_ = 1
				for _FORV_18_ = _FOR_, _FOR_, _FOR_ do
					L4_282:insert((sprite.newSprite(L6_284)))
					sprite.newSprite(L6_284).currentFrame = L9_287 % 4 + 1
					sprite.newSprite(L6_284).x, sprite.newSprite(L6_284).y = L4_282.contentWidth / 2 - L14_292, -L13_291 / 2 + L13_291 / L11_289 * (_FORV_18_ - 1)
					L9_287 = L9_287 + 1
					sprite.newSprite(L6_284).xScale, sprite.newSprite(L6_284).yScale = 0.3, 0.3
					sprite.newSprite(L6_284):play()
				end
				L3_281.alertBox = L4_282
				L23_301 = utils
				L23_301 = L23_301.getNotificationSlider
				L20_298 = L3_281
				L23_301 = L23_301(L20_298)
				A0_278.alertMsg = L23_301
				L20_298 = timer
				L20_298 = L20_298.performWithDelay
				L21_299 = A1_279
				L20_298 = L20_298(L21_299, function(A0_302)
					A0_302.source.params.wheel:dismissAlertMsg()
					local L2_303 = L2_303
				end)
				A0_278.alertMsgTimer = L20_298
				L20_298 = A0_278.alertMsgTimer
				L21_299 = {}
				L21_299.wheel = A0_278
				L20_298.params = L21_299
			end
		end
	end
end
L6_6.alert = L7_7
function L7_7(A0_304)
	A0_304:dismissAlertMsg()
	L4_308 = selectedMode
	if L4_308 then
		L4_308 = A0_304.gameModes
		L5_309 = A0_304.selectedMode
		L4_308 = L4_308[L5_309]
		if L4_308 then
			L4_308 = A0_304.gameModes
			L5_309 = A0_304.selectedMode
			L4_308 = L4_308[L5_309]
			L4_308 = L4_308.alertMsgSound
			if L4_308 then
				L5_309 = sound
				L5_309 = L5_309.dispose
				L5_309(L4_308)
			end
		end
	end
	L4_308 = A0_304.wheelApplyTimer
	if L4_308 then
		L4_308 = timer
		L4_308 = L4_308.cancel
		L5_309 = A0_304.wheelApplyTimer
		L4_308(L5_309)
		A0_304.wheelApplyTimer = nil
	end
	L4_308 = pairs
	L5_309 = A0_304.trackedTransitions
	L4_308, L5_309, _FOR_ = L4_308(L5_309)
	for _FORV_4_, _FORV_5_ in L4_308, L5_309, _FOR_ do
		transition.cancel(_FORV_5_)
		A0_304.trackedTransitions[_FORV_4_] = nil
	end
	L4_308 = pairs
	L5_309 = A0_304.trackedText
	L4_308, L5_309, _FOR_ = L4_308(L5_309)
	for _FORV_4_, _FORV_5_ in L4_308, L5_309, _FOR_ do
		if _FORV_5_.delete then
			_FORV_5_:delete()
		end
		A0_304.trackedText[_FORV_4_] = nil
	end
	L4_308 = spritesheetmanager
	L4_308 = L4_308.disposeSpriteSet
	L5_309 = "res/wheel/blinkinglight.png"
	L4_308(L5_309)
end
L6_6.destroy = L7_7
return L6_6
