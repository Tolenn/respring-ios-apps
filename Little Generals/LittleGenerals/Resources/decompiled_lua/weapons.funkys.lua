local L0_0, L1_1, L2_2, L3_3
L0_0 = weaponTypes
L1_1 = weaponTypes
L1_1 = L1_1.FUNKY_BOMB
L2_2 = {}
L2_2.image = "res/weapons/funky/funkybomb.png"
L2_2.name = "Funky Bomb"
L2_2.listImage = "funkybomb"
L3_3 = {}
L3_3[1] = weaponTypes.FUNKY_SPAWN
L2_2.children = L3_3
L3_3 = weaponBalance
L3_3 = L3_3[weaponTypes.FUNKY_BOMB]
L3_3 = L3_3.damage
L2_2.damage = L3_3
L3_3 = weaponBalance
L3_3 = L3_3[weaponTypes.FUNKY_BOMB]
L3_3 = L3_3.blastRadius
L2_2.blastRadius = L3_3
L3_3 = weaponBalance
L3_3 = L3_3[weaponTypes.FUNKY_BOMB]
L3_3 = L3_3.forceRadius
L2_2.forceRadius = L3_3
L3_3 = weaponBalance
L3_3 = L3_3[weaponTypes.FUNKY_BOMB]
L3_3 = L3_3.blastForce
L2_2.blastForce = L3_3
L3_3 = weaponBalance
L3_3 = L3_3[weaponTypes.FUNKY_BOMB]
L3_3 = L3_3.cost
L2_2.cost = L3_3
L2_2.numSpawn = 5
L2_2.triggerPlayerChange = false
L2_2.isSensor = false
L3_3 = {}
L3_3.name = "fire"
L3_3.x = -35
L3_3.y = 0
L2_2.exhaustSequence = L3_3
L3_3 = {}
L3_3[1] = "explode1"
L3_3[2] = "explode2"
L3_3[3] = "explode3"
L3_3[4] = "explode4"
L2_2.explodeSequences = L3_3
L3_3 = {}
;({}).file = "res/weapons/funky/funkybomb_explosion1.png"
;({}).dataFile = "res.weapons.funky.funkybomb"
;({}).startFrame = 1
;({}).numFrames = 15
;({}).duration = 500
L3_3.explode1, ({}).loopParam = {}, 1
;({}).file = "res/weapons/funky/funkybomb_explosion3.png"
;({}).dataFile = "res.weapons.funky.funkybomb"
;({}).startFrame = 1
;({}).numFrames = 15
;({}).duration = 500
L3_3.explode2, ({}).loopParam = {}, 1
;({}).file = "res/weapons/funky/funkybomb_explosion3.png"
;({}).dataFile = "res.weapons.funky.funkybomb"
;({}).startFrame = 1
;({}).numFrames = 15
;({}).duration = 500
L3_3.explode3, ({}).loopParam = {}, 1
;({}).file = "res/weapons/funky/funkybomb_explosion4.png"
;({}).dataFile = "res.weapons.funky.funkybomb"
;({}).startFrame = 1
;({}).numFrames = 15
;({}).duration = 500
L3_3.explode4, ({}).loopParam = {}, 1
L2_2.spriteSequences = L3_3
L3_3 = {}
L3_3.fire = "res/sounds/shot.mp3"
L3_3.thrust = "res/sounds/funkyTime.mp3"
L3_3.explode = "res/sounds/explosion.mp3"
L2_2.sounds = L3_3
function L3_3(A0_13, A1_14)
	local L4_16 = L4_16
	L4_16(weaponTypes[A0_13.weaponType].sounds.explode)
	L4_16 = explodeFunkily
	L4_16(A0_13)
