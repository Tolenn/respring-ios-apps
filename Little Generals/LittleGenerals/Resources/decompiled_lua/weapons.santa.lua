-- Decompiled & AI-Repaired from weapons.santa.lu
-- Source disassembly preserved at: disasm/weapons.santa.disasm

local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
function L0_0(A0_16)
	local L1_17 = L1_17
	L1_17 = L1_17(Weapon, A0_16.player, A0_16.spawnWeaponType, A0_16.x, A0_16.y, layerIndex, math.random(0, 359), false)
	L1_17.xScale = 0.5
	L1_17.yScale = 0.5
	require("currentBattle").trackObject(L1_17, true)
	local L4_20 = L4_20
	local L5_21 = math.random(1, 3)
	L4_20.currentFrame = L5_21
	L4_20 = tostring
	L5_21 = A0_16
	L4_20 = L4_20(L5_21)
	L1_17.rootWeapon = L4_20
	L4_20 = A0_16.thrustSoundChannel
	L1_17.thrustSoundChannel = L4_20
	L4_20 = A0_16.isNonPlayerWeapon
	L1_17.isNonPlayerWeapon = L4_20
	L1_17.engageManualPhysics = true
	L1_17.triggerPlayerChange = false
	L1_17.isSensor = true
	L4_20 = -10
	L5_21 = 15
	local L6_22 = L6_22
	local L7_23 = L7_23
	local L8_24, L9_25 = L8_24, L9_25
	local L10_26 = L10_26
	L10_26(L1_17, math.random(L4_20, L5_21), L9_25)
	local L11_27 = L11_27
end
function L1_1(A0_28)
	local L1_29, L2_30 = A0_28:getLinearVelocity()
	if not A0_28.incidentVy then
		A0_28.incidentVy = L2_30
	end
	if not A0_28.firstDrop then
		if math.abs(L2_30) <= math.abs(A0_28.incidentVy / 3) then
			_ENV(A0_28)
			A0_28.firstDrop = true
		end
	elseif not A0_28.thirdDrop then
		local L5_33 = L5_33
		if L5_33 >= math.abs(A0_28.incidentVy / 3) then
			L5_33 = _ENV
			L5_33(A0_28)
			local L4_32 = L4_32
			A0_28.thirdDrop = true
		end
	end
end
function L2_2(A0_34, A1_35)
	local L2_36, L3_37
	L2_36 = A0_34.x
	L3_37 = A0_34.y
	if not A1_35 then
		A1_35 = 1.5
	end
	sound.playSound(weaponTypes[A0_34.weaponType].sounds.explode)
	local L4_38 = L4_38
	L4_38 = L4_38("explode_" .. A0_34.weaponType)
	EXPLOSIONS:insert(L4_38, A0_34.layerIndex)
	L4_38.xScale = A1_35
	L4_38.yScale = A1_35
	L4_38.rotation = math.random(0, 359)
	L4_38.x = L2_36
	L4_38.y = L3_37
	function L4_38.sprite(A0_48, A1_49)
		if A1_49.phase == "end" then
			display.remove(A1_49.sprite)
			local L3_50 = L3_50
		end
	end
	L4_38:addEventListener("sprite", L4_38)
	L4_38:play()
	local L5_39 = L5_39
	L5_39 = L5_39(L4_38)
	local L6_40 = L6_40
	local L10_44 = L10_44
	local L11_45 = L11_45
	local L12_46 = L12_46
	L6_40(L10_44, L11_45, L12_46, 0, false, false, true)
	local L13_47 = L13_47
	L6_40 = FRONT_TANK
	L10_44 = L6_40
	L6_40 = L6_40.insert
	L11_45 = Particles
	L11_45 = L11_45.GetEmitter
	L12_46 = L5_39
	L11_45, L12_46, L13_47 = L11_45(L12_46)
	L6_40(L10_44, L11_45, L12_46, L13_47, L11_45(L12_46))
	L6_40 = A0_34.blastRadius
	L10_44 = FXLibrary
	L10_44 = L10_44.EXPLOSION_BASE_WIDTH
	L10_44 = L10_44 / 2
	L6_40 = L6_40 / L10_44
	L10_44 = Particles
	L10_44 = L10_44.SetEmitterScale
	L11_45 = L5_39
	L12_46 = L6_40
	L10_44(L11_45, L12_46)
	L10_44 = FXLibrary
	L10_44 = L10_44.AttachSantaEffect
	L11_45 = L5_39
	L10_44(L11_45)
	L10_44 = Particles
	L10_44 = L10_44.StartEmitter
	L11_45 = L5_39
	L10_44(L11_45)
