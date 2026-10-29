local L0_0, L1_1, L2_2, L3_3
L0_0 = weaponTypes
L1_1 = weaponTypes
L1_1 = L1_1.MIRV
L2_2 = {}
L2_2.image = "res/weapons/mirv/MIRV.png"
L2_2.name = "MIRV"
L2_2.listImage = "mirv"
L2_2.numSpawn = 5
L3_3 = {}
L3_3[1] = weaponTypes.MIRV_SPAWN
L2_2.children = L3_3
L3_3 = weaponBalance
L3_3 = L3_3[weaponTypes.MIRV]
L3_3 = L3_3.damage
L2_2.damage = L3_3
L3_3 = weaponBalance
L3_3 = L3_3[weaponTypes.MIRV]
L3_3 = L3_3.blastRadius
L2_2.blastRadius = L3_3
L3_3 = weaponBalance
L3_3 = L3_3[weaponTypes.MIRV]
L3_3 = L3_3.forceRadius
L2_2.forceRadius = L3_3
L3_3 = weaponBalance
L3_3 = L3_3[weaponTypes.MIRV]
L3_3 = L3_3.blastForce
L2_2.blastForce = L3_3
L3_3 = weaponBalance
L3_3 = L3_3[weaponTypes.MIRV]
L3_3 = L3_3.cost
L2_2.cost = L3_3
L2_2.triggerPlayerChange = false
L2_2.isSensor = false
L3_3 = {}
L3_3.name = "fire"
L3_3.x = -45
L3_3.y = 0
L2_2.exhaustSequence = L3_3
L3_3 = {}
L3_3.fire = "res/sounds/mirv_launch.mp3"
L3_3.explode = "res/sounds/mirv_spawn.mp3"
L3_3.thrust = "res/sounds/thrust_type1.mp3"
L2_2.sounds = L3_3
L3_3 = {}
L3_3.x = 17
L3_3.y = 0
L2_2.physicsCenter = L3_3
L3_3 = {}
L3_3.density = densityOfABomb
L3_3.friction = 10
L3_3.bounce = 0
L3_3.shape, ({})[1] = {}, -20
L3_3.shape, ({})[2] = {}, -10
L3_3.shape, ({})[3] = {}, 35
L3_3.shape, ({})[4] = {}, -10
L3_3.shape, ({})[5] = {}, 35
L3_3.shape, ({})[6] = {}, 10
L3_3.shape, ({})[7] = {}, -20
L3_3.shape, ({})[8] = {}, 10
L3_3.filter = WEAPON_FILTER
L2_2.physics = L3_3
function L3_3(A0_13, A1_14)
	local L3_15 = L3_15
	L3_15(A0_13, A1_14)
	local L4_16 = L4_16
end
L2_2.collision = L3_3
function L3_3(A0_17)
	local L3_20, L4_21, L5_22, L12_29 = L3_20, L4_21, L5_22, L12_29
	if A0_17.getLinearVelocity then
		L3_20 = trackWeaponStop
		L4_21 = A0_17
		L3_20(L4_21)
		L3_20 = A0_17.player
		L4_21 = A0_17.x
		L5_22 = A0_17.y
		L12_29 = A0_17.layerIndex
		local L7_24 = L7_24
		local L8_25, L9_26 = L8_25, L9_26
		if A0_17.thrustSoundChannel then
			sound.stop(A0_17.thrustSoundChannel)
			A0_17.thrustSoundChannel = nil
		end
		explodeBomb(A0_17)
		local L10_27 = L10_27
		local L11_28 = L11_28
		timer.performWithDelay(10, function()
			local L0_30 = L0_30
			local L1_31 = L1_31
			local L2_32 = L2_32
			local L3_33 = L3_33
			local L4_34 = L4_34
			local L5_35 = L5_35
			local L6_36 = L6_36
			local L7_37 = L7_37
			;({}).x = L10_27
			;({}).y = L11_28
			local L8_38 = L8_38
			local L9_39 = L9_39
			L0_30(L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39, L8_25)
			local L10_40 = L10_40
		end)
	end
end
L2_2.triggerWeapon = L3_3
function L3_3(A0_41, A1_42, A2_43)
	A0_41.thrustSoundChannel = sound.playSound(weaponTypes[A0_41.weaponType].sounds.thrust)
	local L4_44 = L4_44
	local L5_45 = L5_45
	L4_44(L5_45, A1_42, A2_43)
	local L6_46 = L6_46
