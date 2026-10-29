local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = tankModels
L1_1 = tankModels
L1_1 = L1_1.MLRS
L2_2 = {}
L2_2.maxHealth = 175
L3_3 = tankModels
L3_3 = L3_3.tankClasses
L3_3 = L3_3.MEDIUM
L2_2.tankClass = L3_3
L2_2.name = "MLRS"
L2_2.desc = "Ready, aim, launch! When firing regular missiles, launches 2 at a time for a nice and cheap double-tap."
L2_2.damageSpriteXValue = 20
L2_2.damageSpriteYValue = -10
L2_2.sheetFile = "res/tanks/mlrsa.png"
L2_2.sheetDataFile = "res.tanks.mlrsa"
L2_2.tankGroundOffset = 30
L2_2.speedForceExt = 1.5
L2_2.speedForceInt = 1
L2_2.upgradeSlots = 1
function L3_3(A0_23, A1_24)
	repeat
		local L4_27 = L4_27
		if not A0_23.dead then
			L4_27 = A1_24.weaponType
			if L4_27 == weaponTypes.MISSILE then
				L4_27 = A0_23.firedFirstShot
				if not L4_27 then
					L4_27 = weaponTypes
					L4_27 = L4_27[A0_23.weaponType]
					L4_27 = L4_27.inventory
					L4_27 = L4_27.getQuantity
					L4_27 = L4_27(L4_27)
					if 0 < L4_27 then
						A1_24.triggerPlayerChange = false
						L4_27 = timer
						L4_27 = L4_27.performWithDelay
						local L3_26 = L3_26
						L4_27(L3_26, function()
							_ENV.firedThisTurn = false
							_ENV:fire()
							if BattleControls then
								BattleControls:updateWeapon()
								local L0_28, L1_29 = L0_28, L1_29
							end
						end)
						A0_23.firedFirstShot = true
						break -- pseudo-goto
					end
				end
			end
		end
		A0_23.firedFirstShot = false
	until true
end
L2_2.postFire = L3_3
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
L4_4.x = 30
L4_4.y = -45
L4_4.xRef = -57
L4_4.yRef = 2
L3_3.cannon = L4_4
L4_4 = {}
L4_4.x = 0
L4_4.y = -16
L3_3.tank_body = L4_4
L2_2.sprites = L3_3
function L3_3(A0_30, A1_31, A2_32, A3_33)
	local L4_34 = display.newGroup()
	local L5_35 = L5_35
	L5_35 = L5_35(A0_30, A2_32 - 35, A3_33 - 5, tankConstants.SMALL_WHEEL_RADIUS, A1_31.smallWheelPhysics)
	L4_34:insert(L5_35)
	L5_35 = getWheel(A0_30, A2_32 - 20, A3_33 + 8, tankConstants.WHEEL_RADIUS, A1_31.wheelPhysics)
	L4_34:insert(L5_35)
	L5_35 = getWheel(A0_30, A2_32 - 0, A3_33 + 8, tankConstants.WHEEL_RADIUS, A1_31.wheelPhysics)
	L4_34:insert(L5_35)
	L5_35 = getWheel(A0_30, A2_32 + 20, A3_33 + 8, tankConstants.WHEEL_RADIUS, A1_31.wheelPhysics)
	L4_34:insert(L5_35)
	L9_39 = L9_39(A0_30, A2_32 + 35, A3_33 - 5, tankConstants.SMALL_WHEEL_RADIUS, A1_31.smallWheelPhysics)
	L5_35 = L9_39
	L9_39 = L4_34.insert
	L9_39(L7_37, L5_35)
	A0_30.wheelGroup = L4_34
	L9_39 = 1
	L7_37 = A0_30.wheelGroup
	L7_37 = L7_37.numChildren
	L7_37 = L7_37 - 1
	L8_38 = 1
	for _FORV_9_ = L9_39, L7_37, L8_38 do
		local L11_41 = L11_41
		local L12_42 = L12_42
		local L13_43 = L13_43
		local L14_44 = L14_44
		local L15_45 = L15_45
		local L16_46 = L16_46
		local L18_48 = L18_48
		L11_41 = L11_41(L12_42, L13_43, L14_44, L15_45, L16_46, L18_48, A0_30.wheelGroup[_FORV_9_ + 1].y)
	end
end
L2_2.bindWheels = L3_3
L0_0[L1_1] = L2_2
L0_0 = tankTypes
L1_1 = tankTypes
L1_1 = L1_1.MEDIUM_MLRS_AQUA
L2_2 = {}
L3_3 = UnlockableContent
L4_4 = L3_3
L3_3 = L3_3.new
L10_10 = Tank
L10_10 = L10_10.getUnlockId
L11_11 = tankTypes
L11_11 = L11_11.MEDIUM_MLRS_AQUA
L10_10 = L10_10(L11_11)
L11_11 = "Tank"
L12_12 = WarbuxCost
L13_13 = L12_12
L12_12 = L12_12.new
L14_14 = UNLOCKABLE_COSTS
L14_14 = L14_14.TANKS
L14_14 = L14_14.MEDIUM_MLRS_AQUA
L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22 = L12_12(L13_13, L14_14)
L3_3 = L3_3(L4_4, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L12_12(L13_13, L14_14))
L2_2.unlockable = L3_3
L3_3 = tankModels
L3_3 = L3_3.MLRS
L2_2.tankModel = L3_3
L3_3 = {}
L3_3.start = 9
L3_3.frames = 8
L3_3.duration = 160
L2_2.fireSequence = L3_3
L3_3 = {}
L3_3.start = 1
L3_3.frames = 4
L3_3.duration = 150
L2_2.driveSequence = L3_3
L3_3 = {}
L3_3.start = 5
L3_3.frames = 4
L3_3.duration = 150
L2_2.reverseDriveSequence = L3_3
L0_0[L1_1] = L2_2
