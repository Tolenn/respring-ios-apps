local L0_0
L0_0 = weaponTypes
L5_5 = weaponTypes
L5_5 = L5_5.BIG_ROLLER
;({}).image = "res/weapons/roller.png"
;({}).name = "Big Roller"
;({}).listImage = "roller"
;({}).zeroDegree = 0
;({}).isSensor = false
;({}).countdownTimer = 3000
;({}).eagerTracking = true
;({}).damage = weaponBalance[weaponTypes.BIG_ROLLER].damage
;({}).blastRadius = weaponBalance[weaponTypes.BIG_ROLLER].blastRadius
;({}).forceRadius = weaponBalance[weaponTypes.BIG_ROLLER].forceRadius
;({}).blastForce = weaponBalance[weaponTypes.BIG_ROLLER].blastForce
;({}).cost = weaponBalance[weaponTypes.BIG_ROLLER].cost
;({}).density = densityOfABomb
;({}).friction = 200
;({}).bounce = 0
;({}).radius = 21
;({}).physics, ({}).filter = {}, WEAPON_FILTER
;({}).file = "res/weapons/roller/rollerblink2.png"
;({}).dataFile = "res.weapons.roller.rollerblink2"
;({}).startFrame = 6
;({}).numFrames = 5
;({}).duration = 500
;({}).loopParam = 0
;({}).weapon, ({}).playImmediately = {}, false
;({}).file = "res/weapons/roller/roller.png"
;({}).dataFile = "res.weapons.roller.roller"
;({}).startFrame = 1
;({}).numFrames = 14
;({}).duration = 500
;({}).spriteSequences, ({}).explode1, ({}).loopParam = {}, {}, 1
;({}).doExplosionEffect = function(A0_6, A1_7)
	explodeRoller(A0_6)
	local L3_8 = L3_8
end
;({}).collision = function(A0_9, A1_10)
	if A0_9.thrustSoundChannel then
		sound.stop(A0_9.thrustSoundChannel)
		A0_9.thrustSoundChannel = nil
	end
	if not A0_9.countdownSoundChannel then
		A0_9.countdownSoundChannel = sound.playSound(weaponTypes[A0_9.weaponType].sounds.countdown)
	end
	local L3_11 = L3_11
	L3_11(A0_9, A1_10)
	local L4_12 = L4_12
end
;({}).triggerWeapon = function(A0_13)
	if A0_13.countdownSoundChannel then
		sound.stop(A0_13.countdownSoundChannel)
		A0_13.countdownSoundChannel = nil
	end
	explodeBomb(A0_13)
	local L2_14 = L2_14
end
;({}).go = function(A0_15, A1_16, A2_17)
	A0_15.thrustSoundChannel = sound.playSound(weaponTypes[A0_15.weaponType].sounds.thrust)
	local L4_18 = L4_18
	local L5_19 = L5_19
	L4_18(L5_19, A1_16, A2_17)
	local L6_20 = L6_20
end
;({}).manualPhysics = function(A0_21)
	timespinAndExplode(A0_21)
	local L2_22 = L2_22