end
L2_2.doExplosionEffect = L3_3
L3_3 = {}
L3_3.x = 17
L3_3.y = 0
L2_2.physicsCenter = L3_3
L3_3 = {}
L3_3.density = densityOfABomb
L3_3.friction = 10
L3_3.bounce = 0
local L8_8 = L8_8
local L9_9 = L9_9
local L10_10 = L10_10
local L11_11 = L11_11
L8_8[1] = L9_9
L8_8[2] = L10_10
L8_8[3] = L11_11
L8_8[4] = -10
L8_8[5] = 22
L8_8[6] = 10
L8_8[7] = -5
local L8_8[8], L12_12 = 10, L12_12
L3_3.shape = L8_8
L8_8 = WEAPON_FILTER
L3_3.filter = L8_8
L2_2.physics = L3_3
function L3_3(A0_17, A1_18)
	local L3_19 = L3_19
	L3_19(A0_17, A1_18)
	local L4_20 = L4_20
end
L2_2.collision = L3_3
function L3_3(A0_21)
	local L1_22, L2_23, L3_24, L4_25, L5_26
	L1_22 = A0_21.player
	L2_23 = A0_21.x
	L3_24 = A0_21.y
	L4_25 = A0_21.layerIndex
	L5_26 = A0_21.isNonPlayerWeapon
	local L6_27 = L6_27
	local L6_27, L7_28 = L6_27(A0_21), L7_28
	L7_28 = A0_21.thrustSoundChannel
	explodeBomb(A0_21)
	local L8_29 = L8_29
	local L9_30 = L9_30
	local L10_31 = L10_31
	local L11_32 = L11_32
	local L12_33 = L12_33
	local L13_34 = L13_34
	local L14_35 = L14_35
	local L15_36 = L15_36
	local L16_37 = L16_37
	L8_29(L9_30, L10_31, L11_32, L12_33, L13_34, L14_35, L15_36, L16_37, L7_28)
	local L17_38 = L17_38
end
L2_2.triggerWeapon = L3_3
function L3_3(A0_39, A1_40, A2_41)
	({}).loops = -1
	A0_39.thrustSoundChannel = sound.playSound(weaponTypes[A0_39.weaponType].sounds.thrust, {})
	local L3_42 = L3_42
	local L4_43 = L4_43
	local L5_44 = L5_44
	L3_42(L4_43, L5_44, A2_41)
	local L6_45 = L6_45
end
L2_2.go = L3_3
function L3_3(A0_46)
	orientOnPath(A0_46)
	local L2_47 = L2_47
