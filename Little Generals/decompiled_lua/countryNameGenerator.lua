local L0_0 = L0_0
L0_0((...), package.seeall)
L0_0 = {}
local L1_1 = L1_1
local L18_18 = L18_18
local L19_19 = L19_19
L0_0[1] = L1_1
L0_0[2] = L18_18
L0_0[3] = L19_19
L0_0[4] = "Empire of"
L0_0[5] = nil
L0_0[6] = "Federated States of"
L0_0[7] = "Loosly Federated States of"
L0_0[8] = "Republic of"
L0_0[9] = nil
L0_0[10] = "Confederacy of"
L0_0[11] = "Dutchy of"
L0_0[12] = "Union of"
L0_0[13] = nil
L0_0[14] = "United"
L0_0[15] = "Re-united"
L0_0[16] = "United States of"
L0_0[17] = nil
L0_0[18] = "Independant"
L0_0[19] = "Old"
local L0_0[20], L20_20 = "Cultural Wasteland of", L20_20
L1_1 = {}
L18_18 = nil
L19_19 = "North"
L20_20 = "South"
L1_1[1] = L18_18
L1_1[2] = L19_19
L1_1[3] = L20_20
L1_1[4] = "East"
L1_1[5] = nil
L1_1[6] = "West"
L1_1[7] = "Upper"
L1_1[8] = "Lower"
L1_1[9] = "Central"
L18_18 = {}
L19_19 = "Foos"
L20_20 = "Blur"
local L16_16 = L16_16
L18_18[1] = L19_19
L18_18[2] = L20_20
L18_18[3] = L16_16
L18_18[4] = "Turd"
L18_18[5] = "Haha"
L18_18[6] = "Fork"
L18_18[7] = "Zit"
L18_18[8] = "Eep"
L18_18[9] = "Pickle"
L18_18[10] = "Frazzle"
L18_18[11] = "Snaggle"
L18_18[12] = "Mung"
L18_18[13] = "Whiffle"
L18_18[14] = "Chooch"
local L18_18[15], L17_17 = "Zort", L17_17
L19_19 = {}
L20_20 = nil
L16_16 = "beckistan"
L17_17 = "munistan"
local L7_7 = L7_7
local L8_8 = L8_8
local L9_9 = L9_9
local L10_10 = L10_10
local L11_11 = L11_11
local L12_12 = L12_12
local L13_13 = L13_13
L19_19[1] = L20_20
L19_19[2] = L16_16
L19_19[3] = L17_17
L19_19[4] = L7_7
L19_19[5] = L8_8
L19_19[6] = L9_9
L19_19[7] = L10_10
L19_19[8] = L11_11
L19_19[9] = L12_12
L19_19[10] = L13_13
local L19_19[11], L14_14 = "a", L14_14
function L20_20()
	local L0_21, L1_22
	L0_21 = ""
	L1_22 = _ENV
	L1_22 = L1_22[math.random(1, #_ENV)]
	if L1_22 then
		local L2_23 = L2_23
		L0_21 = L2_23 .. " "
	end
	L2_23 = L1_1
	L2_23 = L2_23[math.random(1, #L1_1)]
	if L2_23 then
		L0_21 = L0_21 .. L2_23 .. " "
	end
	local L3_24 = L3_24
	local L7_28 = L7_28
	L7_28 = L7_28[math.random(1, #L2_2)]
	L0_21 = L3_24 .. L7_28
	L3_24 = L3_3
	L7_28 = math
	L7_28 = L7_28.random
	L7_28 = L7_28(1, #L3_3)
	L3_24 = L3_24[L7_28]
	if L3_24 then
		L7_28 = L0_21
		local L0_21, L5_26 = L7_28 .. L3_24, L5_26
	end
	return L0_21
end
generateName = L20_20
function L20_20()
	local L0_29, L1_30, L2_31, L3_32, L4_33
	L0_29 = 1
	L1_30 = 100
	L2_31 = 1
	for L3_32 = L0_29, L1_30, L2_31 do
		L4_33 = print
		local L5_34 = generateName()
		L4_33(L5_34)
	end
end
test = L20_20
