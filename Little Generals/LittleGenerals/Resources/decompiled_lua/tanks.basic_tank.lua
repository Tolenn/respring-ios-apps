local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = tankModels
L1_1 = tankModels
L1_1 = L1_1.BASIC_TANK
L2_2 = {}
L2_2.maxHealth = 200
L2_2.name = "Basic Tank"
L3_3 = tankModels
L3_3 = L3_3.tankClasses
L3_3 = L3_3.LIGHT
L2_2.tankClass = L3_3
L2_2.desc = "General usage destruction machine."
L2_2.damageSpriteXValue = 20
L2_2.damageSpriteYValue = -10
L2_2.sheetFile = "res/tanks/basic_tank.png"
L2_2.sheetDataFile = "res.tanks.basic_tank"
L2_2.tankGroundOffset = 30
L2_2.speedForceExt = 1.5
L2_2.speedForceInt = 1
L2_2.upgradeSlots = 1
L3_3 = {}
L4_4 = tankConstants
L4_4 = L4_4.TANK_DENSITY
L3_3.density = L4_4
L3_3.friction = 10
L3_3.bounce = 0
L4_4 = {}
local L10_10 = L10_10
local L11_11 = L11_11
local L12_12 = L12_12
local L13_13 = L13_13
local L14_14 = L14_14
local L15_15 = L15_15
local L16_16 = L16_16
local L17_17 = L17_17
local L18_18 = L18_18
local L19_19 = L19_19
local L20_20 = L20_20
local L21_21 = L21_21
L4_4[1] = L10_10
L4_4[2] = L11_11
L4_4[3] = L12_12
L4_4[4] = L13_13
L4_4[5] = L14_14
L4_4[6] = L15_15
L4_4[7] = L16_16
L4_4[8] = L17_17
L4_4[9] = L18_18
L4_4[10] = L19_19
L4_4[11] = L20_20
L4_4[12] = L21_21
L4_4[13] = 20
L4_4[14] = 11
L4_4[15] = -20
L4_4[16] = 11
L4_4[17] = -35
local L4_4[18], L22_22 = -9, L22_22
L3_3.shape = L4_4
L4_4 = TANK_FILTER
L3_3.filter = L4_4
L2_2.tankPhysics = L3_3
L3_3 = {}
L4_4 = tankConstants
L4_4 = L4_4.TANK_DENSITY
L4_4 = 2 * L4_4
L3_3.density = L4_4
L3_3.friction = 20
L3_3.bounce = 0
L4_4 = tankConstants
L4_4 = L4_4.SMALL_WHEEL_RADIUS
L3_3.radius = L4_4
L4_4 = TANK_FILTER
L3_3.filter = L4_4
L2_2.smallWheelPhysics = L3_3
L3_3 = {}
L4_4 = tankConstants
L4_4 = L4_4.TRACK_DENSITY2
L3_3.density = L4_4
L3_3.friction = 20
L3_3.bounce = 0
L4_4 = tankConstants
L4_4 = L4_4.WHEEL_RADIUS
L3_3.radius = L4_4
L4_4 = TANK_FILTER
L3_3.filter = L4_4
L2_2.wheelPhysics = L3_3
L3_3 = {}
L4_4 = {}
L4_4.x = 0
L4_4.y = -34
L4_4.xRef = -10
L4_4.yRef = 1
L3_3.cannon = L4_4
L4_4 = {}
L4_4.x = 0
L4_4.y = -16
L3_3.tank_body = L4_4
L2_2.sprites = L3_3
function L3_3(A0_23, A1_24, A2_25, A3_26)
	local L4_27 = display.newGroup()
	local L5_28 = L5_28
	L5_28 = L5_28(A0_23, A2_25 - 35, A3_26 - 5, tankConstants.SMALL_WHEEL_RADIUS, A1_24.smallWheelPhysics)
	L4_27:insert(L5_28)
	L5_28 = getWheel(A0_23, A2_25 - 20, A3_26 + 8, tankConstants.WHEEL_RADIUS, A1_24.wheelPhysics)
	L4_27:insert(L5_28)
	L5_28 = getWheel(A0_23, A2_25 - 0, A3_26 + 8, tankConstants.WHEEL_RADIUS, A1_24.wheelPhysics)
	L4_27:insert(L5_28)
	L5_28 = getWheel(A0_23, A2_25 + 20, A3_26 + 8, tankConstants.WHEEL_RADIUS, A1_24.wheelPhysics)
	L4_27:insert(L5_28)
	L9_32 = L9_32(A0_23, A2_25 + 35, A3_26 - 5, tankConstants.SMALL_WHEEL_RADIUS, A1_24.smallWheelPhysics)
	L5_28 = L9_32
	L9_32 = L4_27.insert
	L9_32(L7_30, L5_28)
	A0_23.wheelGroup = L4_27
	L9_32 = 1
	L7_30 = A0_23.wheelGroup
	L7_30 = L7_30.numChildren
	L7_30 = L7_30 - 1
	L8_31 = 1
	for _FORV_9_ = L9_32, L7_30, L8_31 do
		local L11_34 = L11_34
		local L12_35 = L12_35
		local L13_36 = L13_36
		local L14_37 = L14_37
		local L15_38 = L15_38
		local L16_39 = L16_39
		local L18_41 = L18_41
		L11_34 = L11_34(L12_35, L13_36, L14_37, L15_38, L16_39, L18_41, A0_23.wheelGroup[_FORV_9_ + 1].y)
		L11_34.dampingRatio = 1
	end