end
;({}).fire = "res/sounds/roller_launch.mp3"
;({}).countdown = "res/sounds/roller_countdown.mp3"
;({}).thrust = "res/sounds/roller_thrust.mp3"
L0_0[L5_5], ({}).sounds, ({}).explode = {}, {}, "res/sounds/explosion.mp3"
L0_0 = weaponTypes
L5_5 = weaponTypes
L5_5 = L5_5.BABY_ROLLER
;({}).image = "res/weapons/roller.png"
;({}).name = "Baby Roller"
;({}).listImage = "baby_roller"
;({}).zeroDegree = 0
;({}).isSensor = false
;({}).countdownTimer = 1000
;({}).eagerTracking = true
;({}).damage = weaponBalance[weaponTypes.BABY_ROLLER].damage
;({}).blastRadius = weaponBalance[weaponTypes.BABY_ROLLER].blastRadius
;({}).forceRadius = weaponBalance[weaponTypes.BABY_ROLLER].forceRadius
;({}).blastForce = weaponBalance[weaponTypes.BABY_ROLLER].blastForce
;({}).cost = weaponBalance[weaponTypes.BABY_ROLLER].cost
;({}).density = densityOfABomb
;({}).friction = 200
;({}).bounce = 0
;({}).radius = 8
;({}).physics, ({}).filter = {}, WEAPON_FILTER
;({}).file = "res/weapons/roller/rollerblink2.png"
;({}).dataFile = "res.weapons.roller.rollerblink2"
;({}).startFrame = 1
;({}).numFrames = 5
;({}).duration = 500
;({}).loopParam = 0
;({}).weapon, ({}).playImmediately = {}, false
;({}).file = "res/weapons/roller/roller.png"
;({}).dataFile = "res.weapons.roller.roller"
;({}).startFrame = 1
;({}).numFrames = 14
;({}).duration = 500
;({}).spriteSequences, ({}).explode1, ({}).loopParam = {}, {}, 1
;({}).doExplosionEffect = function(A0_23, A1_24)
	explodeRoller(A0_23)
	local L3_25 = L3_25
end
;({}).collision = function(A0_26, A1_27)
	if A0_26.thrustSoundChannel then
		sound.stop(A0_26.thrustSoundChannel)
		A0_26.thrustSoundChannel = nil
	end
	if not A0_26.countdownSoundChannel then
		A0_26.countdownSoundChannel = sound.playSound(weaponTypes[A0_26.weaponType].sounds.countdown)
	end
	local L3_28 = L3_28
	L3_28(A0_26, A1_27)
	local L4_29 = L4_29
end
;({}).triggerWeapon = function(A0_30)
	if A0_30.countdownSoundChannel then
		sound.stop(A0_30.countdownSoundChannel)
		A0_30.countdownSoundChannel = nil
	end
	explodeBomb(A0_30)
	local L2_31 = L2_31
end
;({}).go = function(A0_32, A1_33, A2_34)
	A0_32.thrustSoundChannel = sound.playSound(weaponTypes[A0_32.weaponType].sounds.thrust)
	local L4_35 = L4_35
	local L5_36 = L5_36
	L4_35(L5_36, A1_33, A2_34)
	local L6_37 = L6_37
end
;({}).manualPhysics = function(A0_38)
	timespinAndExplode(A0_38)
	local L2_39 = L2_39
end
;({}).fire = "res/sounds/roller_launch.mp3"
;({}).countdown = "res/sounds/roller_countdown.mp3"
;({}).thrust = "res/sounds/roller_thrust.mp3"
L0_0[L5_5], ({}).sounds, ({}).explode = {}, {}, "res/sounds/explosion.mp3"
L0_0 = weaponTypes
L5_5 = weaponTypes
L5_5 = L5_5.BABY_ROLLER_REVERSE
L0_0[L5_5] = {}
L0_0 = weaponTypes
L5_5 = weaponTypes
L5_5 = L5_5.BABY_ROLLER_REVERSE
L0_0 = L0_0[L5_5]
L5_5 = pairs
L5_5, _FOR_, _FOR_ = L5_5(weaponTypes[weaponTypes.BABY_ROLLER])
for _FORV_4_, _FORV_5_ in L5_5, _FOR_, _FOR_ do
	L0_0[_FORV_4_] = _FORV_5_
end
L0_0.name = "Reverse Baby"
L0_0.vectorMult = -1
L0_0.iconText = "R"
L0_0.iconTextSize = 35
L5_5 = weaponBalance
L5_5 = L5_5[weaponTypes.BABY_ROLLER_REVERSE]
L5_5 = L5_5.cost
L0_0.cost = L5_5
L5_5 = weaponTypes
L5_5[weaponTypes.BIG_ROLLER_REVERSE] = {}
L5_5 = weaponTypes
L5_5 = L5_5[weaponTypes.BIG_ROLLER_REVERSE]
L4_4 = weaponTypes[weaponTypes.BIG_ROLLER]
L2_2, L4_4, _FOR_ = L2_2(L4_4)
for _FORV_5_, _FORV_6_ in L2_2, L4_4, _FOR_ do
	L5_5[_FORV_5_] = _FORV_6_