end
L2_2.go = L3_3
function L3_3(A0_47)
	orientOnPath(A0_47)
	apexExplode(A0_47)
	local L2_48 = L2_48
end
L2_2.manualPhysics = L3_3
L2_2.fireDelay = 100
L0_0[L1_1] = L2_2
L0_0 = weaponTypes
L1_1 = weaponTypes
L1_1 = L1_1.DEATH_HEAD
L2_2 = {}
L2_2.image = "res/weapons/mirv/death_head.png"
L2_2.name = "Death Head"
L2_2.listImage = "deathhead"
L2_2.numSpawn = 10
L3_3 = {}
local L3_3[1], L4_4 = weaponTypes.MIRV_SPAWN, L4_4
L2_2.children = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.DEATH_HEAD
L3_3 = L3_3[L4_4]
L3_3 = L3_3.damage
L2_2.damage = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.DEATH_HEAD
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastRadius
L2_2.blastRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.DEATH_HEAD
L3_3 = L3_3[L4_4]
L3_3 = L3_3.forceRadius
L2_2.forceRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.DEATH_HEAD
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastForce
L2_2.blastForce = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.DEATH_HEAD
L3_3 = L3_3[L4_4]
L3_3 = L3_3.cost
L2_2.cost = L3_3
L2_2.triggerPlayerChange = false
L3_3 = {}
L3_3.name = "fire"
L3_3.x = -45
L3_3.y = 0
L2_2.exhaustSequence = L3_3
L3_3 = {}
L3_3.fire = "res/sounds/mirv_launch.mp3"
L3_3.explode = "res/sounds/mirv_spawn.mp3"
L3_3.thrust = "res/sounds/thrust_type1.mp3"
L2_2.sounds = L3_3
L3_3 = {}
L3_3.x = 17
L3_3.y = 0
L2_2.physicsCenter = L3_3
L3_3 = {}
L4_4 = densityOfABomb
L3_3.density = L4_4
L3_3.friction = 10
L3_3.bounce = 0
L4_4 = {}
L4_4[1] = -20
L4_4[2] = -10
L4_4[3] = 35
L4_4[4] = -10
L4_4[5] = 35
L4_4[6] = 10
L4_4[7] = -20
L4_4[8] = 10
L3_3.shape = L4_4
L4_4 = WEAPON_FILTER
L3_3.filter = L4_4
L2_2.physics = L3_3
function L3_3(A0_49, A1_50)
	local L3_51 = L3_51
	L3_51(A0_49, A1_50)
	local L4_52 = L4_52
end
L2_2.collision = L3_3
function L3_3(A0_53)
	local L1_54, L2_55, L3_56, L4_57, L5_58
	L1_54 = A0_53.player
	local L2_55, L12_65 = A0_53.x, L12_65
	L3_56 = A0_53.y
	L4_57 = A0_53.layerIndex
	L5_58 = A0_53.isNonPlayerWeapon
	L12_65 = tostring
	local L12_65, L7_60 = L12_65(A0_53), L7_60
	L7_60 = A0_53.numSpawn
	local L8_61, L9_62 = A0_53:getLinearVelocity()
	if A0_53.thrustSoundChannel then
		sound.stop(A0_53.thrustSoundChannel)
		A0_53.thrustSoundChannel = nil
	end
	explodeBomb(A0_53)
	local L10_63 = L10_63
	local L11_64 = L11_64
	L10_63(L11_64, function()
		local L0_66 = L0_66
		local L1_67 = L1_67
		local L2_68 = L2_68
		local L3_69 = L3_69
		local L4_70 = L4_70
		local L5_71 = L5_71
		local L6_72 = L6_72
		local L7_73 = L7_73
		;({}).x = L8_61
		;({}).y = L9_62
		local L8_74 = L8_74
		local L9_75 = L9_75
		L0_66(L1_67, L2_68, L3_69, L4_70, L5_71, L6_72, L7_73, L8_74, L9_75, L6_59)
		local L10_76 = L10_76
	end)
end
L2_2.triggerWeapon = L3_3
function L3_3(A0_77, A1_78, A2_79)
	A0_77.thrustSoundChannel = sound.playSound(weaponTypes[A0_77.weaponType].sounds.thrust)
	local L4_80 = L4_80
	local L5_81 = L5_81
	L4_80(L5_81, A1_78, A2_79)
	local L6_82 = L6_82
end
L2_2.go = L3_3
function L3_3(A0_83)
	orientOnPath(A0_83)
	apexExplode(A0_83)
	local L2_84 = L2_84
