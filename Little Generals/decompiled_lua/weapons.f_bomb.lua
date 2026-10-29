-- Decompiled & AI-Repaired from weapons.f_bomb.lu
-- Source disassembly preserved at: disasm/weapons.f_bomb.disasm

local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
function L0_0(A0_16)
	local L1_17 = L1_17
	local L6_22 = L6_22
	local L7_23 = L7_23
	local L10_26 = L10_26
	local L1_17, L9_25 = L1_17(L6_22, L7_23, L10_26, A0_16.x, A0_16.y, layerIndex, math.random(0, 359), true), L9_25
	L1_17.xScale = 2
	L1_17.yScale = 2
	L1_17.ignoreViewWeaponTracking = true
	L6_22 = require
	L7_23 = "currentBattle"
	L6_22 = L6_22(L7_23)
	L6_22 = L6_22.trackObject
	L7_23 = L1_17
	L10_26 = true
	L6_22(L7_23, L10_26)
	L6_22 = L1_17.bombSprite
	L7_23 = math
	L7_23 = L7_23.random
	L10_26 = 1
	L9_25 = 5
	L7_23 = L7_23(L10_26, L9_25)
	L6_22.currentFrame = L7_23
	L6_22 = L1_17.bombSprite
	L7_23 = L6_22
	L6_22 = L6_22.play
	L6_22(L7_23)
	L6_22 = tostring
	L7_23 = A0_16
	L6_22 = L6_22(L7_23)
	L1_17.rootWeapon = L6_22
	L6_22 = A0_16.thrustSoundChannel
	L1_17.thrustSoundChannel = L6_22
	L6_22 = A0_16.isNonPlayerWeapon
	L1_17.isNonPlayerWeapon = L6_22
	L1_17.engageManualPhysics = true
	L1_17.triggerPlayerChange = false
	L1_17.isSensor = true
	L6_22 = sound
	L6_22 = L6_22.playSound
	L7_23 = weaponTypes
	L10_26 = A0_16.spawnWeaponType
	L7_23 = L7_23[L10_26]
	L7_23 = L7_23.sounds
	L7_23 = L7_23.thrust
	L10_26 = {}
	L10_26.fadein = 50
	L10_26.loops = -1
	L6_22 = L6_22(L7_23, L10_26)
	L1_17.thrustSoundChannel = L6_22
end
function L1_1(A0_27)
	local L1_28, L2_29 = A0_27:getLinearVelocity()
	if not A0_27.incidentVy then
		A0_27.incidentVy = L2_29
	end
	if not A0_27.firstDrop then
		if math.abs(L2_29) <= math.abs(A0_27.incidentVy / 3) then
			_ENV(A0_27)
			A0_27.firstDrop = true
		end
	elseif not A0_27.apexDrop then
		if A0_27.lastY and A0_27.y > A0_27.lastY then
			_ENV(A0_27)
			A0_27.apexDrop = true
		end
	elseif not A0_27.thirdDrop then
		local L5_32 = L5_32
		if L5_32 >= math.abs(A0_27.incidentVy / 4) then
			L5_32 = _ENV
			L5_32(A0_27)
			local L4_31 = L4_31
			A0_27.thirdDrop = true
		end
	end
end
function L2_2(A0_33, A1_34)
	local L2_35, L3_36
	L2_35 = A0_33.x
	L3_36 = A0_33.y
	if not A1_34 then
		A1_34 = 1.5
	end
	sound.playSound(weaponTypes[A0_33.weaponType].sounds.explode)
	local L4_37 = L4_37
	L4_37 = L4_37("explode_" .. A0_33.weaponType)
	EXPLOSIONS:insert(L4_37, A0_33.layerIndex)
	L4_37.xScale = A1_34
	L4_37.yScale = A1_34
	L4_37.rotation = math.random(0, 359)
	L4_37.x = L2_35
	L4_37.y = L3_36
	function L4_37.sprite(A0_47, A1_48)
		if A1_48.phase == "end" then
			display.remove(A1_48.sprite)
			local L3_49 = L3_49
		end
	end
	L4_37:addEventListener("sprite", L4_37)
	L4_37:play()
	local L5_38 = L5_38
	L5_38 = L5_38(L4_37)
	local L6_39 = L6_39
	local L10_43 = L10_43
	local L11_44 = L11_44
	local L12_45 = L12_45
	L6_39(L10_43, L11_44, L12_45, 0, false, false, true)
	local L13_46 = L13_46
	L6_39 = FRONT_TANK
	L10_43 = L6_39
	L6_39 = L6_39.insert
	L11_44 = Particles
	L11_44 = L11_44.GetEmitter
	L12_45 = L5_38
	L11_44, L12_45, L13_46 = L11_44(L12_45)
	L6_39(L10_43, L11_44, L12_45, L13_46, L11_44(L12_45))
	L6_39 = A0_33.blastRadius
	L10_43 = FXLibrary
	L10_43 = L10_43.EXPLOSION_BASE_WIDTH
	L10_43 = L10_43 / 2
	L6_39 = L6_39 / L10_43
	L10_43 = Particles
	L10_43 = L10_43.SetEmitterScale
	L11_44 = L5_38
	L12_45 = L6_39
	L10_43(L11_44, L12_45)
	L10_43 = FXLibrary
	L10_43 = L10_43.AttachGenericExplosionSmoke
	L11_44 = L5_38
	L10_43(L11_44)
	L10_43 = Particles
	L10_43 = L10_43.StartEmitter
	L11_44 = L5_38
	L10_43(L11_44)
