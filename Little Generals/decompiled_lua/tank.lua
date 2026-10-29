-- Decompiled & AI-Repaired from tank.lu
-- Source disassembly preserved at: disasm/tank.disasm

local L0_0, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11 = L0_0, "weapon", L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
L0_0 = L0_0(L3_3)
L3_3 = require
L4_4 = "objectTemplates"
L3_3(L4_4)
L3_3 = require
L4_4 = "physicsGroups"
L3_3(L4_4)
L3_3 = require
L4_4 = "battleControls"
L3_3(L4_4)
L3_3 = 8.5E-4
L4_4 = {}
L4_4.TANK_DENSITY = 1
L4_4.TRACK_DENSITY = 70
L4_4.TRACK_DENSITY2 = 90
L4_4.TRACK_DENSITY3 = 110
L4_4.LARGE_WHEEL_RADIUS = 10
L4_4.WHEEL_RADIUS = 8
L4_4.SMALL_WHEEL_RADIUS = 5
tankConstants = L4_4
L4_4 = 0
L5_5 = 50
L6_6 = 200
L7_7 = 100
L8_8 = 200
L9_9 = 70
L10_10 = 500
L11_11 = 300
if LOW_RES_PHYSICS_MODE then
	L7_7 = 30
	L8_8 = 50
	L9_9 = 15
	L11_11 = 20
