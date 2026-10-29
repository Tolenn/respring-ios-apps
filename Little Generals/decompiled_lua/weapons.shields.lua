-- Decompiled & AI-Repaired from weapons.shields.lu
-- Source disassembly preserved at: disasm/weapons.shields.disasm

local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
function L0_0(A0_7)
	local L1_8
	function L1_8()
		if _ENV.x == nil or _ENV.y == nil then
			local L0_13, L1_14 = L0_13, L1_14
			local L2_15 = L2_15
			L0_13(L1_14, L2_15, _ENV.listener)
			local L3_16 = L3_16
		end
		L0_13 = _ENV
		L1_14 = _ENV
		L2_15 = _ENV
		L2_15 = L2_15.player
		L2_15 = L2_15.x
		L3_16 = _ENV
		L3_16 = L3_16.player
		L3_16 = L3_16.y
		L1_14.y = L3_16
		L0_13.x = L2_15
	end
	A0_7.listener = L1_8
	Runtime:addEventListener("enterFrame", A0_7.listener)
	if A0_7.triggerPlayerChange then
		local L2_9 = L2_9
		local L3_10 = L3_10
		;({}).time = 500
		;({}).xScale = 0.05
		;({}).yScale = 0.05
		local ({}).transition, L5_12 = easing.inExpo, L5_12
		function L5_12.onComplete(A0_17)
			local L3_20 = timer.performWithDelay
			local L2_19 = L2_19
			L3_20(L2_19, function(A0_21)
				playerTurnEnd()
			end)
		end
		L2_9(L3_10, L5_12)
	end
end
function L1_1(A0_22)
	local L1_23, L2_24, L3_25
	L1_23 = A0_22.shield
	L2_24 = weaponTypes
	L3_25 = A0_22.weaponType
	L2_24 = L2_24[L3_25]
	L2_24 = L2_24.shield
	L1_23 = L1_23 / L2_24
	if L1_23 <= 0 then
		A0_22.alpha = 0
	elseif 1 <= L1_23 then
		A0_22.alpha = 1
	else
		L2_24 = L1_23 * 0.8
		L2_24 = L2_24 + 0.2
		A0_22.alpha = L2_24
	end
end
L2_2 = weaponTypes
L3_3 = weaponTypes
L3_3 = L3_3.BABY_SHIELD
L4_4 = {}
L4_4.image = "res/weapons/shields/baby_shield.png"
L4_4.name = "Baby Shield"
L4_4.listImage = "shield"
L4_4.bodyType = "static"
L5_5 = weaponBalance
L6_6 = weaponTypes
L6_6 = L6_6.BABY_SHIELD
L5_5 = L5_5[L6_6]
L5_5 = L5_5.cost
L4_4.cost = L5_5
L5_5 = weaponBalance
L6_6 = weaponTypes
L6_6 = L6_6.BABY_SHIELD
L5_5 = L5_5[L6_6]
L5_5 = L5_5.shield
L4_4.shield = L5_5
L4_4.zeroDegree = -90
L4_4.sendToBack = true
L4_4.recoil = false
L4_4.isSensor = true
L4_4.objType = "shield"
L4_4.trackImmediately = true
L4_4.suppressNormalTracking = true
L4_4.addShieldRuntimeListener = L0_0
function L5_5(A0_26)
	_ENV(A0_26)
	local L2_27 = L2_27
end
L4_4.refreshProperties = L5_5
L5_5 = {}
L6_6 = densityOfABomb
L5_5.density = L6_6
L5_5.friction = 10
L5_5.bounce = 0
L5_5.radius = 150
L6_6 = SHIELD_FILTER
L5_5.filter = L6_6
L4_4.physics = L5_5
function L5_5(A0_28, A1_29)
	local L3_30 = L3_30
	L3_30(A0_28, A1_29)
	local L4_31 = L4_31
end
L4_4.collision = L5_5


-- [End of decompiled block; see disassembly for inner stripped closures]
