-- Decompiled & AI-Repaired from res.avatars.mouths.mouth1.lu
-- Source disassembly preserved at: disasm/res.avatars.mouths.mouth1.disasm

module((...), package.seeall)
local L2_1 = L2_1
L2_1 = require
L2_1 = L2_1("sprite")
sprite = L2_1
function L2_1(A0_2)
	sprite.add(A0_2, "idle", 2, 3, 1200, 1)
	sprite.add(A0_2, "hurtIdle", 2, 3, 1200, 1)
	sprite.add(A0_2, "talking", 5, 3, 1000, 0)
	sprite.add(A0_2, "stun", 6, 1, 1000, 0)
	sprite.add(A0_2, "anger", 1, 1, 1000, 0)
	local L2_3 = L2_3
	local L3_4 = L3_4
	local L4_5 = L4_5
	local L5_6 = L5_6
	local L6_7 = L6_7
	L2_3(L3_4, L4_5, L5_6, L6_7, 500, 0)
	local L7_8 = L7_8
end
buildAnimations = L2_1
function L2_1(A0_9, A1_10)
	local L2_11, L3_12, L4_13, L5_14
	L2_11 = "idle"
	L3_12 = 1000
	L4_13 = 1500
	if A1_10 then
		L2_11 = "hurtIdle"
		L3_12 = 0
		L4_13 = 2000
	end
	function L5_14(A0_19)
		if A0_19.phase == "end" then
			local L1_20 = L1_20
			local L3_22 = L3_22
			local L3_22, L4_23 = L3_22(_ENV, L4_13), L4_23
			function L4_23()
				if _ENV.prepare then
					_ENV:prepare(L2_11)
					local L2_25 = L2_25
					L2_25 = _ENV
					L2_25 = L2_25.play
					L2_25(L2_25)
				end
			end
			L1_20(L3_22, L4_23)
		end
	end
	A0_9:prepare(L2_11)
	local L8_17 = L8_17
	L8_17(A0_9, "sprite", L5_14)
	local L9_18 = L9_18
	L9_18 = A0_9
	L8_17 = A0_9.play
	L8_17(L9_18)
end
idleAnimation = L2_1
function L2_1(A0_26, A1_27)
	if A1_27 then
		A0_26:prepare("talking")
		A0_26:play()
	else
		local L2_28 = L2_28
		local L3_29 = L3_29
		L2_28(L3_29, false)
		local L4_30 = L4_30
	end
end
talkAnimation = L2_1
function L2_1(A0_31)
	A0_31:prepare("stun")
	local L3_32 = L3_32
	L3_32 = A0_31.play
	L3_32(A0_31)
end
stunAnimation = L2_1
function L2_1(A0_33)
	A0_33:prepare("anger")
	local L3_34 = L3_34
	L3_34 = A0_33.play
	L3_34(A0_33)
end
angerAnimation = L2_1
function L2_1(A0_35)
	A0_35:prepare("laugh")
	local L3_36 = L3_36
	L3_36 = A0_35.play
	L3_36(A0_35)
end
laughAnimation = L2_1


-- [End of decompiled block; see disassembly for inner stripped closures]
