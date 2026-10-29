-- Decompiled & AI-Repaired from avatar.lu
-- Source disassembly preserved at: disasm/avatar.disasm

local L0_0 = L0_0
L0_0((...), package.seeall)
L0_0 = {}
local L1_1 = L1_1
local L2_2 = L2_2
local L3_3 = L3_3
local L4_4 = L4_4
local L5_5 = L5_5
local L6_6 = L6_6
local L7_7 = L7_7
local L8_8 = L8_8
local L9_9 = L9_9
local L10_10 = L10_10
L0_0[1] = L1_1
L0_0[2] = L2_2
L0_0[3] = L3_3
L0_0[4] = L4_4
L0_0[5] = L5_5
L0_0[6] = L6_6
L0_0[7] = L7_7
L0_0[8] = L8_8
L0_0[9] = L9_9
L0_0[10] = L10_10
local L0_0[11], L11_11 = glasses, L11_11
Avatar = L0_0
L0_0 = {}
L1_1 = Avatar
L0_0.__index = L1_1
Avatar_mt = L0_0
function L0_0(A0_12)
	local L1_13
	L1_13 = {}
	L4_16 = pairs
	L5_17 = A0_12
	L4_16, L5_17, L6_18 = L4_16(L5_17)
	for L7_19, L8_20 in L4_16, L5_17, L6_18 do
		L9_21 = 1
		L10_22 = #L8_20
		_FOR_ = 1
		for _FORV_10_ = L9_21, L10_22, _FOR_ do
			table.insert(L1_13, L8_20[_FORV_10_])
			local L13_25 = L13_25
		end
	end
	return L1_13
end
function L1_1(A0_26)
	local L1_27
	L1_27 = {}
	setmetatable(L1_27, Avatar_mt)
	L4_30 = pairs
	L4_30, L3_29, _FOR_ = L4_30(A0_26)
	for _FORV_5_, _FORV_6_ in L4_30, L3_29, _FOR_ do
		L1_27[_FORV_5_] = _FORV_6_
	end
	return L1_27
end
create = L1_1
function L1_1(A0_31)
	local L1_32
	L1_32 = {}
	L1_32.light, ({})[1] = {}, "res/avatars/heads/light/head1"
	L1_32.light, ({})[2] = {}, "res/avatars/heads/light/head2"
	L1_32.light, ({})[3] = {}, "res/avatars/heads/light/head3"
	L1_32.light, ({})[4] = {}, "res/avatars/heads/light/head4"
	L1_32.light, ({})[5] = {}, "res/avatars/heads/light/head5"
	L1_32.tan, ({})[1] = {}, "res/avatars/heads/tan/head1_tan"
	L1_32.tan, ({})[2] = {}, "res/avatars/heads/tan/head2_tan"
	L1_32.tan, ({})[3] = {}, "res/avatars/heads/tan/head3_tan"
	L1_32.tan, ({})[4] = {}, "res/avatars/heads/tan/head4_tan"
	L1_32.tan, ({})[5] = {}, "res/avatars/heads/tan/head5_tan"
	local L4_35 = L4_35
	local L5_36 = L5_36
	local L6_37 = L6_37
	L4_35[1] = L5_36
	L4_35[2] = L6_37
	L4_35[3] = "res/avatars/heads/dark/head3_dark"
	L4_35[4] = "res/avatars/heads/dark/head4_dark"
	local L4_35[5], L7_38 = "res/avatars/heads/dark/head5_dark", L7_38
	L1_32.dark = L4_35
	if not A0_31 then
		return L1_32
	elseif A0_31 == "all" then
		L4_35 = _ENV
		L5_36 = L1_32
		return L4_35(L5_36)
	end
	L4_35 = L1_32[A0_31]
	return L4_35
end
heads = L1_1


-- [End of decompiled block; see disassembly for inner stripped closures]