end
L2_2.bindWheels = L3_3
L0_0[L1_1] = L2_2
L0_0 = tankTypes
L1_1 = tankTypes
L1_1 = L1_1.BASIC_BLUE_TANK
L2_2 = {}
L2_2.name = "Dartle"
L2_2.desc = "Lasers are 25% more powerful! Go straight through rock with more power left to zap your foes!"
L3_3 = UnlockableContent
L4_4 = L3_3
L3_3 = L3_3.new
L10_10 = Tank
L10_10 = L10_10.getUnlockId
L11_11 = tankTypes
L11_11 = L11_11.BASIC_BLUE_TANK
L10_10 = L10_10(L11_11)
L11_11 = "Tank"
L12_12 = WarbuxCost
L13_13 = L12_12
L12_12 = L12_12.new
L14_14 = UNLOCKABLE_COSTS
L14_14 = L14_14.TANKS
L14_14 = L14_14.BLUE
L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22 = L12_12(L13_13, L14_14)
L3_3 = L3_3(L4_4, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L12_12(L13_13, L14_14))
L2_2.unlockable = L3_3
L3_3 = tankModels
L3_3 = L3_3.BASIC_TANK
L2_2.tankModel = L3_3
L3_3 = {}
L3_3.start = 1
L3_3.frames = 8
L3_3.duration = 200
L2_2.fireSequence = L3_3
L3_3 = {}
L3_3.start = 9
L3_3.frames = 4
L3_3.duration = 150
L2_2.driveSequence = L3_3
L3_3 = {}
L3_3.start = 13
L3_3.frames = 4
L3_3.duration = 150
L2_2.reverseDriveSequence = L3_3
function L3_3(A0_42, A1_43)
	local L3_44
	L3_44 = A1_43.weaponType
	if L3_44 == weaponTypes.LASER then
		L3_44 = A1_43.penetration
		L3_44 = L3_44 * 1.25
		A1_43.penetration = L3_44
	end
