-- Decompiled & AI-Repaired from weapons.tracers.lu
-- Source disassembly preserved at: disasm/weapons.tracers.disasm

local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = {}
L0_0.TRACER_GROUP = 11002
L0_0.TRACER_PUFF = 11003
tracer = L0_0
L0_0 = weaponTypes
L1_1 = weaponTypes
L1_1 = L1_1.SMOKE_TRACER
L2_2 = {}
L2_2.image = "res/weapons/tracers/smoke_tracer.png"
L2_2.name = "Smoke Tracer"
L2_2.listImage = "smoketracer"
L2_2.smokeTraceImage = "res/weapons/tracers/smoke.png"
L2_2.isSensor = false
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.SMOKE_TRACER
L3_3 = L3_3[L4_4]
L3_3 = L3_3.damage
L2_2.damage = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.SMOKE_TRACER
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastRadius
L2_2.blastRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.SMOKE_TRACER
L3_3 = L3_3[L4_4]
L3_3 = L3_3.forceRadius
L2_2.forceRadius = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.SMOKE_TRACER
L3_3 = L3_3[L4_4]
L3_3 = L3_3.blastForce
L2_2.blastForce = L3_3
L3_3 = weaponBalance
L4_4 = weaponTypes
L4_4 = L4_4.SMOKE_TRACER
L3_3 = L3_3[L4_4]
L3_3 = L3_3.cost
L2_2.cost = L3_3
L3_3 = {}
L3_3.name = "smoke"
L3_3.scale = 0.66
L3_3.x = -35
L3_3.y = 0
L2_2.exhaustSequence = L3_3
L3_3 = {}
L4_4 = densityOfABomb
L3_3.density = L4_4
L3_3.friction = 10
L3_3.bounce = 0
L4_4 = {}
L4_4[1] = -8
L4_4[2] = -3
L4_4[3] = 8
L4_4[4] = -3
L4_4[5] = 8
L4_4[6] = 3
L4_4[7] = -8
L4_4[8] = 3
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
	A0_17.smokeTrace = nil
	local L1_18 = L1_18
	L1_18(A0_17)
	local L2_19 = L2_19
end
L2_2.triggerWeapon = L3_3
function L3_3(A0_20, A1_21, A2_22)
	local L4_23 = L4_23
	local L5_24 = L5_24
	L4_23(L5_24, A1_21, A2_22)
	local L6_25 = L6_25
end
L2_2.go = L3_3
function L3_3(A0_26)
	orientOnPath(A0_26)
	local L2_27 = L2_27
	local L3_28 = L3_28
	L2_27(L3_28, true, true)
	local L4_29 = L4_29
end
L2_2.manualPhysics = L3_3


-- [End of decompiled block; see disassembly for inner stripped closures]