end
L3_3 = weaponTypes
L4_4 = weaponTypes
L4_4 = L4_4.F_BOMB
L5_5 = {}
L5_5.image = "res/weapons/fbomb/f_bomb.png"
L5_5.name = "F-Bomb"
L5_5.listImage = "fbomb"
L6_6 = weaponTypes
L6_6 = L6_6.F_BOMB_SPAWN
L5_5.spawnWeaponType = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.F_BOMB
L6_6 = L6_6[L7_7]
L6_6 = L6_6.damage
L5_5.damage = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.F_BOMB
L6_6 = L6_6[L7_7]
L6_6 = L6_6.blastRadius
L5_5.blastRadius = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.F_BOMB
L6_6 = L6_6[L7_7]
L6_6 = L6_6.forceRadius
L5_5.forceRadius = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.F_BOMB
L6_6 = L6_6[L7_7]
L6_6 = L6_6.blastForce
L5_5.blastForce = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.F_BOMB
L6_6 = L6_6[L7_7]
L6_6 = L6_6.cost
L5_5.cost = L6_6
L5_5.triggerPlayerChange = true
L5_5.isSensor = true
L6_6 = {}
L6_6.name = "fire"
L6_6.x = -35
L6_6.y = 0
L5_5.exhaustSequence = L6_6
L6_6 = {}
L7_7 = {}
L7_7.file = "res/weapons/fbomb/fbomb.png"
L7_7.dataFile = "res.weapons.fbomb.fbomb"
L7_7.startFrame = 6
L7_7.numFrames = 7
L7_7.duration = 500
L7_7.loopParam = 1
L6_6.explode = L7_7
L5_5.spriteSequences = L6_6
L6_6 = {}
L6_6.fire = "res/sounds/shot.mp3"
L6_6.explode = "res/sounds/explosion.mp3"
L6_6.bleep = "res/sounds/bleep.mp3"
L5_5.sounds = L6_6
function L6_6(A0_50, A1_51)
	local L3_52 = L3_52
	L3_52(A0_50, 1.5)
	local L4_53 = L4_53
end
L5_5.doExplosionEffect = L6_6
L6_6 = {}
L6_6.x = 17
L6_6.y = 0
L5_5.physicsCenter = L6_6
L6_6 = {}
L7_7 = densityOfABomb
L6_6.density = L7_7
L6_6.friction = 10
L6_6.bounce = 0
L7_7 = {}
local L8_8 = L8_8
local L9_9 = L9_9
local L10_10 = L10_10
local L11_11 = L11_11
local L12_12 = L12_12
local L13_13 = L13_13
local L14_14 = L14_14
L7_7[1] = L8_8
L7_7[2] = L9_9
L7_7[3] = L10_10
L7_7[4] = L11_11
L7_7[5] = L12_12
L7_7[6] = L13_13
L7_7[7] = L14_14
local L7_7[8], L15_15 = 10, L15_15
L6_6.shape = L7_7
L7_7 = WEAPON_FILTER
L6_6.filter = L7_7
L5_5.physics = L6_6
function L6_6(A0_54, A1_55)
	local L3_56 = L3_56
	L3_56(A0_54, A1_55)
	local L4_57 = L4_57
end
L5_5.collision = L6_6
function L6_6(A0_58)
	if A0_58.thrustSoundChannel then
		sound.stop(A0_58.thrustSoundChannel)
		A0_58.thrustSoundChannel = nil
	end
	explodeBomb(A0_58)
	local L3_60 = L3_60
	L3_60(weaponTypes[A0_58.weaponType].sounds.bleep)
