-- Decompiled & AI-Repaired from weapons.pumpkinpatch.lu
-- Source disassembly preserved at: disasm/weapons.pumpkinpatch.disasm

local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
function L0_0(A0_7)
	local L1_8, L3_10 = L1_8, A0_7.player
	L1_8(L3_10)
	L1_8 = A0_7.x
	L3_10 = A0_7.y
	EXPLOSIONS:insert((BattleSprites.newSprite("explode_" .. A0_7.weaponType)))
	BattleSprites.newSprite("explode_" .. A0_7.weaponType).x, BattleSprites.newSprite("explode_" .. A0_7.weaponType).y = L1_8, L3_10 - BattleSprites.newSprite("explode_" .. A0_7.weaponType).contentHeight / 2
	BattleSprites.newSprite("explode_" .. A0_7.weaponType).sprite = function(A0_15, A1_16)
		if A1_16.phase == "end" then
			display.remove(A1_16.sprite)
			local L3_17 = L3_17
		end
	end
	local L6_13 = L6_13
	BattleSprites.newSprite("explode_" .. A0_7.weaponType):addEventListener("sprite", (BattleSprites.newSprite("explode_" .. A0_7.weaponType)))
	local L7_14 = L7_14
	L7_14 = L6_13.play
	L7_14(L6_13)
end
function L1_1(A0_18)
	local L1_19, L2_20
	L1_19 = activeWeapons
	local L1_19[A0_18], L6_24, L10_28 = nil, L6_24, L10_28
	L1_19 = A0_18.x
	L2_20 = A0_18.y
	L6_24 = doExplosionRadialDamage
	L10_28 = A0_18
	L6_24(L10_28)
	L6_24 = doExplosionFX
	L10_28 = A0_18
	L6_24(L10_28)
	L6_24 = math
	L6_24 = L6_24.random
	L10_28 = 6
	local L6_24, L5_23 = L6_24(L10_28, 10), L5_23
	L10_28 = 200
	L5_23 = {}
	;({}).x = L1_19
	;({})[1] = L2_20
	if not A0_18.isSpawn then
		A0_18:updateShotData()
		_FOR_ = 1
		local L9_27 = L9_27
		for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
			timer.performWithDelay(L10_28 * _FORV_10_, function(A0_32)
				local L1_33
				L1_33 = A0_32.source
				L1_33 = L1_33.params
				local L2_34 = L2_34
				local L7_39 = L7_39
				local L8_40 = L8_40
				local L9_41 = L9_41
				local L2_34, L10_42 = L2_34(L7_39, L8_40, L9_41, _ENV, L2_20, nil, 0, true), L10_42
				L2_34.isSpawn = true
				L8_40 = L2_34
				L7_39 = L2_34.removeEventListener
				L9_41 = "collision"
				L10_42 = L2_34
				L7_39(L8_40, L9_41, L10_42)
				L7_39 = L2_34.bombSprite
				L8_40 = L7_39
				L7_39 = L7_39.play
				L7_39(L8_40)
				L7_39 = timer
				L7_39 = L7_39.performWithDelay
				L8_40 = 2000
				function L9_41()
					_ENV:triggerWeapon()
					local L1_43 = L1_43
				end
				L7_39(L8_40, L9_41)
			end).params, ({}).player = {}, A0_18.player
		end
		L13_31 = timer
		L13_31 = L13_31.performWithDelay
		L13_31 = L13_31(4000 + L10_28 * L6_24, function(A0_44)
			playerTurnEnd()
		end)
	end
	L13_31 = display
	L13_31 = L13_31.remove
	L13_31(A0_18)
	A0_18 = nil
