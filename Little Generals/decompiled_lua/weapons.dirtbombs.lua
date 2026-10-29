local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
L1_1 = weaponTypes
L2_2 = weaponTypes
L2_2 = L2_2.SAND_BOMB
L3_3 = {}
L3_3.image = "res/weapons/dirtbomb/dirt_bomb.png"
L3_3.name = "Sand Bomb"
L3_3.listImage = "dirtbomb"
L4_4 = weaponBalance
L5_5 = weaponTypes
L5_5 = L5_5.SAND_BOMB
L4_4 = L4_4[L5_5]
L4_4 = L4_4.rockCount
L3_3.rockCount = L4_4
L4_4 = weaponBalance
L5_5 = weaponTypes
L5_5 = L5_5.SAND_BOMB
L4_4 = L4_4[L5_5]
L4_4 = L4_4.damage
L3_3.damage = L4_4
L4_4 = weaponBalance
L5_5 = weaponTypes
L5_5 = L5_5.SAND_BOMB
L4_4 = L4_4[L5_5]
L4_4 = L4_4.blastRadius
L3_3.blastRadius = L4_4
L4_4 = weaponBalance
L5_5 = weaponTypes
L5_5 = L5_5.SAND_BOMB
L4_4 = L4_4[L5_5]
L4_4 = L4_4.forceRadius
L3_3.forceRadius = L4_4
L4_4 = weaponBalance
L5_5 = weaponTypes
L5_5 = L5_5.SAND_BOMB
L4_4 = L4_4[L5_5]
L4_4 = L4_4.blastForce
L3_3.blastForce = L4_4
L4_4 = weaponBalance
L5_5 = weaponTypes
L5_5 = L5_5.SAND_BOMB
L4_4 = L4_4[L5_5]
L4_4 = L4_4.cost
L3_3.cost = L4_4
L3_3.isSensor = false
L4_4 = {}
L4_4.name = "fire"
L4_4.x = -32
L4_4.y = 0
L3_3.exhaustSequence = L4_4
L4_4 = {}
L5_5 = {}
L5_5.file = "res/weapons/dirtbomb/sandbomb.png"
L5_5.dataFile = "res.weapons.dirtbomb.sandbomb"
L5_5.startFrame = 1
L5_5.numFrames = 6
L5_5.duration = 300
L5_5.loopParam = 1
L4_4.explode1 = L5_5
L3_3.spriteSequences = L4_4
L4_4 = {}
L4_4.fire = "res/sounds/shot.mp3"
L4_4.thrust = "res/sounds/thrust_type1.mp3"
L4_4.impact = "res/sounds/sandbomb_impact.mp3"
L3_3.sounds = L4_4
function L4_4(A0_14, A1_15)
	sandBurst(A0_14)
	local L3_16 = L3_16
end
L3_3.doExplosionEffect = L4_4
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
function L4_4(A0_17, A1_18)
	local L3_19 = L3_19
	L3_19(A0_17, A1_18)
	local L4_20 = L4_20
end
L3_3.collision = L4_4
function L4_4(A0_21)
	if A0_21.thrustSoundChannel then
		sound.stop(A0_21.thrustSoundChannel)
		A0_21.thrustSoundChannel = nil
	end
	local L3_23 = L3_23
	L3_23(weaponTypes[A0_21.weaponType].sounds.impact)
	L3_23 = explodeSandBomb
	L3_23(A0_21)
end
L3_3.triggerWeapon = L4_4
function L4_4(A0_24, A1_25, A2_26)
	A0_24.thrustSoundChannel = sound.playSound(weaponTypes[A0_24.weaponType].sounds.thrust)
	local L4_27 = L4_27
	local L5_28 = L5_28
	L4_27(L5_28, A1_25, A2_26)
	local L6_29 = L6_29
end
L3_3.go = L4_4
function L4_4(A0_30)
	orientOnPath(A0_30)
	local L2_31 = L2_31
