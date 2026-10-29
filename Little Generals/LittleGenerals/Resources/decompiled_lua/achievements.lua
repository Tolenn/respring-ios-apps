module((...), package.seeall)
local L2_2 = L2_2
L2_2 = require
L2_2("facebookSupport")
L2_2 = require
L2_2("gamecenterSupport")
local L1_1 = L1_1
L2_2 = "achievements"
L1_1 = {}
Achievement, ({})[1] = {}, id
Achievement, ({})[2] = {}, gamecenterData
Achievement, ({})[3] = {}, percentageComplete
Achievement_mt, ({}).__index = {}, Achievement
local L3_3, L4_4 = L3_3, L4_4
local L5_5 = L5_5
local L4_4, L6_6 = L4_4(L5_5, L2_2, {}), L6_6
L5_5 = Achievement
function L6_6(A0_7, A1_8, A2_9)
	if A0_7.percentageComplete == 100 and not A2_9 then
		local L3_10 = L3_10
		L3_10("Achievement already attained", A0_7.id)
		return
	end
	L3_10 = A1_8 or L3_10
	if not A1_8 then
		L3_10 = 100
	end
	print("attaining", A0_7.name, A0_7.percentageComplete, L3_10)
	L3_10 = math.min(math.max(L3_10, 0), 100)
	local L4_11 = L4_11
	L4_11 = L4_11(settings, _ENV, {})
	L4_11[tostring(A0_7.id)], ({}).percentageComplete = {}, L3_10
	A0_7.percentageComplete = L3_10
	local L7_14 = L7_14
	L7_14(settings, _ENV, L4_11)
	local L8_15 = L8_15
	L7_14 = settings
	L8_15 = L7_14
	L7_14 = L7_14.save
	L7_14(L8_15)
	L8_15 = A0_7
	L7_14 = A0_7.sync
	L7_14(L8_15)
end
L5_5.attain = L6_6
L5_5 = Achievement
function L6_6(A0_16)
	gamecenterSupport.attainAchievement(A0_16)
	local L2_17 = L2_17
end
L5_5.sync = L6_6
L5_5 = Achievement
function L6_6(A0_18)
	local L1_19
	L1_19 = A0_18.percentageComplete
	L1_19 = L1_19 == 100
	return L1_19
end
L5_5.isAttained = L6_6
L5_5 = achievements
function L6_6(A0_20, A1_21)
	if type(A0_20) == "number" then
		A0_20 = tostring(A0_20)
	end
	if _ENV[A0_20] then
		local L2_22 = L2_22
		local L3_23 = L3_23
		L2_22(L3_23, A0_20)
	end
	L2_22 = 0
	L3_23 = L4_4
	L3_23 = L3_23[A0_20]
	if L3_23 then
		L3_23 = L4_4
		L3_23 = L3_23[A0_20]
		L2_22 = L3_23.percentageComplete
	end
	L3_23 = {}
	L3_23.id = A0_20
	L3_23.gamecenterData = A1_21
	L3_23.percentageComplete = L2_22
	setmetatable(L3_23, Achievement_mt)
	_ENV[A0_20] = L3_23
	local L4_24 = L4_24
	local L5_25 = L5_25
	L4_24(L5_25, L3_23)
	local L6_26 = L6_26
	return L3_23
end
L5_5.addAchievement = L6_6
L5_5 = achievements
function L6_6(A0_27)
	local L1_28
	L1_28 = _ENV
	L1_28 = L1_28[A0_27]
	return L1_28
end
L5_5.byId = L6_6
L5_5 = achievements
function L6_6()
	local L0_29, L1_30
	function L0_29(A0_33)
		local L1_34, L2_35, L3_36
		function L1_34(A0_49)
			L3_52 = _ENV
			L1_50, L3_52, L4_53 = L1_50(L3_52)
			for L5_54, L6_55 in L1_50, L3_52, L4_53 do
				if L6_55.gamecenterData and L6_55.gamecenterData.achievementId == A0_49 then
					return L6_55
				end
			end
		end
		L2_35 = A0_33.errorCode
		if not L2_35 then
			L2_35 = A0_33.data
			L3_36 = {}
			L7_40 = gcAvchievements
			if L7_40 then
				L7_40 = 1
				_FOR_ = 1
				for _FORV_7_ = L7_40, _FOR_, _FOR_ do
					if L1_34(L2_35[_FORV_7_].identifier) and L2_35[_FORV_7_].percentComplete ~= L1_34(L2_35[_FORV_7_].identifier).percentageComplete then
						_ENV[L2_35[_FORV_7_].identifier]:attain(math.max(L2_35[_FORV_7_].percentComplete, L1_34(L2_35[_FORV_7_].identifier).percentageComplete))
					end
					table.insert(L3_36, L2_35[_FORV_7_].identifier)
					print("remote achievement:", L2_35[_FORV_7_].identifier, L2_35[_FORV_7_].percentComplete, "local completion", L1_34(L2_35[_FORV_7_].identifier).percentageComplete)
					local L15_48 = L15_48
				end
			end
			L7_40 = pairs
			L8_41 = _ENV
			L7_40, L8_41, L12_45 = L7_40(L8_41)
			for L13_46, L14_47 in L7_40, L8_41, L12_45 do
				L15_48 = table
				L15_48 = L15_48.indexOf
				L15_48 = L15_48(L3_36, L13_46)
				if L15_48 == nil and L14_47.percentageComplete > 0 then
					L14_47:sync()
				end
			end
		end
	end
	function L1_30()
		print("gamecenter init successful")
		local L1_56 = L1_56
		L1_56("loadAchievements", _ENV)
		local L2_57 = L2_57
	end
	local L2_31 = L2_31
	L2_31(L1_30)
	local L3_32 = L3_32
end
L5_5.syncWithGameCenter = L6_6
