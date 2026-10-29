local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = weaponTypes
L1_1 = weaponTypes
L1_1 = L1_1.NUKE
L2_2 = {}
L2_2.image = "res/weapons/nuke/nuke.png"
L2_2.name = "Nuke"
L2_2.listImage = "nuke"
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.NUKE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.damage
L2_2.damage = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.NUKE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastRadius
L2_2.blastRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.NUKE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.forceRadius
L2_2.forceRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.NUKE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastForce
L2_2.blastForce = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.NUKE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.cost
L2_2.cost = L3_3
L2_2.isSensor = false
L3_3 = {}
L3_3.name = "fire"
L3_3.x = -38
L3_3.y = 0
L2_2.exhaustSequence = L3_3
L3_3 = {}
L4_4 = {}
L4_4.file = "res/weapons/nuke/bignuke.png"
L4_4.dataFile = "res.weapons.nuke.bignuke"
L4_4.startFrame = 1
L4_4.numFrames = 16
L4_4.duration = 1250
L4_4.loopParam = 1
L3_3.explode1 = L4_4
L2_2.spriteSequences = L3_3
function L3_3(A0_13, A1_14)
	local L4_16 = L4_16
	L4_16(weaponTypes[A0_13.weaponType].sounds.explode)
	L4_16 = nukeBlast
	L4_16(A0_13)
end
L2_2.doExplosionEffect = L3_3
L3_3 = {}
L4_4 = densityOfABomb
L3_3.density = L4_4
L3_3.friction = 10
L3_3.bounce = 0
L4_4 = {}
L4_4[1] = 0
L4_4[2] = -15
L4_4[3] = 27
L4_4[4] = -15
L4_4[5] = 27
L4_4[6] = 15
L4_4[7] = 0
L4_4[8] = 15
L3_3.shape = L4_4
L4_4 = WEAPON_FILTER
L3_3.filter = L4_4
L2_2.physics = L3_3
function L3_3(A0_17, A1_18)
	local L3_19 = L3_19
	L3_19(A0_17, A1_18)
	local L4_20 = L4_20
end
L2_2.collision = L3_3
function L3_3(A0_21)
	if A0_21.thrustSoundChannel then
		sound.stop(A0_21.thrustSoundChannel)
		A0_21.thrustSoundChannel = nil
	end
	explodeBomb(A0_21)
	local L2_22 = L2_22
end
L2_2.triggerWeapon = L3_3
function L3_3(A0_23, A1_24, A2_25)
	A0_23.thrustSoundChannel = sound.playSound(weaponTypes[A0_23.weaponType].sounds.thrust)
	local L4_26 = L4_26
	local L5_27 = L5_27
	L4_26(L5_27, A1_24, A2_25)
	local L6_28 = L6_28
end
L2_2.go = L3_3
function L3_3(A0_29)
	orientOnPath(A0_29)
	local L2_30 = L2_30
end
L2_2.manualPhysics = L3_3
L3_3 = {}
L3_3.fire = "res/sounds/shot.mp3"
L3_3.thrust = "res/sounds/thrust_type1.mp3"
L3_3.explode = "res/sounds/nukeexplode.mp3"
L2_2.sounds = L3_3
L0_0[L1_1] = L2_2
L0_0 = weaponTypes
L1_1 = weaponTypes
L1_1 = L1_1.BABY_NUKE
L2_2 = {}
L2_2.image = "res/weapons/nuke/nuke_baby.png"
L2_2.name = "Baby Nuke"
L2_2.listImage = "babynuke"
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.BABY_NUKE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.damage
L2_2.damage = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.BABY_NUKE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastRadius
L2_2.blastRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.BABY_NUKE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.forceRadius
L2_2.forceRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.BABY_NUKE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastForce
L2_2.blastForce = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.BABY_NUKE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.cost
L2_2.cost = L3_3
L2_2.isSensor = false
L3_3 = {}
L3_3.name = "fire"
L3_3.x = -28
L3_3.y = 0
L2_2.exhaustSequence = L3_3
L3_3 = {}
L4_4 = {}
L4_4.file = "res/weapons/nuke/nuke_explosion.png"
L4_4.dataFile = "res.weapons.nuke.nuke"
L4_4.startFrame = 1
L4_4.numFrames = 16
L4_4.duration = 1000
L4_4.loopParam = 1
L3_3.explode1 = L4_4
L2_2.spriteSequences = L3_3
function L3_3(A0_31, A1_32)
	local L4_34 = L4_34
	L4_34(weaponTypes[A0_31.weaponType].sounds.explode)
	L4_34 = nukeBlast
	L4_34(A0_31)
end
L2_2.doExplosionEffect = L3_3
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
local L4_4[8], L12_12 = 12, L12_12
L3_3.shape = L4_4
L4_4 = WEAPON_FILTER
L3_3.filter = L4_4
L2_2.physics = L3_3
function L3_3(A0_35, A1_36)
	local L3_37 = L3_37
	L3_37(A0_35, A1_36)
	local L4_38 = L4_38