end
L3_3.manualPhysics = L4_4
L1_1[L2_2] = L3_3
function L1_1(A0_32)
	local L3_35, L6_38, L10_42, L13_45 = L3_35, A0_32.player, L10_42, L13_45
	L3_35(L6_38)
	L3_35 = activeWeapons
	L3_35[A0_32] = nil
	L3_35 = doExplosionFX
	L6_38 = A0_32
	L3_35(L6_38)
	L3_35 = ROCKINFO
	L3_35 = L3_35.MINIMUM_ROCK_SIZE
	L3_35 = L3_35 / 0.0625
	L6_38 = A0_32.x
	L10_42 = A0_32.y
	L13_45 = A0_32.updateShotData
	L13_45(A0_32)
	L13_45 = A0_32.rockCount
	_FOR_ = 1
	for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
		timer.performWithDelay(100 * _FORV_10_, function(A0_46)
			local L1_47, L2_48
			L1_47 = A0_46.source
			L2_48 = L1_47.params
			local L3_49, L4_50 = L3_49, L4_50
			local L5_51 = L5_51
			L3_49 = L3_49(L4_50, L5_51, _ENV, L4_36, ROCKINFO.MINIMUM_ROCK_SIZE + math.random() * ROCKINFO.MINIMUM_ROCK_SIZE * 1 / (L1_33 * L1_33), 0, "dynamic", "plain")
			L3_49.suspendRockCollisions = true
			L4_50 = _ENV
			L5_51 = _UPVALUE3_
			L4_50 = L4_50 + L5_51
			L4_50 = L4_50 - 1
			L5_51 = L5_37
			L5_51 = L5_51 / 2
			L5_51 = L5_51 * L1_33
			L4_50 = L4_50 - L5_51
			L5_51 = L1_33
			L5_51 = 3 * L5_51
			if math.round(math.random(1, 2)) % 2 == 0 then
				L4_50 = -L4_50
			end
			if LOW_RES_PHYSICS_MODE then
				L4_50 = L4_50 / 32
				L5_51 = L5_51 / 32
			end
			local L9_55 = L9_55
			local L10_56 = L10_56
			L9_55(L10_56, L4_50, L5_51, _ENV, L4_36)
			local L11_57 = L11_57
			L9_55 = table
			L9_55 = L9_55.insert
			L10_56 = _UPVALUE5_
			L11_57 = L3_49
			L9_55(L10_56, L11_57)
		end).params, ({}).bomb = {}, A0_32
		local L12_44 = L12_44
	end
	timer.performWithDelay(2000 + L12_44 * L13_45, function(A0_58)
		local L1_59, L2_60
		L1_59 = A0_58.source
		L2_60 = L1_59.params
		L6_64 = 1
		_FOR_ = 1
		for _FORV_6_ = L6_64, _FOR_, _FOR_ do
			L2_60.rocks[_FORV_6_].suspendRockCollisions = nil
		end
		L6_64 = playerTurnEnd
		L6_64()
	end).params, ({}).rocks = {}, {}
	local L8_40 = L8_40
	display.remove(A0_32)
	local L9_41 = L9_41
	A0_32 = nil
end
explodeSandBomb = L1_1
function L1_1(A0_66)
	local L1_67, L2_68
	L1_67 = A0_66.x
	L2_68 = A0_66.y
	local L3_69 = L3_69
	L3_69 = L3_69("explode1_" .. A0_66.weaponType)
	EXPLOSIONS:insert(L3_69)
	L3_69.x, L3_69.y = L1_67, L2_68
	function L3_69.sprite(A0_74, A1_75)
		if A1_75.phase == "end" then
			display.remove(A1_75.sprite)
			local L3_76 = L3_76
		end
	end
	local L6_72 = L6_72
	L6_72(L3_69, "sprite", L3_69)
	local L7_73 = L7_73
	L7_73 = L3_69
	L6_72 = L3_69.play
	L6_72(L7_73)
end
sandBurst = L1_1