end
;({}).treads = "res/sounds/treads.wav"
;({}).noGas = "res/sounds/carNoStart.mp3"
;({}).explode = "res/sounds/tank_explode1.mp3"
;({}).BASIC_BLUE_TANK = 1
;({}).BASIC_GREEN_TANK = 2
;({}).BASIC_ORANGE_TANK = 3
;({}).BASIC_PURPLE_TANK = 4
;({}).BASIC_RED_TANK = 5
;({}).BASIC_YELLOW_TANK = 6
;({}).LIGHT_GREEN_TANK = 7
;({}).MEDIUM_BLUE_TANK = 8
;({}).HEAVY_RED_TANK = 9
;({}).HUMMER_YELLOW = 10
;({}).MEDIUM_WHEELED_BROWN = 11
;({}).MEDIUM_MLRS_AQUA = 12
;({}).CHUNKY_LIME = 13
;({}).NUKE_TANK = 14
;({}).GOLD_TANK = 15
;({}).LOWRIDER_TANK = 16
;({}).ICECREAM_TRUCK = 17
;({}).ALMIGHTY_TINY = 18
;({}).PUMPKIN_TANK = 19
;({}).DRAGON_TANK = 20
;({}).SLEIGH_TANK = 21
;({}).CANADA = 22
;({}).CHINA = 23
;({}).GERMANY = 24
;({}).IRELAND = 25
;({}).ITALY = 26
;({}).RUSSIA = 27
;({}).UK = 28
tankTypes, ({}).USA = {}, 29
local L18_18 = L18_18
local L19_19 = L19_19
local L24_24 = L24_24
local L25_25 = L25_25
local L26_26 = L26_26
local L27_27 = L27_27
local L28_28 = L28_28
local L29_29 = L29_29
local L30_30 = L30_30
local L31_31 = L31_31
local L32_32 = L32_32
local L33_33 = L33_33
local L34_34 = L34_34
local L35_35 = L35_35
local L36_36 = L36_36
local L37_37 = L37_37
local L38_38 = L38_38
local L39_39 = L39_39
local L40_40 = L40_40
L20_20[1] = L21_21
L20_20[2] = L22_22
L20_20[3] = L23_23
L20_20[4] = L24_24
L20_20[5] = L25_25
L20_20[6] = L26_26
L20_20[7] = L27_27
L20_20[8] = L28_28
L20_20[9] = L29_29
L20_20[10] = L30_30
L20_20[11] = L31_31
L20_20[12] = L32_32
L20_20[13] = L33_33
L20_20[14] = L34_34
L20_20[15] = L35_35
L20_20[16] = L36_36
L20_20[17] = L37_37
L20_20[18] = L38_38
L20_20[19] = L39_39
L20_20[20] = L40_40
L20_20[21] = tankTypes.SLEIGH_TANK
L20_20[22] = tankTypes.USA
L20_20[23] = tankTypes.UK
L20_20[24] = tankTypes.RUSSIA
L20_20[25] = tankTypes.CANADA
L20_20[26] = tankTypes.CHINA
L20_20[27] = tankTypes.GERMANY
L20_20[28] = tankTypes.IRELAND
local L20_20[29], L41_41 = tankTypes.ITALY, L41_41
availableTankTypesInOrder = L20_20
L20_20 = {}
L20_20.BASIC_TANK = 1
L20_20.LIGHT_WHEELED = 2
L20_20.MEDIUM_TANK = 3
L20_20.HEAVY_TANK = 4
L20_20.HUMMER = 5
L20_20.MEDIUM_WHEELED = 6
L20_20.BASIC_CHUNKY = 7
L20_20.MLRS = 8
L20_20.NUKE_TANK = 9
L20_20.GOLD_TANK = 10
L20_20.LOWRIDER_TANK = 11
L20_20.ICECREAM_TRUCK = 12
L20_20.TINY = 13
L20_20.PUMPKIN_TANK = 14
L20_20.DRAGON_TANK = 15
L20_20.SLEIGH_TANK = 16
tankModels = L20_20
L20_20 = tankModels
L21_21 = {}
L21_21.LIGHT = 1
L21_21.MEDIUM = 2
L21_21.HEAVY = 3
L21_21.SPECIAL = 4
L20_20.tankClasses = L21_21
L20_20 = tankModels
L21_21 = {}
L22_22 = tankModels
L22_22 = L22_22.tankClasses
L22_22 = L22_22.LIGHT
L23_23 = tankModels
L23_23 = L23_23.tankClasses
L23_23 = L23_23.MEDIUM
L24_24 = tankModels
L24_24 = L24_24.tankClasses
L24_24 = L24_24.HEAVY
L25_25 = tankModels
L25_25 = L25_25.tankClasses
L25_25 = L25_25.SPECIAL
L21_21[1] = L22_22
L21_21[2] = L23_23
L21_21[3] = L24_24
L21_21[4] = L25_25
L20_20.orderedTankClasses = L21_21
L20_20 = tankModels
L20_20 = L20_20.tankClasses
L21_21 = tankModels
L21_21 = L21_21.tankClasses
L21_21 = L21_21.LIGHT
L22_22 = {}
L22_22.name = "Light Class Tank"
L22_22.groupName = "Light Tanks"
L22_22.filterImage = "light_filter.png"
L20_20[L21_21] = L22_22
L20_20 = tankModels
L20_20 = L20_20.tankClasses
L21_21 = tankModels
L21_21 = L21_21.tankClasses
L21_21 = L21_21.MEDIUM
L22_22 = {}
L22_22.name = "Medium Class Tank"
L22_22.groupName = "Medium Tanks"
L22_22.filterImage = "medium_filter.png"
L20_20[L21_21] = L22_22
L20_20 = tankModels
L20_20 = L20_20.tankClasses
L21_21 = tankModels
L21_21 = L21_21.tankClasses
L21_21 = L21_21.HEAVY
L22_22 = {}
L22_22.name = "Heavy Class Tank"
L22_22.groupName = "Heavy Tanks"
L22_22.filterImage = "heavy_filter.png"
L20_20[L21_21] = L22_22
L20_20 = tankModels
L20_20 = L20_20.tankClasses
L21_21 = tankModels
L21_21 = L21_21.tankClasses
L21_21 = L21_21.SPECIAL
L22_22 = {}
L22_22.name = "Special Class Tank"
L22_22.groupName = "Special Tanks"
L22_22.filterImage = "special_filter.png"
L20_20[L21_21] = L22_22
L20_20 = {}
L21_21 = weaponTypes
L21_21 = L21_21.BABY_MISSILE
L20_20.weaponType = L21_21
L21_21 = tankTypes
L21_21 = L21_21.BASIC_GREEN_TANK
L20_20.tankType = L21_21
L20_20.objType = "tank"
L20_20.power = 100
L20_20.angle = 45
L20_20.driveForce = L10_10
L20_20.gas = L4_4
L20_20.score = 0
L20_20.shots = 0
L20_20.hits = 0
L20_20.hasParachute = false
L20_20.hasBattery = false
L20_20.upgradeSlots = 0
L21_21 = {}
L20_20.shotHistory = L21_21
Tank = L20_20
L20_20 = Tank
L20_20.MIN_POWER = L5_5
L20_20 = Tank
L20_20.MAX_POWER = L6_6
L20_20 = Tank
function L21_21()
	sound.loadSoundBatch(_ENV)
	local L1_42 = L1_42
end
L20_20.loadAllSounds = L21_21
L20_20 = Tank
function L21_21()
	L2_45 = sound.disposeSoundBatch
	L3_46 = _ENV
	L2_45(L3_46)
	L2_45 = 1
	L3_46 = tankTypes
	L3_46 = #L3_46
	_FOR_ = 1
	for _FORV_3_ = L2_45, L3_46, _FOR_ do
		Tank.disposeTypeSounds(_FORV_3_)
	end
end
L20_20.disposeAllSounds = L21_21
L20_20 = Tank
function L21_21(A0_49)
	if tankTypes[A0_49] and tankTypes[A0_49].sounds then
		sound.loadSoundBatch(tankTypes[A0_49].sounds)
		local L2_50 = L2_50
	end
