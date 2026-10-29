-- Decompiled & AI-Repaired from weapons.napalm.lu
-- Source disassembly preserved at: disasm/weapons.napalm.disasm

local L0_0, L1_1
L0_0 = {}
L0_0.NAPALM_SPAWN = 10001
L0_0.HOT_NAPALM_SPAWN = 10002
napalm = L0_0
L0_0 = 8
function L1_1()
	local L0_16
	L0_16 = {}
	L3_19 = weaponTypes
	L3_19 = L3_19.NAPALM
	L4_20 = weaponTypes
	L4_20 = L4_20.HOT_NAPALM
	L0_16[1] = L3_19
	L0_16[2] = L4_20
	L3_19 = 1
	L4_20 = #L0_16
	L5_21 = 1
	for _FORV_4_ = L3_19, L4_20, L5_21 do
		if weaponTypes[L0_16[_FORV_4_]].fireSpriteSet == nil then
			weaponTypes[L0_16[_FORV_4_]].fireSpriteSheet = sprite.newSpriteSheetFromData(weaponTypes[L0_16[_FORV_4_]].fireSheet.source, weaponTypes[L0_16[_FORV_4_]].fireSheet)
			weaponTypes[L0_16[_FORV_4_]].fireSpriteSet = sprite.newSpriteSet(weaponTypes[L0_16[_FORV_4_]].fireSpriteSheet, 1, #weaponTypes[L0_16[_FORV_4_]].fireSheet.frames)
			local L7_23 = L7_23
			local L8_24 = L8_24
			local L9_25 = L9_25
			local L10_26 = L10_26
			local L11_27 = L11_27
			L8_24(L9_25, L10_26, L11_27, #weaponTypes[L7_23].fireSheet.frames, 400, 0)
			local L12_28 = L12_28
		end
	end
end
;({}).name = "Napalm"
;({}).pluralName = "Napalm blasts"
;({}).listImage = "Napalm"
;({}).isSensor = false
;({}).rockCount = weaponBalance[weaponTypes.NAPALM].rockCount
;({}).damage = weaponBalance[weaponTypes.NAPALM].damage
;({}).blastRadius = weaponBalance[weaponTypes.NAPALM].blastRadius
;({}).forceRadius = weaponBalance[weaponTypes.NAPALM].forceRadius
;({}).blastForce = weaponBalance[weaponTypes.NAPALM].blastForce
;({}).cost = weaponBalance[weaponTypes.NAPALM].cost
;({}).smokeType = "RisingSmokeLight"
;({}).spawnType = napalm.NAPALM_SPAWN
;({}).file = "res/weapons/napalm/napalm.png"
;({}).dataFile = "res.weapons.napalm.napalm"
;({}).startFrame = 1
;({}).numFrames = 6
;({}).duration = 250
;({}).loopParam = 0
;({}).weapon, ({}).playImmediately = {}, true
;({}).file = "res/weapons/napalm/fireexplosion.png"
;({}).dataFile = "res.weapons.napalm.fireexplosion"
;({}).startFrame = 1
;({}).numFrames = 11
;({}).duration = 500
;({}).spriteSequences, ({}).explode1, ({}).loopParam = {}, {}, 1
;({}).density = densityOfABomb
;({}).friction = 10
;({}).bounce = 0
;({}).shape, ({})[1] = {}, 0
;({}).shape, ({})[2] = {}, -10
;({}).shape, ({})[3] = {}, 40
;({}).shape, ({})[4] = {}, -10
;({}).shape, ({})[5] = {}, 40
;({}).shape, ({})[6] = {}, 10
;({}).shape, ({})[7] = {}, 0
;({}).shape, ({})[8] = {}, 10
;({}).physics, ({}).filter = {}, WEAPON_FILTER
;({}).collision = function(A0_29, A1_30)
	local L3_31 = L3_31
	L3_31(A0_29, A1_30)
	local L4_32 = L4_32
end
;({}).doExplosionEffect = function(A0_33, A1_34)
	napalmBurst(A0_33)
	local L3_35 = L3_35
end
;({}).triggerWeapon = function(A0_36)
	if A0_36.thrustSoundChannel then
		sound.stop(A0_36.thrustSoundChannel)
		A0_36.thrustSoundChannel = nil
	end
	local L3_38 = L3_38
	L3_38(weaponTypes[A0_36.weaponType].sounds.explode)
	L3_38 = explodeNapalm
	L3_38(A0_36)
end
;({}).go = function(A0_39, A1_40, A2_41)
	A0_39.thrustSoundChannel = sound.playSound(weaponTypes[A0_39.weaponType].sounds.thrust)
	local L4_42 = L4_42
	local L5_43 = L5_43
	L4_42(L5_43, A1_40, A2_41)
	local L6_44 = L6_44
	L4_42 = _ENV
	L4_42()
end
;({}).manualPhysics = function(A0_45)
	orientOnPath(A0_45)
	local L2_46 = L2_46
end
;({}).fire = "res/sounds/shot.mp3"
;({}).thrust = "res/sounds/thrust_type1.mp3"
;({}).sounds, ({}).explode = {}, "res/sounds/napalm_impact.mp3"
;({}).source = "res/weapons/napalm/fireA.png"
;({}).name = "fire1.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 58
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 58
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 58
;({}).spriteTrimmed = false
;({}).textureRotated = false
;({}).name = "fire2.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 62
;({}).x = 34
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 62
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 62
;({}).spriteTrimmed = false
;({}).textureRotated = false
;({}).name = "fire3.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 60
;({}).x = 68
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 60
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 60
;({}).spriteTrimmed = false
;({}).textureRotated = false
;({}).name = "fire4.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 65
;({}).x = 102
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 65
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 65
;({}).spriteTrimmed = false
;({}).textureRotated = false
;({}).name = "fire5.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 57
;({}).x = 136
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 57
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 57
;({}).spriteTrimmed = false
;({}).textureRotated = false
;({}).name = "fire6.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 62
;({}).x = 170
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 62
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 62
;({}).spriteTrimmed = false
;({}).textureRotated = false
;({}).name = "fire7.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 66
;({}).x = 204
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 66
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 66
;({}).spriteTrimmed = false
;({}).textureRotated = false
;({}).name = "fire8.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 68
;({}).x = 238
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 68
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 68
;({}).spriteTrimmed = false
;({}).textureRotated = false
weaponTypes[weaponTypes.NAPALM], ({}).fireSheet, ({}).frames, ({})[1] = {}, {}, {}, {}
weaponTypes[weaponTypes.NAPALM], ({}).fireSheet, ({}).frames, ({})[2] = {}, {}, {}, {}
weaponTypes[weaponTypes.NAPALM], ({}).fireSheet, ({}).frames, ({})[3] = {}, {}, {}, {}
weaponTypes[weaponTypes.NAPALM], ({}).fireSheet, ({}).frames, ({})[4] = {}, {}, {}, {}
weaponTypes[weaponTypes.NAPALM], ({}).fireSheet, ({}).frames, ({})[5] = {}, {}, {}, {}
weaponTypes[weaponTypes.NAPALM], ({}).fireSheet, ({}).frames, ({})[6] = {}, {}, {}, {}
weaponTypes[weaponTypes.NAPALM], ({}).fireSheet, ({}).frames, ({})[7] = {}, {}, {}, {}
weaponTypes[weaponTypes.NAPALM], ({}).fireSheet, ({}).frames, ({})[8] = {}, {}, {}, {}
weaponTypes[weaponTypes.HOT_NAPALM] = utils.deepcopy(weaponTypes[weaponTypes.NAPALM])
local L2_2 = L2_2
local L3_3 = L3_3
;({}).name = "Hot Napalm"
;({}).pluralName = "Hot Napalm blasts"
;({}).listImage = "hot_napalm"
;({}).rockCount = weaponBalance[weaponTypes.HOT_NAPALM].rockCount
;({}).damage = weaponBalance[weaponTypes.HOT_NAPALM].damage
;({}).blastRadius = weaponBalance[weaponTypes.HOT_NAPALM].blastRadius
;({}).forceRadius = weaponBalance[weaponTypes.HOT_NAPALM].forceRadius
;({}).blastForce = weaponBalance[weaponTypes.HOT_NAPALM].blastForce
;({}).cost = weaponBalance[weaponTypes.HOT_NAPALM].cost
;({}).smokeType = "RisingSmokeDark"
;({}).spawnType = napalm.HOT_NAPALM_SPAWN
;({}).destroysRock = true
;({}).file = "res/weapons/napalm/hotnapalm.png"
;({}).dataFile = "res.weapons.napalm.hotnapalm"
;({}).startFrame = 1
;({}).numFrames = 6
;({}).duration = 250
;({}).loopParam = 0
;({}).weapon, ({}).playImmediately = {}, true
;({}).file = "res/weapons/napalm/fireexplosionblue.png"
;({}).dataFile = "res.weapons.napalm.fireexplosionblue"
;({}).startFrame = 1
;({}).numFrames = 11
;({}).duration = 500
;({}).spriteSequences, ({}).explode1, ({}).loopParam = {}, {}, 1
;({}).source = "res/weapons/napalm/fireblue.png"
;({}).name = "fire1.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 58
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 58
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 58
;({}).spriteTrimmed = false
;({}).textureRotated = false
local L7_7 = L7_7
;({}).name = "fire2.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 62
;({}).x = 34
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 62
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 62
;({}).spriteTrimmed = false
;({}).textureRotated = false
local L8_8 = L8_8
;({}).name = "fire3.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 60
;({}).x = 68
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 60
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 60
;({}).spriteTrimmed = false
;({}).textureRotated = false
local L9_9 = L9_9
;({}).name = "fire4.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 65
;({}).x = 102
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 65
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 65
;({}).spriteTrimmed = false
;({}).textureRotated = false
local L10_10 = L10_10
;({}).name = "fire5.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 57
;({}).x = 136
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 57
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 57
;({}).spriteTrimmed = false
;({}).textureRotated = false
local L11_11 = L11_11
;({}).name = "fire6.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 62
;({}).x = 170
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 62
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 62
;({}).spriteTrimmed = false
;({}).textureRotated = false
local L12_12 = L12_12
;({}).name = "fire7.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 66
;({}).x = 204
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 66
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 66
;({}).spriteTrimmed = false
;({}).textureRotated = false
local L13_13 = L13_13
;({}).name = "fire8.png"
;({}).x = 0
;({}).y = 0
;({}).width = 32
;({}).spriteColorRect, ({}).height = {}, 68
;({}).x = 238
;({}).y = 0
;({}).width = 32
;({}).textureRect, ({}).height = {}, 68
;({}).width = 32
;({}).spriteSourceSize, ({}).height = {}, 68
local L15_15 = L15_15
;({}).spriteTrimmed = false
;({}).textureRotated = false
L9_9[1] = L10_10
L9_9[2] = L11_11
L9_9[3] = L12_12
L9_9[4] = L13_13
L9_9[5] = L15_15
L9_9[6] = {}
L9_9[7] = {}
L9_9[8] = {}
L8_8.frames = L9_9
L7_7.fireSheet = L8_8
L2_2(L3_3, L7_7)
L2_2 = weaponTypes
L3_3 = weaponTypes
L3_3 = L3_3.DRAGON_FIRE
L7_7 = {}
L7_7.name = "Dragon's Fire"
L7_7.pluralName = "Dragon's Fire"
L7_7.listImage = "dragonfire"
L7_7.isSensor = false
L7_7.recoil = false
L7_7.listImageYoffset = -10
L7_7.zeroDegree = 0
L7_7.isExclusiveWeapon = true
L8_8 = {}
L9_9 = "DRAGON_TANK"
L8_8[1] = L9_9
L7_7.exclusiveFor = L8_8
L7_7.isInfinite = true
L8_8 = weaponBalance
L9_9 = weaponTypes
L9_9 = L9_9.DRAGON_FIRE
L8_8 = L8_8[L9_9]
L8_8 = L8_8.rockCount
L7_7.rockCount = L8_8
L8_8 = weaponBalance
L9_9 = weaponTypes
L9_9 = L9_9.DRAGON_FIRE
L8_8 = L8_8[L9_9]
L8_8 = L8_8.damage
L7_7.damage = L8_8
L8_8 = weaponBalance
L9_9 = weaponTypes
L9_9 = L9_9.DRAGON_FIRE
L8_8 = L8_8[L9_9]
L8_8 = L8_8.blastRadius
L7_7.blastRadius = L8_8
L8_8 = weaponBalance
L9_9 = weaponTypes
L9_9 = L9_9.DRAGON_FIRE
L8_8 = L8_8[L9_9]
L8_8 = L8_8.forceRadius
L7_7.forceRadius = L8_8
L8_8 = weaponBalance
L9_9 = weaponTypes
L9_9 = L9_9.DRAGON_FIRE
L8_8 = L8_8[L9_9]
L8_8 = L8_8.blastForce
L7_7.blastForce = L8_8
L8_8 = weaponBalance
L9_9 = weaponTypes
L9_9 = L9_9.DRAGON_FIRE
L8_8 = L8_8[L9_9]
L8_8 = L8_8.cost
L7_7.cost = L8_8
L7_7.smokeType = "RisingSmokeLight"
L8_8 = {}
L9_9 = {}
L9_9.file = "res/weapons/dragonsfire/flamethrower.png"
L9_9.dataFile = "res.weapons.dragonsfire.flamethrower"
L9_9.startFrame = 1
L9_9.numFrames = 4
L9_9.duration = 250
L9_9.loopParam = 0
L9_9.playImmediately = true
L8_8.weapon = L9_9
L7_7.spriteSequences = L8_8
L8_8 = {}
L9_9 = densityOfABomb
L8_8.density = L9_9
L8_8.friction = 10
L8_8.bounce = 0
L8_8.radius = L0_0
L9_9 = WEAPON_FILTER
L8_8.filter = L9_9
L7_7.physics = L8_8
function L8_8(A0_47, A1_48)
	if A1_48.other.objType == "rock" then
		A0_47.pointUp = true
		timer.performWithDelay(1, function()
			if _ENV and _ENV.parent and A1_48.other and A1_48.other.parent then
				local L0_55 = L0_55
				local L1_56 = L1_56
				local L2_57 = L2_57
				local L3_58 = L3_58
				local L4_59 = L4_59
				local L0_55, L5_60 = L0_55(L1_56, L2_57, L3_58, L4_59, _ENV.y), L5_60
				L0_55.maxForce = 1000
			end
		end)
	elseif A1_48.other.objType == "flair" then
		if A1_48.other:doDamage(A0_47.damage, A0_47.player) then
			return
		end
	elseif not A0_47.done and A1_48.other.objType == "tank" then
		FRONT_TANK:insert(A0_47)
		A0_47.pointUp = true
		A0_47.player:recordDirectHit(weaponTypes[A0_47.weaponType])
		local L4_51 = L4_51
		local L5_52 = L5_52
		local ({}).weaponType, L7_54 = A0_47.weaponType, L7_54
		L4_51(L5_52, L7_54, A0_47.player, {})
		A0_47.done = true
		L4_51 = timer
		L4_51 = L4_51.performWithDelay
		L5_52 = 1
		function L7_54()
			local L2_63 = L2_63
			if _ENV then
				L2_63 = _ENV
				L2_63 = L2_63.getLinearVelocity
				if L2_63 then
					L2_63 = _ENV
					L2_63 = L2_63.getLinearVelocity
					local L2_63, L1_62 = L2_63(L2_63)
					physics.removeBody(_ENV)
					;({}).radius = _ENV
					local ({}).filter, L7_68 = FLUID_FILTER, L7_68
					physics.addBody(_ENV, "dynamic", {})
					local L4_65 = L4_65
					local L5_66 = L5_66
					L4_65(L5_66, L2_63, L1_62)
					local L6_67 = L6_67
					L4_65 = _ENV
					L4_65.angularVelocity = L7_68
				end
			end
		end
		L4_51(L5_52, L7_54)
	end
end
L7_7.collision = L8_8


-- [End of decompiled block; see disassembly for inner stripped closures]
