local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
L0_0 = {}
L1_1 = {}
L0_0.stats = L1_1
L1_1 = {}
L0_0.mpStats = L1_1
function L1_1(A0_9)
	local L1_10 = L1_10
	local L1_10, L2_11 = L1_10("currentBattle"), L2_11
	if L1_10 then
		L2_11 = L1_10.isMultiplayer
		if L2_11 then
			L2_11 = A0_9.mpStats
			return L2_11
		end
	end
	L2_11 = A0_9.stats
	return L2_11
end
L0_0.getStatRootTable = L1_1
function L2_2(A0_12, A1_13, A2_14)
	local L3_15, L4_16, L7_19 = L3_15, L4_16, "."
	L3_15 = L3_15(L4_16, L7_19)
	L4_16 = 1
	L7_19 = A1_13 or L7_19
	if not A1_13 then
		L8_20 = A0_12
		L7_19 = A0_12.getStatRootTable
		L7_19 = L7_19(L8_20)
	end
	L8_20 = #L3_15
	if 1 < L8_20 then
		L8_20 = 1
		L9_21 = #L3_15
		L9_21 = L9_21 - 1
		L10_22 = 1
		for L11_23 = L8_20, L9_21, L10_22 do
			if not L7_19[L3_15[L11_23]] then
				L7_19[L3_15[L11_23]] = {}
			end
			L7_19 = L7_19[L3_15[L11_23]]
		end
	end
	L8_20 = L7_19
	L9_21 = #L3_15
	L9_21 = L3_15[L9_21]
	return L8_20, L9_21
end
L0_0.getStatParentTable = L2_2
function L3_3(A0_24, A1_25, A2_26, A3_27)
	local L4_28 = L4_28
	local L6_29 = L6_29
	local L4_28, L6_29, L7_30 = L4_28(L6_29, A3_27, A1_25)
	L4_28[L6_29] = A2_26
end
L0_0.setStat = L3_3
function L4_4(A0_31, A1_32, A2_33, A3_34)
	local L4_35, L5_36 = L4_35, L5_36
	local L6_37 = L6_37
	local L4_35, L5_36, L7_38 = L4_35(L5_36, L6_37, A1_32)
	L6_37 = L4_35[L5_36]
	if not L6_37 then
		L6_37 = A2_33
	end
	return L6_37
end
L0_0.getStat = L4_4
function L5_5(A0_39, A1_40, A2_41, A3_42)
	local L4_43, L5_44 = L4_43, L5_44
	local L6_45 = L6_45
	local L4_43, L5_44, L7_46 = L4_43(L5_44, L6_45, A1_40)
	if not A2_41 then
		A2_41 = 0
	end
	L6_45 = L4_43[L5_44]
	if not L6_45 then
		L4_43[L5_44] = A2_41
	else
		L6_45 = L4_43[L5_44]
		L6_45 = L6_45 + A2_41
		L4_43[L5_44] = L6_45
	end
	L6_45 = L4_43[L5_44]
	return L6_45
end
L0_0.addToStat = L5_5
function L6_6(A0_47)
	local L6_53, L7_54 = L6_53, "settings"
	L6_53 = L6_53(L7_54)
	L6_53 = L6_53.new
	L7_54 = "tombstone.json"
	L6_53 = L6_53(L7_54)
	L9_56 = L6_53
	L7_54 = L6_53.load
	L7_54(L9_56)
	A0_47.data = L6_53
	L7_54 = A0_47.data
	L9_56 = L7_54
	L7_54 = L7_54.get
	L7_54 = L7_54(L9_56, "stats")
	if L7_54 then
		L9_56 = pairs
		L9_56, _FOR_, _FOR_ = L9_56(L7_54)
		for _FORV_6_, _FORV_7_ in L9_56, _FOR_, _FOR_ do
			A0_47.stats[_FORV_6_] = _FORV_7_
		end
	end
	L9_56 = A0_47.data
	L9_56 = L9_56.get
	L9_56 = L9_56(L9_56, "mpStats")
	if L9_56 then
		L4_51, L5_52, _FOR_ = L4_51(L9_56)
		for _FORV_7_, _FORV_8_ in L4_51, L5_52, _FOR_ do
			A0_47.mpStats[_FORV_7_] = _FORV_8_
		end
	end
end
L0_0.load = L6_6
function L7_7(A0_57)
	local L1_58
	L1_58 = {}
	_FOR_, _FOR_, _FOR_ = pairs(A0_57.stats)
	for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
		L1_58[_FORV_5_] = _FORV_6_
	end
	local L2_59 = L2_59
	L2_59(A0_57.data, "stats", L1_58)
	L2_59 = {}
	_FOR_, _FOR_, _FOR_ = pairs(A0_57.mpStats)
	for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
		L2_59[_FORV_6_] = _FORV_7_
	end
	local L5_62 = L5_62
	L5_62(A0_57.data, "mpStats", L2_59)
	local L6_63 = L6_63
	L5_62 = A0_57.data
	L6_63 = L5_62
	L5_62 = L5_62.save
	L5_62(L6_63)
end
L0_0.save = L7_7
function L8_8(A0_64, A1_65)
	local L2_66 = L2_66
	L2_66 = L2_66 .. tostring(A1_65)
	if not (0 < A0_64:getStat(L2_66, 0, A0_64.stats)) then
		local L3_67, L4_68 = L3_67, L4_68
		local L5_69 = L5_69
		local L6_70 = L6_70
		local L3_67, L7_71 = L3_67(L4_68, L5_69, L6_70, A0_64.mpStats), L7_71
		if not (0 < L3_67) then
			goto lbl_22
		end
	end
	L3_67 = false
	do return L3_67 end
	::lbl_22::
	L3_67 = true
	return L3_67
end
L0_0.weaponIsUnused = L8_8
return L0_0
