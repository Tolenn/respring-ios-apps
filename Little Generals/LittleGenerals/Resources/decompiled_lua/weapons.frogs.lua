local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = weaponTypes
L1_1 = weaponTypes
L1_1 = L1_1.LEAPFROG
L2_2 = {}
L2_2.image = "res/weapons/leapfrog/leapfrog.png"
L2_2.name = "Leapfrog"
L2_2.listImage = "leapfrog"
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.LEAPFROG
L3_3 = L3_3[L4_4]
L3_3 = L3_3.damage
L2_2.damage = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.LEAPFROG
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastRadius
L2_2.blastRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.LEAPFROG
L3_3 = L3_3[L4_4]
L3_3 = L3_3.forceRadius
L2_2.forceRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.LEAPFROG
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastForce
L2_2.blastForce = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.LEAPFROG
L3_3 = L3_3[L4_4]
L3_3 = L3_3.cost
L2_2.cost = L3_3
L2_2.triggerPlayerChange = false
L2_2.isSensor = false
L2_2.maxLeaps = 2
L3_3 = {}
L3_3.name = "fire"
L3_3.x = -35
L3_3.y = 0
L2_2.exhaustSequence = L3_3
L3_3 = {}
L4_4 = {}
L4_4.file = "res/weapons/leapfrog/leapfrog_explosion.png"
L4_4.dataFile = "res.weapons.leapfrog.leapfrog_explosion"
L4_4.startFrame = 1
L4_4.numFrames = 8
L4_4.duration = 200
L4_4.loopParam = 1
L3_3.explode1 = L4_4
L4_4 = {}
L4_4.file = "res/weapons/leapfrog/leapfinal.png"
L4_4.dataFile = "res.weapons.leapfrog.leapfinal"
L4_4.startFrame = 1
L4_4.numFrames = 7
L4_4.duration = 350
L4_4.loopParam = 1
L3_3.explode2 = L4_4
L2_2.spriteSequences = L3_3
L3_3 = {}
L3_3.fire = "res/sounds/shot.mp3"
L3_3.thrust = "res/sounds/thrust_type1.mp3"
L3_3.croak = "res/sounds/Frogcroaking.mp3"
L3_3.explode = "res/sounds/explosion.mp3"
L2_2.sounds = L3_3
function L3_3(A0_13, A1_14)
	local L4_16 = L4_16
	L4_16(weaponTypes[A0_13.weaponType].sounds.explode)
	L4_16 = frogBlast
	L4_16(A0_13)
end
L2_2.doExplosionEffect = L3_3
L3_3 = {}
L3_3.x = 19
L3_3.y = 0
L2_2.physicsCenter = L3_3
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
local L4_4[8], L12_12 = 5, L12_12
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
		local L1_22 = L1_22
		L1_22(A0_21.thrustSoundChannel)
		A0_21.thrustSoundChannel = nil
	end
	L1_22 = {}
	if not A0_21.rootWeapon then
	end
	L1_22.rootWeapon = tostring(A0_21)
	L1_22.player = A0_21.player
	L1_22.isNonPlayerWeapon = A0_21.isNonPlayerWeapon
	L1_22.x = A0_21.x
	L1_22.y = A0_21.y - 20
	L1_22.layerIndex = A0_21.layerIndex
	L1_22.maxLeaps = A0_21.maxLeaps
	L1_22.leapNum = A0_21.leapNum
	L1_22.direction = A0_21.startAngle
	explodeBomb(A0_21)
	local L2_23 = L2_23
	L2_23(L1_22)
	local L3_24 = L3_24
end
L2_2.triggerWeapon = L3_3
function L3_3(A0_25, A1_26, A2_27)
	A0_25.thrustSoundChannel = sound.playSound(weaponTypes[A0_25.weaponType].sounds.thrust)
	A0_25.startAngle = A1_26
	A0_25.startPower = A2_27
	local L4_28 = L4_28
	local L5_29 = L5_29
	L4_28(L5_29, A1_26, A2_27)
	local L6_30 = L6_30