end
L2_2.manualPhysics = L3_3
L0_0[L1_1] = L2_2
L0_0 = weaponTypes
L1_1 = weaponTypes
L1_1 = L1_1.FUNKY_SPAWN
L2_2 = {}
L2_2.image = "res/weapons/funky/funky_child.png"
L2_2.name = "Funky Spawn"
L2_2.zeroDegree = 0
L3_3 = weaponBalance
L8_8 = weaponTypes
L8_8 = L8_8.FUNKY_SPAWN
L3_3 = L3_3[L8_8]
L3_3 = L3_3.damage
L2_2.damage = L3_3
L3_3 = weaponBalance
L8_8 = weaponTypes
L8_8 = L8_8.FUNKY_SPAWN
L3_3 = L3_3[L8_8]
L3_3 = L3_3.blastRadius
L2_2.blastRadius = L3_3
L3_3 = weaponBalance
L8_8 = weaponTypes
L8_8 = L8_8.FUNKY_SPAWN
L3_3 = L3_3[L8_8]
L3_3 = L3_3.forceRadius
L2_2.forceRadius = L3_3
L3_3 = weaponBalance
L8_8 = weaponTypes
L8_8 = L8_8.FUNKY_SPAWN
L3_3 = L3_3[L8_8]
L3_3 = L3_3.blastForce
L2_2.blastForce = L3_3
L3_3 = weaponBalance
L8_8 = weaponTypes
L8_8 = L8_8.FUNKY_SPAWN
L3_3 = L3_3[L8_8]
L3_3 = L3_3.cost
L2_2.cost = L3_3
L2_2.hideFromSelection = true
L2_2.isSensor = true
L3_3 = {}
L8_8 = densityOfABomb
L3_3.density = L8_8
L3_3.friction = 10
L3_3.bounce = 0
L3_3.radius = 5
L8_8 = WEAPON_FILTER
L3_3.filter = L8_8
L2_2.physics = L3_3
L3_3 = {}
L8_8 = "explode1"
L9_9 = "explode2"
L10_10 = "explode3"
L11_11 = "explode4"
L3_3[1] = L8_8
L3_3[2] = L9_9
L3_3[3] = L10_10
L3_3[4] = L11_11
L2_2.explodeSequences = L3_3
L3_3 = {}
L8_8 = {}
L8_8.file = "res/weapons/funky/funkybomb_explosion1.png"
L8_8.dataFile = "res.weapons.funky.funkybomb"
L8_8.startFrame = 1
L8_8.numFrames = 15
L8_8.duration = 500
L8_8.loopParam = 1
L3_3.explode1 = L8_8
L8_8 = {}
L8_8.file = "res/weapons/funky/funkybomb_explosion3.png"
L8_8.dataFile = "res.weapons.funky.funkybomb"
L8_8.startFrame = 1
L8_8.numFrames = 15
L8_8.duration = 500
L8_8.loopParam = 1
L3_3.explode2 = L8_8
L8_8 = {}
L8_8.file = "res/weapons/funky/funkybomb_explosion4.png"
L8_8.dataFile = "res.weapons.funky.funkybomb"
L8_8.startFrame = 1
L8_8.numFrames = 15
L8_8.duration = 500
L8_8.loopParam = 1
L3_3.explode3 = L8_8
L8_8 = {}
L8_8.file = "res/weapons/funky/funkybomb_explosion3.png"
L8_8.dataFile = "res.weapons.funky.funkybomb"
L8_8.startFrame = 1
L8_8.numFrames = 15
L8_8.duration = 500
L8_8.loopParam = 1
L3_3.explode4 = L8_8
L2_2.spriteSequences = L3_3
L3_3 = {}
L3_3.fire = "res/sounds/shot.mp3"
L3_3.explode = "res/sounds/explosion.mp3"
L2_2.sounds = L3_3
function L3_3(A0_48, A1_49)
	local L4_51 = L4_51
	L4_51(weaponTypes[A0_48.weaponType].sounds.explode)
	L4_51 = explodeFunkily
	L4_51(A0_48)
end
L2_2.doExplosionEffect = L3_3
function L3_3(A0_52, A1_53)
	local L3_54 = L3_54
	L3_54(A0_52, A1_53)
	local L4_55 = L4_55
end
L2_2.collision = L3_3
function L3_3(A0_56)
	if A0_56.thrustSoundChannel then
		sound.stop(A0_56.thrustSoundChannel)
		A0_56.thrustSoundChannel = nil
	end
	explodeBomb(A0_56)
	local L2_57 = L2_57
end
L2_2.triggerWeapon = L3_3
function L3_3(A0_58, A1_59, A2_60)
	local L4_61 = L4_61
	local L5_62 = L5_62
	L4_61(L5_62, A1_59, A2_60)
	local L6_63 = L6_63
end
L2_2.go = L3_3
function L3_3(A0_64)
	orientOnPath(A0_64)
	local L2_65 = L2_65
