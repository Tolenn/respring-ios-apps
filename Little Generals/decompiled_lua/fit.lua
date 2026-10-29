local L0_0, L2_2, L3_3 = L0_0, "matrix", L3_3
L0_0 = L0_0(L2_2)
L2_2 = {}
function L3_3(A0_4)
	local L6_10 = L6_10
	L6_10(#A0_4 + 1 == #A0_4[1], "Cannot calculate Results")
	L6_10 = A0_4.dogauss
	L6_10(A0_4)
	local L2_6 = L2_6
	L6_10 = A0_4[1]
	L6_10 = #L6_10
	L2_6 = {}
	_FOR_ = 1
	for _FORV_6_ = _FOR_, _FOR_, _FOR_ do
		L2_6[_FORV_6_] = A0_4[_FORV_6_][L6_10]
	end
	L5_9 = unpack
	L7_11 = L2_6
	return L5_9(L7_11)
end
function L2_2.linear(A0_12, A1_13)
	local L2_14, L3_15
	L2_14 = {}
	L3_15 = {}
	_FOR_, _FOR_, _FOR_ = ipairs(A0_12)
	for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
		L2_14[_FORV_7_], ({})[1] = {}, 1
		L2_14[_FORV_7_], ({})[2] = {}, _FORV_8_
		L3_15[_FORV_7_], ({})[1] = {}, A1_13[_FORV_7_]
	end
	L11_23 = _ENV
	L11_23 = L11_23.new
	L11_23 = L11_23(L11_23, L2_14)
	local L5_17 = L5_17
	L5_17 = L5_17(_ENV, L3_15)
	local L6_18 = L6_18
	L6_18 = L6_18(_ENV.transpose(L11_23), L11_23)
	local L7_19 = L7_19
	L7_19 = L7_19(_ENV.transpose(L11_23), L5_17)
	local L8_20 = L8_20
	L8_20 = L8_20(L6_18, L7_19)
	local L9_21 = L9_21
	do return L9_21(L8_20) end
	local L10_22 = L10_22
end
function L2_2.parabola(A0_24, A1_25)
	local L2_26, L3_27
	L2_26 = {}
	L3_27 = {}
	_FOR_, _FOR_, _FOR_ = ipairs(A0_24)
	for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
		L2_26[_FORV_7_], ({})[1] = {}, 1
		L2_26[_FORV_7_], ({})[2] = {}, _FORV_8_
		L2_26[_FORV_7_], ({})[3] = {}, _FORV_8_ * _FORV_8_
		L3_27[_FORV_7_], ({})[1] = {}, A1_25[_FORV_7_]
	end
	L11_35 = _ENV
	L12_36 = L11_35
	L11_35 = L11_35.new
	L11_35 = L11_35(L12_36, L2_26)
	L12_36 = _ENV
	L12_36 = L12_36.new
	L12_36 = L12_36(L12_36, L3_27)
	local L6_30 = L6_30
	L6_30 = L6_30(_ENV.transpose(L11_35), L11_35)
	local L7_31 = L7_31
	L7_31 = L7_31(_ENV.transpose(L11_35), L12_36)
	local L8_32 = L8_32
	L8_32 = L8_32(L6_30, L7_31)
	local L9_33 = L9_33
	do return L9_33(L8_32) end
	local L10_34 = L10_34
end
function L2_2.exponential(A0_37, A1_38)
	L6_43, _FOR_, _FOR_ = L6_43(A0_37)
	for _FORV_5_, _FORV_6_ in L6_43, _FOR_, _FOR_ do
		A0_37[_FORV_5_] = math.log(_FORV_6_)
		A1_38[_FORV_5_] = math.log(A1_38[_FORV_5_])
	end
	L6_43 = _ENV
	L6_43 = L6_43.linear
	L8_45 = A0_37
	L6_43, L8_45 = L6_43(L8_45, A1_38)
	local L4_41 = L4_41
	local L4_41, L5_42 = L4_41(L6_43), L5_42
	L5_42 = L8_45
	return L4_41, L5_42
end
return L2_2
