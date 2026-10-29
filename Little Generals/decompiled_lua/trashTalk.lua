module((...), package.seeall)
local L0_0 = L0_0
L0_0 = L0_0("currentBattle")
TrashPhrases, ({})[1] = {}, phrases
TrashPhrases_mt, ({}).__index = {}, TrashPhrases
function TrashPhrases.new(A0_13)
	local L1_14
	L1_14 = {}
	L1_14.phrases = {}
	local L2_15 = L2_15
	local L3_16 = L3_16
	L2_15(L3_16, TrashPhrases_mt)
	local L4_17 = L4_17
	return L1_14
end
function TrashPhrases.random(A0_18, A1_19, A2_20)
	repeat
		local L4_22 = require("currentBattle")
		L4_22 = L4_22.isSinglePlayer
		L4_22 = L4_22()
		if not L4_22 and not A2_20 then
			L4_22 = nil
			return L4_22
		end
		L4_22 = CUSTOM_OVERRIDES
		L4_22 = L4_22.TALK_ODDS
		L4_22 = A1_19 or L4_22
		if not L4_22 and not A1_19 then
			L4_22 = 20
		end
		local L5_23 = L5_23
		local L6_24 = L6_24
		L6_24 = L6_24(1, L4_22)
		L5_23 = L5_23(L6_24, L6_24(1, L4_22))
		L6_24 = L5_23 % L4_22
		L6_24 = L6_24 == 0
		if L6_24 then
			local L7_25 = L7_25
			local L8_26 = L8_26
			local L9_27 = L9_27
			L8_26 = L8_26(L9_27, #A0_18.phrases)
			L7_25 = L7_25[L8_26]
			do return L7_25 end
			break -- pseudo-goto
		end
		L7_25 = nil
		return L7_25
	until true
end
BATTLE_PREAMBLE = TrashPhrases:new()
MISSED_SHOT = TrashPhrases:new()
MOVING_FORWARD = TrashPhrases:new()
MOVING_BACKWARD = TrashPhrases:new()
IDLE = TrashPhrases:new()
HIT_FIRST_DMG = TrashPhrases:new()
HIT_LOW_DMG = TrashPhrases:new()
HIT_MED_DMG = TrashPhrases:new()
HIT_HIGH_DMG = TrashPhrases:new()
WIN = TrashPhrases:new()
local L1_1 = TrashPhrases:new()
LOSS = L1_1
L1_1 = {}
local L2_2 = L2_2
local L3_3 = L3_3
local L4_4 = L4_4
local L6_6 = L6_6
local L7_7 = L7_7
local L8_8 = L8_8
local L9_9 = L9_9
local L10_10 = L10_10
local L11_11 = L11_11
L1_1[1] = L2_2
L1_1[2] = L3_3
L1_1[3] = L4_4
L1_1[4] = L6_6
L1_1[5] = L7_7
L1_1[6] = L8_8
L1_1[7] = L9_9
L1_1[8] = L10_10
L1_1[9] = L11_11
L1_1[10] = WIN
local L1_1[11], L12_12 = LOSS, L12_12
function L2_2(A0_28)
	if string.find(A0_28, "[,\"]") then
		local L4_31 = L4_31
		local L5_32 = string.gsub(A0_28, "\"", "\"\"")
		A0_28 = L4_31 .. L5_32 .. "\""
	end
	return A0_28
end
function L3_3(A0_33)
	local L1_34 = L1_34
	local A0_33, L2_35 = L1_34 .. ",", L2_35
	L1_34 = {}
	L2_35 = 1
	repeat
		if string.find(A0_33, "^\"", L2_35) then
			repeat
			until string.find(A0_33, "\"(\"?)", L2_35 + 1) ~= "\""
			if not string.find(A0_33, "\"(\"?)", L2_35 + 1) then
				error("unmatched \"")
			end
			local L11_44 = L11_44
			local L12_45 = L12_45
			table.insert(L1_34, (string.gsub(string.sub(A0_33, L2_35 + 1, string.find(A0_33, "\"(\"?)", L2_35 + 1) - 1), "\"\"", "\"")))
			L2_35 = string.find(A0_33, ",", string.find(A0_33, "\"(\"?)", L2_35 + 1)) + 1
			break -- pseudo-goto
		end
		L11_44 = string
		L11_44 = L11_44.find
		L12_45 = A0_33
		L11_44 = L11_44(L12_45, ",", L2_35)
		L12_45 = table
		L12_45 = L12_45.insert
		local L7_40 = L7_40
		local L8_41 = L8_41
		local L8_41, L9_42 = L8_41(A0_33, L2_35, L11_44 - 1)
		repeat
			L12_45(L7_40, L8_41, L9_42, L8_41(A0_33, L2_35, L11_44 - 1))
			L2_35 = L11_44 + 1
		until true
		L11_44 = string
		L11_44 = L11_44.len
		L12_45 = A0_33
		L11_44 = L11_44(L12_45)
	until L2_35 > L11_44
	return L1_34
end
function L4_4()
	local L10_56 = io.open
	local L1_47 = L1_47
	L10_56, L1_47 = L10_56(L1_47, "r")
	if L10_56 then
		local L2_48 = L2_48
		L2_48 = L2_48(L10_56, "*l")
		local L3_49 = L3_49
		L3_49 = L3_49(L2_48)
		_FOR_, _FOR_, _FOR_ = pairs(L3_49)
		for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
			L1_1[_FORV_7_].name = _FORV_8_
		end
		L9_55 = L10_56.read
		L9_55 = L9_55(L10_56, "*l")
		L2_48 = L9_55
		while L2_48 do
			L9_55 = _ENV
			L9_55 = L9_55(L2_48)
			_FOR_, _FOR_, _FOR_ = ipairs(L9_55)
			for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
				if _FORV_10_ ~= "" then
					local L11_57 = L11_57
					table.insert(L1_1[L11_57].phrases, _FORV_10_)
				end
				L11_57 = L11_57 + 1
			end
			L13_59 = L10_56
			L12_58 = L10_56.read
			L12_58 = L12_58(L13_59, "*l")
			L2_48 = L12_58
		end
		L11_57 = L10_56
		L9_55 = L10_56.close
		L9_55(L11_57)
	end
end
L6_6 = L4_4
L6_6()