end
L3_3 = weaponTypes
L4_4 = weaponTypes
L4_4 = L4_4.SANTA
L5_5 = {}
L5_5.image = "res/weapons/santa/santa_bomb.png"
L5_5.name = "S.A.N.T.A"
L5_5.listImage = "santa_bomb"
L5_5.zeroDegree = 90
L6_6 = weaponTypes
L6_6 = L6_6.SANTA_SPAWN
L5_5.spawnWeaponType = L6_6
L6_6 = weaponBalance
L6_6 = L6_6[weaponTypes.SANTA]
L6_6 = L6_6.damage
L5_5.damage = L6_6
L6_6 = weaponBalance
L6_6 = L6_6[weaponTypes.SANTA]
L6_6 = L6_6.blastRadius
L5_5.blastRadius = L6_6
L6_6 = weaponBalance
L6_6 = L6_6[weaponTypes.SANTA]
L6_6 = L6_6.forceRadius
L5_5.forceRadius = L6_6
L6_6 = weaponBalance
L6_6 = L6_6[weaponTypes.SANTA]
L6_6 = L6_6.blastForce
L5_5.blastForce = L6_6
L6_6 = weaponBalance
L6_6 = L6_6[weaponTypes.SANTA]
L6_6 = L6_6.cost
L5_5.cost = L6_6
L5_5.isExclusiveWeapon = true
L6_6 = {}
local L6_6[1], L7_7 = "SLEIGH_TANK", L7_7
L5_5.exclusiveFor = L6_6
L5_5.isInfinite = true
L5_5.triggerPlayerChange = true
L5_5.isSensor = true
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
L6_6.explode = "res/sounds/explosion2.mp3"
L6_6.thrust = "res/sounds/Ho_Ho_Ho.mp3"
L6_6.bellhit = "res/sounds/bellhit.mp3"
L5_5.sounds = L6_6
function L6_6(A0_51, A1_52)
	local L3_53 = L3_53
	L3_53(A0_51, 1.5)
	local L4_54 = L4_54
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
function L6_6(A0_55, A1_56)
	local L3_57 = L3_57
	L3_57(A0_55, A1_56)
	local L4_58 = L4_58
end
L5_5.collision = L6_6
function L6_6(A0_59)
	if A0_59.thrustSoundChannel then
		sound.stop(A0_59.thrustSoundChannel)
		A0_59.thrustSoundChannel = nil
	end
	explodeBomb(A0_59)
	local L3_61 = L3_61
	L3_61(weaponTypes[A0_59.weaponType].sounds.bellhit)
end
L5_5.triggerWeapon = L6_6
function L6_6(A0_62, A1_63, A2_64)
	A0_62.thrustSoundChannel = sound.playSound(weaponTypes[A0_62.weaponType].sounds.thrust)
	local L5_66 = L5_66
	L5_66(A0_62, A1_63, A2_64)
	local L6_67 = L6_67
	L6_67 = A0_62
	L5_66 = A0_62.getLinearVelocity
	L5_66, L6_67 = L5_66(L6_67)
	A0_62.incidentVy = L6_67
	A0_62.incidentVx = L5_66
end
L5_5.go = L6_6
function L6_6(A0_68)
	orientOnPath(A0_68)
	_ENV(A0_68)
	local L2_69 = L2_69
end
L5_5.manualPhysics = L6_6
L3_3[L4_4] = L5_5
L3_3 = weaponTypes
L4_4 = weaponTypes
L4_4 = L4_4.SANTA_SPAWN
L5_5 = {}
L5_5.name = "Santa Spawn"
L5_5.zeroDegree = 0
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.SANTA_SPAWN
L6_6 = L6_6[L7_7]
L6_6 = L6_6.damage
L5_5.damage = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.SANTA_SPAWN
L6_6 = L6_6[L7_7]
L6_6 = L6_6.blastRadius
L5_5.blastRadius = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.SANTA_SPAWN
L6_6 = L6_6[L7_7]
L6_6 = L6_6.forceRadius
L5_5.forceRadius = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.SANTA_SPAWN
L6_6 = L6_6[L7_7]
L6_6 = L6_6.blastForce
L5_5.blastForce = L6_6
L6_6 = weaponBalance
L7_7 = weaponTypes
L7_7 = L7_7.SANTA_SPAWN
L6_6 = L6_6[L7_7]
L6_6 = L6_6.cost
L5_5.cost = L6_6
L5_5.hideFromSelection = true
L5_5.trackImmediately = false
L5_5.isTracked = true
function L6_6(A0_70)
	local L1_71
	L1_71 = A0_70.bombSprite
	local L2_72 = L2_72
	local L3_73 = L3_73
	local L2_72, L4_74 = L2_72(L3_73, 3), L4_74
	L1_71.currentFrame = L2_72
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
L7_7.file = "res/weapons/santa/presents.png"
L7_7.dataFile = "res.weapons.santa.presents"
L7_7.startFrame = 1
L7_7.numFrames = 3
L7_7.duration = 2000
L7_7.loopParam = 0
L7_7.playImmediately = false
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
L6_6.explode = "res/sounds/explosion2.mp3"
L6_6.bellhit = "res/sounds/bellhit.mp3"
L6_6.thrust = "res/sounds/slidedown.mp3"
L5_5.sounds = L6_6
function L6_6(A0_75, A1_76)
	_ENV(A0_75)
	local L3_77 = L3_77
end
L5_5.doExplosionEffect = L6_6
function L6_6(A0_78, A1_79)
	local L3_80 = L3_80
	L3_80(A0_78, A1_79)
	local L4_81 = L4_81
end
L5_5.collision = L6_6
function L6_6(A0_82)
	if A0_82.thrustSoundChannel then
		sound.stop(A0_82.thrustSoundChannel)
		A0_82.thrustSoundChannel = nil
	end
	explodeBomb(A0_82)
	local L3_84 = L3_84
	L3_84(weaponTypes[A0_82.weaponType].sounds.bellhit)
end
L5_5.triggerWeapon = L6_6
function L6_6(A0_85, A1_86, A2_87)
	A0_85.thrustSoundChannel = sound.playSound(weaponTypes[A0_85.weaponType].sounds.thrust)
	A0_85.ignoreViewWeaponTracking = true
	local L4_88 = L4_88
	local L5_89 = L5_89
	L4_88(L5_89, A1_86, A2_87)
	local L6_90 = L6_90
end
L5_5.go = L6_6


-- [End of decompiled block; see disassembly for inner stripped closures]
