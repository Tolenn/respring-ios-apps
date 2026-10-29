local L0_0
L0_0 = "unlockable"
local L1_1, L2_2 = L1_1, L2_2
L1_1 = L1_1(L2_2, L0_0, {})
L2_2 = {}
local L3_3 = L3_3
local L4_4 = L4_4
L2_2[1] = L3_3
L2_2[2] = L4_4
local L2_2[3], L5_5 = unlockState, L5_5
UnlockableContent = L2_2
L2_2 = {}
L3_3 = UnlockableContent
L2_2.__index = L3_3
UnlockableContent_mt = L2_2
L2_2 = UnlockableContent
function L3_3(A0_6, A1_7, A2_8, A3_9)
	local L4_10
	L4_10 = {}
	L4_10.id = tostring(A1_7)
	L4_10.name = A2_8
	L4_10.cost = A3_9
	if not _ENV[A1_7] then
	end
	L4_10.unlockState = CUSTOM_OVERRIDES.OVERRIDE_UNLOCK
	local L5_11 = L5_11
	local L6_12 = L6_12
	L5_11(L6_12, UnlockableContent_mt)
	local L7_13 = L7_13
	return L4_10
end
L2_2.new = L3_3
L2_2 = UnlockableContent
function L3_3(A0_14, A1_15, A2_16)
	local L3_17
	function L3_17(A0_21)
		if A0_21 then
			_ENV.unlockState = true
			_ENV[_ENV.id] = true
			local L3_24 = L3_24
			L3_24(settings, L0_0, _ENV)
			local L4_25 = L4_25
			L3_24 = settings
			L4_25 = L3_24
			L3_24 = L3_24.save
			L3_24(L4_25)
		end
		L3_24 = A1_15
		if L3_24 then
			L3_24 = A1_15
			L4_25 = A0_21
			L3_24(L4_25)
		end
	end
	local L6_20 = L6_20
	if not A2_16 then
		L6_20 = A0_14.cost
		if L6_20 ~= nil then
			goto lbl_15
		end
	end
	L6_20 = L3_17
	L6_20(true)
	goto lbl_23
	::lbl_15::
	L6_20 = A0_14.cost
	if L6_20 then
		L6_20 = A0_14.cost
		L6_20 = L6_20.pay
		local L5_19 = L5_19
		L6_20(L5_19, function(A0_26)
			_ENV(A0_26)
			local L2_27 = L2_27
		end)
	end
	::lbl_23::
end
L2_2.unlock = L3_3
L2_2 = UnlockableContent
function L3_3(A0_28)
	repeat
		if not A0_28.unlockState and A0_28.cost then
			do return A0_28.cost:canAfford() end
			local L1_29, L2_30 = L1_29, L2_30
			break -- pseudo-goto
		end
		L1_29 = {}
		return L1_29
	until true
end
L2_2.canUnlock = L3_3