end
L5_5.name = "Reverse Biggy"
L5_5.iconText = "R"
L5_5.iconTextSize = 45
L5_5.vectorMult = -1
L2_2 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.BIG_ROLLER_REVERSE
L2_2 = L2_2[L4_4]
L2_2 = L2_2.cost
L5_5.cost = L2_2
function L2_2(A0_40, A1_41, A2_42)
	local L3_43 = L3_43
	local L4_44 = L4_44
	L3_43, L4_44 = L3_43(L4_44, A2_42)
	local L8_48 = L8_48
	local L9_49 = L9_49
	L8_48(L9_49, L3_43, L4_44, A0_40.x, A0_40.y)
	local L10_50 = L10_50
	if 0 <= L3_43 then
		A0_40.xVector = 1
	else
		A0_40.xVector = -1
	end
	L8_48 = A0_40.vectorMult
	if L8_48 then
		L8_48 = A0_40.xVector
		L9_49 = A0_40.vectorMult
		L8_48 = L8_48 * L9_49
		A0_40.xVector = L8_48
	end
	L9_49 = A0_40
	L8_48 = A0_40.applyTorque
	L10_50 = A0_40.xVector
	L10_50 = 30 * L10_50
	L8_48(L9_49, L10_50)
end
shootRoller = L2_2
function L2_2(A0_51)
	if math.abs(A0_51.angularVelocity) < 400 then
		if LOW_RES_PHYSICS_MODE then
		end
		A0_51:applyTorque(60 * A0_51.xVector / 60)
	end
	if A0_51.allowLinearForce then
		if LOW_RES_PHYSICS_MODE then
		end
		local L3_54, L4_55 = L3_54, L4_55
		local L5_56 = L5_56
		local L6_57 = L6_57
		local L7_58 = L7_58
		L5_56(L6_57, L7_58, L4_55, A0_51.x, A0_51.y)
		local L8_59 = L8_59
	end
	L3_54 = A0_51.startTime
	if L3_54 then
		L3_54 = system
		L3_54 = L3_54.getTimer
		L3_54 = L3_54()
		L4_55 = A0_51.startTime
		L3_54 = L3_54 - L4_55
		L4_55 = A0_51.countdownTimer
		if L3_54 > L4_55 then
			L4_55 = A0_51
			L3_54 = A0_51.triggerWeapon
			L3_54(L4_55)
		end
	end
end
timespinAndExplode = L2_2
function L2_2(A0_60)
	local L3_63 = L3_63
	if A0_60.airborneTimer ~= nil then
		L3_63 = timer
		L3_63 = L3_63.cancel
		L3_63(A0_60.airborneTimer)
	end
	L3_63 = timer
	L3_63 = L3_63.performWithDelay
	local L2_62 = L2_62
	L3_63 = L3_63(L2_62, function(A0_64)
		local L1_65
		L1_65 = A0_64.source
		L1_65 = L1_65.params
		L1_65 = L1_65.bomb
		L1_65.isAirborne = true
		L1_65 = _ENV
		L1_65.isAirborne = true
	end)
	A0_60.airborneTimer = L3_63
	L3_63 = A0_60.airborneTimer
	L2_62 = {}
	L2_62.bomb = A0_60
	L3_63.params = L2_62
