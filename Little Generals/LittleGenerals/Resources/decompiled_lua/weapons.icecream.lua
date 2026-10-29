local L0_0, L1_1, L2_2, L3_3, L4_4
function L0_0(A0_14)
	local L1_15, L2_16
	L1_15 = A0_14.x
	L2_16 = A0_14.y
	local L3_17 = L3_17
	L3_17 = L3_17("explode_" .. A0_14.weaponType)
	local L4_18 = L4_18
	L4_18(EXPLOSIONS, L3_17, A0_14.layerIndex)
	L4_18 = A0_14.blastRadius
	L4_18 = L4_18 / L3_17.width
	L4_18 = L4_18 / 2
	L3_17.xScale, L3_17.yScale = L4_18, L4_18
	L3_17.rotation = math.random(0, 359)
	L3_17.x, L3_17.y = L1_15, L2_16
	function L3_17.sprite(A0_23, A1_24)
		if A1_24.phase == "end" then
			display.remove(A1_24.sprite)
			local L3_25 = L3_25
		end
	end
	local L7_21 = L7_21
	L7_21(L3_17, "sprite", L3_17)
	local L8_22 = L8_22
	L8_22 = L3_17
	L7_21 = L3_17.play
	L7_21(L8_22)
end
L1_1 = weaponTypes
L2_2 = weaponTypes
L2_2 = L2_2.ICECREAM
L3_3 = {}
L3_3.name = "Ice Cream"
L3_3.listImage = "icecream"
L4_4 = weaponBalance
L4_4 = L4_4[weaponTypes.ICECREAM]
L4_4 = L4_4.damage
L3_3.damage = L4_4
L4_4 = weaponBalance
L4_4 = L4_4[weaponTypes.ICECREAM]
L4_4 = L4_4.blastRadius
L3_3.blastRadius = L4_4
L4_4 = weaponBalance
L4_4 = L4_4[weaponTypes.ICECREAM]
L4_4 = L4_4.forceRadius
L3_3.forceRadius = L4_4
L4_4 = weaponBalance
L4_4 = L4_4[weaponTypes.ICECREAM]
L4_4 = L4_4.blastForce
L3_3.blastForce = L4_4
L4_4 = weaponBalance
L4_4 = L4_4[weaponTypes.ICECREAM]
L4_4 = L4_4.cost
L3_3.cost = L4_4
L3_3.isExclusiveWeapon = true
L4_4 = {}
local L4_4[1], L5_5 = "ICECREAM_TRUCK", L5_5
L3_3.exclusiveFor = L4_4
L3_3.isInfinite = true
L4_4 = {}
L5_5 = {}
L5_5.file = "res/weapons/icecream/icecreamshot.png"
L5_5.dataFile = "res.weapons.icecream.icecreamshot"
L5_5.startFrame = 1
L5_5.numFrames = 6
L5_5.duration = 300
L5_5.loopParam = 0
L5_5.playImmediately = true
L4_4.weapon = L5_5
L5_5 = {}
L5_5.file = "res/weapons/icecream/icecreamexplo.png"
L5_5.dataFile = "res.weapons.icecream.icecreamexplo"
L5_5.startFrame = 1
L5_5.numFrames = 7
L5_5.duration = 500
L5_5.loopParam = 1
L4_4.explode = L5_5
L3_3.spriteSequences = L4_4
function L4_4(A0_26, A1_27)
	local L4_29 = L4_29
	L4_29(weaponTypes[A0_26.weaponType].sounds.explode)
	L4_29 = _ENV
	L4_29(A0_26)
end
L3_3.doExplosionEffect = L4_4
L3_3.isSensor = false
L4_4 = {}
L5_5 = densityOfABomb
L4_4.density = L5_5
L4_4.friction = 10
L4_4.bounce = 0
L5_5 = {}
local L6_6 = L6_6
local L7_7 = L7_7
local L8_8 = L8_8
local L9_9 = L9_9
local L10_10 = L10_10
local L11_11 = L11_11
local L12_12 = L12_12
L5_5[1] = L6_6
L5_5[2] = L7_7
L5_5[3] = L8_8
L5_5[4] = L9_9
L5_5[5] = L10_10
L5_5[6] = L11_11
L5_5[7] = L12_12
local L5_5[8], L13_13 = 10, L13_13
L4_4.shape = L5_5
L5_5 = WEAPON_FILTER
L4_4.filter = L5_5
L3_3.physics = L4_4
function L4_4(A0_30, A1_31)
	local L3_32 = L3_32
	L3_32(A0_30, A1_31)
	local L4_33 = L4_33
end
L3_3.collision = L4_4
function L4_4(A0_34)
	if A0_34.thrustSoundChannel then
		sound.stop(A0_34.thrustSoundChannel)
		A0_34.thrustSoundChannel = nil
	end
	explodeBomb(A0_34)
	local L2_35 = L2_35
end
L3_3.triggerWeapon = L4_4
function L4_4(A0_36, A1_37, A2_38)
	A0_36.thrustSoundChannel = sound.playSound(weaponTypes[A0_36.weaponType].sounds.thrust)
	local L4_39 = L4_39
	local L5_40 = L5_40
	L4_39(L5_40, A1_37, A2_38)
	local L6_41 = L6_41
end
L3_3.go = L4_4
function L4_4(A0_42)
	orientOnPath(A0_42)
	local L2_43 = L2_43
end
L3_3.manualPhysics = L4_4
L4_4 = {}
L4_4.fire = "res/sounds/icecream_shoot.mp3"
L4_4.thrust = "res/sounds/drips.mp3"
L4_4.explode = "res/sounds/splat2.mp3"
L3_3.sounds = L4_4
L1_1[L2_2] = L3_3