end
L2_2.preFire = L3_3
L0_0[L1_1] = L2_2
L0_0 = tankTypes
L1_1 = tankTypes
L1_1 = L1_1.BASIC_GREEN_TANK
L2_2 = {}
L2_2.name = "Basic Green"
L2_2.desc = "Slightly harder to hit in green-ish terrain."
L2_2.unlockable = nil
L3_3 = tankModels
L3_3 = L3_3.BASIC_TANK
L2_2.tankModel = L3_3
L3_3 = {}
L3_3.start = 17
L3_3.frames = 8
L3_3.duration = 200
L2_2.fireSequence = L3_3
L3_3 = {}
L3_3.start = 25
L3_3.frames = 5
L3_3.duration = 150
L2_2.driveSequence = L3_3
L3_3 = {}
L3_3.start = 30
L3_3.frames = 5
L3_3.duration = 150
L2_2.reverseDriveSequence = L3_3
function L3_3(A0_45)
	if activeCountry.landType == landType.MOUNTAINS then
		local L2_46 = L2_46
		L2_46(players[2].AI, 7)
		local L3_47 = L3_47
	end
end
L2_2.preAIFire = L3_3
L0_0[L1_1] = L2_2
L0_0 = tankTypes
L1_1 = tankTypes
L1_1 = L1_1.BASIC_ORANGE_TANK
L2_2 = {}
L2_2.name = "Basic Orange"
L2_2.desc = "Slightly harder to hit in the desert terrain."
L2_2.unlockable = nil
L3_3 = tankModels
L3_3 = L3_3.BASIC_TANK
L2_2.tankModel = L3_3
L3_3 = {}
L3_3.start = 35
L3_3.frames = 8
L3_3.duration = 200
L2_2.fireSequence = L3_3
L3_3 = {}
L3_3.start = 43
L3_3.frames = 5
L3_3.duration = 150
L2_2.driveSequence = L3_3
L3_3 = {}
L3_3.start = 48
L3_3.frames = 5
L3_3.duration = 150
L2_2.reverseDriveSequence = L3_3
function L3_3(A0_48)
	if activeCountry.landType == landType.DESERT then
		local L2_49 = L2_49
		L2_49(players[2].AI, 7)
		local L3_50 = L3_50
	end
end
L2_2.preAIFire = L3_3
L0_0[L1_1] = L2_2
L0_0 = tankTypes
L1_1 = tankTypes
L1_1 = L1_1.BASIC_PURPLE_TANK
L2_2 = {}
L2_2.name = "Funky Child"
L2_2.desc = "Add some more funk to your funky bombs! An extra warhead on the funky bomb will groove right through terrain."
L3_3 = UnlockableContent
L4_4 = L3_3
L3_3 = L3_3.new
L10_10 = Tank
L10_10 = L10_10.getUnlockId
L11_11 = tankTypes
L11_11 = L11_11.BASIC_PURPLE_TANK
L10_10 = L10_10(L11_11)
L11_11 = "Tank"
L12_12 = WarbuxCost
L13_13 = L12_12
L12_12 = L12_12.new
L14_14 = UNLOCKABLE_COSTS
L14_14 = L14_14.TANKS
L14_14 = L14_14.PURPLE
L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22 = L12_12(L13_13, L14_14)
L3_3 = L3_3(L4_4, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L12_12(L13_13, L14_14))
L2_2.unlockable = L3_3
L3_3 = tankModels
L3_3 = L3_3.BASIC_TANK
L2_2.tankModel = L3_3
L3_3 = {}
L3_3.start = 53
L3_3.frames = 8
L3_3.duration = 200
L2_2.fireSequence = L3_3
L3_3 = {}
L3_3.start = 61
L3_3.frames = 4
L3_3.duration = 150
L2_2.driveSequence = L3_3
L3_3 = {}
L3_3.start = 65
L3_3.frames = 4
L3_3.duration = 150
L2_2.reverseDriveSequence = L3_3
function L3_3(A0_51, A1_52)
	local L3_53
	L3_53 = A1_52.weaponType
	if L3_53 == weaponTypes.FUNKY_BOMB then
		L3_53 = A1_52.numSpawn
		if L3_53 then
			L3_53 = A1_52.numSpawn
			L3_53 = L3_53 + 1
			A1_52.numSpawn = L3_53
		end
	end