end
function L4_4(A0_66, A1_67)
	if A1_67.other.objType == "flair" then
		if A1_67.other:doDamage(A0_66.damage, A0_66.player) then
			return
		end
	elseif A1_67.other.objType ~= "tank" and A1_67.other.objType ~= "shield" then
		if A1_67.other.objType == "rock" or A1_67.other.objType == "wall" then
			A0_66.isAirborne = false
			_ENV(A0_66)
			A0_66.allowLinearForce = true
			if not A0_66.startTime then
				if A0_66.isSprite then
					A0_66.bombSprite:play()
				end
				A0_66:setLinearVelocity(0, 0)
				A0_66.startTime = system.getTimer()
			end
		end
		return
	elseif A1_67.other.objType == "shield" and A1_67.other.player == A0_66.player then
		return
	else
		if A1_67.other.objType == "tank" then
			A0_66.player:recordDirectHit(A0_66.weaponType)
			;({}).weaponType = weaponType
			local ({}).isAirStrikeWeapon, L7_73 = A0_66.isAirStrikeWeapon, L7_73
			L7_73(A1_67.other, A0_66.damage, A0_66.player, {})
		end
		L7_73 = A1_67.other
		A0_66.triggerObj = L7_73
	end
	L7_73 = A0_66.removeEventListener
	L7_73(A0_66, "collision", A0_66)
	L7_73 = A0_66.setLinearVelocity
	L7_73(A0_66, 0, 0)
	local L5_71 = L5_71
	L7_73 = timer
	L7_73 = L7_73.performWithDelay
	L5_71 = 10
	L7_73 = L7_73(L5_71, function(A0_74)
		local L1_75, L2_76
		L1_75 = A0_74.source
		L2_76 = L1_75.params
		local L3_77 = L3_77
		L3_77(L2_76.bomb)
		local L4_78 = L4_78
	end)
	L5_71 = {}
	L5_71.bomb = A0_66
	L7_73.params = L5_71
end
rollerCollision = L4_4
function L4_4(A0_79)
	local L1_80, L2_81
	L1_80 = A0_79.x
	L2_81 = A0_79.y
	local L3_82 = L3_82
	L3_82 = L3_82("explode1_" .. A0_79.weaponType)
	local L4_83 = L4_83
	L4_83(EXPLOSIONS, L3_82, A0_79.layerIndex)
	L4_83 = A0_79.blastRadius
	L4_83 = L4_83 / L3_82.width
	L4_83 = L4_83 / 2
	if not A0_79.xVector then
	end
	A0_79.xVector = 1
	L3_82.xScale = L4_83 * (A0_79.xVector * -1)
	L3_82.yScale = L4_83
	L3_82.rotation = math.random(0, 359)
	L3_82.x = L1_80
	L3_82.y = L2_81
	function L3_82.sprite(A0_93, A1_94)
		if A1_94.phase == "end" then
			display.remove(A1_94.sprite)
			local L3_95 = L3_95
		end
	end
	L3_82:addEventListener("sprite", L3_82)
	L3_82:play()
	local L5_84 = L5_84
	L5_84 = L5_84(L3_82)
	local L6_85 = L6_85
	local L10_89 = L10_89
	local L11_90 = L11_90
	local L12_91 = L12_91
	L6_85(L10_89, L11_90, L12_91, 0, false, false, true)
	local L13_92 = L13_92
	L6_85 = FRONT_TANK
	L10_89 = L6_85
	L6_85 = L6_85.insert
	L11_90 = Particles
	L11_90 = L11_90.GetEmitter
	L12_91 = L5_84
	L11_90, L12_91, L13_92 = L11_90(L12_91)
	L6_85(L10_89, L11_90, L12_91, L13_92, L11_90(L12_91))
	L6_85 = A0_79.blastRadius
	L10_89 = FXLibrary
	L10_89 = L10_89.EXPLOSION_BASE_WIDTH
	L10_89 = L10_89 / 2
	L6_85 = L6_85 / L10_89
	L10_89 = Particles
	L10_89 = L10_89.SetEmitterScale
	L11_90 = L5_84
	L12_91 = L6_85
	L10_89(L11_90, L12_91)
	L10_89 = FXLibrary
	L10_89 = L10_89.AttachGenericExplosionSmoke
	L11_90 = L5_84
	L10_89(L11_90)
	L10_89 = Particles
	L10_89 = L10_89.StartEmitter
	L11_90 = L5_84
	L10_89(L11_90)
end
explodeRoller = L4_4