end
L2_2.manualPhysics = L3_3
L0_0[L1_1] = L2_2
L0_0 = weaponTypes
L1_1 = weaponTypes
L1_1 = L1_1.MIRV_SPAWN
L2_2 = {}
L2_2.image = "res/weapons/mirv/MIRV_child.png"
L2_2.name = "MIRV Spawn"
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.MIRV_SPAWN
L3_3 = L3_3[L4_4]
L3_3 = L3_3.damage
L2_2.damage = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.MIRV_SPAWN
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastRadius
L2_2.blastRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.MIRV_SPAWN
L3_3 = L3_3[L4_4]
L3_3 = L3_3.forceRadius
L2_2.forceRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.MIRV_SPAWN
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastForce
L2_2.blastForce = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.MIRV_SPAWN
L3_3 = L3_3[L4_4]
L3_3 = L3_3.cost
L2_2.cost = L3_3
L2_2.isSensor = true
L3_3 = {}
L4_4 = {}
L4_4.file = "res/weapons/mirv/mirvexplosion2.png"
L4_4.dataFile = "res.weapons.mirv.mirvexplosion2"
L4_4.startFrame = 1
L4_4.numFrames = 9
L4_4.duration = 600
L4_4.loopParam = 1
L3_3.explode1 = L4_4
L4_4 = {}
L4_4.file = "res/weapons/mirv/mirvexplosion.png"
L4_4.dataFile = "res.weapons.mirv.mirvexplosion"
L4_4.startFrame = 1
L4_4.numFrames = 9
L4_4.duration = 600
L4_4.loopParam = 1
L3_3.explode2 = L4_4
L4_4 = {}
L4_4.file = "res/weapons/mirv/deathhead2.png"
L4_4.dataFile = "res.weapons.mirv.deathhead2"
L4_4.startFrame = 1
L4_4.numFrames = 10
L4_4.duration = 800
L4_4.loopParam = 1
L3_3.explode_deathHead = L4_4
L2_2.spriteSequences = L3_3
L3_3 = {}
L3_3.fire = "res/sounds/shot.mp3"
L3_3.explode = "res/sounds/mirv_impact.mp3"
L3_3.whisper = "res/sounds/evil_whisper.mp3"
L2_2.sounds = L3_3
function L3_3(A0_85, A1_86)
	local L4_88 = L4_88
	L4_88(weaponTypes[A0_85.weaponType].sounds.explode)
	L4_88 = mirvSpawnBlast
	L4_88(A0_85)
end
L2_2.doExplosionEffect = L3_3
L2_2.hideFromSelection = true
L3_3 = {}
L4_4 = densityOfABomb
L3_3.density = L4_4
L3_3.friction = 10
L3_3.bounce = 0
L4_4 = {}
local L5_5 = L5_5
local L6_6 = L6_6
local L7_7 = L7_7
local L8_8 = L8_8
local L9_9 = L9_9
local L10_10 = L10_10
local L11_11 = L11_11
L4_4[1] = L5_5
L4_4[2] = L6_6
L4_4[3] = L7_7
L4_4[4] = L8_8
L4_4[5] = L9_9
L4_4[6] = L10_10
L4_4[7] = L11_11
local L4_4[8], L12_12 = 13, L12_12
L3_3.shape = L4_4
L4_4 = WEAPON_FILTER
L3_3.filter = L4_4
L2_2.physics = L3_3
function L3_3(A0_89, A1_90)
	local L3_91 = L3_91
	L3_91(A0_89, A1_90)
	local L4_92 = L4_92
end
L2_2.collision = L3_3
function L3_3(A0_93)
	explodeBomb(A0_93)
	local L2_94 = L2_94
end
L2_2.triggerWeapon = L3_3
function L3_3(A0_95, A1_96, A2_97)
	local L4_98 = L4_98
	local L5_99 = L5_99
	L4_98(L5_99, A1_96, A2_97)
	local L6_100 = L6_100
end
L2_2.go = L3_3
function L3_3(A0_101)
	orientOnPath(A0_101)
	local L2_102 = L2_102
end
L2_2.manualPhysics = L3_3
L0_0[L1_1] = L2_2
function L0_0(A0_103)
	if A0_103.lastY and A0_103.y > A0_103.lastY then
		A0_103:triggerWeapon()
		local L2_104 = L2_104
	end