end
L2_2.go = L3_3
function L3_3(A0_31)
	orientOnPath(A0_31)
	local L2_32 = L2_32
end
L2_2.manualPhysics = L3_3
L0_0[L1_1] = L2_2
function L0_0(A0_33)
	local L1_34, L2_35, L3_36, L4_37
	L1_34 = A0_33.leapNum
	local L7_40 = L7_40
	if not L1_34 then
		A0_33.leapNum = 1
	end
	L1_34 = A0_33.leapNum
	L2_35 = A0_33.maxLeaps
	if L1_34 > L2_35 then
		return
	end
	L1_34 = 70
	L2_35 = 10
	L3_36 = A0_33.direction
	if L3_36 < 0 then
		L2_35 = L2_35 * -1
	end
	L3_36 = 0
	L4_37 = {}
	L7_40 = A0_33.rootWeapon
	L4_37.rootWeapon = L7_40
	L7_40 = A0_33.isNonPlayerWeapon
	L4_37.isNonPlayerWeapon = L7_40
	L7_40 = A0_33.player
	L4_37.player = L7_40
	L4_37.angle = L2_35
	L7_40 = A0_33.layerIndex
	L4_37.layerIndex = L7_40
	L4_37.power = L1_34
	L7_40 = A0_33.leapNum
	L7_40 = L7_40 + 1
	L4_37.leapNum = L7_40
	L7_40 = A0_33.maxLeaps
	L4_37.maxLeaps = L7_40
	L7_40 = A0_33.x
	L4_37.x = L7_40
	L7_40 = A0_33.y
	L4_37.y = L7_40
	L7_40 = weaponTypes
	L7_40 = L7_40.LEAPFROG
	L4_37.weaponType = L7_40
	L7_40 = A0_33.leapNum
	if L7_40 < A0_33.maxLeaps then
		L4_37.triggerPlayerChange = false
	else
		L4_37.triggerPlayerChange = true
	end
	L7_40 = timer
	L7_40 = L7_40.performWithDelay
	local L6_39 = L6_39
	L7_40 = L7_40(L6_39, function(A0_41)
		local L1_42, L2_43
		L1_42 = A0_41.source
		L2_43 = L1_42.params
		local L3_44 = L3_44
		local L8_49 = L8_49
		local L9_50 = L9_50
		local L10_51 = L10_51
		local L3_44, L11_52 = L3_44(L8_49, L9_50, L10_51, L2_43.x, L2_43.y, L2_43.layerIndex, L2_43.angle, true), L11_52
		L8_49 = L2_43.rootWeapon
		L3_44.rootWeapon = L8_49
		L8_49 = L2_43.leapNum
		L3_44.leapNum = L8_49
		L8_49 = L2_43.maxLeaps
		L3_44.maxLeaps = L8_49
		L3_44.isSensor = true
		L8_49 = L2_43.isNonPlayerWeapon
		L3_44.isNonPlayerWeapon = L8_49
		L8_49 = L2_43.triggerPlayerChange
		L3_44.triggerPlayerChange = L8_49
		L8_49 = weaponTypes
		L9_50 = L3_44.weaponType
		L8_49 = L8_49[L9_50]
		L9_50 = "blastRadius"
		L10_51 = L3_44.leapNum
		L9_50 = L9_50 .. L10_51
		L8_49 = L8_49[L9_50]
		L3_44.blastRadius = L8_49
		L8_49 = L3_44.blastRadius
		if not L8_49 then
			L8_49 = weaponTypes
			L9_50 = L3_44.weaponType
			L8_49 = L8_49[L9_50]
			L8_49 = L8_49.blastRadius
			L3_44.blastRadius = L8_49
		end
		L8_49 = timer
		L8_49 = L8_49.performWithDelay
		L9_50 = 200
		function L10_51()
			local L2_54 = L2_54
			L2_54(weaponTypes[weaponTypes.LEAPFROG].sounds.croak)
		end
		L8_49(L9_50, L10_51)
		L9_50 = L3_44
		L8_49 = L3_44.go
		L10_51 = L2_43.angle
		L11_52 = L2_43.power
		L8_49(L9_50, L10_51, L11_52)
	end)
	L7_40.params = L4_37