end
L2_2.preFire = L3_3
L0_0[L1_1] = L2_2
L0_0 = tankTypes
L1_1 = tankTypes
L1_1 = L1_1.BASIC_RED_TANK
L2_2 = {}
L2_2.name = "MIRVin"
L2_2.desc = "Extra warhead on MIRVs. That's 20% more destructive power to the MIRV!"
L3_3 = UnlockableContent
L4_4 = L3_3
L3_3 = L3_3.new
L10_10 = Tank
L10_10 = L10_10.getUnlockId
L11_11 = tankTypes
L11_11 = L11_11.BASIC_RED_TANK
L10_10 = L10_10(L11_11)
L11_11 = "Tank"
L12_12 = WarbuxCost
L13_13 = L12_12
L12_12 = L12_12.new
L14_14 = UNLOCKABLE_COSTS
L14_14 = L14_14.TANKS
L14_14 = L14_14.RED
L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22 = L12_12(L13_13, L14_14)
L3_3 = L3_3(L4_4, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L12_12(L13_13, L14_14))
L2_2.unlockable = L3_3
L3_3 = tankModels
L3_3 = L3_3.BASIC_TANK
L2_2.tankModel = L3_3
L3_3 = {}
L3_3.start = 69
L3_3.frames = 8
L3_3.duration = 200
L2_2.fireSequence = L3_3
L3_3 = {}
L3_3.start = 77
L3_3.frames = 4
L3_3.duration = 150
L2_2.driveSequence = L3_3
L3_3 = {}
L3_3.start = 81
L3_3.frames = 4
L3_3.duration = 150
L2_2.reverseDriveSequence = L3_3
function L3_3(A0_54, A1_55)
	local L3_56
	L3_56 = A1_55.weaponType
	if L3_56 == weaponTypes.MIRV then
		L3_56 = A1_55.numSpawn
		if L3_56 then
			L3_56 = A1_55.numSpawn
			L3_56 = L3_56 + 1
			A1_55.numSpawn = L3_56
		end
	end
end
L2_2.preFire = L3_3
L0_0[L1_1] = L2_2
L0_0 = tankTypes
L1_1 = tankTypes
L1_1 = L1_1.BASIC_YELLOW_TANK
L2_2 = {}
L2_2.name = "Lil' Digger"
L2_2.desc = "Adds a little more drilling distance. Reach more minerals, and collapse more terrain on your enemies!"
L3_3 = UnlockableContent
L4_4 = L3_3
L3_3 = L3_3.new
L10_10 = Tank
L10_10 = L10_10.getUnlockId
L11_11 = tankTypes
L11_11 = L11_11.BASIC_YELLOW_TANK
L10_10 = L10_10(L11_11)
L11_11 = "Tank"
L12_12 = WarbuxCost
L13_13 = L12_12
L12_12 = L12_12.new
L14_14 = UNLOCKABLE_COSTS
L14_14 = L14_14.TANKS
L14_14 = L14_14.YELLOW
L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22 = L12_12(L13_13, L14_14)
L3_3 = L3_3(L4_4, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L12_12(L13_13, L14_14))
L2_2.unlockable = L3_3
L3_3 = tankModels
L3_3 = L3_3.BASIC_TANK
L2_2.tankModel = L3_3
L3_3 = {}
L3_3.start = 85
L3_3.frames = 8
L3_3.duration = 200
L2_2.fireSequence = L3_3
L3_3 = {}
L3_3.start = 93
L3_3.frames = 4
L3_3.duration = 150
L2_2.driveSequence = L3_3
L3_3 = {}
L3_3.start = 97
L3_3.frames = 4
L3_3.duration = 150
L2_2.reverseDriveSequence = L3_3
function L3_3(A0_57, A1_58)
	local L3_59
	L3_59 = A1_58.weaponType
	if L3_59 == weaponTypes.DRILL then
		L3_59 = A1_58.countdownTimer
		if L3_59 then
			L3_59 = A1_58.countdownTimer
			L3_59 = L3_59 + 1000
			A1_58.countdownTimer = L3_59
		end
	end
end
L2_2.preFire = L3_3
L0_0[L1_1] = L2_2
