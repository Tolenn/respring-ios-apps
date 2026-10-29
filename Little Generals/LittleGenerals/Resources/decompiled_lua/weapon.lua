-- Decompiled & AI-Repaired from weapon.lu
-- Source disassembly preserved at: disasm/weapon.disasm

require("physicsGroups")
densityOfABomb = 2
BOMB_WEIGHT = 1500
SMOKE_WIDTH = 10
;({}).file = "res/weapons/exhaust/exhaust.png"
;({}).dataFile = "res.weapons.exhaust.exhaust"
;({}).startFrame = 1
;({}).numFrames = 3
;({}).duration = 250
;({}).fire, ({}).loopParam = {}, -2
;({}).file = "res/weapons/exhaust/exhaust.png"
;({}).dataFile = "res.weapons.exhaust.exhaust"
;({}).startFrame = 4
;({}).numFrames = 4
;({}).duration = 400
;({}).smoke, ({}).loopParam = {}, -2
;({}).file = "res/weapons/bigexplosionA.png"
;({}).dataFile = "res.weapons.bigexplosionA"
;({}).startFrame = 1
;({}).numFrames = 6
;({}).duration = 300
GenericWeaponSequences, ({}).spriteSequences, ({}).explode1, ({}).loopParam = {}, {}, {}, 1
;({}).triggerPlayerChange = true
;({}).objType = "bomb"
;({}).zeroDegree = 90
;({}).isBullet = true
;({}).isAirborne = true
;({}).isSensor = true
;({}).countdownTimer = 0
;({}).recoil = true
;({}).hideFromSelection = false
;({}).damage = 0
;({}).shield = 0
;({}).blastRadius = 0
;({}).blastForce = 0
;({}).forceRadius = 0
;({}).trackImmediately = true
;({}).doExplosionEffect = function(A0_13, A1_14)
	local L2_15, L3_16, L4_17, L5_18
	L2_15 = A0_13
	L3_16 = L2_15.emitterName
	L4_17 = L2_15.x
	L5_18 = L2_15.y
	local L6_19 = L6_19
	L6_19(L3_16, L4_17, L5_18, 0, false, false, true)
	local L13_26 = L13_26
	L6_19 = L2_15.blastRadius
	L13_26 = FXLibrary
	L13_26 = L13_26.EXPLOSION_BASE_WIDTH
	L6_19 = L6_19 / L13_26
	L13_26 = Particles
	L13_26 = L13_26.SetEmitterScale
	L13_26(L3_16, L6_19)
	L13_26 = FRONT_TANK
	L13_26 = L13_26.insert
	L13_26(L13_26, Particles.GetEmitter(L3_16))
	L13_26 = FXLibrary
	L13_26 = L13_26.AttachWeaponExlpode
	L13_26(L3_16)
	L13_26 = Particles
	L13_26 = L13_26.StartEmitter
	L13_26(L3_16)
	L13_26 = L2_15.weaponType
	if L13_26 then
		L13_26 = weaponTypes
		L13_26 = L13_26[L2_15.weaponType]
		if L13_26 then
			L13_26 = weaponTypes
			L13_26 = L13_26[L2_15.weaponType]
			L13_26 = L13_26.sounds
			if L13_26 then
				L13_26 = weaponTypes
				L13_26 = L13_26[L2_15.weaponType]
				L13_26 = L13_26.sounds
				L13_26 = L13_26.explode
				if L13_26 then
					L13_26 = sound
					L13_26 = L13_26.playSound
					L13_26(weaponTypes[L2_15.weaponType].sounds.explode)
				end
			end
		end
	end
	L13_26 = BattleSprites
	L13_26 = L13_26.newSprite
	local L13_26, L8_21 = L13_26("explode1_generic"), L8_21
	L8_21 = A0_13.blastRadius
	L8_21 = L8_21 / L13_26.width
	L8_21 = L8_21 / 2
	L13_26.rotation = math.random(0, 359)
	L13_26.xScale, L13_26.yScale = L8_21, L8_21
	EXPLOSIONS:insert(L13_26)
	L13_26.x, L13_26.y = L4_17, L5_18
	function L13_26.sprite(A0_27, A1_28)
		if A1_28.phase == "end" then
			display.remove(A1_28.sprite)
			local L3_29 = L3_29
		end
	end
	local L11_24 = L11_24
	L11_24(L13_26, "sprite", L13_26)
	local L12_25 = L12_25
	L12_25 = L13_26
	L11_24 = L13_26.play
	L11_24(L12_25)
end


-- [End of decompiled block; see disassembly for inner stripped closures]
