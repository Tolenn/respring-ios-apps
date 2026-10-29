local L0_0, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8 = L0_0, "campaignThemes", L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
L0_0 = L0_0(L2_2)
L2_2 = "CampaignStates"
L3_3 = "CampaignStatesVersion"
L4_4 = "33"
L5_5 = 100000
L6_6 = 5
L7_7 = 12
L8_8 = 5
HOMELAND_COUNTRY_ID = 1
campaigns = {}
landType = L0_0.landType
flairType = L0_0.flairType
;({}).x = -76
;({}).N, ({}).y = {}, -38
;({}).x = 76
;({}).E, ({}).y = {}, -38
;({}).x = 76
;({}).S, ({}).y = {}, 38
;({}).x = -76
LandImageSteps, ({}).W, ({}).y = {}, {}, 38
;({}).x = 0
;({}).N, ({}).y = {}, -1
;({}).x = 1
;({}).E, ({}).y = {}, 0
;({}).x = 0
;({}).S, ({}).y = {}, 1
;({}).x = -1
LandSteps, ({}).W, ({}).y = {}, {}, 0
;({}).num = 1
;({}).previousCampaigns = {}
;({}).theme = 1
;({}).outIslands = {}
;({}).finishedDate = nil
;({}).wins = 0
;({}).losses = 0
;({}).totalShots = 0
;({}).totalHits = 0
;({}).totalWeaponShots = {}
;({}).totalWeaponHits = {}
;({}).otherStats = {}
;({}).id = 1
;({}).lands, ({})[1] = {}, 1
;({}).owned = true
;({}).landType = landType.MOUNTAINS
;({}).countries, ({})[1] = {}, {}
;({}).id = 1
;({}).countryId = 1
;({}).N = 0
;({}).E = 0
;({}).S = 0
;({}).adjacent, ({}).W = {}, 0
;({}).N = 0
;({}).E = 0
;({}).S = 0
;({}).borders, ({}).W = {}, 0
;({}).x = 0
;({}).y = 0
;({}).flair = {}
Campaign, ({}).lands, ({})[1] = {}, {}, {}
;({}).name = "New Country"
;({}).underAttackDate = nil
;({}).won = false
;({}).owned = false
;({}).landType = landType.MOUNTAINS
;({}).seed = nil
;({}).lossDate = nil
;({}).winDate = nil
;({}).underAttackDate = nil
;({}).moneyStartDate = nil
;({}).moneyAmount = 0
;({}).factoryStartDate = nil
;({}).factoryLandId = nil
;({}).factoryType = nil
;({}).factoryRuns = nil
;({}).wheelOfFortune = false
;({}).lands = {}
;({}).wins = 0
;({}).losses = 0
;({}).totalShots = 0
Country, ({}).totalWeaponShots = {}, {}
;({}).N = 0
;({}).E = 0
;({}).S = 0
;({}).adjacent, ({}).W = {}, 0
;({}).N = 0
;({}).E = 0
;({}).S = 0
;({}).borders, ({}).W = {}, 0
;({}).deleted = false
;({}).countryId = 0
;({}).flair = {}
;({}).x = 0
Land, ({}).y = {}, 0
;({}).shaderImage = "res/maps/darkoverlay.png"
;({}).E_double, ({})[1] = {}, 1
;({}).E_double, ({})[2] = {}, 3
;({}).W_double, ({})[1] = {}, 2
;({}).W_double, ({})[2] = {}, 4
;({}).E_single, ({})[1] = {}, 5
;({}).E_single, ({})[2] = {}, 7
;({}).E_single, ({})[3] = {}, 9
;({}).W_single, ({})[1] = {}, 6
;({}).W_single, ({})[2] = {}, 8
;({}).W_single, ({})[3] = {}, 10
;({}).EW_line = 11
;({}).N_double, ({})[1] = {}, 12
;({}).N_double, ({})[2] = {}, 14
;({}).S_double, ({})[1] = {}, 13
;({}).S_double, ({})[2] = {}, 15
;({}).N_single, ({})[1] = {}, 16
;({}).N_single, ({})[2] = {}, 18
;({}).N_single, ({})[3] = {}, 20
;({}).S_single, ({})[1] = {}, 17
;({}).S_single, ({})[2] = {}, 19
;({}).S_single, ({})[3] = {}, 21
;({}).NS_line = 22
;({}).line = "NS_line.png"
;({}).E1 = "double_jagged.png"
;({}).W2 = "double_jagged.png"
;({}).E3 = "double_triangle.png"
;({}).W4 = "double_triangle.png"
;({}).E5 = "single_smtriangle.png"
;({}).W6 = "single_smtriangle.png"
;({}).E7 = "single_wedge.png"
;({}).W8 = "single_wedge.png"
;({}).E9 = "single_triangle.png"
;({}).W10 = "single_triangle.png"
;({}).N12 = "double_jagged.png"
;({}).S13 = "double_jagged.png"
;({}).N14 = "double_triangle.png"
;({}).S15 = "double_triangle.png"
;({}).N16 = "single_smtriangle.png"
;({}).S17 = "single_smtriangle.png"
;({}).N18 = "single_wedge.png"
;({}).S19 = "single_wedge.png"
;({}).N20 = "single_triangle.png"
;({}).borderTemplates, ({}).S21 = {}, "single_triangle.png"
;({}).NS_straight, ({})[1] = {}, 0
;({}).NS_straight, ({})[2] = {}, 0
;({}).NS_straight, ({})[3] = {}, 77
;({}).NS_straight, ({})[4] = {}, -38
;({}).EW_straight, ({})[1] = {}, 0
;({}).EW_straight, ({})[2] = {}, 0
;({}).EW_straight, ({})[3] = {}, 77
;({}).EW_straight, ({})[4] = {}, 38
;({}).NS_double_triangle1, ({})[1] = {}, 0
;({}).NS_double_triangle1, ({})[2] = {}, 0
;({}).NS_double_triangle1, ({})[3] = {}, 29
;({}).NS_double_triangle1, ({})[4] = {}, -64
;({}).NS_double_triangle1, ({})[5] = {}, 154
;({}).NS_double_triangle1, ({})[6] = {}, -76
;({}).NS_double_triangle2, ({})[1] = {}, 0
;({}).NS_double_triangle2, ({})[2] = {}, 0
;({}).NS_double_triangle2, ({})[3] = {}, -29
;({}).NS_double_triangle2, ({})[4] = {}, 64
;({}).NS_double_triangle2, ({})[5] = {}, -154
;({}).NS_double_triangle2, ({})[6] = {}, 76
;({}).NS_double_jagged1, ({})[1] = {}, 0
;({}).NS_double_jagged1, ({})[2] = {}, 0
;({}).NS_double_jagged1, ({})[3] = {}, 15
;({}).NS_double_jagged1, ({})[4] = {}, -28
;({}).NS_double_jagged1, ({})[5] = {}, 62
;({}).NS_double_jagged1, ({})[6] = {}, -48
;({}).NS_double_jagged1, ({})[7] = {}, 65
;({}).NS_double_jagged1, ({})[8] = {}, -68
;({}).NS_double_jagged1, ({})[9] = {}, 154
;({}).NS_double_jagged1, ({})[10] = {}, -76
;({}).NS_double_jagged2, ({})[1] = {}, 0
;({}).NS_double_jagged2, ({})[2] = {}, 0
;({}).NS_double_jagged2, ({})[3] = {}, -15
;({}).NS_double_jagged2, ({})[4] = {}, 28
;({}).NS_double_jagged2, ({})[5] = {}, -62
;({}).NS_double_jagged2, ({})[6] = {}, 48
;({}).NS_double_jagged2, ({})[7] = {}, -65
;({}).NS_double_jagged2, ({})[8] = {}, 68
;({}).NS_double_jagged2, ({})[9] = {}, -154
;({}).NS_double_jagged2, ({})[10] = {}, 76
;({}).EW_double_triangle1, ({})[1] = {}, 0
;({}).EW_double_triangle1, ({})[2] = {}, 0
;({}).EW_double_triangle1, ({})[3] = {}, 129
;({}).EW_double_triangle1, ({})[4] = {}, 11
;({}).EW_double_triangle1, ({})[5] = {}, 154
;({}).EW_double_triangle1, ({})[6] = {}, 76
;({}).EW_double_triangle2, ({})[1] = {}, 0
;({}).EW_double_triangle2, ({})[2] = {}, 0
;({}).EW_double_triangle2, ({})[3] = {}, -129
;({}).EW_double_triangle2, ({})[4] = {}, -11
;({}).EW_double_triangle2, ({})[5] = {}, -154
;({}).EW_double_triangle2, ({})[6] = {}, -76
;({}).EW_double_jagged1, ({})[1] = {}, 0
;({}).EW_double_jagged1, ({})[2] = {}, 0
;({}).EW_double_jagged1, ({})[3] = {}, 88
;({}).EW_double_jagged1, ({})[4] = {}, 8
;({}).EW_double_jagged1, ({})[5] = {}, 90
;({}).EW_double_jagged1, ({})[6] = {}, 28
;({}).EW_double_jagged1, ({})[7] = {}, 137
;({}).EW_double_jagged1, ({})[8] = {}, 48
;({}).EW_double_jagged1, ({})[9] = {}, 154
;({}).EW_double_jagged1, ({})[10] = {}, 76
;({}).EW_double_jagged2, ({})[1] = {}, 0
;({}).EW_double_jagged2, ({})[2] = {}, 0
;({}).EW_double_jagged2, ({})[3] = {}, -88
;({}).EW_double_jagged2, ({})[4] = {}, -8
;({}).EW_double_jagged2, ({})[5] = {}, -90
;({}).EW_double_jagged2, ({})[6] = {}, -28
;({}).EW_double_jagged2, ({})[7] = {}, -137
;({}).EW_double_jagged2, ({})[8] = {}, -48
;({}).EW_double_jagged2, ({})[9] = {}, -154
;({}).EW_double_jagged2, ({})[10] = {}, -76
;({}).NS_single_smtriangle1, ({})[1] = {}, 0
;({}).NS_single_smtriangle1, ({})[2] = {}, 0
;({}).NS_single_smtriangle1, ({})[3] = {}, 32
;({}).NS_single_smtriangle1, ({})[4] = {}, -27
;({}).NS_single_smtriangle1, ({})[5] = {}, 77
;({}).NS_single_smtriangle1, ({})[6] = {}, -38
;({}).NS_single_smtriangle2, ({})[1] = {}, 0
;({}).NS_single_smtriangle2, ({})[2] = {}, 0
;({}).NS_single_smtriangle2, ({})[3] = {}, -29
;({}).NS_single_smtriangle2, ({})[4] = {}, 27
;({}).NS_single_smtriangle2, ({})[5] = {}, -77
;({}).NS_single_smtriangle2, ({})[6] = {}, 38
;({}).NS_single_smwedge1, ({})[1] = {}, 0
;({}).NS_single_smwedge1, ({})[2] = {}, 0
;({}).NS_single_smwedge1, ({})[3] = {}, 18
;({}).NS_single_smwedge1, ({})[4] = {}, -9
;({}).NS_single_smwedge1, ({})[5] = {}, 13
;({}).NS_single_smwedge1, ({})[6] = {}, -28
;({}).NS_single_smwedge1, ({})[7] = {}, 25
;({}).NS_single_smwedge1, ({})[8] = {}, -37
;({}).NS_single_smwedge1, ({})[9] = {}, 77
;({}).NS_single_smwedge1, ({})[10] = {}, -38
;({}).NS_single_smwedge2, ({})[1] = {}, 0
;({}).NS_single_smwedge2, ({})[2] = {}, 0
;({}).NS_single_smwedge2, ({})[3] = {}, -18
;({}).NS_single_smwedge2, ({})[4] = {}, 9
;({}).NS_single_smwedge2, ({})[5] = {}, -13
;({}).NS_single_smwedge2, ({})[6] = {}, 28
;({}).NS_single_smwedge2, ({})[7] = {}, -25
;({}).NS_single_smwedge2, ({})[8] = {}, 37
;({}).NS_single_smwedge2, ({})[9] = {}, -77
;({}).NS_single_smwedge2, ({})[10] = {}, 38
;({}).NS_single_triangle1, ({})[1] = {}, 0
;({}).NS_single_triangle1, ({})[2] = {}, 0
;({}).NS_single_triangle1, ({})[3] = {}, 17
;({}).NS_single_triangle1, ({})[4] = {}, -31
;({}).NS_single_triangle1, ({})[5] = {}, 77
;({}).NS_single_triangle1, ({})[6] = {}, -38
;({}).NS_single_triangle2, ({})[1] = {}, 0
;({}).NS_single_triangle2, ({})[2] = {}, 0
;({}).NS_single_triangle2, ({})[3] = {}, -16
;({}).NS_single_triangle2, ({})[4] = {}, 30
;({}).NS_single_triangle2, ({})[5] = {}, -77
;({}).NS_single_triangle2, ({})[6] = {}, 38
;({}).EW_single_smtriangle1, ({})[1] = {}, 0
;({}).EW_single_smtriangle1, ({})[2] = {}, 0
;({}).EW_single_smtriangle1, ({})[3] = {}, 46
;({}).EW_single_smtriangle1, ({})[4] = {}, 11
;({}).EW_single_smtriangle1, ({})[5] = {}, 77
;({}).EW_single_smtriangle1, ({})[6] = {}, 38
;({}).EW_single_smtriangle2, ({})[1] = {}, 0
;({}).EW_single_smtriangle2, ({})[2] = {}, 0
;({}).EW_single_smtriangle2, ({})[3] = {}, -46
;({}).EW_single_smtriangle2, ({})[4] = {}, -11
;({}).EW_single_smtriangle2, ({})[5] = {}, -77
;({}).EW_single_smtriangle2, ({})[6] = {}, -38
;({}).EW_single_smwedge1, ({})[1] = {}, 0
;({}).EW_single_smwedge1, ({})[2] = {}, 0
;({}).EW_single_smwedge1, ({})[3] = {}, 50
;({}).EW_single_smwedge1, ({})[4] = {}, -1
;({}).EW_single_smwedge1, ({})[5] = {}, 64
;({}).EW_single_smwedge1, ({})[6] = {}, 9
;({}).EW_single_smwedge1, ({})[7] = {}, 59
;({}).EW_single_smwedge1, ({})[8] = {}, 30
;({}).EW_single_smwedge1, ({})[9] = {}, 77
;({}).EW_single_smwedge1, ({})[10] = {}, 38
;({}).EW_single_smwedge2, ({})[1] = {}, 0
;({}).EW_single_smwedge2, ({})[2] = {}, 0
;({}).EW_single_smwedge2, ({})[3] = {}, -50
;({}).EW_single_smwedge2, ({})[4] = {}, 1
;({}).EW_single_smwedge2, ({})[5] = {}, -64
;({}).EW_single_smwedge2, ({})[6] = {}, -9
;({}).EW_single_smwedge2, ({})[7] = {}, -59
;({}).EW_single_smwedge2, ({})[8] = {}, -30
;({}).EW_single_smwedge2, ({})[9] = {}, -77
;({}).EW_single_smwedge2, ({})[10] = {}, -38
;({}).EW_single_triangle1, ({})[1] = {}, 0
;({}).EW_single_triangle1, ({})[2] = {}, 0
;({}).EW_single_triangle1, ({})[3] = {}, 59
;({}).EW_single_triangle1, ({})[4] = {}, 8
;({}).EW_single_triangle1, ({})[5] = {}, 77
;({}).EW_single_triangle1, ({})[6] = {}, 38
;({}).borderPoints, ({}).EW_single_triangle2, ({})[1] = {}, {}, 0
;({}).borderPoints, ({}).EW_single_triangle2, ({})[2] = {}, {}, 0
;({}).borderPoints, ({}).EW_single_triangle2, ({})[3] = {}, {}, -59
;({}).borderPoints, ({}).EW_single_triangle2, ({})[4] = {}, {}, -8
;({}).borderPoints, ({}).EW_single_triangle2, ({})[5] = {}, {}, -77
;({}).borderPoints, ({}).EW_single_triangle2, ({})[6] = {}, {}, -38
local L12_12 = L12_12
local L13_13 = L13_13
local L14_14 = L14_14
local L15_15 = L15_15
local L16_16 = L16_16
local L17_17 = L17_17
local L18_18 = L18_18
local L19_19 = L19_19
local L20_20 = L20_20
local L21_21 = L21_21
local L22_22 = L22_22
local L23_23 = L23_23
local L24_24 = L24_24
local L25_25 = L25_25
local L26_26 = L26_26
local L27_27 = L27_27
local L28_28 = L28_28
local L29_29 = L29_29
local L30_30 = L30_30
local L31_31 = L31_31
L14_14[1] = L15_15
L14_14[2] = L16_16
L14_14[3] = L17_17
L14_14[4] = L18_18
L14_14[5] = L19_19
L14_14[6] = L20_20
L14_14[7] = L21_21
L14_14[8] = L22_22
L14_14[9] = L23_23
L14_14[10] = L24_24
L14_14[11] = L25_25
L14_14[12] = L26_26
L14_14[13] = L27_27
L14_14[14] = L28_28
L14_14[15] = L29_29
L14_14[16] = L30_30
L14_14[17] = L31_31
L14_14[18] = "NS_single_smwedge1.png"
L14_14[19] = "NS_single_smwedge2.png"
L14_14[20] = "NS_single_triangle1.png"
L14_14[21] = "NS_single_triangle2.png"
local L14_14[22], L32_32 = "NS_straight.png", L32_32
L13_13.borderSheet = L14_14
Borders = L13_13
function L13_13()
	L4_37 = utils
	L4_37 = L4_37.deepcopy
	L4_37 = L4_37(Borders.N_double)
	L3_36.NS_double = L4_37
	L3_36 = pairs
	L4_37 = Borders
	L4_37 = L4_37.S_double
	L3_36, L4_37, _FOR_ = L3_36(L4_37)
	for _FORV_3_, _FORV_4_ in L3_36, L4_37, _FOR_ do
		Borders.NS_double[#Borders.NS_double + 1] = _FORV_4_
	end
	L3_36 = Borders
	L4_37 = utils
	L4_37 = L4_37.deepcopy
	L4_37 = L4_37(Borders.E_double)
	L3_36.EW_double = L4_37
	L3_36 = pairs
	L4_37 = Borders
	L4_37 = L4_37.W_double
	L3_36, L4_37, _FOR_ = L3_36(L4_37)
	for _FORV_3_, _FORV_4_ in L3_36, L4_37, _FOR_ do
		Borders.EW_double[#Borders.EW_double + 1] = _FORV_4_
	end
	L3_36 = Borders
	L4_37 = utils
	L4_37 = L4_37.deepcopy
	L4_37 = L4_37(Borders.N_single)
	L3_36.NS_single = L4_37
	L3_36 = pairs
	L4_37 = Borders
	L4_37 = L4_37.S_single
	L3_36, L4_37, _FOR_ = L3_36(L4_37)
	for _FORV_3_, _FORV_4_ in L3_36, L4_37, _FOR_ do
		Borders.NS_single[#Borders.NS_single + 1] = _FORV_4_
	end
	L3_36 = Borders
	L4_37 = utils
	L4_37 = L4_37.deepcopy
	L4_37 = L4_37(Borders.E_single)
	L3_36.EW_single = L4_37
	L3_36 = pairs
	L4_37 = Borders
	L4_37 = L4_37.W_single
	L3_36, L4_37, _FOR_ = L3_36(L4_37)
	for _FORV_3_, _FORV_4_ in L3_36, L4_37, _FOR_ do
		Borders.EW_single[#Borders.EW_single + 1] = _FORV_4_
	end
	L3_36 = Borders
	L4_37 = utils
	L4_37 = L4_37.deepcopy
	L6_39 = Borders
	L6_39 = L6_39.NS_single
	L4_37 = L4_37(L6_39)
	L3_36.NS_single_nolines = L4_37
	L3_36 = Borders
	L4_37 = utils
	L4_37 = L4_37.deepcopy
	L6_39 = Borders
	L6_39 = L6_39.EW_single
	L4_37 = L4_37(L6_39)
	L3_36.EW_single_nolines = L4_37
	L3_36 = 1
	L4_37 = 5
	L6_39 = 1
	for _FORV_3_ = L3_36, L4_37, L6_39 do
		Borders.NS_single[#Borders.NS_single + 1] = Borders.NS_line
	end
	L3_36 = 1
	L4_37 = 5
	L6_39 = 1
	for _FORV_3_ = L3_36, L4_37, L6_39 do
		Borders.EW_single[#Borders.EW_single + 1] = Borders.EW_line
	end
end
generateMergedBorderTables = L13_13
L13_13 = generateMergedBorderTables
L13_13()
L13_13 = Campaign
function L14_14(A0_40, A1_41, A2_42)
	local L3_43
	L3_43 = {}
	L6_46 = pairs
	L7_47 = Campaign
	L6_46, L7_47, L8_48 = L6_46(L7_47)
	for _FORV_7_, _FORV_8_ in L6_46, L7_47, L8_48 do
		L3_43[_FORV_7_] = utils.deepcopy(_FORV_8_)
	end
	if A1_41 ~= nil then
		L3_43.num = A1_41
	end
	if A2_42 ~= nil then
		L3_43.theme = A2_42
	end
	return L3_43
end
L13_13.new = L14_14
L13_13 = Land
function L14_14(A0_51, A1_52, A2_53, A3_54)
	local L4_55
	L4_55 = {}
	L7_58 = pairs
	L8_59 = Land
	L7_58, L8_59, L9_60 = L7_58(L8_59)
	for _FORV_8_, _FORV_9_ in L7_58, L8_59, L9_60 do
		L4_55[_FORV_8_] = utils.deepcopy(_FORV_9_)
	end
	L4_55.id = A1_52
	L4_55.x = A2_53
	L4_55.y = A3_54
	L7_58 = {}
	L7_58.N = 0
	L7_58.E = 0
	L7_58.S = 0
	L7_58.W = 0
	L4_55.borders = L7_58
	L7_58 = {}
	L4_55.flair = L7_58
	return L4_55
end
L13_13.new = L14_14
L13_13 = Country
function L14_14(A0_63, A1_64, A2_65, A3_66)
	local L4_67
	L4_67 = {}
	L7_70 = pairs
	L8_71 = Country
	L7_70, L8_71, L9_72 = L7_70(L8_71)
	for _FORV_8_, _FORV_9_ in L7_70, L8_71, L9_72 do
		L4_67[_FORV_8_] = utils.deepcopy(_FORV_9_)
	end
	L4_67.name = A3_66
	L4_67.id = A1_64
	L4_67.owned = A2_65
	L4_67.wheelOfFortune = false
	return L4_67
end
L13_13.new = L14_14
L13_13 = campaigns
L14_14 = Campaign
L15_15 = L14_14
L14_14 = L14_14.new
L14_14 = L14_14(L15_15)
L13_13[1] = L14_14
function L13_13(A0_75, A1_76)
	if A1_76 ~= nil then
		L4_79 = pairs
		L5_80 = A1_76.adjacent
		L4_79, L5_80, L6_81 = L4_79(L5_80)
		for L9_84, _FORV_6_ in L4_79, L5_80, L6_81 do
			if _FORV_6_ ~= 0 then
				A0_75.lands[_FORV_6_].adjacent[getOppositeDirection(L9_84)] = 0
				A0_75.lands[_FORV_6_].borders[getOppositeDirection(L9_84)] = 0
			end
			A1_76.adjacent[L9_84] = 0
			A1_76.borders[L9_84] = 0
		end
		L4_79 = A0_75.lands
		L5_80 = A1_76.id
		L4_79 = L4_79[L5_80]
		L4_79.deleted = true
	end
end
function L14_14(A0_85)
	local L3_88, L7_92 = A0_85.countries, L7_92
	L1_86, L3_88, L4_89 = L1_86(L3_88)
	for L5_90, L6_91 in L1_86, L3_88, L4_89 do
		L7_92 = L6_91.landType
		if L7_92 ~= landType.WATER then
			L7_92 = L6_91.owned
			if not L7_92 then
				L7_92 = false
				return L7_92
			end
		end
	end
	L1_86 = true
	return L1_86
end
isCampaignFinished = L14_14
function L14_14(A0_93)
	local L1_94
	L1_94 = _ENV
	local L1_94, L7_100, L8_101, L9_102 = L1_94.themes, L7_100, L8_101, L9_102
	L7_100 = A0_93.theme
	L1_94 = L1_94[L7_100]
	L7_100 = spritesheetmanager
	L7_100 = L7_100.getSpriteSet
	L8_101 = L1_94.islandSheetFile
	L7_100, L8_101 = L7_100(L8_101)
	L9_102 = {}
	A0_93.outIslands = L9_102
	L9_102 = math
	L9_102 = L9_102.random
	L17_110 = L1_94.outIslandGeneration
	L17_110 = L17_110.numIslandsRange
	L17_110 = L17_110[1]
	L9_102 = L9_102(L17_110, L1_94.outIslandGeneration.numIslandsRange[2])
	L17_110 = 1
	L6_99 = L9_102
	_FOR_ = 1
	for _FORV_8_ = L17_110, L6_99, _FOR_ do
		({}).frame = math.random(1, #L8_101)
		local L12_105 = L12_105
		local L13_106 = L13_106
		if math.random(1, 4) == 1 then
			L12_105.y, L12_105.x = L1_94.outIslandGeneration.m * math.random(L1_94.outIslandGeneration.xRange[1], L1_94.outIslandGeneration.xRange[2]) + math.random(L1_94.outIslandGeneration.ySlopeRange[1], L1_94.outIslandGeneration.ySlopeRange[2]), L13_106
		elseif math.random(1, 4) == 2 then
			L12_105.y, L12_105.x = L1_94.outIslandGeneration.m * math.random(L1_94.outIslandGeneration.xRange[1], L1_94.outIslandGeneration.xRange[2]) + math.random(L1_94.outIslandGeneration.ySlopeRange[1], L1_94.outIslandGeneration.ySlopeRange[2]), -1 * L13_106
		elseif math.random(1, 4) == 3 then
			L12_105.x = -1 * L13_106
			L12_105.y = -1 * (L1_94.outIslandGeneration.m * math.random(L1_94.outIslandGeneration.xRange[1], L1_94.outIslandGeneration.xRange[2]) + math.random(L1_94.outIslandGeneration.ySlopeRange[1], L1_94.outIslandGeneration.ySlopeRange[2]))
		else
			L12_105.x = L13_106
			L12_105.y = -1 * (L1_94.outIslandGeneration.m * math.random(L1_94.outIslandGeneration.xRange[1], L1_94.outIslandGeneration.xRange[2]) + math.random(L1_94.outIslandGeneration.ySlopeRange[1], L1_94.outIslandGeneration.ySlopeRange[2]))
		end
		_FOR_ = 1
		for _FORV_17_ = _FOR_, _FOR_, _FOR_ do
			if not false and A0_93.outIslands[_FORV_17_].y > L12_105.y then
				local L18_111 = L18_111
				local L19_112 = L19_112
				local L20_113 = L20_113
				table.insert(A0_93.outIslands, _FORV_17_, L12_105)
				break
			end
		end
		if not L20_113 then
			L21_114 = table
			L21_114 = L21_114.insert
			L21_114(A0_93.outIslands, L12_105)
		end
	end
end
generateCampaignOutIslands = L14_14
function L14_14(A0_115)
	local L1_116
	L1_116 = A0_115.previousCampaigns
	L1_116 = #L1_116
	if L1_116 == 0 then
		L1_116 = 1
	end
	local L3_118 = L3_118
	local L3_118, L4_119 = L3_118(L1_116, 10), L4_119
	L1_116 = L3_118
	L3_118 = dailies
	L3_118 = L3_118.getTimeEvents
	L3_118 = L3_118()
	L3_118 = L3_118.dailyAllowance
	L3_118 = L3_118.amount
	L3_118 = L3_118 * L1_116
	return L3_118
end
calculateDailyAmount = L14_14
function L14_14(A0_120)
	ensureHomeLand(A0_120, A0_120.lands[1])
	ensureBorderingLandsXDeep(A0_120, A0_120.lands[1], _ENV)
	local L4_124 = L4_124
	L4_124 = valueFillNonBorders
	L4_124(A0_120)
	L4_124 = ensurePangea
	L4_124(A0_120)
	L4_124 = buildWeaponFactories
	L4_124(A0_120)
	L4_124 = generateWheelsOfFortune
	L4_124(A0_120)
	L4_124 = generateCampaignOutIslands
	L4_124(A0_120)
	L4_124 = A0_120.countries
	L4_124 = L4_124[HOMELAND_COUNTRY_ID]
	L4_124.moneyStartDate = os.time() - dailies.getTimeEvents().dailyAllowance.interval
	L4_124 = A0_120.countries
	L4_124 = L4_124[HOMELAND_COUNTRY_ID]
	local L2_122 = L2_122
	local L2_122, L3_123 = L2_122(A0_120), L3_123
	L4_124.moneyAmount = L2_122
end
buildNewCampaign = L14_14
function L14_14(A0_125)
	local L1_126, L2_127
	L1_126 = A0_125.countries
	local L1_126, L7_132, L8_133, L13_138, L19_144, L20_145 = #L1_126, L7_132, L8_133, L13_138, L19_144, L20_145
	L2_127 = _ENV
	L1_126 = L1_126 / L2_127
	L2_127 = 2
	L7_132 = math
	L7_132 = L7_132.min
	L8_133 = math
	L8_133 = L8_133.floor
	L13_138 = L1_126
	L8_133 = L8_133(L13_138)
	L8_133 = L2_127 + L8_133
	L13_138 = A0_125.countries
	L13_138 = #L13_138
	L7_132 = L7_132(L8_133, L13_138)
	L8_133 = getAdjacentCountries
	L13_138 = A0_125
	L19_144 = A0_125.countries
	L19_144 = L19_144[1]
	L8_133 = L8_133(L13_138, L19_144)
	L13_138 = utils
	L13_138 = L13_138.deepcopy
	L19_144 = weaponFactories
	L19_144 = L19_144.available
	L13_138 = L13_138(L19_144)
	while true do
		L19_144 = A0_125.countries
		L19_144 = #L19_144
		if not (L2_127 < L19_144) then
			break
		end
		L19_144 = nil
		L20_145 = 0
		while not false and L20_145 <= 30 do
			L19_144 = A0_125.countries[math.random(L2_127, L7_132)]
			if L19_144.landType ~= landType.WATER and L19_144.factoryType == nil then
				_FOR_, _FOR_, _FOR_ = pairs(L19_144.lands)
				for _FORV_12_, _FORV_13_ in _FOR_, _FOR_, _FOR_ do
					local L14_139 = L14_139
					if landHasRoomForBigSprite(A0_125.lands[_FORV_13_]) then
						_FOR_, _FOR_, _FOR_ = pairs(L8_133)
						for _FORV_19_, _FORV_20_ in _FOR_, _FOR_, _FOR_ do
							if _FORV_20_.id == L19_144.id then
								break
							end
						end
						if not true then
							L14_139 = true
							L19_144.wheelLandId = A0_125.lands[_FORV_13_].id
							break
						end
					end
				end
			end
			L20_145 = L20_145 + 1
		end
		if L14_139 then
			L19_144.wheelOfFortune = true
		end
		L2_127 = L7_132 + 1
		L17_142 = math
		L17_142 = L17_142.min
		L18_143 = math
		L18_143 = L18_143.floor
		L21_146 = L1_126
		L18_143 = L18_143(L21_146)
		L18_143 = L2_127 + L18_143
		L21_146 = A0_125.countries
		L21_146 = #L21_146
		L17_142 = L17_142(L18_143, L21_146)
		L7_132 = L17_142
	end
end
generateWheelsOfFortune = L14_14
function L14_14(A0_148)
	local L1_149, L2_150, L3_151, L4_152, L5_153
	L1_149 = 10
	local L2_150, L8_156, L9_157, L14_162 = false, L8_156, L9_157, L14_162
	L3_151 = 0
	L4_152 = A0_148.countries
	L4_152 = #L4_152
	L5_153 = L4_152 - L1_149
	L8_156 = utils
	L8_156 = L8_156.deepcopy
	L9_157 = weaponFactories
	L9_157 = L9_157.available
	L8_156 = L8_156(L9_157)
	while 1 < L5_153 do
		L9_157 = nil
		L14_162 = 0
		while not false and L14_162 <= 30 do
			L9_157 = A0_148.countries[math.random(L5_153, L4_152)]
			if L9_157.landType ~= landType.WATER then
				_FOR_, _FOR_, _FOR_ = pairs(L9_157.lands)
				for _FORV_13_, _FORV_14_ in _FOR_, _FOR_, _FOR_ do
					local L15_163 = L15_163
					if landHasRoomForBigSprite(A0_148.lands[_FORV_14_]) then
						L15_163 = true
						L9_157.factoryLandId = A0_148.lands[_FORV_14_].id
						break
					end
				end
			end
			L14_162 = L14_162 + 1
		end
		if L15_163 then
			L17_165 = math
			L17_165 = L17_165.random
			L17_165 = L17_165(1, #L8_156)
			L9_157.factoryType = L8_156[L17_165]
			L9_157.factoryRuns = 0
			if not L2_150 then
				table.remove(L8_156, L17_165)
				local L13_161 = L13_161
			end
			L3_151 = L3_151 + 1
		end
		L4_152 = L5_153 - 1
		L5_153 = L4_152 - L1_149
	end
end
buildWeaponFactories = L14_14
function L14_14(A0_166, A1_167, A2_168, A3_169)
	local L4_170 = L4_170
	L4_170 = L4_170(Campaign, A0_166.num + 1, A1_167)
	buildNewCampaign(L4_170)
	if A2_168 ~= nil then
		L4_170.countries[HOMELAND_COUNTRY_ID].moneyStartDate = A2_168
		L4_170.countries[HOMELAND_COUNTRY_ID].moneyAmount = A3_169
	end
	L4_170.previousCampaigns = A0_166.previousCampaigns
	local L5_171 = os.time()
	A0_166.finishedDate = L5_171
	L5_171 = {}
	copyCampaignStates(L5_171, A0_166)
	L5_171.previousCampaigns = nil
	L5_171.outIslands = nil
	local L6_172 = L6_172
	local L7_173 = L7_173
	L6_172(L7_173, L5_171)
	local L8_174 = L8_174
	return L4_170
end
finishCampaignAndStartNew = L14_14
function L14_14(A0_175, A1_176, A2_177, A3_178, A4_179, A5_180)
	local L6_181, L7_182, L8_183, L9_184, L10_185, L11_186, L12_187, L13_188, L14_189, L15_190
	A1_176 = A1_176 - 1
	L6_181 = A3_178
	L7_182 = A3_178 - A1_176
	L8_183 = -1
	for L9_184 = L6_181, L7_182, L8_183 do
		L10_185 = A2_177
		L11_186 = A2_177 + A1_176
		L12_187 = 1
		for L13_188 = L10_185, L11_186, L12_187 do
			L14_189 = L13_188 - A2_177
			L15_190 = A3_178 - L9_184
			L14_189 = L14_189 + L15_190
			if A1_176 >= L14_189 then
				L14_189 = _ENV
				L15_190 = A0_175
				L14_189(L15_190, getLandByCoord(A0_175, L9_184, L13_188))
			end
		end
	end
	L6_181 = A5_180
	L7_182 = A5_180 + A1_176
	L8_183 = 1
	for L9_184 = L6_181, L7_182, L8_183 do
		L10_185 = A2_177
		L11_186 = A2_177 + A1_176
		L12_187 = 1
		for L13_188 = L10_185, L11_186, L12_187 do
			L14_189 = L13_188 - A2_177
			L15_190 = L9_184 - A5_180
			L14_189 = L14_189 + L15_190
			if A1_176 >= L14_189 then
				L14_189 = _ENV
				L15_190 = A0_175
				L14_189(L15_190, getLandByCoord(A0_175, L9_184, L13_188))
			end
		end
	end
	L6_181 = A5_180
	L7_182 = A5_180 + A1_176
	L8_183 = 1
	for L9_184 = L6_181, L7_182, L8_183 do
		L10_185 = A4_179
		L11_186 = A4_179 - A1_176
		L12_187 = -1
		for L13_188 = L10_185, L11_186, L12_187 do
			L14_189 = A4_179 - L13_188
			L15_190 = L9_184 - A5_180
			L14_189 = L14_189 + L15_190
			if A1_176 >= L14_189 then
				L14_189 = _ENV
				L15_190 = A0_175
				L14_189(L15_190, getLandByCoord(A0_175, L9_184, L13_188))
			end
		end
	end
	L6_181 = A3_178
	L7_182 = A3_178 - A1_176
	L8_183 = -1
	for L9_184 = L6_181, L7_182, L8_183 do
		L10_185 = A4_179
		L11_186 = A4_179 - A1_176
		L12_187 = -1
		for L13_188 = L10_185, L11_186, L12_187 do
			L14_189 = A4_179 - L13_188
			L15_190 = A3_178 - L9_184
			L14_189 = L14_189 + L15_190
			if A1_176 >= L14_189 then
				L14_189 = _ENV
				L15_190 = A0_175
				local L16_191 = L16_191
				local L17_192 = L17_192
				local L18_193 = L18_193
				local L16_191, L17_192, L18_193, L19_194 = L16_191(L17_192, L18_193, L13_188)
				L14_189(L15_190, L16_191, L17_192, L18_193, L19_194)
			end
		end
	end
end
shaveCorners = L14_14
function L14_14(A0_195)
	local L1_196
	L4_199 = A0_195.lands
	L2_197, L4_199, L5_200 = L2_197(L4_199)
	for L6_201, L9_204 in L2_197, L4_199, L5_200 do
		L10_205 = pairs
		L11_206 = L9_204.adjacent
		L10_205, L11_206, _FOR_ = L10_205(L11_206)
		for _FORV_10_, _FORV_11_ in L10_205, L11_206, _FOR_ do
			if not L9_204.deleted and _FORV_11_ == 0 and L9_204.borders[_FORV_10_] == 0 then
				L1_196 = Borders.NS_single_nolines
				if _FORV_10_ == "E" or _FORV_10_ == "W" then
					L1_196 = Borders.EW_single_nolines
				end
				while "math" do
					if isBorderPermitted(L9_204, _FORV_10_, L1_196[math.random(1, #L1_196)]) then
						break
					end
				end
				L9_204.borders[_FORV_10_] = L1_196[math.random(1, #L1_196)]
			end
		end
	end
end
valueFillNonBorders = L14_14
function L14_14(A0_212)
	local L1_213
	L1_213 = 0
	L4_216 = ipairs
	L7_217 = A0_212.countries
	L4_216, L7_217, _FOR_ = L4_216(L7_217)
	for _FORV_5_, _FORV_6_ in L4_216, L7_217, _FOR_ do
		if _FORV_6_.owned then
			L1_213 = L1_213 + 1
		end
	end
	return L1_213
end
getNumOwnedCountries = L14_14
function L14_14(A0_218, A1_219, A2_220)
	local L3_221, L4_222
	L3_221 = {}
	L4_222 = LandImageSteps
	L4_222 = L4_222[A0_218]
	L4_222 = L4_222.x
	L4_222 = L4_222 * math.abs(LandSteps[A0_218].x)
	L4_222 = L4_222 + A1_219
	L3_221.x = L4_222
	L4_222 = LandImageSteps
	L4_222 = L4_222[A0_218]
	L4_222 = L4_222.y
	local L5_223 = L5_223
	local L5_223, L6_224 = L5_223(LandSteps[A0_218].y), L6_224
	L4_222 = L4_222 * L5_223
	L4_222 = L4_222 + A2_220
	L3_221.y = L4_222
	return L3_221
end
getTranslatedOrthogonalPoint = L14_14
function L14_14(A0_225, A1_226, A2_227, A3_228)
	local L4_229
	L4_229 = {}
	local L5_230 = L5_230
	local L6_231 = L6_231
	local L7_232 = L7_232
	L4_229[1] = L5_230
	L4_229[2] = L6_231
	L4_229[3] = L7_232
	L4_229[4] = "W"
	L5_230 = 1
	if A1_226 == "W" then
		L5_230 = 4
	elseif A1_226 == "S" then
		L5_230 = 3
	elseif A1_226 == "E" then
		L5_230 = 2
	end
	L6_231 = A0_225.borders
	L6_231 = L6_231[A1_226]
	L7_232 = getBorderPoints
	local L8_233 = L8_233
	local L8_233, L9_234 = L8_233(L6_231)
	L7_232 = L7_232(L8_233, L9_234, L8_233(L6_231))
	L8_233 = nil
	if L7_232 ~= nil then
		L9_234 = {}
		L8_233 = L9_234
		L9_234 = nil
		if L5_230 == 1 then
			L9_234 = #L4_229
		else
			L9_234 = L5_230 - 1
		end
		local L10_235 = L10_235
		local L11_236 = L11_236
		local L12_237 = L12_237
		L10_235 = L10_235(L11_236, L12_237, A3_228)
		L11_236 = nil
		L12_237 = isADoubleBorderValue
		L12_237 = L12_237(A1_226, math.abs(L6_231))
		if not L12_237 then
			L11_236 = getBorderDirection(L6_231, "single")
		else
			L11_236 = getBorderDirection(math.abs(L6_231), "double")
			L13_238 = L13_238(#L7_232 / 4)
			L13_238 = L13_238 * 2
			if L11_236 ~= A1_226 then
				if L11_236 == "S" or L11_236 == "E" then
					if 0 < L6_231 then
						doubleBorderLeadsInto = true
						while L13_238 < #L7_232 do
							table.remove(L7_232, 1)
						end
					else
						L10_235.x = L10_235.x - LandImageSteps[L4_229[L9_234]].x
						L10_235.y = L10_235.y - LandImageSteps[L4_229[L9_234]].y
						while L13_238 < #L7_232 do
							table.remove(L7_232, #L7_232)
						end
					end
				elseif L11_236 == "N" or L11_236 == "W" then
					if 0 < L6_231 then
						while L13_238 < #L7_232 do
							table.remove(L7_232, #L7_232)
						end
					else
						doubleBorderLeadsInto = true
						L10_235.x = L10_235.x - LandImageSteps[L4_229[L9_234]].x * 2
						L10_235.y = L10_235.y - LandImageSteps[L4_229[L9_234]].y * 2
						while L13_238 < #L7_232 do
							table.remove(L7_232, 1)
						end
					end
				end
			elseif L11_236 == "S" or L11_236 == "E" then
				if 0 < L6_231 then
					L10_235.x = L10_235.x + LandImageSteps[L4_229[L9_234]].x
					L10_235.y = L10_235.y + LandImageSteps[L4_229[L9_234]].y
					while L13_238 < #L7_232 do
						table.remove(L7_232, 1)
					end
				else
					doubleBorderLeadsInto = true
					while L13_238 < #L7_232 do
						table.remove(L7_232, #L7_232)
					end
				end
			elseif L11_236 == "N" or L11_236 == "W" then
				if 0 < L6_231 then
					doubleBorderLeadsInto = true
					while L13_238 < #L7_232 do
						table.remove(L7_232, #L7_232)
					end
				else
					L10_235.x = L10_235.x + LandImageSteps[L4_229[L9_234]].x
					L10_235.y = L10_235.y + LandImageSteps[L4_229[L9_234]].y
					while L13_238 < #L7_232 do
						L14_239(L15_240, 1)
					end
				end
			end
		end
		if L11_236 ~= A1_226 then
			L13_238 = {}
			L14_239 = {}
			if 0 < L6_231 then
				L15_240 = Borders
				L15_240 = L15_240.NS_line
				if L6_231 ~= L15_240 then
					L15_240 = Borders
					L15_240 = L15_240.EW_line
				end
				if L6_231 ~= L15_240 or A1_226 ~= "N" and A1_226 ~= "E" then
					L15_240 = #L7_232
					L15_240 = L15_240 - 1
					L15_240 = L7_232[L15_240]
					L14_239.x = L15_240
					L15_240 = #L7_232
					L15_240 = L7_232[L15_240]
					L14_239.y = L15_240
			end
			else
				L14_239.x = 0
				L14_239.y = 0
			end
			L15_240 = #L7_232
			L15_240 = L15_240 - 1
			_FOR_ = -2
			for _FORV_18_ = L15_240, _FOR_, _FOR_ do
				L13_238[#L13_238 + 1] = L7_232[_FORV_18_] - L14_239.x
				L13_238[#L13_238 + 1] = L7_232[_FORV_18_ + 1] - L14_239.y
			end
			L7_232 = L13_238
			if 0 < L6_231 and L12_237 and (L11_236 == "N" or L11_236 == "W") then
				L15_240 = L9_234
				L21_246 = #L4_229
				if L9_234 == L21_246 then
					L9_234 = 1
				else
					L9_234 = L9_234 + 1
				end
				L21_246 = getTranslatedOrthogonalPoint
				local L17_242 = L17_242
				local L18_243 = L18_243
				local L21_246, L19_244 = L21_246(L17_242, L18_243, A3_228), L19_244
				L14_239 = L21_246
				L21_246 = L14_239.x
				L17_242 = #L13_238
				L17_242 = L17_242 - 1
				L17_242 = L13_238[L17_242]
				L18_243 = L10_235.x
				L17_242 = L17_242 + L18_243
				L21_246 = L21_246 - L17_242
				L17_242 = L14_239.y
				L18_243 = #L13_238
				L18_243 = L13_238[L18_243]
				L19_244 = L10_235.y
				L18_243 = L18_243 + L19_244
				L17_242 = L17_242 - L18_243
				L18_243 = L10_235.x
				L18_243 = L18_243 + L21_246
				L10_235.x = L18_243
				L18_243 = L10_235.y
				L18_243 = L18_243 + L17_242
				L10_235.y = L18_243
			end
		end
		L13_238 = 1
		L14_239 = #L7_232
		L14_239 = L14_239 - 1
		L15_240 = 2
		for L21_246 = L13_238, L14_239, L15_240 do
			L17_242 = #L8_233
			L17_242 = L17_242 + 1
			L18_243 = L7_232[L21_246]
			L19_244 = L10_235.x
			L18_243 = L18_243 + L19_244
			L8_233[L17_242] = L18_243
			L17_242 = #L8_233
			L17_242 = L17_242 + 1
			L18_243 = L21_246 + 1
			L18_243 = L7_232[L18_243]
			L19_244 = L10_235.y
			L18_243 = L18_243 + L19_244
			L8_233[L17_242] = L18_243
		end
	end
	return L8_233
end
getRawBorderPoints = L14_14
function L14_14(A0_247, A1_248, A2_249)
	local L3_250
	L3_250 = {}
	local L11_258 = "N"
	local L5_252 = L5_252
	local L6_253 = L6_253
	L3_250[1] = L11_258
	L3_250[2] = L5_252
	L3_250[3] = L6_253
	L3_250[4] = "W"
	L11_258 = {}
	L5_252 = false
	L6_253 = false
	_FOR_, _FOR_, _FOR_ = ipairs(L3_250)
	for _FORV_10_, _FORV_11_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_10_ == 1 then
		else
		end
		if getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) ~= nil then
			if isADoubleBorderValue(_FORV_11_, math.abs(A0_247.borders[_FORV_11_])) then
				if getBorderDirection(math.abs(A0_247.borders[_FORV_11_]), "double") ~= _FORV_11_ then
					if getBorderDirection(math.abs(A0_247.borders[_FORV_11_]), "double") == "S" or getBorderDirection(math.abs(A0_247.borders[_FORV_11_]), "double") == "E" then
						if A0_247.borders[_FORV_11_] > 0 then
							L5_252 = true
							while math.ceil(#getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) / 4) * 2 < #getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) do
								table.remove(getBorderPoints(math.abs(A0_247.borders[_FORV_11_])), 1)
							end
						else
							getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x = getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x - LandImageSteps[L3_250[_FORV_10_ - 1]].x
							getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y = getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y - LandImageSteps[L3_250[_FORV_10_ - 1]].y
							while math.ceil(#getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) / 4) * 2 < #getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) do
								table.remove(getBorderPoints(math.abs(A0_247.borders[_FORV_11_])), #getBorderPoints(math.abs(A0_247.borders[_FORV_11_])))
							end
						end
					elseif getBorderDirection(math.abs(A0_247.borders[_FORV_11_]), "double") == "N" or getBorderDirection(math.abs(A0_247.borders[_FORV_11_]), "double") == "W" then
						if A0_247.borders[_FORV_11_] > 0 then
							while math.ceil(#getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) / 4) * 2 < #getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) do
								table.remove(getBorderPoints(math.abs(A0_247.borders[_FORV_11_])), #getBorderPoints(math.abs(A0_247.borders[_FORV_11_])))
							end
						else
							L5_252 = true
							getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x = getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x - LandImageSteps[L3_250[_FORV_10_ - 1]].x * 2
							getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y = getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y - LandImageSteps[L3_250[_FORV_10_ - 1]].y * 2
							while math.ceil(#getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) / 4) * 2 < #getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) do
								table.remove(getBorderPoints(math.abs(A0_247.borders[_FORV_11_])), 1)
							end
						end
					end
				elseif getBorderDirection(math.abs(A0_247.borders[_FORV_11_]), "double") == "S" or getBorderDirection(math.abs(A0_247.borders[_FORV_11_]), "double") == "E" then
					if A0_247.borders[_FORV_11_] > 0 then
						getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x = getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x + LandImageSteps[L3_250[_FORV_10_ - 1]].x
						getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y = getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y + LandImageSteps[L3_250[_FORV_10_ - 1]].y
						while math.ceil(#getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) / 4) * 2 < #getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) do
							table.remove(getBorderPoints(math.abs(A0_247.borders[_FORV_11_])), 1)
						end
					else
						L5_252 = true
						while math.ceil(#getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) / 4) * 2 < #getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) do
							table.remove(getBorderPoints(math.abs(A0_247.borders[_FORV_11_])), #getBorderPoints(math.abs(A0_247.borders[_FORV_11_])))
						end
					end
				elseif getBorderDirection(math.abs(A0_247.borders[_FORV_11_]), "double") == "N" or getBorderDirection(math.abs(A0_247.borders[_FORV_11_]), "double") == "W" then
					if A0_247.borders[_FORV_11_] > 0 then
						L5_252 = true
						while math.ceil(#getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) / 4) * 2 < #getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) do
							table.remove(getBorderPoints(math.abs(A0_247.borders[_FORV_11_])), #getBorderPoints(math.abs(A0_247.borders[_FORV_11_])))
						end
					else
						getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x = getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x + LandImageSteps[L3_250[_FORV_10_ - 1]].x
						getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y = getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y + LandImageSteps[L3_250[_FORV_10_ - 1]].y
						while math.ceil(#getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) / 4) * 2 < #getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) do
							table.remove(getBorderPoints(math.abs(A0_247.borders[_FORV_11_])), 1)
						end
					end
				end
			else
			end
			if getBorderDirection(A0_247.borders[_FORV_11_], "single") ~= _FORV_11_ then
				if A0_247.borders[_FORV_11_] > 0 then
					({}).x = getBorderPoints(math.abs(A0_247.borders[_FORV_11_]))[#getBorderPoints(math.abs(A0_247.borders[_FORV_11_])) - 1]
					;({}).y = getBorderPoints(math.abs(A0_247.borders[_FORV_11_]))[#getBorderPoints(math.abs(A0_247.borders[_FORV_11_]))]
				else
					({}).x = 0
					;({}).y = 0
				end
				_FOR_ = -2
				for _FORV_23_ = _FOR_, _FOR_, _FOR_ do
					({})[#{} + 1] = getBorderPoints(math.abs(A0_247.borders[_FORV_11_]))[_FORV_23_] - ({}).x
					;({})[#{} + 1] = getBorderPoints(math.abs(A0_247.borders[_FORV_11_]))[_FORV_23_ + 1] - ({}).y
				end
				if A0_247.borders[_FORV_11_] > 0 and isADoubleBorderValue(_FORV_11_, math.abs(A0_247.borders[_FORV_11_])) and (getBorderDirection(A0_247.borders[_FORV_11_], "single") == "N" or getBorderDirection(A0_247.borders[_FORV_11_], "single") == "W") then
					if _FORV_10_ - 1 == #L3_250 then
					else
					end
					getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x = getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x + (getTranslatedOrthogonalPoint(L3_250[1 + 1], A1_248, A2_249).x - (({})[#{} - 1] + getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x))
					getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y = getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y + (getTranslatedOrthogonalPoint(L3_250[1 + 1], A1_248, A2_249).y - (({})[#{}] + getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y))
				end
			end
			if isADoubleBorderValue(_FORV_11_, math.abs(A0_247.borders[_FORV_11_])) then
				if not L5_252 then
				end
				L5_252 = false
				_FOR_ = 2
				for _FORV_22_ = _FOR_, _FOR_, _FOR_ do
					L11_258[#L11_258 + 1] = ({})[_FORV_22_] + getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x
					L11_258[#L11_258 + 1] = ({})[_FORV_22_ + 1] + getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y
				end
				break -- pseudo-goto
			end
			_FOR_ = 2
			for _FORV_21_ = _FOR_, _FOR_, _FOR_ do
				L11_258[#L11_258 + 1] = ({})[_FORV_21_] + getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).x
				L11_258[#L11_258 + 1] = ({})[_FORV_21_ + 1] + getTranslatedOrthogonalPoint(L3_250[_FORV_10_ - 1], A1_248, A2_249).y
			end
			break -- pseudo-goto
		end
		if _FORV_10_ == 1 then
		else
		end
		if (L3_250[#L3_250 - 1] == "E" or L3_250[#L3_250 - 1] == "S") and A0_247.borders[L3_250[#L3_250 - 1]] < 0 then
		else
			if L3_250[#L3_250 - 1] == "N" and isADoubleBorderValue(L3_250[#L3_250 - 1], A0_247.borders[L3_250[#L3_250 - 1]]) then
				do break end -- pseudo-goto
				local L19_266 = L19_266
			end
			if L3_250[#L3_250 - 1] == "W" then
				local L22_269 = L22_269
				repeat
					if isADoubleBorderValue(L3_250[#L3_250 - 1], A0_247.borders[L3_250[#L3_250 - 1]]) then
						L6_253 = true
					end
				until true
			end
		end
		if not L5_252 and not true then
			L11_258[#L11_258 + 1] = L22_269.x
			local L11_258[#L11_258 + 1], L21_268 = L22_269.y, L21_268
		end
		repeat
			L5_252 = false
		until true
	end
	if L6_253 then
		L14_261 = table
		L14_261 = L14_261.remove
		L26_273 = L11_258
		L25_272 = 1
		L14_261(L26_273, L25_272)
		L14_261 = table
		L14_261 = L14_261.remove
		L26_273 = L11_258
		L25_272 = 1
		L14_261(L26_273, L25_272)
		L14_261 = table
		L14_261 = L14_261.insert
		L26_273 = L11_258
		L25_272 = 1
		L17_264 = #L11_258
		L17_264 = L17_264 - 1
		L17_264 = L11_258[L17_264]
		L14_261(L26_273, L25_272, L17_264)
		L14_261 = table
		L14_261 = L14_261.insert
		L26_273 = L11_258
		L25_272 = 2
		L17_264 = #L11_258
		L17_264 = L11_258[L17_264]
		L14_261(L26_273, L25_272, L17_264)
		repeat
			do break end -- pseudo-goto
			L14_261 = #L11_258
			L14_261 = L14_261 + 1
			L26_273 = L11_258[1]
			L11_258[L14_261] = L26_273
			L14_261 = #L11_258
			L14_261 = L14_261 + 1
			L26_273 = L11_258[2]
			L11_258[L14_261] = L26_273
		until true
	end
	return L11_258
end
getBorderPolygonPoints = L14_14
function L14_14(A0_274)
	local L1_275
	if 0 < A0_274 and A0_274 ~= nil then
		L1_275 = Borders
		L1_275 = L1_275.borderSheet
		L1_275 = L1_275[A0_274]
		if L1_275 ~= nil then
			local L2_276 = L2_276
			local L2_276, L5_279 = L2_276(L1_275, ".png", ""), L5_279
			L1_275 = L2_276
			L2_276 = Borders
			L2_276 = L2_276.borderPoints
			L2_276 = L2_276[L1_275]
			if L2_276 ~= nil then
				L5_279 = #L2_276
				if 4 <= L5_279 then
					L5_279 = utils
					L5_279 = L5_279.deepcopy
					do return L5_279(L2_276) end
					local L4_278 = L4_278
				end
			end
		end
	end
	L1_275 = nil
	return L1_275
end
getBorderPoints = L14_14
function L14_14(A0_280, A1_281, A2_282, A3_283, A4_284)
	local L5_285
	L5_285 = {}
	local L11_291, L12_292 = getTranslatedOrthogonalPoint, L12_292
	L12_292 = A1_281
	L13_293 = A3_283
	L14_294 = A4_284
	L11_291 = L11_291(L12_292, L13_293, L14_294)
	L12_292 = getBorderPoints
	L13_293 = A2_282
	L12_292 = L12_292(L13_293)
	if L12_292 ~= nil then
		L13_293 = isADoubleBorderValue
		L14_294 = dir
		L15_295 = A2_282
		L13_293 = L13_293(L14_294, L15_295)
		if not L13_293 then
			L13_293 = getBorderDirection
			L14_294 = A2_282
			L15_295 = "double"
			L13_293 = L13_293(L14_294, L15_295)
			repeat
				if L13_293 ~= A1_281 then
					L13_293 = {}
					L14_294 = {}
					L15_295 = #L12_292
					L15_295 = L15_295 - 1
					L15_295 = L12_292[L15_295]
					L14_294.x = L15_295
					L15_295 = #L12_292
					L15_295 = L12_292[L15_295]
					L14_294.y = L15_295
					L15_295 = #L12_292
					L15_295 = L15_295 - 1
					L16_296 = 1
					_FOR_ = -2
					for _FORV_13_ = L15_295, L16_296, _FOR_ do
						L13_293[#L13_293 + 1] = L12_292[_FORV_13_] - L14_294.x
						L13_293[#L13_293 + 1] = L12_292[_FORV_13_ + 1] - L14_294.y
					end
					L12_292 = L13_293
				end
				L13_293 = 1
				L14_294 = #L12_292
				L14_294 = L14_294 - 2
				L15_295 = 2
				for L16_296 = L13_293, L14_294, L15_295 do
					L5_285[#L5_285 + 1] = L12_292[L16_296] + L11_291.x
					L5_285[#L5_285 + 1] = L12_292[L16_296 + 1] + L11_291.y
				end
				do break end -- pseudo-goto
				L13_293 = #L5_285
				L13_293 = L13_293 + 1
				L14_294 = L11_291.x
				L5_285[L13_293] = L14_294
				L13_293 = #L5_285
				L13_293 = L13_293 + 1
				L14_294 = L11_291.y
				L5_285[L13_293] = L14_294
			until true
		end
	end
	L13_293 = #L5_285
	L13_293 = L13_293 + 1
	L14_294 = L5_285[1]
	L5_285[L13_293] = L14_294
	L13_293 = #L5_285
	L13_293 = L13_293 + 1
	L14_294 = L5_285[2]
	L5_285[L13_293] = L14_294
	return L5_285
end
getDoubleBorderPolygonPoints = L14_14
function L14_14(A0_297, A1_298)
	local L2_299
	L2_299 = {}
	L7_304 = "N"
	L2_299[1] = L7_304
	L2_299[2] = "S"
	L2_299[3] = "E"
	L2_299[4] = "W"
	if A1_298 == nil then
		A1_298 = "single"
	end
	L7_304 = pairs
	L6_303 = L2_299
	L7_304, L6_303, _FOR_ = L7_304(L6_303)
	for _FORV_6_, _FORV_7_ in L7_304, L6_303, _FOR_ do
		_FOR_, _FOR_, _FOR_ = pairs(Borders[_FORV_7_ .. "_" .. A1_298])
		for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_12_ == A0_297 then
				return _FORV_7_
			end
		end
	end
	L7_304 = nil
	return L7_304
end
getBorderDirection = L14_14
function L14_14(A0_310, A1_311)
	local L2_312, L3_313
	L2_312 = {}
	L2_312.x = 0
	L2_312.y = 0
	if A1_311 < 0 then
		L3_313 = LandImageSteps
		L2_312 = L3_313.N
	elseif 0 < A1_311 then
		L3_313 = LandImageSteps
		L2_312 = L3_313.S
	end
	L3_313 = {}
	L3_313.x = 0
	L3_313.y = 0
	if A0_310 < 0 then
		L3_313 = LandImageSteps.W
	elseif 0 < A0_310 then
		L3_313 = LandImageSteps.E
	end
	if math.abs(A0_310) > math.abs(A1_311) then
	elseif math.abs(A0_310) < math.abs(A1_311) then
	end
	local L4_314 = L4_314
	L4_314 = L4_314(A1_311)
	L4_314 = L4_314 * L2_312.x
	L4_314 = L4_314 + math.abs(A0_310) * L3_313.x
	local L5_315 = L5_315
	L5_315 = L5_315(A1_311)
	L5_315 = L5_315 * L2_312.y
	local L6_316 = L6_316
	local L6_316, L7_317 = L6_316(A0_310), L7_317
	L7_317 = L3_313.y
	L6_316 = L6_316 * L7_317
	L5_315 = L5_315 + L6_316
	L6_316 = L4_314
	L7_317 = L5_315
	return L6_316, L7_317
end
getSteppedImageCoords = L14_14
function L14_14(A0_318, A1_319)
	local L3_320 = utils.deepcopy(A1_319.lands)
	A0_318.lands = L3_320
	L3_320 = A1_319.name
	A0_318.name = L3_320
	L3_320 = A1_319.owned
	A0_318.owned = L3_320
	L3_320 = A1_319.landType
	A0_318.landType = L3_320
	L3_320 = A1_319.seed
	A0_318.seed = L3_320
	L3_320 = A1_319.wins
	A0_318.wins = L3_320
	L3_320 = A1_319.losses
	A0_318.losses = L3_320
	L3_320 = A1_319.underAttackDate
	A0_318.underAttackDate = L3_320
	L3_320 = A1_319.winDate
	A0_318.winDate = L3_320
	L3_320 = A1_319.lossDate
	A0_318.lossDate = L3_320
	L3_320 = A1_319.moneyStartDate
	A0_318.moneyStartDate = L3_320
	L3_320 = A1_319.moneyAmount
	A0_318.moneyAmount = L3_320
	L3_320 = A1_319.factoryLandId
	A0_318.factoryLandId = L3_320
	L3_320 = A1_319.factoryStartDate
	A0_318.factoryStartDate = L3_320
	L3_320 = A1_319.factoryType
	A0_318.factoryType = L3_320
	L3_320 = A1_319.factoryRuns
	A0_318.factoryRuns = L3_320
	L3_320 = A1_319.wheelOfFortune
	A0_318.wheelOfFortune = L3_320
end
copyCountryStates = L14_14
function L14_14(A0_321, A1_322)
	A0_321.countryId = A1_322.countryId
	A0_321.deleted = A1_322.deleted
	A0_321.x = A1_322.x
	A0_321.y = A1_322.y
	A0_321.adjacent = utils.deepcopy(A1_322.adjacent)
	A0_321.borders = utils.deepcopy(A1_322.borders)
	local L3_323 = utils.deepcopy(A1_322.flair)
	A0_321.flair = L3_323
end
copyLandStates = L14_14
function L14_14(A0_324, A1_325, A2_326)
	A0_324.num = A1_325.num
	A0_324.unlocked = A1_325.unlocked
	A0_324.theme = A1_325.theme
	A0_324.finishedDate = A1_325.finishedDate
	A0_324.wins = A1_325.wins
	A0_324.losses = A1_325.losses
	A0_324.totalShots = A1_325.totalShots
	A0_324.totalHits = A1_325.totalHits
	A0_324.totalWeaponShots = utils.deepcopy(A1_325.totalWeaponShots)
	A0_324.totalWeaponHits = utils.deepcopy(A1_325.totalWeaponHits)
	if not A1_325.otherStats then
		A1_325.otherStats = {}
	end
	A0_324.otherStats = utils.deepcopy(A1_325.otherStats)
	A0_324.outIslands = utils.deepcopy(A1_325.outIslands)
	local L4_327 = utils.deepcopy(A1_325.previousCampaigns)
	A0_324.previousCampaigns = L4_327
end
copyCampaignStates = L14_14
function L14_14(A0_328)
	local L1_329
	L1_329 = false
	if A0_328.countries ~= nil then
		local L2_330 = L2_330
		L2_330 = L2_330("campaignThemes")
		local L3_331 = L3_331
		L3_331 = L3_331(L2_330.availableLandTypes)
		_FOR_ = 1
		for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
			if A0_328.countries[_FORV_7_].wheelOfFortune then
				L1_329 = true
			end
			if 0 < #L3_331 then
				_FOR_ = -1
				for _FORV_12_ = _FOR_, _FOR_, _FOR_ do
					if L3_331[_FORV_12_] == A0_328.countries[_FORV_7_].landType then
						table.remove(L3_331, _FORV_12_)
					end
				end
			end
		end
		if not L1_329 then
			L8_336 = print
			L14_342 = "no wheel found on campaign...generating for existing campaign"
			L8_336(L14_342)
			L8_336 = generateWheelsOfFortune
			L14_342 = A0_328
			L8_336(L14_342)
		end
		L8_336 = #L3_331
		if 0 < L8_336 then
			L8_336 = print
			L14_342 = "no new terrain types exist...generating for existing campaign"
			L8_336(L14_342)
			L8_336 = {}
			L14_342 = 1
			L15_343 = A0_328.countries
			L15_343 = #L15_343
			_FOR_ = 1
			for _FORV_8_ = L14_342, L15_343, _FOR_ do
				if A0_328.countries[_FORV_8_].landType ~= L2_330.landType.WATER then
					L8_336[A0_328.countries[_FORV_8_].id] = A0_328.countries[_FORV_8_].id
					A0_328.countries[_FORV_8_].landType = L2_330.availableLandTypes[math.random(1, #L2_330.availableLandTypes)]
				end
			end
			L14_342 = 1
			L15_343 = A0_328.lands
			L15_343 = #L15_343
			_FOR_ = 1
			for _FORV_8_ = L14_342, L15_343, _FOR_ do
				A0_328.lands[_FORV_8_].flair = {}
			end
			L14_342 = addFlairToCountries
			L15_343 = A0_328
			L14_342(L15_343, L8_336)
			local L7_335 = L7_335
		end
	end
end
function L15_15()
	local L10_354 = campaignSettings.get
	L10_354 = L10_354(campaignSettings, _ENV)
	if L10_354 == nil or L4_4 ~= L10_354 then
		local L4_348 = L4_348
		L4_348("Blowing away saved campaigns:", L10_354, " incompatible with ", L4_4)
		L4_348 = saveCampaignStates
		L4_348()
		L4_348 = dailies
		L4_348 = L4_348.clearDailies
		L4_348()
		L4_348 = campaignSettings
		L5_349 = L4_348
		L4_348 = L4_348.save
		L4_348(L5_349)
	end
	L4_348 = campaignSettings
	L5_349 = L4_348
	L4_348 = L4_348.get
	L4_348 = L4_348(L5_349, L1_1)
	if L4_348 ~= nil then
		L5_349 = 1
		L3_347 = #L4_348
		_FOR_ = 1
		for _FORV_5_ = L5_349, L3_347, _FOR_ do
			if campaigns[_FORV_5_] == nil then
				campaigns[_FORV_5_] = Campaign:new()
			end
			copyCampaignStates(campaigns[_FORV_5_], L4_348[_FORV_5_])
			if campaigns[_FORV_5_].countries ~= nil then
				_FOR_ = 1
				for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
					campaigns[_FORV_5_].countries[_FORV_10_] = Country:new(L4_348[_FORV_5_].countries[_FORV_10_].id, false)
					copyCountryStates(campaigns[_FORV_5_].countries[_FORV_10_], L4_348[_FORV_5_].countries[_FORV_10_])
				end
			end
			if campaigns[_FORV_5_].lands ~= nil then
				_FOR_ = 1
				for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
					local L11_355 = L11_355
					if L4_348[_FORV_5_].lands[_FORV_10_] == nil then
						campaigns[_FORV_5_].lands[_FORV_10_] = nil
						break -- pseudo-goto
					end
					campaigns[_FORV_5_].lands[_FORV_10_] = Land:new(L4_348[_FORV_5_].lands[_FORV_10_].id, 0, 0)
					copyLandStates(campaigns[_FORV_5_].lands[_FORV_10_], L4_348[_FORV_5_].lands[_FORV_10_])
					repeat
					until true
				end
			end
			L15_359 = L11_11
			L16_360 = campaigns
			L16_360 = L16_360[_FORV_5_]
			L15_359(L16_360)
		end
	end
end
loadCampaignStates = L15_15
function L15_15(A0_362, A1_363, A2_364, A3_365, A4_366)
	local L5_367, L6_368
	L5_367 = A0_362.lands
	L5_367 = #L5_367
	L5_367 = L5_367 + 1
	L6_368 = A0_362.lands
	local L9_371 = L9_371
	local L10_372 = L10_372
	local L12_374 = L12_374
	L9_371 = L9_371(L10_372, L12_374, A1_363.x + LandSteps[A2_364].x, A1_363.y + LandSteps[A2_364].y)
	L6_368[L5_367] = L9_371
	L6_368 = A1_363.adjacent
	L6_368[A2_364] = L5_367
	L6_368 = A0_362.lands
	L6_368 = L6_368[L5_367]
	L6_368 = L6_368.adjacent
	L9_371 = getOppositeDirection
	L10_372 = A2_364
	L9_371 = L9_371(L10_372)
	L10_372 = A1_363.id
	L6_368[L9_371] = L10_372
	if A3_365 ~= nil then
		L6_368 = A3_365.id
		if 0 < L6_368 then
			L6_368 = A0_362.lands
			L6_368 = L6_368[L5_367]
			L6_368 = L6_368.adjacent
			L9_371 = A3_365.direction
			L10_372 = A3_365.id
			L6_368[L9_371] = L10_372
			L6_368 = A0_362.lands
			L9_371 = A3_365.id
			L6_368 = L6_368[L9_371]
			L6_368 = L6_368.adjacent
			L9_371 = getOppositeDirection
			L10_372 = A3_365.direction
			L9_371 = L9_371(L10_372)
			L6_368[L9_371] = L5_367
		end
	end
	if A4_366 ~= nil then
		L6_368 = A4_366.id
		if 0 < L6_368 then
			L6_368 = A0_362.lands
			L6_368 = L6_368[L5_367]
			L6_368 = L6_368.adjacent
			L9_371 = A4_366.direction
			L10_372 = A4_366.id
			L6_368[L9_371] = L10_372
			L6_368 = A0_362.lands
			L9_371 = A4_366.id
			L6_368 = L6_368[L9_371]
			L6_368 = L6_368.adjacent
			L9_371 = getOppositeDirection
			L10_372 = A4_366.direction
			L9_371 = L9_371(L10_372)
			L6_368[L9_371] = L5_367
		end
	end
	return L5_367
end
addLandTo = L15_15
function L15_15(A0_375)
	local L1_376
	if A0_375 == "N" then
		L1_376 = "S"
		return L1_376
	elseif A0_375 == "E" then
		L1_376 = "W"
		return L1_376
	elseif A0_375 == "S" then
		L1_376 = "N"
		return L1_376
	elseif A0_375 == "W" then
		L1_376 = "E"
		return L1_376
	end
end
getOppositeDirection = L15_15
function L15_15(A0_377)
	local L1_378
	if A0_377 == "N" then
		L1_378 = {}
		L1_378[1] = "E"
		L1_378[2] = "W"
		return L1_378
	elseif A0_377 == "E" then
		L1_378 = {}
		L1_378[1] = "S"
		L1_378[2] = "N"
		return L1_378
	elseif A0_377 == "S" then
		L1_378 = {}
		L1_378[1] = "W"
		L1_378[2] = "E"
		return L1_378
	elseif A0_377 == "W" then
		L1_378 = {}
		local L2_379 = L2_379
		L1_378[1] = L2_379
		local L1_378[2], L3_380 = "S", L3_380
		return L1_378
	end
end
getAdjacentDirections = L15_15
function L15_15(A0_381, A1_382)
	if A0_381 == "E" or A0_381 == "W" then
		L5_386 = pairs
		L6_387 = Borders
		L6_387 = L6_387.EW_double
		L5_386, L6_387, _FOR_ = L5_386(L6_387)
		for _FORV_5_, _FORV_6_ in L5_386, L6_387, _FOR_ do
			if _FORV_6_ == A1_382 then
				return true
			end
		end
		break -- pseudo-goto
	end
	L5_386 = pairs
	L6_387 = Borders
	L6_387 = L6_387.NS_double
	L5_386, L6_387, L7_388 = L5_386(L6_387)
	repeat
		for _FORV_5_, _FORV_6_ in L5_386, L6_387, L7_388 do
			if _FORV_6_ == A1_382 then
				return true
			end
		end
	until true
	L5_386 = false
	return L5_386
end
isADoubleBorderValue = L15_15
function L15_15(A0_389, A1_390, A2_391, A3_392)
	local L4_393, L5_394, L6_395, L7_396
	L4_393 = A1_390.borders
	L4_393 = L4_393[A3_392]
	L5_394 = A2_391.borders
	L5_394 = L5_394[A3_392]
	L6_395 = 0
	L7_396 = A1_390.adjacent
	L7_396 = L7_396[A3_392]
	if L7_396 ~= 0 then
		L7_396 = A0_389.lands
		L7_396 = L7_396[A1_390.adjacent[A3_392]]
		L7_396 = L7_396.borders
		L6_395 = L7_396[getOppositeDirection(A3_392)]
	end
	L7_396 = 0
	if A2_391.adjacent[A3_392] ~= 0 then
		L7_396 = A0_389.lands[A2_391.adjacent[A3_392]].borders[getOppositeDirection(A3_392)]
	end
	if 0 < L4_393 and not isADoubleBorderValue(A3_392, L4_393) and 0 < L5_394 and not isADoubleBorderValue(A3_392, L5_394) and 0 < L6_395 and not isADoubleBorderValue(getOppositeDirection(A3_392), L6_395) and 0 < L7_396 then
		local L8_397 = L8_397
		L8_397 = L8_397(getOppositeDirection(A3_392), L7_396)
		if not L8_397 then
			if A3_392 == "N" or A3_392 == "S" then
				L8_397 = Borders
				L8_397 = L8_397.NS_line
				if L4_393 ~= L8_397 then
					L8_397 = Borders
					L8_397 = L8_397.NS_line
					if L5_394 ~= L8_397 then
						L8_397 = A0_389.lands
						L8_397 = L8_397[A1_390.adjacent[A3_392]]
						L8_397 = L8_397.borders
						L8_397 = L8_397[getOppositeDirection(A3_392)]
						if L8_397 ~= Borders.NS_line then
							L8_397 = A0_389.lands
							L8_397 = L8_397[A2_391.adjacent[A3_392]]
							L8_397 = L8_397.borders
							L8_397 = L8_397[getOppositeDirection(A3_392)]
							if L8_397 ~= Borders.NS_line then
								L8_397 = true
								return L8_397
							end
						end
					end
				end
			elseif A3_392 == "E" or A3_392 == "W" then
				L8_397 = Borders
				L8_397 = L8_397.EW_line
				if L4_393 ~= L8_397 then
					L8_397 = Borders
					L8_397 = L8_397.EW_line
					if L5_394 ~= L8_397 then
						L8_397 = A0_389.lands
						L8_397 = L8_397[A1_390.adjacent[A3_392]]
						L8_397 = L8_397.borders
						L8_397 = L8_397[getOppositeDirection(A3_392)]
						if L8_397 ~= Borders.EW_line then
							L8_397 = A0_389.lands
							L8_397 = L8_397[A2_391.adjacent[A3_392]]
							L8_397 = L8_397.borders
							local L9_398 = L9_398
							local L9_398, L10_399 = L9_398(A3_392), L10_399
							L8_397 = L8_397[L9_398]
							L9_398 = Borders
							L9_398 = L9_398.EW_line
							if L8_397 ~= L9_398 then
								L8_397 = true
								return L8_397
							end
						end
					end
				end
			end
		end
	end
	L8_397 = false
	return L8_397
end
borderEligibleToBeMergedIntoDouble = L15_15
function L15_15(A0_400)
	local L1_401, L2_402
	L1_401 = {}
	local L2_402, L24_424 = {}, L24_424
	L5_405 = pairs
	L6_406 = A0_400.countries
	L5_405, L6_406, L7_407 = L5_405(L6_406)
	for L18_418, L23_423 in L5_405, L6_406, L7_407 do
		L24_424 = L23_423.landType
		L28_428 = landType
		L28_428 = L28_428.WATER
		if L24_424 == L28_428 then
			L24_424 = table
			L24_424 = L24_424.insert
			L28_428 = L2_402
			L29_429 = L23_423
			L24_424(L28_428, L29_429)
		else
			L24_424 = getAdjacentCountries
			L28_428 = A0_400
			L29_429 = L23_423
			L24_424 = L24_424(L28_428, L29_429)
			L28_428 = false
			L29_429 = 1
			L33_433 = #L1_401
			L34_434 = 1
			for _FORV_13_ = L29_429, L33_433, L34_434 do
				_FOR_, _FOR_, _FOR_ = pairs(L24_424)
				for _FORV_18_, _FORV_19_ in _FOR_, _FOR_, _FOR_ do
					if _FORV_19_.landType ~= landType.WATER then
						_FOR_, _FOR_, _FOR_ = pairs(L1_401[_FORV_13_])
						for _FORV_23_, _FORV_24_ in _FOR_, _FOR_, _FOR_ do
							if _FORV_19_ == _FORV_24_ then
								table.insert(L1_401[_FORV_13_], L23_423)
								L28_428 = true
								break
							end
							if L28_428 then
								break
							end
						end
					end
					if L28_428 then
						break
					end
				end
				if L28_428 then
					break
				end
			end
			if not L28_428 then
				L29_429 = {}
				L33_433 = table
				L33_433 = L33_433.insert
				L34_434 = L29_429
				L33_433(L34_434, L23_423)
				L33_433 = table
				L33_433 = L33_433.insert
				L34_434 = L1_401
				L33_433(L34_434, L29_429)
			end
		end
	end
	L5_405 = #L1_401
	if 1 < L5_405 then
		L5_405 = #L1_401
		L6_406 = 2
		L7_407 = -1
		for L18_418 = L5_405, L6_406, L7_407 do
			L23_423 = L1_401[L18_418]
			L24_424 = false
			L28_428 = 1
			L29_429 = L18_418 - 1
			L33_433 = 1
			for L34_434 = L28_428, L29_429, L33_433 do
				local _FOR_, _FOR_, _FOR_, L15_415 = pairs(L23_423)
				for _FORV_17_, _FORV_18_ in _FOR_, _FOR_, _FOR_ do
					_FOR_, _FOR_, _FOR_ = pairs((getAdjacentCountries(A0_400, _FORV_18_)))
					for _FORV_23_, _FORV_24_ in _FOR_, _FOR_, _FOR_ do
						_FOR_, _FOR_, _FOR_ = pairs(L15_415)
						for _FORV_28_, _FORV_29_ in _FOR_, _FOR_, _FOR_ do
							if _FORV_24_ == _FORV_29_ then
								_FOR_, _FOR_, _FOR_ = pairs(L23_423)
								for _FORV_33_, _FORV_34_ in _FOR_, _FOR_, _FOR_ do
									local L35_435 = L35_435
									table.insert(L15_415, _FORV_34_)
								end
								table.remove(L1_401, L18_418)
								L24_424 = true
								break
							end
						end
						if L24_424 then
							break
						end
					end
					if L24_424 then
						break
					end
				end
				if L24_424 then
					break
				end
			end
		end
	end
	L5_405 = L1_401
	L6_406 = L2_402
	return L5_405, L6_406
end
checkForPangea = L15_15
function L15_15(A0_438)
	local L1_439, L3_441, L4_442, L5_443 = L1_439, A0_438, L4_442, L5_443
	L1_439, L3_441 = L1_439(L3_441)
	L4_442 = 0
	while true do
		L5_443 = #L1_439
		if not (1 < L5_443 and L4_442 < 30) then
			break
		end
		L5_443 = L1_439[1]
		L15_453 = 2
		L16_454 = #L1_439
		L20_458 = 1
		for L23_461 = L15_453, L16_454, L20_458 do
			if #L1_439[L23_461] > #L5_443 then
				L5_443 = L1_439[L23_461]
			end
		end
		L15_453 = false
		L16_454 = 1
		L20_458 = #L3_441
		L23_461 = 1
		for _FORV_9_ = L16_454, L20_458, L23_461 do
			_FOR_, _FOR_, _FOR_ = pairs((getAdjacentCountries(A0_438, L3_441[_FORV_9_])))
			for _FORV_15_, _FORV_16_ in _FOR_, _FOR_, _FOR_ do
				local L18_456 = L18_456
				if _FORV_16_.landType ~= landType.WATER then
					_FOR_ = 1
					local L19_457 = L19_457
					for _FORV_20_ = _FOR_, _FOR_, _FOR_ do
						if L1_439[_FORV_20_] ~= L5_443 then
							_FOR_ = 1
							for _FORV_25_ = _FOR_, _FOR_, _FOR_ do
								if _FORV_16_ == L1_439[_FORV_20_][_FORV_25_] then
									L18_456.landType = landType.MOUNTAINS
									L15_453 = true
									break
								end
							end
						end
						if L15_453 then
							break
						end
					end
				end
				if L15_453 then
					break
				end
			end
			if L15_453 then
				break
			end
		end
		L4_442 = L4_442 + 1
		L16_454 = checkForPangea
		L20_458 = A0_438
		L16_454, L20_458 = L16_454(L20_458)
		L3_441 = L20_458
		L1_439 = L16_454
	end
end
ensurePangea = L15_15
function L15_15(A0_464, A1_465)
	local L4_468, L7_471, L14_478, L24_488, L25_489 = A1_465, L7_471, L14_478, L24_488, L25_489
	L2_466, L4_468, L5_469 = L2_466(L4_468)
	for L6_470 in L2_466, L4_468, L5_469 do
		L7_471 = A0_464.countries
		L7_471 = L7_471[L6_470]
		L7_471 = L7_471.lands
		L8_472 = 1
		L9_473 = #L7_471
		L10_474 = 1
		for L11_475 = L8_472, L9_473, L10_474 do
			L14_478 = A0_464.lands
			L15_479 = L7_471[L11_475]
			L14_478 = L14_478[L15_479]
			L15_479 = pairs
			L16_480 = L14_478.adjacent
			L15_479, L16_480, L17_481 = L15_479(L16_480)
			for L18_482, L23_487 in L15_479, L16_480, L17_481 do
				L24_488 = false
				if L23_487 ~= 0 then
					L25_489 = A0_464.lands
					L25_489 = L25_489[L23_487]
					if L14_478.countryId == L25_489.countryId then
						math.randomseed(system.getTimer())
						local _FOR_, _FOR_, _FOR_, L22_486 = pairs((getAdjacentDirections(L18_482)))
						for _FORV_24_, _FORV_25_ in _FOR_, _FOR_, _FOR_ do
							if not L24_488 then
								local L26_490 = L26_490
								if borderEligibleToBeMergedIntoDouble(A0_464, L14_478, L25_489, _FORV_25_) and L14_478.adjacent[_FORV_25_] ~= 0 and L25_489.adjacent[_FORV_25_] ~= 0 and A0_464.lands[L14_478.adjacent[_FORV_25_]].countryId == A0_464.lands[L25_489.adjacent[_FORV_25_]].countryId and L14_478.countryId ~= A0_464.lands[L14_478.adjacent[_FORV_25_]].countryId then
									if _FORV_25_ == "E" or _FORV_25_ == "W" then
									end
									if L18_482 == "N" or L18_482 == "E" then
										L14_478.borders[_FORV_25_] = Borders.EW_double[math.random(1, #Borders.EW_double)]
										L25_489.borders[_FORV_25_] = -1 * Borders.EW_double[math.random(1, #Borders.EW_double)]
										A0_464.lands[L14_478.adjacent[_FORV_25_]].borders[getOppositeDirection(_FORV_25_)] = Borders.EW_double[math.random(1, #Borders.EW_double)]
										A0_464.lands[L25_489.adjacent[_FORV_25_]].borders[getOppositeDirection(_FORV_25_)] = -1 * Borders.EW_double[math.random(1, #Borders.EW_double)]
									else
										L14_478.borders[_FORV_25_] = -1 * Borders.EW_double[math.random(1, #Borders.EW_double)]
										L25_489.borders[_FORV_25_] = Borders.EW_double[math.random(1, #Borders.EW_double)]
										A0_464.lands[L14_478.adjacent[_FORV_25_]].borders[getOppositeDirection(_FORV_25_)] = -1 * Borders.EW_double[math.random(1, #Borders.EW_double)]
										A0_464.lands[L25_489.adjacent[_FORV_25_]].borders[getOppositeDirection(_FORV_25_)] = Borders.EW_double[math.random(1, #Borders.EW_double)]
									end
									L24_488 = true
								end
							end
						end
					end
				end
			end
		end
	end
end
performCountryBorderSanitization = L15_15
function L15_15(A0_495, A1_496)
	local L8_503, L15_510 = L8_503, L15_510
	if #A1_496 == 0 then
		return
	end
	L4_499 = pairs
	L5_500 = A1_496
	L4_499, L5_500, L6_501 = L4_499(L5_500)
	for L7_502 in L4_499, L5_500, L6_501 do
		L8_503 = A0_495.countries
		L8_503 = L8_503[L7_502]
		L8_503 = L8_503.lands
		L9_504 = 1
		L10_505 = #L8_503
		L11_506 = 1
		for L14_509 = L9_504, L10_505, L11_506 do
			L15_510 = A0_495.lands
			L16_511 = L8_503[L14_509]
			L15_510 = L15_510[L16_511]
			L16_511 = pairs
			L17_512 = L15_510.adjacent
			L16_511, L17_512, L18_513 = L16_511(L17_512)
			for _FORV_15_, _FORV_16_ in L16_511, L17_512, L18_513 do
				if _FORV_16_ ~= 0 and L15_510.countryId ~= A0_495.lands[_FORV_16_].countryId then
					if A0_495.lands[_FORV_16_].borders[getOppositeDirection(_FORV_15_)] ~= 0 then
						L15_510.borders[_FORV_15_] = A0_495.lands[_FORV_16_].borders[getOppositeDirection(_FORV_15_)]
					else
						if A0_495.countries[L15_510.countryId].landType == landType.WATER or A0_495.countries[A0_495.lands[_FORV_16_].countryId].landType == landType.WATER then
							if _FORV_15_ == "E" or _FORV_15_ == "W" then
							end
						elseif _FORV_15_ == "E" or _FORV_15_ == "W" then
						end
						while "EW_single_nolines" do
							if isBorderPermitted(L15_510, _FORV_15_, Borders.EW_single[math.random(1, #Borders.EW_single)]) then
								if isBorderPermitted(A0_495.lands[_FORV_16_], getOppositeDirection(_FORV_15_), Borders.EW_single[math.random(1, #Borders.EW_single)]) then
									break
								end
							end
						end
						L15_510.borders[_FORV_15_] = Borders.EW_single[math.random(1, #Borders.EW_single)]
						local L21_516 = L21_516
						local L22_517 = L22_517
						A0_495.lands[_FORV_16_].borders[getOppositeDirection(_FORV_15_)] = Borders.EW_single[math.random(1, #Borders.EW_single)]
					end
				end
			end
		end
	end
end
generateCountryBorders = L15_15
function L15_15(A0_519, A1_520, A2_521)
	local L3_522
	if A1_520 == "N" then
		if A2_521 == 19 then
			L3_522 = A0_519.borders
			L3_522 = L3_522.W
			if L3_522 ~= 7 then
				L3_522 = A0_519.borders
				L3_522 = L3_522.W
			end
			if L3_522 == 9 then
				L3_522 = false
				return L3_522
			end
		end
	elseif A1_520 == "E" then
		if A2_521 == 8 then
			L3_522 = A0_519.borders
			L3_522 = L3_522.S
			if L3_522 ~= 18 then
				L3_522 = A0_519.borders
				L3_522 = L3_522.S
			end
			if L3_522 == 20 then
				L3_522 = false
				return L3_522
			end
		end
	elseif A1_520 == "S" then
		if A2_521 == 18 or A2_521 == 20 then
			L3_522 = A0_519.borders
			L3_522 = L3_522.E
			if L3_522 == 8 then
				L3_522 = false
				return L3_522
			end
		end
	elseif A1_520 == "W" and (A2_521 == 7 or A2_521 == 9) then
		L3_522 = A0_519.borders
		L3_522 = L3_522.N
		if L3_522 == 19 then
			L3_522 = false
			return L3_522
		end
	end
	L3_522 = true
	return L3_522
end
isBorderPermitted = L15_15
function L15_15(A0_523)
	local L6_529, L19_542 = math.randomseed, L19_542
	L19_542 = system
	L19_542 = L19_542.getTimer
	L19_542, L20_543 = L19_542()
	L6_529(L19_542, L20_543, L19_542())
	L6_529 = require
	L19_542 = "countryNameGenerator"
	L6_529 = L6_529(L19_542)
	L19_542 = {}
	L20_543 = pairs
	L20_543, _FOR_, _FOR_ = L20_543(A0_523.lands)
	for _FORV_6_, _FORV_7_ in L20_543, _FOR_, _FOR_ do
		if _FORV_7_ ~= nil and not _FORV_7_.deleted and _FORV_7_.countryId == 0 then
			formCountryFromLands(A0_523, Country:new(#A0_523.countries + 1, false, L6_529.generateName()), _FORV_7_, (math.random(4, 16)))
			if #Country:new(#A0_523.countries + 1, false, L6_529.generateName()).lands == 1 then
				_FOR_, _FOR_, _FOR_ = pairs((getAdjacentCountries(A0_523, (Country:new(#A0_523.countries + 1, false, L6_529.generateName())))))
				for _FORV_14_, _FORV_15_ in _FOR_, _FOR_, _FOR_ do
					if _FORV_15_.id ~= HOMELAND_COUNTRY_ID then
						A0_523.lands[Country:new(#A0_523.countries + 1, false, L6_529.generateName()).lands[1]].countryId = _FORV_15_.id
						table.insert(_FORV_15_.lands, Country:new(#A0_523.countries + 1, false, L6_529.generateName()).lands[1])
						break
					end
				end
			else
				A0_523.countries[Country:new(#A0_523.countries + 1, false, L6_529.generateName()).id] = Country:new(#A0_523.countries + 1, false, L6_529.generateName())
				L19_542[Country:new(#A0_523.countries + 1, false, L6_529.generateName()).id] = #L19_542 + 1
			end
		end
	end
	L20_543 = #L19_542
	if 0 < L20_543 then
		L20_543 = pairs
		L20_543, _FOR_, _FOR_ = L20_543(L19_542)
		for _FORV_6_ in L20_543, _FOR_, _FOR_ do
			if math.random(1, 15) == 4 then
				A0_523.countries[_FORV_6_].landType = landType.WATER
				break -- pseudo-goto
			end
			A0_523.countries[_FORV_6_].landType = _ENV.availableLandTypes[math.random(1, #_ENV.availableLandTypes)]
			repeat
			until true
		end
		L20_543 = pairs
		L7_530 = L19_542
		L20_543, L7_530, L9_532 = L20_543(L7_530)
		for _FORV_6_ in L20_543, L7_530, L9_532 do
			if A0_523.countries[_FORV_6_].landType ~= landType.WATER then
				_FOR_, _FOR_, _FOR_ = pairs(A0_523.countries[_FORV_6_].lands)
				for _FORV_13_, _FORV_14_ in _FOR_, _FOR_, _FOR_ do
					_FOR_, _FOR_, _FOR_ = pairs(A0_523.lands[_FORV_14_].adjacent)
					local L17_540, L18_541 = L17_540, L18_541
					for _FORV_19_, _FORV_20_ in _FOR_, _FOR_, _FOR_ do
						if _FORV_20_ ~= 0 and A0_523.lands[_FORV_20_].countryId ~= L17_540.id then
							if A0_523.countries[A0_523.lands[_FORV_20_].countryId].landType ~= landType.WATER then
								L18_541 = false
							else
								local L21_544 = L21_544
								L21_544[A0_523.lands[_FORV_20_].countryId] = A0_523.lands[_FORV_20_].countryId
							end
						end
					end
				end
				if L18_541 then
					L22_545 = false
					_FOR_, _FOR_, _FOR_ = pairs(L21_544)
					for _FORV_14_ in _FOR_, _FOR_, _FOR_ do
						if L19_542[_FORV_14_] ~= nil and not L22_545 then
							A0_523.countries[_FORV_14_].landType = landType.MOUNTAINS
							L22_545 = true
						end
					end
					if not L22_545 then
						_FOR_, _FOR_, _FOR_ = pairs(L21_544)
						for _FORV_14_ in _FOR_, _FOR_, _FOR_ do
							if not L22_545 then
								A0_523.countries[_FORV_14_].landType = landType.MOUNTAINS
								L22_545 = true
							end
						end
					end
				end
			end
		end
	end
	return L19_542
end
ensureCountriesForAllLands = L15_15
function L15_15(A0_546)
	A0_546.flairByLandType = {}
	L4_550 = pairs
	L5_551 = _ENV
	L5_551 = L5_551.themes
	L8_554 = A0_546.theme
	L5_551 = L5_551[L8_554]
	L5_551 = L5_551.flair
	L4_550, L5_551, L8_554 = L4_550(L5_551)
	for L9_555, L10_556 in L4_550, L5_551, L8_554 do
		_FOR_, _FOR_, _FOR_ = pairs(L10_556.landTypes)
		for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
			if A0_546.flairByLandType[_FORV_10_] == nil then
				A0_546.flairByLandType[_FORV_10_] = {}
			end
			table.insert(A0_546.flairByLandType[_FORV_10_], L10_556)
		end
	end
end
prepCampaignFlairByLandType = L15_15
function L15_15(A0_560, A1_561)
	local L5_565, L10_570, L23_583 = A0_560, L10_570, L23_583
	L4_564(L5_565)
	L4_564 = pairs
	L5_565 = A1_561
	L4_564, L5_565, L6_566 = L4_564(L5_565)
	for L9_569 in L4_564, L5_565, L6_566 do
		L10_570 = A0_560.countries
		L10_570 = L10_570[L9_569]
		L11_571 = pairs
		L12_572 = L10_570.lands
		L11_571, L12_572, L13_573 = L11_571(L12_572)
		for L21_581, L22_582 in L11_571, L12_572, L13_573 do
			L23_583 = A0_560.lands
			L23_583 = L23_583[L22_582]
			L23_583.flair = {}
			if A0_560.flairByLandType[L10_570.landType] ~= nil and math.random(1, 5 * #A0_560.flairByLandType[L10_570.landType]) <= #A0_560.flairByLandType[L10_570.landType] then
				({}).id = A0_560.flairByLandType[L10_570.landType][math.random(1, 5 * #A0_560.flairByLandType[L10_570.landType])].id
				;({}).flairType = A0_560.flairByLandType[L10_570.landType][math.random(1, 5 * #A0_560.flairByLandType[L10_570.landType])].flairType
				;({}).x = math.random(flairType[({}).flairType].xMin, flairType[({}).flairType].xMax)
				;({}).y = math.random(flairType[({}).flairType].yMin, flairType[({}).flairType].yMax)
				table.insert(L23_583.flair, {})
				if flairType[A0_560.flairByLandType[L10_570.landType][math.random(1, 5 * #A0_560.flairByLandType[L10_570.landType])].flairType].allowCluster then
					local L17_577 = L17_577
					local L18_578 = L18_578
					local L20_580 = L20_580
					_FOR_ = 1
					for _FORV_22_ = _FOR_, _FOR_, _FOR_ do
						if L17_577[_FORV_22_].flairType == L20_580.flairType then
							({})[#{} + 1] = L17_577[_FORV_22_]
						end
					end
					_FOR_ = 1
					for _FORV_22_ = _FOR_, _FOR_, _FOR_ do
						local L24_584 = L24_584
						;({}).id = ({})[math.random(1, #{})].id
						;({}).flairType = ({})[math.random(1, #{})].flairType
						;({}).x = math.random(L24_584.xMin, L24_584.xMax)
						local L25_585 = L25_585
						;({}).y = math.random(L24_584.yMin, L24_584.yMax)
						_FOR_ = 1
						for _FORV_29_ = _FOR_, _FOR_, _FOR_ do
							local L30_590 = L30_590
							if L23_583.flair[_FORV_29_].y < ({}).y then
							end
						end
						table.insert(L23_583.flair, _FORV_29_ + 1, {})
					end
				end
			end
		end
	end
end
addFlairToCountries = L15_15
function L15_15(A0_592, A1_593, A2_594, A3_595)
	local L4_596, L5_597, L6_598, L7_599, L8_600, L9_601
	L4_596 = true
	L5_597 = 1
	L6_598 = A3_595
	L7_599 = 1
	for L8_600 = L5_597, L6_598, L7_599 do
		if L4_596 then
			L9_601 = A1_593.id
			A2_594.countryId = L9_601
			L9_601 = A1_593.lands
			L13_605 = A1_593.lands
			L13_605 = #L13_605
			L13_605 = L13_605 + 1
			L14_606 = A2_594.id
			L9_601[L13_605] = L14_606
			L9_601 = {}
			L13_605 = pairs
			L14_606 = A2_594.adjacent
			L13_605, L14_606, _FOR_ = L13_605(L14_606)
			for _FORV_13_, _FORV_14_ in L13_605, L14_606, _FOR_ do
				if _FORV_14_ ~= 0 and A0_592.lands[_FORV_14_].countryId == 0 then
					L9_601[#L9_601 + 1] = _FORV_14_
				end
			end
			L13_605 = #L9_601
			if 0 < L13_605 then
				L13_605 = math
				L13_605 = L13_605.random
				L14_606 = 1
				L15_607 = #L9_601
				repeat
					L13_605 = L13_605(L14_606, L15_607)
					L14_606 = A0_592.lands
					L15_607 = L9_601[L13_605]
					A2_594 = L14_606[L15_607]
					do break end -- pseudo-goto
					L4_596 = false
				until true
			end
		end
	end
end
formCountryFromLands = L15_15
function L15_15(A0_608, A1_609, A2_610, A3_611)
	repeat
		local L4_612 = L4_612
		L4_612 = L4_612(A0_608, A1_609, A2_610, A3_611)
		local L5_613 = L5_613
		L5_613 = L5_613(A0_608, A1_609, A3_611, A2_610)
		if (L4_612 == nil or L4_612 == 0) and (L5_613 == nil or L5_613 == 0) then
			local L6_614 = L6_614
			L6_614 = L6_614(A0_608, A0_608.lands[A1_609.adjacent[A2_610]], A3_611)
			if A1_609.adjacent[A3_611] ~= nil then
				A0_608.lands[L6_614].adjacent[getOppositeDirection(A2_610)] = A1_609.adjacent[A3_611]
			end
			if A1_609.adjacent[A2_610] ~= nil then
				local A0_608.lands[L6_614].adjacent[getOppositeDirection(A3_611)], L10_618 = A1_609.adjacent[A2_610], L10_618
			end
			A0_608.lands[A1_609.adjacent[A2_610]].adjacent[A3_611] = L6_614
			A0_608.lands[A1_609.adjacent[A3_611]].adjacent[A2_610] = L6_614
			break -- pseudo-goto
		end
		if L4_612 == nil or L4_612 == 0 then
			L6_614 = A0_608.lands
			L10_618 = A1_609.adjacent
			L10_618 = L10_618[A2_610]
			L6_614 = L6_614[L10_618]
			L6_614 = L6_614.adjacent
			L6_614[A3_611] = L5_613
			L6_614 = A0_608.lands
			L6_614 = L6_614[L5_613]
			L6_614 = L6_614.adjacent
			L10_618 = getOppositeDirection
			L10_618 = L10_618(A3_611)
			L6_614[L10_618] = A1_609.adjacent[A2_610]
		elseif L5_613 == nil or L5_613 == 0 then
			L6_614 = A0_608.lands
			L10_618 = A1_609.adjacent
			L10_618 = L10_618[A3_611]
			L6_614 = L6_614[L10_618]
			L6_614 = L6_614.adjacent
			L6_614[A2_610] = L4_612
			L6_614 = A0_608.lands
			L6_614 = L6_614[L4_612]
			L6_614 = L6_614.adjacent
			L10_618 = getOppositeDirection
			local L10_618, L8_616 = L10_618(A2_610), L8_616
			L8_616 = A1_609.adjacent
			L8_616 = L8_616[A3_611]
			L6_614[L10_618] = L8_616
		end
	until true
end
ensureCornerLand = L15_15
function L15_15(A0_619, A1_620, A2_621, A3_622)
	local L4_623, L5_624
	L4_623 = A1_620.adjacent
	L4_623 = L4_623[A2_621]
	if 0 < L4_623 then
		L5_624 = A0_619.lands
		L5_624 = L5_624[L4_623]
		L5_624 = L5_624.adjacent
		L5_624 = L5_624[A3_622]
		return L5_624
	end
	L5_624 = 0
	return L5_624
end
getCornerLandId = L15_15
function L15_15(A0_625, A1_626, A2_627, A3_628)
	local L4_629 = L4_629
	local L5_630 = L5_630
	local L6_631 = L6_631
	local L7_632 = L7_632
	local L4_629, L8_633 = L4_629(L5_630, L6_631, L7_632, A3_628), L8_633
	if 0 < L4_629 then
		L5_630 = A0_625.lands
		L5_630 = L5_630[0]
		return L5_630
	end
	L5_630 = 0
	return L5_630
end
getCornerLand = L15_15
function L15_15(A0_634)
	L5_639 = "===========> Adjacents for Land ID: "
	L4_638(L5_639, A0_634.id)
	L4_638 = pairs
	L5_639 = A0_634.adjacent
	L4_638, L5_639, _FOR_ = L4_638(L5_639)
	for _FORV_4_, _FORV_5_ in L4_638, L5_639, _FOR_ do
		print(_FORV_4_, _FORV_5_)
	end
end
printAdjacent = L15_15
function L15_15(A0_643, A1_644)
	L5_648 = A0_643
	L2_645(L5_648, A1_644)
	L2_645 = 2
	L5_648 = 9
	L4_647 = 1
	for _FORV_5_ = L2_645, L5_648, L4_647 do
		local L7_650 = L7_650
		L7_650(A0_643.countries[HOMELAND_COUNTRY_ID].lands, _FORV_5_)
		local L8_651 = L8_651
		L7_650 = A0_643.lands
		L7_650 = L7_650[_FORV_5_]
		L7_650.countryId = 1
	end
end
ensureHomeLand = L15_15
function L15_15(A0_652, A1_653, A2_654)
	local L3_655, L14_666 = L3_655, A0_652
	L3_655(L14_666, A1_653)
	L3_655 = 1
	L14_666 = A0_652.lands
	local L5_657 = L5_657
	L5_657 = L5_657(A0_652, A1_653, "N", "W")
	L14_666 = L14_666[L5_657]
	L5_657 = {}
	L5_657[1] = "E"
	L5_657[2] = "S"
	L5_657[3] = "W"
	L5_657[4] = "N"
	while A2_654 > L3_655 do
		_FOR_, _FOR_, _FOR_ = pairs(L5_657)
		for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
			_FOR_ = 1
			for _FORV_14_ = _FOR_, _FOR_, _FOR_ do
				ensureBorderingLandsExist(A0_652, L14_666)
				if L14_666.adjacent[_FORV_10_] > 0 then
					L14_666 = A0_652.lands[L14_666.adjacent[_FORV_10_]]
				end
			end
		end
		L17_669 = getCornerLandId
		L16_668 = A0_652
		L17_669 = L17_669(L16_668, L14_666, "N", "W")
		if 0 < L17_669 then
			L16_668 = A0_652.lands
			L14_666 = L16_668[L17_669]
		end
		L3_655 = L3_655 + 1
	end
	L17_669 = getFurthestLands
	L16_668 = A0_652
	L17_669 = L17_669(L16_668)
	L16_668 = shaveCorners
	local L12_664 = L12_664
	L16_668(L12_664, _ENV, L17_669.N.y, L17_669.E.x, L17_669.S.y, L17_669.W.x)
	local L13_665 = L13_665
	L16_668 = ensureCountriesForAllLands
	L12_664 = A0_652
	L16_668 = L16_668(L12_664)
	L12_664 = addFlairToCountries
	L13_665 = A0_652
	L12_664(L13_665, L16_668)
	L12_664 = generateCountryBorders
	L13_665 = A0_652
	L12_664(L13_665, L16_668)
	L12_664 = performCountryBorderSanitization
	L13_665 = A0_652
	L12_664(L13_665, L16_668)
	local L10_662 = L10_662
end
ensureBorderingLandsXDeep = L15_15
function L15_15(A0_670, A1_671, A2_672)
	if A1_671.adjacent[A2_672] == nil or A1_671.adjacent[A2_672] == 0 then
		local L3_673 = L3_673
		local L3_673, L4_674 = L3_673(A2_672), L4_674
		L4_674 = {}
		L4_674.direction = L3_673[1]
		local L5_675 = L5_675
		L5_675 = L5_675(A0_670, A1_671, L3_673[1], A2_672)
		L4_674.id = L5_675
		L5_675 = {}
		L5_675.direction = L3_673[2]
		L5_675.id = getCornerLandId(A0_670, A1_671, L3_673[2], A2_672)
		local L6_676 = L6_676
		local L7_677 = L7_677
		local L8_678 = L8_678
		local L9_679 = L9_679
		local L10_680 = L10_680
		local L6_676, L11_681 = L6_676(L7_677, L8_678, L9_679, L10_680, L5_675), L11_681
		return L6_676
	end
	L3_673 = A1_671.adjacent
	L3_673 = L3_673[A2_672]
	return L3_673
end
ensureLandInDirection = L15_15
function L15_15(A0_682, A1_683)
	ensureLandInDirection(A0_682, A1_683, "N")
	ensureLandInDirection(A0_682, A1_683, "E")
	ensureLandInDirection(A0_682, A1_683, "S")
	ensureLandInDirection(A0_682, A1_683, "W")
	ensureCornerLand(A0_682, A1_683, "N", "E")
	ensureCornerLand(A0_682, A1_683, "S", "E")
	ensureCornerLand(A0_682, A1_683, "S", "W")
	local L3_684 = L3_684
	local L4_685 = L4_685
	local L5_686 = L5_686
	L3_684(L4_685, L5_686, "N", "W")
	local L6_687 = L6_687
end
ensureBorderingLandsExist = L15_15
function L15_15(A0_688, A1_689)
	local L2_690, L3_691, L4_692, L5_693, L6_694
	L2_690 = 1
	L3_691 = A1_689.lands
	L3_691 = #L3_691
	L4_692 = 1
	for L5_693 = L2_690, L3_691, L4_692 do
		L6_694 = A0_688.lands
		L10_698 = A1_689.lands
		L10_698 = L10_698[L5_693]
		L6_694 = L6_694[L10_698]
		if L6_694 == nil then
			L10_698 = print
			L11_699 = "this shouldn't be nil"
			L12_700 = A1_689.lands
			L12_700 = L12_700[L5_693]
			L10_698(L11_699, L12_700)
		end
		L10_698 = pairs
		L11_699 = L6_694.adjacent
		L10_698, L11_699, L12_700 = L10_698(L11_699)
		for L14_702, _FORV_11_ in L10_698, L11_699, L12_700 do
			if _FORV_11_ ~= nil and _FORV_11_ ~= 0 and A0_688.lands[_FORV_11_] ~= nil and A0_688.countries[A0_688.lands[_FORV_11_].countryId].owned and (not A0_688.countries[A0_688.lands[_FORV_11_].countryId].underAttackDate or os.time() < A0_688.countries[A0_688.lands[_FORV_11_].countryId].underAttackDate) then
				return true
			end
		end
	end
	L2_690 = false
	return L2_690
end
canAnyAdjacentAttack = L15_15
function L15_15()
	local L1_704, L9_712 = system.getTimer, L9_712
	L1_704 = L1_704()
	L9_712 = {}
	_FOR_ = 1
	for _FORV_5_ = _FOR_, _FOR_, _FOR_ do
		L9_712[_FORV_5_] = {}
		copyCampaignStates(L9_712[_FORV_5_], campaigns[_FORV_5_])
		L9_712[_FORV_5_].borderFillSpriteSet = nil
		L9_712[_FORV_5_].spriteSet = nil
		L9_712[_FORV_5_].fillSheet = nil
		L9_712[_FORV_5_].sheetFile = nil
		L9_712[_FORV_5_].flairByLandType = nil
		L9_712[_FORV_5_].sheet = nil
		L9_712[_FORV_5_].countries = {}
		_FOR_ = 1
		for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
			L9_712[_FORV_5_].countries[_FORV_9_] = {}
			L9_712[_FORV_5_].countries[_FORV_9_].id = campaigns[_FORV_5_].countries[_FORV_9_].id
			copyCountryStates(L9_712[_FORV_5_].countries[_FORV_9_], campaigns[_FORV_5_].countries[_FORV_9_])
		end
		L9_712[_FORV_5_].lands = {}
		_FOR_ = 1
		for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
			if campaigns[_FORV_5_].lands[_FORV_9_] ~= nil then
				L9_712[_FORV_5_].lands[_FORV_9_] = {}
				L9_712[_FORV_5_].lands[_FORV_9_].id = campaigns[_FORV_5_].lands[_FORV_9_].id
				copyLandStates(L9_712[_FORV_5_].lands[_FORV_9_], campaigns[_FORV_5_].lands[_FORV_9_])
				repeat
					do break end -- pseudo-goto
					L9_712[_FORV_5_].lands[_FORV_9_] = nil
				until true
			end
		end
	end
	L7_710 = campaignSettings
	L8_711 = L7_710
	L7_710 = L7_710.set
	L10_713 = _ENV
	L12_715 = L9_712
	L7_710(L8_711, L10_713, L12_715)
	L7_710 = campaignSettings
	L8_711 = L7_710
	L7_710 = L7_710.set
	L10_713 = L3_3
	L12_715 = L4_4
	L7_710(L8_711, L10_713, L12_715)
end
saveCampaignStates = L15_15
function L15_15(A0_717, A1_718)
	local L2_719, L3_720, L4_721, L5_722, L6_723, L7_724
	L2_719 = {}
	local L3_720, L15_732, L16_733 = 1, L15_732, L16_733
	L4_721 = A1_718.lands
	L4_721 = #L4_721
	L5_722 = 1
	for L6_723 = L3_720, L4_721, L5_722 do
		L7_724 = A0_717.lands
		L10_727 = A1_718.lands
		L10_727 = L10_727[L6_723]
		L7_724 = L7_724[L10_727]
		L10_727 = pairs
		L11_728 = L7_724.adjacent
		L10_727, L11_728, L12_729 = L10_727(L11_728)
		for L13_730, L14_731 in L10_727, L11_728, L12_729 do
			if L14_731 ~= nil and L14_731 ~= 0 then
				L15_732 = A0_717.lands
				L15_732 = L15_732[L14_731]
				if L15_732 ~= nil then
					L16_733 = L15_732.countryId
					if L16_733 ~= L7_724.countryId then
						L16_733 = L15_732.countryId
						L2_719[L16_733] = A0_717.countries[A0_717.lands[L14_731].countryId]
					end
				end
			end
		end
	end
	return L2_719
end
getAdjacentCountries = L15_15
function L15_15(A0_734, A1_735)
	local L2_736
	L2_736 = {}
	L5_739 = A0_734.lands
	L5_739 = L5_739[1]
	L2_736.N = L5_739
	L5_739 = A0_734.lands
	L5_739 = L5_739[1]
	L2_736.E = L5_739
	L5_739 = A0_734.lands
	L5_739 = L5_739[1]
	L2_736.S = L5_739
	L5_739 = A0_734.lands
	L5_739 = L5_739[1]
	L2_736.W = L5_739
	L5_739 = pairs
	L6_740 = A0_734.lands
	L5_739, L6_740, L7_741 = L5_739(L6_740)
	for L8_742, L9_743 in L5_739, L6_740, L7_741 do
		if L9_743 ~= nil and A1_735 == nil or A0_734.countries[L9_743.countryId].owned == A1_735 then
			if L9_743.y < L2_736.N.y then
				L2_736.N = L9_743
			end
			if L9_743.y > L2_736.S.y then
				L2_736.S = L9_743
			end
			if L9_743.x > L2_736.E.x then
				L2_736.E = L9_743
			end
			if L9_743.x < L2_736.W.x then
				L2_736.W = L9_743
			end
		end
	end
	return L2_736
end
getFurthestLands = L15_15
function L15_15(A0_744)
	local L1_745
	L1_745 = A0_744.borders
	L1_745 = L1_745.N
	if L1_745 ~= 0 then
		L1_745 = A0_744.borders
		L1_745 = L1_745.N
		if L1_745 ~= 18 then
			L1_745 = A0_744.borders
			L1_745 = L1_745.N
			if L1_745 ~= 20 then
				L1_745 = A0_744.borders
				L1_745 = L1_745.N
				if L1_745 ~= 16 then
					L1_745 = A0_744.borders
					L1_745 = L1_745.N
					if L1_745 ~= 12 then
						L1_745 = A0_744.borders
						L1_745 = L1_745.N
						if L1_745 ~= -12 then
							L1_745 = A0_744.borders
							L1_745 = L1_745.N
							if L1_745 ~= 14 then
								L1_745 = A0_744.borders
								L1_745 = L1_745.N
								if L1_745 ~= -14 then
									goto lbl_135
								end
							end
						end
					end
				end
			end
		end
	end
	L1_745 = A0_744.borders
	L1_745 = L1_745.E
	if L1_745 ~= 0 then
		L1_745 = A0_744.borders
		L1_745 = L1_745.E
		if L1_745 ~= 7 then
			L1_745 = A0_744.borders
			L1_745 = L1_745.E
			if L1_745 ~= 5 then
				L1_745 = A0_744.borders
				L1_745 = L1_745.E
				if L1_745 ~= 9 then
					L1_745 = A0_744.borders
					L1_745 = L1_745.E
					if L1_745 ~= 3 then
						L1_745 = A0_744.borders
						L1_745 = L1_745.E
						if L1_745 ~= -3 then
							L1_745 = A0_744.borders
							L1_745 = L1_745.E
							if L1_745 ~= 1 then
								L1_745 = A0_744.borders
								L1_745 = L1_745.E
								if L1_745 ~= -1 then
									goto lbl_135
								end
							end
						end
					end
				end
			end
		end
	end
	L1_745 = A0_744.borders
	L1_745 = L1_745.S
	if L1_745 ~= 0 then
		L1_745 = A0_744.borders
		L1_745 = L1_745.S
		if L1_745 ~= 19 then
			L1_745 = A0_744.borders
			L1_745 = L1_745.S
			if L1_745 ~= 21 then
				L1_745 = A0_744.borders
				L1_745 = L1_745.S
				if L1_745 ~= 17 then
					L1_745 = A0_744.borders
					L1_745 = L1_745.S
					if L1_745 ~= 13 then
						L1_745 = A0_744.borders
						L1_745 = L1_745.S
						if L1_745 ~= -13 then
							L1_745 = A0_744.borders
							L1_745 = L1_745.S
							if L1_745 ~= 15 then
								L1_745 = A0_744.borders
								L1_745 = L1_745.S
								if L1_745 ~= -15 then
									goto lbl_135
								end
							end
						end
					end
				end
			end
		end
	end
	L1_745 = A0_744.borders
	L1_745 = L1_745.W
	if L1_745 ~= 0 then
		L1_745 = A0_744.borders
		L1_745 = L1_745.W
		if L1_745 ~= 10 then
			L1_745 = A0_744.borders
			L1_745 = L1_745.W
			if L1_745 ~= 6 then
				L1_745 = A0_744.borders
				L1_745 = L1_745.W
				if L1_745 ~= 8 then
					L1_745 = A0_744.borders
					L1_745 = L1_745.W
					if L1_745 ~= 4 then
						L1_745 = A0_744.borders
						L1_745 = L1_745.W
						if L1_745 ~= 2 then
							L1_745 = A0_744.borders
							L1_745 = L1_745.W
							if L1_745 ~= -2 then
								L1_745 = A0_744.borders
								L1_745 = L1_745.W
								if L1_745 ~= 2 then
									L1_745 = A0_744.borders
									L1_745 = L1_745.W
									if L1_745 ~= -2 then
										goto lbl_135
									end
								end
							end
						end
					end
				end
			end
		end
	end
	L1_745 = true
	do return L1_745 end
	::lbl_135::
	L1_745 = false
	return L1_745
end
landHasRoomForBigSprite = L15_15
function L15_15(A0_746, A1_747, A2_748)
	L5_751 = A0_746.lands
	L3_749, L5_751, L6_752 = L3_749(L5_751)
	for L7_753, L8_754 in L3_749, L5_751, L6_752 do
		if L8_754 ~= nil and L8_754.x == A1_747 and L8_754.y == A2_748 then
			return L8_754
		end
	end
	L3_749 = nil
	return L3_749
end
getLandByCoord = L15_15
function L15_15(A0_755, A1_756)
	L4_759 = A0_755.lands
	L2_757, L4_759, L7_760 = L2_757(L4_759)
	for _FORV_5_, _FORV_6_ in L2_757, L4_759, L7_760 do
		if _FORV_6_.id == A1_756 then
			return _FORV_6_
		end
	end
	L2_757 = nil
	return L2_757
end
getLandById = L15_15
function L15_15(A0_761, A1_762)
	activeCampaign = A0_761
	activeCountry = A1_762
end
setCountry = L15_15