end
apexExplode = L0_0
function L0_0(A0_105, A1_106, A2_107, A3_108, A4_109, A5_110, A6_111, A7_112, A8_113, A9_114)
	local L12_117, L13_118, L14_119 = math.floor, L13_118, L14_119
	L13_118 = A5_110 * 0.4
	L12_117 = L12_117(L13_118)
	L13_118 = 30
	L14_119 = A7_112.x
	L15_120 = L12_117 * L13_118
	L14_119 = L14_119 - L15_120
	L15_120 = 1
	L16_121 = A5_110
	_FOR_ = 1
	for _FORV_16_ = L15_120, L16_121, _FOR_ do
		local L23_128 = L23_128
		local L24_129 = L24_129
		local L23_128, L25_130 = L23_128(L24_129, A0_105, A4_109, A1_106, A2_107, A6_111, 0, true), L25_130
		L23_128.isNonPlayerWeapon = A8_113
		L23_128.rootWeapon = A9_114
		L23_128.engageManualPhysics = true
		L24_129 = A5_110 - 1
		if _FORV_16_ == L24_129 then
			L23_128.triggerPlayerChange = true
			L24_129 = trackWeaponStart
			L25_130 = L23_128
			L24_129(L25_130)
		else
			L23_128.triggerPlayerChange = false
		end
		L25_130 = L23_128
		L24_129 = L23_128.setLinearVelocity
		L24_129(L25_130, L14_119 + _FORV_16_ * L13_118, A7_112.y)
		L23_128.parentWeaponType = A3_108
	end
end
spawnKids = L0_0
function L0_0(A0_131)
	local L1_132, L2_133, L3_134
	L1_132 = A0_131.x
	L2_133 = A0_131.y
	L3_134 = nil
	math.randomseed(system.getTimer())
	local L4_135 = L4_135
	L4_135 = L4_135(1, 2)
	if L4_135 == 1 then
		L3_134 = BattleSprites.newSprite("explode1_" .. A0_131.weaponType)
	else
		local L5_136 = L5_136
		local L5_136, L6_137 = L5_136("explode2_" .. A0_131.weaponType), L6_137
		L3_134 = L5_136
	end
	L5_136 = L3_134
	L6_137 = A0_131.blastRadius
	L6_137 = L6_137 / L3_134.width
	EXPLOSIONS:insert(L3_134)
	L3_134.xScale = L6_137
	L3_134.yScale = L6_137
	L3_134.x = L1_132
	L3_134.y = L2_133 - L3_134.contentHeight / 2 - A0_131.blastRadius
	function L3_134.sprite(A0_147, A1_148)
		if A1_148.phase == "end" then
			display.remove(A1_148.sprite)
			local L3_149 = L3_149
		end
	end
	L3_134:addEventListener("sprite", L3_134)
	L3_134:play()
	if A0_131.parentWeaponType and A0_131.parentWeaponType == weaponTypes.DEATH_HEAD and math.random(1, 10) <= 5 then
		if math.random(1, 10) <= 5 then
			timer.performWithDelay(500, function()
				local L2_151 = L2_151
				L2_151(weaponTypes[_ENV.weaponType].sounds.whisper)
			end)
		end
		L3_134 = BattleSprites.newSprite("explode_deathHead_" .. A0_131.weaponType)
		EXPLOSIONS:insert(L3_134)
		L3_134.x, L3_134.y = L1_132, L2_133 - L3_134.contentHeight / 2 - A0_131.blastRadius
		function L3_134.sprite(A0_152, A1_153)
			if A1_153.phase == "end" then
				display.remove(A1_153.sprite)
				local L3_154 = L3_154
			end
		end
		L3_134:addEventListener("sprite", L3_134)
		L3_134:play()
	end
	local L7_138 = L7_138
	L7_138 = L7_138(L3_134)
	local L12_143 = L12_143
	local L13_144 = L13_144
	local L14_145 = L14_145
	L12_143(L13_144, L14_145, L2_133, 0, false, false, true)
	local L15_146 = L15_146
	L12_143 = BEHIND_TANK
	L13_144 = L12_143
	L12_143 = L12_143.insert
	L14_145 = Particles
	L14_145 = L14_145.GetEmitter
	L15_146 = L7_138
	L14_145, L15_146 = L14_145(L15_146)
	L12_143(L13_144, L14_145, L15_146, L14_145(L15_146))
	L12_143 = FXLibrary
	L12_143 = L12_143.AttachSuperLightExplosionSmoke
	L13_144 = L7_138
	L12_143(L13_144)
	L12_143 = Particles
	L12_143 = L12_143.StartEmitter
	L13_144 = L7_138
	L12_143(L13_144)
end
mirvSpawnBlast = L0_0
