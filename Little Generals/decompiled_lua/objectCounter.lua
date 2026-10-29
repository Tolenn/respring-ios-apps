local L0_0
L0_0 = {}
L0_0.objectCount = 0
local L0_0[1], L1_1 = objectList, L1_1
Counter = L0_0
L0_0 = {}
L1_1 = Counter
L0_0.__index = L1_1
Counter_mt = L0_0
L0_0 = Counter
function L1_1(A0_2)
	local L1_3
	L1_3 = {}
	L1_3.objectCount = 0
	L1_3.objectList = {}
	L1_3.objectList.__mode = "v"
	local L2_4 = L2_4
	local L3_5 = L3_5
	L2_4(L3_5, Counter_mt)
	local L4_6 = L4_6
	return L1_3
end
L0_0.new = L1_1
L0_0 = Counter
function L1_1(A0_7, A1_8)
	local L2_9
	L2_9 = A1_8.objectId
	if L2_9 then
		return
	end
	L2_9 = A0_7.objectCount
	L2_9 = L2_9 + 1
	A0_7.objectCount = L2_9
	L2_9 = A0_7.objectCount
	A1_8.objectId = L2_9
	L2_9 = A0_7.objectList
	local L3_10 = L3_10
	local L3_10, L4_11 = L3_10(A0_7.objectCount), L4_11
	L2_9[L3_10] = A1_8
end
L0_0.nextId = L1_1
L0_0 = Counter
function L1_1(A0_12, A1_13, A2_14)
	if A1_13.objectId then
		A0_12.objectList[tostring(A1_13.objectId)] = nil
	end
	A1_13.objectId = A2_14
	local L3_15, L4_16 = L3_15, L4_16
	L3_15(L4_16, A1_13)
	local L5_17 = L5_17
end
L0_0.setId = L1_1
L0_0 = Counter
function L1_1(A0_18, A1_19)
	A0_18.objectList[tostring(A1_19.objectId)] = A1_19
	local L2_20 = L2_20
	local L3_21 = L3_21
	local L2_20, L4_22 = L2_20(L3_21, A1_19.objectId + 1), L4_22
	A0_18.objectCount = L2_20
end
L0_0.updateTo = L1_1
L0_0 = Counter
function L1_1(A0_23, A1_24)
	local L2_25
	L2_25 = A0_23.objectList
	local L3_26 = L3_26
	local L3_26, L4_27 = L3_26(A1_24), L4_27
	L2_25 = L2_25[L3_26]
	return L2_25
end
L0_0.object = L1_1
L0_0 = Counter
function L1_1(A0_28, A1_29)
	local L2_30
	L2_30 = A1_29.objectId
	if L2_30 then
		L2_30 = A0_28.objectList
		local L3_31 = L3_31
		local L3_31, L4_32 = L3_31(A1_29.objectId), L4_32
		L2_30[L3_31] = nil
	end
end
L0_0.remove = L1_1
L0_0 = Counter
function L1_1(A0_33)
	return A0_33.objectCount
end
L0_0.highestObjectId = L1_1
L0_0 = Counter
function L1_1(A0_34)
	return A0_34.objectList
end
L0_0.objects = L1_1
L0_0 = Counter
function L1_1(A0_35)
	local L1_36
	A0_35.objectList = nil
end
L0_0.destroy = L1_1