end
L20_20.loadTypeSounds = L21_21
L20_20 = Tank
function L21_21(A0_51)
	if tankTypes[A0_51] and tankTypes[A0_51].sounds then
		sound.loadSoundBatch(tankTypes[A0_51].sounds)
		local L2_52 = L2_52
	end
end
L20_20.disposeTypeSounds = L21_21
L20_20 = Tank
function L21_21(A0_53)
	local L1_54 = L1_54
	local L3_56 = tostring(A0_53)
	L1_54 = L1_54 .. L3_56
	return L1_54
end
L20_20.getUnlockId = L21_21
L20_20 = require
L21_21 = "tanks.basic_tank"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.medium_tank"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.heavy_tank"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.hummer"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.mlrs"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.basic_chunky"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.light_wheeled"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.medium_wheeled"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.nuke_tank"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.gold_tank"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.lowrider_tank"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.icecream_truck"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.almighty_tiny"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.pumpkin_tank"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.dragon_tank"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.sleigh_tank"
L20_20(L21_21)
L20_20 = require
L21_21 = "tanks.country_tanks"
L20_20(L21_21)
L20_20 = 1
L21_21 = tankTypes
L21_21 = #L21_21
L22_22 = 1
for L23_23 = L20_20, L21_21, L22_22 do
	L24_24 = tankTypes
	L24_24 = L24_24[L23_23]
	L25_25 = L23_23 + 100
	L24_24.templateId = L25_25
end
function L20_20(A0_57, A1_58, A2_59, A3_60, A4_61, A5_62)
	local L6_63
	L6_63 = A5_62
	if L6_63 == nil then
		L6_63 = display.newCircle(A1_58, A2_59, A3_60)
		L6_63.alpha = 0
	else
		L6_63.x, L6_63.y = A1_58, A2_59
		L6_63.alpha = 1
	end
	L6_63.xOffset, L6_63.yOffset = A0_57.x - L6_63.x, A0_57.y - L6_63.y
	physics.addBody(L6_63, A4_61)
	L6_63.physics = A4_61
	L6_63.isWheel = true
	L6_63.objType = Tank.objType
	L6_63.angularDamping = 5
	L6_63.isFixedRotation = true
	local L7_64 = L7_64
	local L8_65 = L8_65
	local L9_66 = L9_66
	local L10_67 = L10_67
	local L11_68 = L11_68
	local L7_64, L12_69 = L7_64(L8_65, L9_66, L10_67, L11_68, L6_63.y), L12_69
	L6_63.tank = A0_57
	function L8_65(A0_70, A1_71, A2_72, A3_73)
		local L5_74 = L5_74
		local L6_75 = L6_75
		local L7_76 = L7_76
		L5_74(L6_75, L7_76, A2_72, A3_73)
		local L8_77 = L8_77
	end
	L6_63.damageHealth = L8_65
	return L6_63
end
getWheel = L20_20
function L20_20(A0_78)
	A0_78.damageEmitterName = "DamageEmitter" .. tostring(A0_78)
	local L6_84 = L6_84
	local L7_85 = L7_85
	L6_84(L7_85, 0, tankTypes[A0_78.tankType].damageSpriteYValue - 10, 0, false, false, true)
	local L8_86 = L8_86
	L6_84 = Particles
	L6_84 = L6_84.GetEmitter
	L7_85 = A0_78.damageEmitterName
	L6_84 = L6_84(L7_85)
	function L7_85(A0_87)
		local L1_88, L2_89, L3_90, L4_91, L5_92, L6_93
		L1_88 = _ENV
		L1_88 = L1_88.parent
		if L1_88 then
			L1_88 = A0_78
			L1_88 = L1_88.parent
			if L1_88 then
				L1_88 = _ENV
				L2_89 = _ENV
				L3_90 = A0_78
				L3_90 = L3_90.x
				L4_91 = A0_78
				L4_91 = L4_91.y
				L5_92 = tankTypes
				L6_93 = A0_78
				L6_93 = L6_93.tankType
				L5_92 = L5_92[L6_93]
				L5_92 = L5_92.damageSpriteYValue
				L4_91 = L4_91 + L5_92
				L4_91 = L4_91 - 10
				L2_89.y = L4_91
				L1_88.x = L3_90
			end
		end
	end
	A0_78.damageMover = L7_85
	L8_86 = BEHIND_TANK
	L8_86 = L8_86.insert
	local L4_82 = L4_82
	L8_86(L4_82, L6_84)
	local L5_83 = L5_83