end
L5_5.triggerWeapon = L6_6
function L6_6(A0_61, A1_62, A2_63)
	local L5_65 = L5_65
	L5_65(A0_61, A1_62, A2_63)
	local L6_66 = L6_66
	L6_66 = A0_61
	L5_65 = A0_61.getLinearVelocity
	L5_65, L6_66 = L5_65(L6_66)
	A0_61.incidentVy = L6_66
	A0_61.incidentVx = L5_65
end
L5_5.go = L6_6
function L6_6(A0_67)
	orientOnPath(A0_67)
	_ENV(A0_67)
	local L2_68 = L2_68
end
L5_5.manualPhysics = L6_6
L3_3[L4_4] = L5_5
L3_3 = weaponTypes
L4_4 = weaponTypes
L4_4 = L4_4.F_BOMB_SPAWN
L5_5 = {}
L5_5.image = "res/weapons/funky/funky_child.png"
L5_5.name = "F-Bomb Spawn"
L5_5.zeroDegree = 0
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.F_BOMB_SPAWN
L6_6 = L6_6[L7_7]
L6_6 = L6_6.damage
L5_5.damage = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.F_BOMB_SPAWN
L6_6 = L6_6[L7_7]
L6_6 = L6_6.blastRadius
L5_5.blastRadius = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.F_BOMB_SPAWN
L6_6 = L6_6[L7_7]
L6_6 = L6_6.forceRadius
L5_5.forceRadius = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.F_BOMB_SPAWN
L6_6 = L6_6[L7_7]
L6_6 = L6_6.blastForce
L5_5.blastForce = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.F_BOMB_SPAWN
L6_6 = L6_6[L7_7]
L6_6 = L6_6.cost
L5_5.cost = L6_6
L5_5.hideFromSelection = true
L5_5.trackImmediately = false
L5_5.isTracked = true
function L6_6(A0_69)
	local L3_72 = L3_72
	local L4_73 = math.random(1, 5)
	L3_72.currentFrame = L4_73
	L3_72 = A0_69.bombSprite
	L4_73 = L3_72
	L3_72 = L3_72.play
	L3_72(L4_73)
end
L5_5.refreshProperties = L6_6
L5_5.isSensor = true
L6_6 = {}
L7_7 = densityOfABomb
L6_6.density = L7_7
L6_6.friction = 10
L6_6.bounce = 0
L6_6.radius = 10
L7_7 = WEAPON_FILTER
L6_6.filter = L7_7
L5_5.physics = L6_6
L6_6 = {}
L7_7 = {}
L7_7.file = "res/weapons/fbomb/fbomb.png"
L7_7.dataFile = "res.weapons.fbomb.fbomb"
L7_7.startFrame = 1
L7_7.numFrames = 5
L7_7.duration = 2000
L7_7.loopParam = 0
L7_7.playImmediately = true
L6_6.weapon = L7_7
L7_7 = {}
L7_7.file = "res/weapons/fbomb/fbomb.png"
L7_7.dataFile = "res.weapons.fbomb.fbomb"
L7_7.startFrame = 6
L7_7.numFrames = 7
L7_7.duration = 500
L7_7.loopParam = 1
L6_6.explode = L7_7
L5_5.spriteSequences = L6_6
L6_6 = {}
L6_6.fire = "res/sounds/shot.mp3"
L6_6.explode = "res/sounds/explosion2.mp3"
L6_6.bleep = "res/sounds/bleep.mp3"
L6_6.thrust = "res/sounds/f-sound.mp3"
L5_5.sounds = L6_6
function L6_6(A0_74, A1_75)
	_ENV(A0_74)
	local L3_76 = L3_76
end
L5_5.doExplosionEffect = L6_6
function L6_6(A0_77, A1_78)
	local L3_79 = L3_79
	L3_79(A0_77, A1_78)
	local L4_80 = L4_80
end
L5_5.collision = L6_6
function L6_6(A0_81)
	if A0_81.thrustSoundChannel then
		sound.stop(A0_81.thrustSoundChannel)
		A0_81.thrustSoundChannel = nil
	end
	explodeBomb(A0_81)
	local L3_83 = L3_83
	L3_83(weaponTypes[A0_81.weaponType].sounds.bleep)
end
L5_5.triggerWeapon = L6_6


-- [End of decompiled block; see disassembly for inner stripped closures]
