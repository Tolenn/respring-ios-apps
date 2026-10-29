local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
function L0_0(A0_7)
	if A0_7.startTime and system.getTimer() - A0_7.startTime > A0_7.countdownTimer then
		A0_7:triggerWeapon()
		local L2_8 = L2_8
	end
end
function L1_1(A0_9, A1_10)
	A0_9.isAirborne = true
	if A1_10.other.objType == "flair" then
		if A1_10.other:doDamage(A0_9.damage, A0_9.player) then
			return
		end
	elseif A1_10.other.objType ~= "tank" and A1_10.other.objType ~= "shield" then
		if (A1_10.other.objType == "rock" or A1_10.other.objType == "wall") and not A0_9.startTime then
			if A0_9.isSprite then
				A0_9.bombSprite:play()
			end
			A0_9.startTime = system.getTimer()
		end
		return
	elseif A1_10.other.objType == "shield" and A1_10.other.player == A0_9.player then
		return
	else
		if A1_10.other.objType == "tank" then
			A0_9.player:recordDirectHit(A0_9.weaponType)
			;({}).weaponType = weaponType
			local ({}).isAirStrikeWeapon, L7_16 = A0_9.isAirStrikeWeapon, L7_16
			L7_16(A1_10.other, A0_9.damage, A0_9.player, {})
		end
		L7_16 = A1_10.other
		A0_9.triggerObj = L7_16
	end
	L7_16 = A0_9.removeEventListener
	L7_16(A0_9, "collision", A0_9)
	L7_16 = A0_9.setLinearVelocity
	L7_16(A0_9, 0, 0)
	local L5_14 = L5_14
	L7_16 = timer
	L7_16 = L7_16.performWithDelay
	L5_14 = 10
	L7_16 = L7_16(L5_14, function(A0_17)
		local L1_18, L2_19
		L1_18 = A0_17.source
		L2_19 = L1_18.params
		local L3_20 = L3_20
		L3_20(L2_19.bomb)
		local L4_21 = L4_21
	end)
	L5_14 = {}
	L5_14.bomb = A0_9
	L7_16.params = L5_14
end
function L2_2(A0_22)
	local L1_23, L2_24
	L1_23 = A0_22.x
	L2_24 = A0_22.y
	local L3_25 = L3_25
	L3_25 = L3_25("explode_" .. A0_22.weaponType)
	local L4_26 = L4_26
	L4_26(EXPLOSIONS, L3_25, A0_22.layerIndex)
	L4_26 = A0_22.blastRadius
	L4_26 = L4_26 / L3_25.width
	L4_26 = L4_26 / 2
	L3_25.xScale = L4_26
	L3_25.yScale = L4_26
	L3_25.rotation = math.random(0, 359)
	L3_25.x = L1_23
	L3_25.y = L2_24
	function L3_25.sprite(A0_36, A1_37)
		if A1_37.phase == "end" then
			display.remove(A1_37.sprite)
			local L3_38 = L3_38
		end
	end
	L3_25:addEventListener("sprite", L3_25)
	L3_25:play()
	local L5_27 = L5_27
	L5_27 = L5_27(L3_25)
	local L6_28 = L6_28
	local L10_32 = L10_32
	local L11_33 = L11_33
	local L12_34 = L12_34
	L6_28(L10_32, L11_33, L12_34, 0, false, false, true)
	local L13_35 = L13_35
	L6_28 = FRONT_TANK
	L10_32 = L6_28
	L6_28 = L6_28.insert
	L11_33 = Particles
	L11_33 = L11_33.GetEmitter
	L12_34 = L5_27
	L11_33, L12_34, L13_35 = L11_33(L12_34)
	L6_28(L10_32, L11_33, L12_34, L13_35, L11_33(L12_34))
	L6_28 = A0_22.blastRadius
	L10_32 = FXLibrary
	L10_32 = L10_32.EXPLOSION_BASE_WIDTH
	L10_32 = L10_32 / 2
	L6_28 = L6_28 / L10_32
	L10_32 = Particles
	L10_32 = L10_32.SetEmitterScale
	L11_33 = L5_27
	L12_34 = L6_28
	L10_32(L11_33, L12_34)
	L10_32 = FXLibrary
	L10_32 = L10_32.AttachGenericExplosionSmoke
	L11_33 = L5_27
	L10_32(L11_33)
	L10_32 = Particles
	L10_32 = L10_32.StartEmitter
	L11_33 = L5_27
	L10_32(L11_33)