end
L2_2 = weaponTypes
L3_3 = weaponTypes
L3_3 = L3_3.PUMPKIN
L4_4 = {}
L4_4.name = "Pumpkin Patch"
L4_4.pluralName = "Pumpkin Patches"
L4_4.listImage = "pumpkinbomb"
L4_4.listImageYoffset = -5
L4_4.listImageButtonScale = 0.7
L4_4.isSensor = false
L5_5 = weaponBalance
L5_5 = L5_5[weaponTypes.PUMPKIN]
L5_5 = L5_5.rockCount
L4_4.rockCount = L5_5
L5_5 = weaponBalance
L5_5 = L5_5[weaponTypes.PUMPKIN]
L5_5 = L5_5.damage
L4_4.damage = L5_5
L5_5 = weaponBalance
L5_5 = L5_5[weaponTypes.PUMPKIN]
L5_5 = L5_5.blastRadius
L4_4.blastRadius = L5_5
L5_5 = weaponBalance
L5_5 = L5_5[weaponTypes.PUMPKIN]
L5_5 = L5_5.forceRadius
L4_4.forceRadius = L5_5
L5_5 = weaponBalance
L5_5 = L5_5[weaponTypes.PUMPKIN]
L5_5 = L5_5.blastForce
L4_4.blastForce = L5_5
L4_4.isExclusiveWeapon = true
L5_5 = {}
local L5_5[1], L6_6 = "PUMPKIN_TANK", L6_6
L4_4.exclusiveFor = L5_5
L4_4.isInfinite = true
L5_5 = {}
L6_6 = {}
L6_6.file = "res/weapons/pumpkin/pumpkin.png"
L6_6.dataFile = "res.weapons.pumpkin.pumpkin"
L6_6.startFrame = 1
L6_6.numFrames = 5
L6_6.duration = 250
L6_6.loopParam = -2
L6_6.playImmediately = true
L5_5.weapon = L6_6
L6_6 = {}
L6_6.file = "res/weapons/pumpkin/pumpkin.png"
L6_6.dataFile = "res.weapons.pumpkin.pumpkin"
L6_6.startFrame = 6
L6_6.numFrames = 6
L6_6.duration = 500
L6_6.loopParam = 1
L5_5.explode = L6_6
L4_4.spriteSequences = L5_5
L5_5 = {}
L6_6 = densityOfABomb
L5_5.density = L6_6
L5_5.friction = 10
L5_5.bounce = 0
L5_5.radius = 20
L6_6 = WEAPON_FILTER
L5_5.filter = L6_6
L4_4.physics = L5_5
function L5_5(A0_45, A1_46)
	local L3_47 = L3_47
	L3_47(A0_45, A1_46)
	local L4_48 = L4_48
end
L4_4.collision = L5_5
function L5_5(A0_49, A1_50)
	_ENV(A0_49)
	local L3_51 = L3_51
end
L4_4.doExplosionEffect = L5_5
function L5_5(A0_52)
	if A0_52.thrustSoundChannel then
		sound.stop(A0_52.thrustSoundChannel)
		A0_52.thrustSoundChannel = nil
	end
	local L3_54 = L3_54
	L3_54(weaponTypes[A0_52.weaponType].sounds.explode)
	L3_54 = _ENV
	L3_54(A0_52)
end
L4_4.triggerWeapon = L5_5
function L5_5(A0_55, A1_56, A2_57)
	A0_55.thrustSoundChannel = sound.playSound(weaponTypes[A0_55.weaponType].sounds.thrust)
	local L3_58 = L3_58
	L3_58(A0_55, A1_56, A2_57)
	L3_58 = {}
	L3_58[1] = -1
	L3_58[2] = 1
	local L4_59 = L4_59
	local L5_60 = L5_60
	L4_59 = L4_59(L5_60, #L3_58)
	L4_59 = L3_58[L4_59]
	L5_60 = 75 * L4_59
	local L6_61 = L6_61
	local L7_62 = L7_62
	local L6_61, L8_63 = L6_61(L7_62, 50), L8_63
	L6_61 = L6_61 * L4_59
	L5_60 = L5_60 + L6_61
	A0_55.angularVelocity = L5_60
end
L4_4.go = L5_5


-- [End of decompiled block; see disassembly for inner stripped closures]
