local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = weaponTypes
L1_1 = weaponTypes
L1_1 = L1_1.DRILL
L2_2 = {}
L2_2.name = "Drill"
L2_2.listImage = "driller"
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.DRILL
L3_3 = L3_3[L4_4]
L3_3 = L3_3.damage
L2_2.damage = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.DRILL
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastRadius
L2_2.blastRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.DRILL
L3_3 = L3_3[L4_4]
L3_3 = L3_3.forceRadius
L2_2.forceRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.DRILL
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastForce
L2_2.blastForce = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.DRILL
L3_3 = L3_3[L4_4]
L3_3 = L3_3.cost
L2_2.cost = L3_3
L2_2.countdownTimer = 3000
L2_2.isSensor = true
L2_2.zeroDegree = 90
L3_3 = {}
L4_4 = {}
L4_4.file = "res/weapons/driller/drilleranimation.png"
L4_4.dataFile = "res.weapons.driller.drilleranimation"
L4_4.startFrame = 1
L4_4.numFrames = 9
L4_4.duration = 500
L4_4.loopParam = 0
L4_4.playImmediately = false
L3_3.weapon = L4_4
L2_2.spriteSequences = L3_3
L3_3 = {}
L3_3.fire = "res/sounds/shot.mp3"
L3_3.explode = "res/sounds/drillexplode.mp3"
L3_3.drilling = "res/sounds/drilling.mp3"
L3_3.thrust = "res/sounds/thrust_type1.mp3"
L2_2.sounds = L3_3
L3_3 = {}
L3_3.name = "fire"
L3_3.x = -40
L3_3.y = 0
L2_2.exhaustSequence = L3_3
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
local L4_4[8], L12_12 = 10, L12_12
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
	if A0_17.drillCircle ~= nil then
		display.remove(A0_17.drillCircle)
		A0_17.drillCircle = nil
	end
	if A0_17.parent then
		if A0_17.thrustSoundChannel then
			sound.stop(A0_17.thrustSoundChannel)
			A0_17.thrustSoundChannel = nil
		end
		if A0_17.drillingSoundChannel then
			sound.stop(A0_17.drillingSoundChannel)
			A0_17.drillingSoundChannel = nil
		end
		explodeBomb(A0_17)
		local L2_18 = L2_18
	end
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
	drill(A0_25)
	local L2_26 = L2_26
