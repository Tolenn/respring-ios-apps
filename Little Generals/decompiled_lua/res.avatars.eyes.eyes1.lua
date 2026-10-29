local L0_0, L1_1
L0_0 = {}
function L1_1(A0_2)
	sprite.add(A0_2, "idle", 4, 2, 250, 1)
	sprite.add(A0_2, "hurtIdle", 2, 2, 400, 1)
	sprite.add(A0_2, "stun", 6, 1, 1000, 1)
	sprite.add(A0_2, "anger", 1, 1, 1000, 1)
	local L2_3 = L2_3
	local L3_4 = L3_4
	local L4_5 = L4_5
	local L5_6 = L5_6
	local L6_7 = L6_7
	L2_3(L3_4, L4_5, L5_6, L6_7, 1000, 1)
	local L7_8 = L7_8
end
L0_0.buildAnimations = L1_1
function L1_1(A0_9)
	local L1_10, L2_11, L3_12, L4_13
	L1_10 = A0_9.phase
	if L1_10 ~= "end" then
		return
	end
	L1_10 = A0_9.sprite
	L1_10 = L1_10.mode
	if L1_10 ~= "idle" then
		L1_10 = A0_9.sprite
		L1_10 = L1_10.mode
		if L1_10 ~= "hurtIdle" then
			goto lbl_39
		end
	end
	L1_10 = 2000
	L2_11 = 8000
	L3_12 = false
	L4_13 = A0_9.sprite
	L4_13 = L4_13.mode
	if A0_9.sprite.mode == "hurtIdle" then
		L1_10 = 0
		L2_11 = 2000
		L3_12 = true
	end
	local L5_14 = L5_14
	local L7_16 = L7_16
	local L7_16, L8_17 = L7_16(L1_10, L2_11), L8_17
	function L8_17()
		if _ENV.sprite.mode == L4_13 then
			local L1_18 = L1_18
			L1_18(_ENV.sprite, L3_12)
			local L2_19 = L2_19
		end
	end
	L5_14(L7_16, L8_17)
	::lbl_39::
end
L0_0.endListener = L1_1
function L1_1(A0_20)
	A0_20:prepare("stun")
	local L3_21 = L3_21
	L3_21 = A0_20.play
	L3_21(A0_20)
end
L0_0.stunAnimation = L1_1
function L1_1(A0_22)
	A0_22:prepare("anger")
	local L3_23 = L3_23
	L3_23 = A0_22.play
	L3_23(A0_22)
end
L0_0.angerAnimation = L1_1
function L1_1(A0_24)
	A0_24:prepare("laugh")
	local L3_25 = L3_25
	L3_25 = A0_24.play
	L3_25(A0_24)
end
L0_0.laughAnimation = L1_1
function L1_1(A0_26, A1_27)
	local L2_28
	L2_28 = "idle"
	if A1_27 then
		L2_28 = "hurtIdle"
	end
	A0_26.mode = L2_28
	if A0_26.prepare then
		A0_26:prepare(L2_28)
		A0_26:removeEventListener("sprite", _ENV.endListener)
		local L5_31 = L5_31
		L5_31(A0_26, "sprite", _ENV.endListener)
		local L6_32 = L6_32
		L6_32 = A0_26
		L5_31 = A0_26.play
		L5_31(L6_32)
	end
end
L0_0.idleAnimation = L1_1
function L1_1(A0_33)
	local L2_34 = L2_34
	L2_34(A0_33, false)
	local L3_35 = L3_35
end
L0_0.talkAnimation = L1_1
function L1_1(A0_36)
	A0_36.mode = nil
	local L1_37, L2_38 = L1_37, L2_38
	local L3_39 = L3_39
	L1_37(L2_38, L3_39, _ENV.endListener)
	local L4_40 = L4_40
end
L0_0.stopAnimation = L1_1
function L1_1(A0_41)
	A0_41.buildAnimations = _ENV.buildAnimations
	A0_41.endListener = _ENV.endListener
	A0_41.stunAnimation = _ENV.stunAnimation
	A0_41.angerAnimation = _ENV.angerAnimation
	A0_41.laughAnimation = _ENV.laughAnimation
	A0_41.idleAnimation = _ENV.idleAnimation
	A0_41.talkAnimation = _ENV.talkAnimation
end
L0_0.copyInto = L1_1
return L0_0