end
function L21_21(A0_94)
	local L1_95, L2_96
	L1_95 = tankTypes
	L1_95 = L1_95[A0_94]
	L2_96 = tankModels
	L2_96 = L2_96[L1_95.tankModel]
	_FOR_, _FOR_, _FOR_ = pairs(L2_96)
	for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
		if not L1_95[_FORV_6_] then
			L1_95[_FORV_6_] = _FORV_7_
		end
	end
	local L3_97 = display.newGroup()
	L3_97.tankType = A0_94
	local L4_98 = L4_98
	local L5_99 = L5_99
	L4_98, L5_99 = L4_98(L5_99, L1_95.sheetDataFile, true)
	sprite.add(L4_98, "cannon" .. A0_94, L1_95.fireSequence.start, L1_95.fireSequence.frames, L1_95.fireSequence.duration, 1)
	sprite.add(L4_98, "drive" .. A0_94, L1_95.driveSequence.start, L1_95.driveSequence.frames, L1_95.driveSequence.duration, 0)
	L10_104(L4_98, "reverse" .. A0_94, L1_95.reverseDriveSequence.start, L1_95.reverseDriveSequence.frames, L1_95.reverseDriveSequence.duration, 0)
	L10_104 = sprite
	L10_104 = L10_104.newSprite
	L10_104 = L10_104(L4_98)
	L3_97.cannon = L10_104
	L10_104 = L3_97.cannon
	L10_104 = L10_104.scale
	L10_104(L10_104, -1, -1)
	L10_104 = L3_97.cannon
	L10_104.xReference = L3_97.cannon.contentWidth + L1_95.sprites.cannon.xRef
	L10_104 = L3_97.cannon
	L10_104.yReference = 0 + L1_95.sprites.cannon.yRef
	L10_104 = L3_97.insert
	L10_104(L3_97, L3_97.cannon)
	L10_104 = L3_97.cannon
	L10_104 = L10_104.prepare
	L10_104(L10_104, "cannon" .. A0_94)
	L10_104 = L3_97.cannon
	L10_104 = L10_104.addEventListener
	L10_104(L10_104, "sprite", function(A0_109)
		if A0_109.phase == "end" then
			local L2_110 = L2_110
			local L4_112 = L4_112
			L2_110(L4_112, "cannon" .. A0_94)
		end
	end)
	L10_104 = sprite
	L10_104 = L10_104.newSprite
	L10_104 = L10_104(L4_98)
	L3_97.tank_body = L10_104
	L10_104 = L3_97.tank_body
	L10_104 = L10_104.prepare
	L10_104(L10_104, "drive" .. A0_94)
	L10_104 = L3_97.insert
	L10_104(L3_97, L3_97.tank_body)
	L10_104 = display
	L10_104 = L10_104.newGroup
	L10_104 = L10_104()
	L3_97.spriteWheelGroup = L10_104
	L10_104 = L2_96.sprites
	L10_104 = L10_104.wheels
	if L10_104 then
		L10_104 = pairs
		L10_104, _FOR_, _FOR_ = L10_104(L2_96.sprites.wheels)
		for _FORV_9_, _FORV_10_ in L10_104, _FOR_, _FOR_ do
			sprite.newSprite(L4_98).currentFrame = L1_95.wheelFrames[_FORV_9_]
			sprite.newSprite(L4_98).x, sprite.newSprite(L4_98).y = _FORV_10_.x, _FORV_10_.y
			L3_97.spriteWheelGroup:insert((sprite.newSprite(L4_98)))
		end
	end
	L11_105 = L3_97
	L10_104 = L3_97.insert
	L12_106 = L3_97.spriteWheelGroup
	L10_104(L11_105, L12_106)
	L10_104 = L3_97
	L11_105 = L1_95
	return L10_104, L11_105
end
getTankSpriteGroup = L21_21
function L21_21(A0_113, A1_114)
	if A1_114.other.objType == "rock" then
		if A0_113.parachuteBody then
			A0_113:cleanupParachute()
		end
		if A1_114.force > _ENV then
			if not A0_113.rockDamage then
			end
			A0_113.rockDamage = math.max(A0_113.maxHealth - math.floor(A1_114.force / L12_12 * math.max(A0_113.maxHealth / A0_113.maxHealth, 0.05)), 0)
			local L4_117, L5_118 = L4_117, L5_118
			local L6_119 = L6_119
			local L7_120 = L7_120
			L6_119(L7_120, math.floor(A1_114.force / L12_12 * math.max(A0_113.maxHealth / A0_113.maxHealth, 0.05)), getRockPointsPlayer(), nil)
			local L8_121 = L8_121
		end
		L4_117 = A1_114.force
		if 500 < L4_117 then
			L4_117 = A1_114.other
			L4_117 = L4_117.rockScale
			L5_118 = ROCKINFO
			L5_118 = L5_118.MINIMUM_ROCK_SIZE
			if L4_117 <= L5_118 then
				L4_117 = collide
				L5_118 = A1_114.other
				L4_117(L5_118)
			end
		end
	end
end
L22_22 = Tank


-- [End of decompiled block; see disassembly for inner stripped closures]