end
explodeGrenade = L2_2
L2_2 = weaponTypes
L3_3 = weaponTypes
L3_3 = L3_3.GRENADE
L4_4 = {}
L4_4.name = "Grenade"
L4_4.listImage = "grenade"
L4_4.zeroDegree = 0
L4_4.isSensor = false
L4_4.countdownTimer = 3000
L5_5 = weaponBalance
L6_6 = weaponTypes
L6_6 = L6_6.GRENADE
L5_5 = L5_5[L6_6]
L5_5 = L5_5.damage
L4_4.damage = L5_5
L5_5 = weaponBalance
L6_6 = weaponTypes
L6_6 = L6_6.GRENADE
L5_5 = L5_5[L6_6]
L5_5 = L5_5.blastRadius
L4_4.blastRadius = L5_5
L5_5 = weaponBalance
L6_6 = weaponTypes
L6_6 = L6_6.GRENADE
L5_5 = L5_5[L6_6]
L5_5 = L5_5.forceRadius
L4_4.forceRadius = L5_5
L5_5 = weaponBalance
L6_6 = weaponTypes
L6_6 = L6_6.GRENADE
L5_5 = L5_5[L6_6]
L5_5 = L5_5.blastForce
L4_4.blastForce = L5_5
L5_5 = weaponBalance
L6_6 = weaponTypes
L6_6 = L6_6.GRENADE
L5_5 = L5_5[L6_6]
L5_5 = L5_5.cost
L4_4.cost = L5_5
L5_5 = {}
L6_6 = densityOfABomb
L5_5.density = L6_6
L5_5.friction = 200
L5_5.bounce = 0.5
L5_5.radius = 15
L6_6 = WEAPON_FILTER
L5_5.filter = L6_6
L4_4.physics = L5_5
L5_5 = {}
L6_6 = {}
L6_6.file = "res/weapons/grenade/grenadeblink.png"
L6_6.dataFile = "res.weapons.grenade.grenadeblink"
L6_6.startFrame = 1
L6_6.numFrames = 5
L6_6.duration = 300
L6_6.loopParam = 0
L6_6.playImmediately = false
L5_5.weapon = L6_6
L6_6 = {}
L6_6.file = "res/weapons/grenade/grenade.png"
L6_6.dataFile = "res.weapons.grenade.grenade"
L6_6.startFrame = 1
L6_6.numFrames = 7
L6_6.duration = 400
L6_6.loopParam = 1
L5_5.explode = L6_6
L4_4.spriteSequences = L5_5
function L5_5(A0_39, A1_40)
	local L4_42 = L4_42
	L4_42(weaponTypes[A0_39.weaponType].sounds.explode)
	L4_42 = explodeGrenade
	L4_42(A0_39)
end
L4_4.doExplosionEffect = L5_5
function L5_5(A0_43, A1_44)
	if not A0_43.countdownSoundChannel then
		A0_43.countdownSoundChannel = sound.playSound(weaponTypes[A0_43.weaponType].sounds.countdown)
	end
	local L3_45 = L3_45
	L3_45(A0_43, A1_44)
	local L4_46 = L4_46
end
L4_4.collision = L5_5
function L5_5(A0_47)
	if A0_47.countdownSoundChannel then
		sound.stop(A0_47.countdownSoundChannel)
		A0_47.countdownSoundChannel = nil
	end
	explodeBomb(A0_47)
	local L2_48 = L2_48
end
L4_4.triggerWeapon = L5_5
function L5_5(A0_49, A1_50, A2_51)
	local L4_52 = L4_52
	local L5_53 = L5_53
	L4_52(L5_53, A1_50, A2_51)
	local L6_54 = L6_54
end
L4_4.go = L5_5
function L5_5(A0_55)
	_ENV(A0_55)
	local L2_56 = L2_56
end
L4_4.manualPhysics = L5_5
L5_5 = {}
L5_5.fire = "res/sounds/grenade_launch.mp3"
L5_5.countdown = "res/sounds/grenade_tick.mp3"
L5_5.explode = "res/sounds/grenade_explosion.mp3"
L4_4.sounds = L5_5
L2_2[L3_3] = L4_4
