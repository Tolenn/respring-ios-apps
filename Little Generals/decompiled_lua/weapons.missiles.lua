local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = weaponTypes
L1_1 = weaponTypes
L1_1 = L1_1.MISSILE
L2_2 = {}
L2_2.image = "res/weapons/missiles/missile.png"
L2_2.name = "Missile"
L2_2.listImage = "missile"
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.MISSILE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.damage
L2_2.damage = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.MISSILE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastRadius
L2_2.blastRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.MISSILE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.forceRadius
L2_2.forceRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.MISSILE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastForce
L2_2.blastForce = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.MISSILE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.cost
L2_2.cost = L3_3
L3_3 = {}
L3_3.name = "fire"
L3_3.x = -40
L3_3.y = 0
L2_2.exhaustSequence = L3_3
L2_2.isSensor = false
L3_3 = {}
L4_4 = densityOfABomb
L3_3.density = L4_4
L3_3.friction = 10
L3_3.bounce = 0
L4_4 = {}
L4_4[1] = -7
L4_4[2] = -10
L4_4[3] = 30
L4_4[4] = -10
L4_4[5] = 30
L4_4[6] = 10
L4_4[7] = -7
L4_4[8] = 10
L3_3.shape = L4_4
L4_4 = WEAPON_FILTER
L3_3.filter = L4_4
L2_2.physics = L3_3
function L3_3(A0_13, A1_14)
	local L3_15 = L3_15
	L3_15(A0_13, A1_14)
	local L4_16 = L4_16
end
L2_2.collision = L3_3
function L3_3(A0_17)
	if A0_17.thrustSoundChannel then
		sound.stop(A0_17.thrustSoundChannel)
		A0_17.thrustSoundChannel = nil
	end
	explodeBomb(A0_17)
	local L2_18 = L2_18
end
L2_2.triggerWeapon = L3_3
function L3_3(A0_19, A1_20, A2_21)
	A0_19.thrustSoundChannel = sound.playSound(weaponTypes[A0_19.weaponType].sounds.thrust)
	local L4_22 = L4_22
	local L5_23 = L5_23
	L4_22(L5_23, A1_20, A2_21)
	local L6_24 = L6_24
end
L2_2.go = L3_3
function L3_3(A0_25)
	orientOnPath(A0_25)
	local L2_26 = L2_26
end
L2_2.manualPhysics = L3_3
L3_3 = {}
L3_3.fire = "res/sounds/missilefire.mp3"
L3_3.thrust = "res/sounds/thrust_type1.mp3"
L3_3.explode = "res/sounds/missileexplode.mp3"
L2_2.sounds = L3_3
L0_0[L1_1] = L2_2
L0_0 = weaponTypes
L1_1 = weaponTypes
L1_1 = L1_1.BABY_MISSILE
L2_2 = {}
L2_2.image = "res/weapons/missiles/missile_baby.png"
L3_3 = {}
L3_3.name = "fire"
L3_3.x = -25
L3_3.y = 0
L2_2.exhaustSequence = L3_3
L2_2.isSensor = false
L2_2.name = "Baby Missile"
L2_2.listImage = "babymissile"
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.BABY_MISSILE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.damage
L2_2.damage = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.BABY_MISSILE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastRadius
L2_2.blastRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.BABY_MISSILE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.forceRadius
L2_2.forceRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.BABY_MISSILE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastForce
L2_2.blastForce = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.BABY_MISSILE
L3_3 = L3_3[L4_4]
L3_3 = L3_3.cost
L2_2.cost = L3_3
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
local L4_4[8], L12_12 = 7, L12_12
L3_3.shape = L4_4
L4_4 = WEAPON_FILTER
L3_3.filter = L4_4
L2_2.physics = L3_3
function L3_3(A0_27, A1_28)
	local L3_29 = L3_29
	L3_29(A0_27, A1_28)
	local L4_30 = L4_30
end
L2_2.collision = L3_3
function L3_3(A0_31)
	if A0_31.thrustSoundChannel then
		sound.stop(A0_31.thrustSoundChannel)
		A0_31.thrustSoundChannel = nil
	end
	explodeBomb(A0_31)
	local L2_32 = L2_32
end
L2_2.triggerWeapon = L3_3
function L3_3(A0_33, A1_34, A2_35)
	A0_33.thrustSoundChannel = sound.playSound(weaponTypes[A0_33.weaponType].sounds.thrust)
	local L4_36 = L4_36
	local L5_37 = L5_37
	L4_36(L5_37, A1_34, A2_35)
	local L6_38 = L6_38
end
L2_2.go = L3_3
function L3_3(A0_39)
	orientOnPath(A0_39)
	local L2_40 = L2_40
end
L2_2.manualPhysics = L3_3
L3_3 = {}
L3_3.fire = "res/sounds/missilefire.mp3"
L3_3.thrust = "res/sounds/thrust_type1.mp3"
L3_3.explode = "res/sounds/babymissileexplode.mp3"
L2_2.sounds = L3_3
L0_0[L1_1] = L2_2