end
L2_2.collision = L3_3
function L3_3(A0_39)
	if A0_39.thrustSoundChannel then
		sound.stop(A0_39.thrustSoundChannel)
		A0_39.thrustSoundChannel = nil
	end
	explodeBomb(A0_39)
	local L2_40 = L2_40
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
	local L2_48 = L2_48
end
L2_2.manualPhysics = L3_3
L3_3 = {}
L3_3.fire = "res/sounds/shot.mp3"
L3_3.thrust = "res/sounds/thrust_type1.mp3"
L3_3.explode = "res/sounds/nukeexplode.mp3"
L2_2.sounds = L3_3
L0_0[L1_1] = L2_2
function L0_0(A0_49)
	local L1_50, L2_51
	L1_50 = A0_49.x
	L2_51 = A0_49.y
	local L3_52 = L3_52
	local L5_54 = "explode1_" .. A0_49.weaponType
	L3_52 = L3_52(L5_54)
	L5_54 = L3_52
	local L6_55, L7_56 = L6_55, L7_56
	local L8_57 = L8_57
	L7_56(L8_57, L3_52, A0_49.layerIndex)
	L3_52.xScale = L6_55
	L3_52.yScale = L6_55
	L3_52.x = L1_50
	L7_56 = L3_52.contentHeight
	L7_56 = L7_56 / 2
	L7_56 = L2_51 - L7_56
	L8_57 = A0_49.blastRadius
	L7_56 = L7_56 - L8_57
	L3_52.y = L7_56
	L7_56 = 85 * L6_55
	L8_57 = A0_49.emitterName
	function L3_52.sprite(A0_66, A1_67)
		repeat
			if A1_67.sprite.currentFrame == 9 then
				Particles.CreateEmitter(_ENV, L1_50, L2_51 - L7_56, 0, false, false, true)
				Particles.SetEmitterScale(_ENV, _UPVALUE4_)
				FRONT_TANK:insert(Particles.GetEmitter(_ENV))
				FXLibrary.AttachBigNukeCloud(_ENV)
				local L4_70 = L4_70
				local L8_74 = L8_74
				local L9_75 = L9_75
				local L10_76 = L10_76
				local L11_77 = L11_77
				local L12_78 = L12_78
				local L13_79 = L13_79
				L9_75[1] = L10_76
				L9_75[2] = L11_77
				L9_75[3] = L12_78
				L9_75[4] = L13_79
				L9_75[5] = 350
				L9_75[6] = 180
				L9_75[7] = 30
				L9_75[8] = 90
				L9_75[9] = 175
				local L9_75[10], L14_80 = 0, L14_80
				L10_76 = false
				L11_77 = false
				L12_78 = false
				L4_70(L8_74, L9_75, L10_76, L11_77, L12_78)
				L4_70 = Particles
				L4_70 = L4_70.StartEmitter
				L8_74 = _ENV
				L4_70(L8_74)
				break -- pseudo-goto
			end
			L4_70 = A1_67.phase
			if L4_70 == "end" then
				L4_70 = display
				L4_70 = L4_70.remove
				L8_74 = A1_67.sprite
				L4_70(L8_74)
			end
		until true
	end
	L3_52:addEventListener("sprite", L3_52)
	L3_52:play()
	L8_57 = A0_49.emitterName .. "SmokeLeft"
	Particles.CreateEmitter(L8_57, L1_50 - 40, L2_51 + A0_49.blastRadius - 40, 0, false, false, true)
	Particles.SetEmitterScale(L8_57, A0_49.blastRadius / FXLibrary.EXPLOSION_BASE_WIDTH)
	EXPLOSIONS:insert(Particles.GetEmitter(L8_57))
	Particles.GetEmitter(L8_57).rotation = -90
	FXLibrary.AttachBigNukeCloudLeft(L8_57)
	Particles.StartEmitter(L8_57)
	L8_57 = A0_49.emitterName .. "SmokeRight"
	local L13_62 = L13_62
	local L14_63 = L14_63
	local L15_64 = L15_64
	L14_63(L15_64, L1_50 + 40, L2_51 + A0_49.blastRadius - 40, 0, false, false, true)
	local L16_65 = L16_65
	L14_63 = Particles
	L14_63 = L14_63.SetEmitterScale
	L15_64 = L8_57
	L16_65 = L13_62
	L14_63(L15_64, L16_65)
	L14_63 = EXPLOSIONS
	L15_64 = L14_63
	L14_63 = L14_63.insert
	L16_65 = Particles
	L16_65 = L16_65.GetEmitter
	L16_65 = L16_65(L8_57)
	L14_63(L15_64, L16_65, L16_65(L8_57))
	L14_63 = Particles
	L14_63 = L14_63.GetEmitter
	L15_64 = L8_57
	L14_63 = L14_63(L15_64)
	L14_63.rotation = 90
	L14_63 = FXLibrary
	L14_63 = L14_63.AttachBigNukeCloudRight
	L15_64 = L8_57
	L14_63(L15_64)
	L14_63 = Particles
	L14_63 = L14_63.StartEmitter
	L15_64 = L8_57
	L14_63(L15_64)
end
nukeBlast = L0_0