end
L2_2.manualPhysics = L3_3
L0_0[L1_1] = L2_2
function L0_0(A0_66)
	local L8_74 = math.randomseed
	L8_74(system.getTimer())
	L8_74 = math
	L8_74 = L8_74.random
	L8_74 = L8_74(1, #weaponTypes[A0_66.weaponType].explodeSequences)
	local L2_68 = L2_68
	L2_68 = L2_68(1, 360)
	local L3_69 = L3_69
	local L3_69, L4_70 = L3_69(weaponTypes[A0_66.weaponType].explodeSequences[L8_74] .. "_" .. A0_66.weaponType), L4_70
	L4_70 = L3_69
	_FOR_ = 1
	for _FORV_8_ = _FOR_, _FOR_, _FOR_ do
		EXPLOSIONS:insert(L3_69, A0_66.layerIndex + (_FORV_8_ - 1))
		L3_69.yScale, L3_69.xScale, L3_69.rotation = A0_66.blastRadius / L3_69.width / 2, A0_66.blastRadius / L3_69.width / 2, L3_69
		L3_69.x = A0_66.x
		L3_69.y = A0_66.y
		function L3_69.sprite(A0_80, A1_81)
			if A1_81.phase == "next" and A1_81.sprite.currentFrame == 4 then
				if A1_81.sprite.nextExplosion then
					A1_81.sprite.nextExplosion.alpha = 1
					A1_81.sprite.nextExplosion:play()
					A1_81.sprite.nextExplosion = nil
				end
			elseif A1_81.phase == "end" then
				local L2_82 = L2_82
				L2_82(A1_81.sprite)
				local L3_83 = L3_83
			end
		end
		L3_69:addEventListener("sprite", L3_69)
		if _FORV_8_ < #weaponTypes[A0_66.weaponType].explodeSequences then
			L8_74 = L8_74 + 1
			if L8_74 > #weaponTypes[A0_66.weaponType].explodeSequences then
				L8_74 = 1
			end
			L3_69.nextExplosionFrame = _FORV_8_ * 3
			L3_69.nextExplosion = BattleSprites.newSprite(weaponTypes[A0_66.weaponType].explodeSequences[L8_74] .. "_" .. A0_66.weaponType)
			L3_69.nextExplosion.alpha = 0
			L3_69 = L3_69.nextExplosion
		end
	end
	L9_75 = L4_70
	L7_73 = L4_70.play
	L7_73(L9_75)
end
explodeFunkily = L0_0
function L0_0(A0_84, A1_85, A2_86, A3_87, A4_88, A5_89, A6_90, A7_91, A8_92)
	local L9_93, L10_94, L11_95, L12_96, L13_97, L14_98
	L9_93 = -15
	L10_94 = 15
	L11_95 = 90
	L12_96 = 90
	L13_97 = 0
	L14_98 = math
	L14_98 = L14_98.randomseed
	L16_100 = system
	L16_100 = L16_100.getTimer
	L16_100, L17_101 = L16_100()
	L14_98(L16_100, L17_101, L16_100())
	L14_98 = 1
	L16_100 = A4_88
	L17_101 = 1
	for _FORV_17_ = L14_98, L16_100, L17_101 do
		do
			local L19_103 = L19_103
			local L20_104 = L20_104
			local L22_106 = L22_106
			L22_106 = L22_106(50 * (_FORV_17_ - 1) + L13_97 * (_FORV_17_ - 1), function(A0_107)
				local L1_108, L2_109
				L1_108 = A0_107.source
				L2_109 = L1_108.params
				local L3_110 = L3_110
				local L8_115 = L8_115
				local L9_116 = L9_116
				local L10_117 = L10_117
				local L3_110, L11_118 = L3_110(L8_115, L9_116, L10_117, L2_109.x, L2_109.y, _ENV, L19_103, true), L11_118
				L8_115 = L2_109.rootWeapon
				L3_110.rootWeapon = L8_115
				L8_115 = L2_109.thrustSoundChannel
				L3_110.thrustSoundChannel = L8_115
				L8_115 = L2_109.isNonPlayerWeapon
				L3_110.isNonPlayerWeapon = L8_115
				L8_115 = L2_109.triggerPlayerChange
				L3_110.triggerPlayerChange = L8_115
				L3_110.isSensor = true
				L9_116 = L3_110
				L8_115 = L3_110.go
				L10_117 = L19_103
				L11_118 = L20_104
				L8_115(L9_116, L10_117, L11_118)
			end)
			;({}).rootWeapon = A7_91
			;({}).isNonPlayerWeapon = A6_90
			;({}).weaponType = A3_87
			;({}).player = A0_84
			;({}).x = A1_85
			L22_106.params, ({}).y = {}, A2_86
			if _FORV_17_ == A4_88 then
				L22_106.params.triggerPlayerChange = true
				L22_106.params.thrustSoundChannel = A8_92
			else
				L22_106.params.triggerPlayerChange = false
			end
		end
	end
end
explodeFunk = L0_0