end
explodeFrog = L0_0
function L0_0(A0_55)
	local L1_56, L2_57, L3_58, L4_59
	L1_56 = A0_55.x
	L2_57 = A0_55.y
	L3_58 = nil
	L4_59 = A0_55.leapNum
	if L4_59 then
		L4_59 = A0_55.leapNum
		L4_59 = L4_59 > A0_55.maxLeaps
	end
	if L4_59 then
		L3_58 = BattleSprites.newSprite("explode2_" .. A0_55.weaponType)
		L3_58.x, L3_58.y = L1_56, L2_57
		Particles.CreateEmitter(tostring(L3_58), L1_56, L2_57, 0, false, false, true)
		BEHIND_TANK:insert(Particles.GetEmitter((tostring(L3_58))))
		Particles.SetEmitterScale(tostring(L3_58), A0_55.blastRadius / (FXLibrary.EXPLOSION_BASE_WIDTH / 2))
		FXLibrary.AttachGenericExplosionSmoke((tostring(L3_58)))
		Particles.StartEmitter((tostring(L3_58)))
	else
		L3_58 = BattleSprites.newSprite("explode1_" .. A0_55.weaponType)
		L3_58.x, L3_58.y = L1_56, L2_57 - L3_58.contentHeight / 2 - A0_55.blastRadius
		local L10_65 = L10_65
		local L11_66 = L11_66
		local L12_67 = L12_67
		L11_66(L12_67, L1_56, L2_57, 0, false, false, true)
		local L13_68 = L13_68
		L11_66 = BEHIND_TANK
		L12_67 = L11_66
		L11_66 = L11_66.insert
		L13_68 = Particles
		L13_68 = L13_68.GetEmitter
		L13_68 = L13_68(L10_65)
		L11_66(L12_67, L13_68, L13_68(L10_65))
		L11_66 = A0_55.blastRadius
		L12_67 = FXLibrary
		L12_67 = L12_67.EXPLOSION_BASE_WIDTH
		L12_67 = L12_67 / 2
		L11_66 = L11_66 / L12_67
		L12_67 = Particles
		L12_67 = L12_67.SetEmitterScale
		L13_68 = L10_65
		L12_67(L13_68, L11_66)
		L12_67 = FXLibrary
		L12_67 = L12_67.AttachSuperLightExplosionSmoke
		L13_68 = L10_65
		L12_67(L13_68)
		L12_67 = Particles
		L12_67 = L12_67.StartEmitter
		L13_68 = L10_65
		L12_67(L13_68)
	end
	L10_65 = EXPLOSIONS
	L11_66 = L10_65
	L10_65 = L10_65.insert
	L12_67 = L3_58
	L10_65(L11_66, L12_67)
	L10_65 = A0_55.blastRadius
	L11_66 = L3_58.width
	L10_65 = L10_65 / L11_66
	L3_58.xScale = L10_65
	L3_58.yScale = L10_65
	function L11_66(A0_69, A1_70)
		if A1_70.phase == "end" then
			display.remove(A1_70.sprite)
			local L3_71 = L3_71
		end
	end
	L3_58.sprite = L11_66
	L12_67 = L3_58
	L11_66 = L3_58.addEventListener
	L13_68 = "sprite"
	L11_66(L12_67, L13_68, L3_58)
	L12_67 = L3_58
	L11_66 = L3_58.play
	L11_66(L12_67)
end
frogBlast = L0_0