end
L2_2.manualPhysics = L3_3
L0_0[L1_1] = L2_2
function L0_0(A0_27, A1_28)
	if A1_28.other.objType ~= "rock" then
		if A1_28.other.objType == "shield" and A1_28.other.player == A0_27.player then
			return
		elseif A1_28.other.objType == "wall" or A1_28.other.objType == "tank" or A1_28.other.objType == "shield" or A1_28.other.objType == "flair" then
			if A1_28.other.objType == "flair" and A1_28.other:doDamage(A0_27.damage, A0_27.player) then
				return
			end
			A0_27:removeEventListener("collision", A0_27)
			timer.performWithDelay(1, function(A0_41)
				local L1_42
				L1_42 = A0_41.source
				L1_42 = L1_42.params
				L1_42 = L1_42.bomb
				if L1_42.drillTimer ~= nil then
					timer.cancel(L1_42.drillTimer)
				end
				if L1_42.explodeTimer ~= nil then
					timer.cancel(L1_42.explodeTimer)
				end
				local L2_43 = L2_43
				L2_43(L1_42)
				local L3_44 = L3_44
			end).params, ({}).bomb = {}, A0_27
		end
		return
	end
	setRockPointsPlayer(A0_27.player)
	if A0_27.isDrilling then
		if not A0_27.drillingSoundChannel and sound.isSoundEnabled() then
			A0_27.drillingSoundChannel = sound.playSound(weaponTypes[A0_27.weaponType].sounds.drilling)
		end
		if A0_27.emergingFromRockTimer ~= nil then
			timer.cancel(A0_27.emergingFromRockTimer)
		end
		local L2_29 = L2_29
		L2_29 = L2_29(250, function(A0_45)
			local L1_46
			L1_46 = A0_45.source
			L1_46 = L1_46.params
			L1_46 = L1_46.bomb
			L1_46.isDrilling = false
			L1_46.isAirborne = true
			if _ENV.bombSprite then
				_ENV.bombSprite:pause()
				local L2_47, L3_48 = L2_47, L3_48
			end
		end)
		A0_27.emergingFromRockTimer = L2_29
		L2_29 = A0_27.emergingFromRockTimer
		L2_29.params, ({}).bomb = {}, A0_27
		return
	end
	L2_29 = 200
	local L3_30, L4_31 = A0_27:getLinearVelocity()
	local L5_32 = L5_32
	local L5_32, L6_33 = L5_32(L3_30 ^ 2 + L4_31 ^ 2), L6_33
	L6_33 = L2_29 / L5_32
	L3_30, L4_31 = L3_30 * L6_33, L4_31 * L6_33
	A0_27.linearX = L3_30
	A0_27.linearY = L4_31
	A0_27:setLinearVelocity(L3_30, L4_31)
	A0_27.isDrilling = true
	if A0_27.bombSprite then
		A0_27.bombSprite:play()
		local L7_34 = L7_34
	end
	L7_34 = A0_27.firstDrillingAction
	if not L7_34 then
		L7_34 = 18
		A0_27.drillCircle = display.newCircle(A0_27.parent, A0_27.x, A0_27.y, L7_34)
		A0_27.drillCircle.radius = L7_34
		local L10_37 = L10_37
		local L11_38 = L11_38
		local L12_39 = L12_39
		L10_37(L11_38, L12_39, 0, 0, 0)
		local L13_40 = L13_40
		L10_37 = timer
		L10_37 = L10_37.performWithDelay
		L11_38 = A0_27.countdownTimer
		function L12_39(A0_49)
			local L1_50
			L1_50 = A0_49.source
			L1_50 = L1_50.params
			L1_50 = L1_50.bomb
			L1_50.isDrilling = false
			timer.cancel(L1_50.drillTimer)
			if L1_50.removeEventListener then
				local L4_53 = L4_53
				L4_53(L1_50, "collision", L1_50)
				local L5_54 = L5_54
			end
			L5_54 = L1_50
			L4_53 = L1_50.triggerWeapon
			L4_53(L5_54)
		end
		L10_37 = L10_37(L11_38, L12_39)
		A0_27.explodeTimer = L10_37
		L10_37 = A0_27.explodeTimer
		L11_38 = {}
		L11_38.bomb = A0_27
		L10_37.params = L11_38
		A0_27.firstDrillingAction = true
	end
end
drillCollision = L0_0
function L0_0(A0_55)
	if A0_55.isDrilling then
		local L3_58 = L3_58
		L3_58(A0_55, A0_55.linearX, A0_55.linearY)
		local L4_59 = L4_59
		A0_55.angularVelocity = 0
		L3_58 = A0_55.drillCircle
		L4_59 = A0_55.x
		L3_58.x = L4_59
		L3_58 = A0_55.drillCircle
		L4_59 = A0_55.y
		L3_58.y = L4_59
		L3_58 = timer
		L3_58 = L3_58.performWithDelay
		L4_59 = 1
		L3_58 = L3_58(L4_59, function(A0_60)
			if _ENV.drillCircle then
				local L2_61 = L2_61
				local L3_62 = L3_62
				local L4_63 = L4_63
				local L5_64 = L5_64
				local L6_65 = L6_65
				local L7_66 = L7_66
				local L8_67 = L8_67
				L2_61(L3_62, L4_63, L5_64, L6_65, L7_66, L8_67, tostring(_ENV), _ENV.weaponType)
				local L9_68 = L9_68
			end
		end)
		A0_55.drillTimer = L3_58
	end
end
drill = L0_0
