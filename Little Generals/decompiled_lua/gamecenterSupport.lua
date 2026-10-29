local L7_7, L8_8 = L7_7, (...)
L7_7(L8_8, package.seeall)
L7_7 = require
L8_8 = "gameNetwork"
L7_7 = L7_7(L8_8)
gameNetwork = L7_7
L7_7 = "gamecenterEnabled"
L8_8 = "gamecenterBannersShown"
gamecenter = settings:get(L7_7, false)
local L3_3, L4_4 = L3_3, L4_4
local L5_5 = L5_5
local L4_4, L6_6 = L4_4(L5_5, L8_8, {}), L6_6
L5_5 = false
L6_6 = nil
gamecenterId = L6_6
L6_6 = nil
gamecenterAlias = L6_6
L6_6 = false
hasCancelled = L6_6
L6_6 = gamecenterSupport
function L6_6.init(A0_9)
	repeat
		if "simulator" == system.getInfo("environment") then
			print("Game Center isn't supported on the simulator.")
			return
		end
		if not _ENV then
			local L2_11 = L2_11
			local L3_12 = L3_12
			L3_12("gamecenter", L2_11)
			local L4_13 = L4_13
			break -- pseudo-goto
		end
		if A0_9 then
			L2_11 = A0_9
			L2_11()
		end
	until true
end
function L6_6(A0_14)
	local L1_15 = L1_15
	local L2_16 = L2_16
	L1_15(L2_16, A0_14)
	L1_15 = A0_14.percentageComplete
	L1_15 = L1_15 == 100
	function L2_16(A0_22)
		if not A0_22.errorCode then
			if _ENV then
				_ENV[A0_14.id] = true
				settings:set(L1_1, _ENV)
				settings:save()
			end
		else
			local L1_23 = L1_23
			local L2_24 = L2_24
			local L3_25 = L3_25
			L1_23(L2_24, L3_25, A0_22.errorMessage)
			local L4_26 = L4_26
		end
	end
	local L3_17 = L3_17
	local L4_18 = L4_18
	;({}).identifier = A0_14.gamecenterData.achievementId
	local ({}).percentComplete, L7_21 = A0_14.percentageComplete, L7_21
	L7_21.achievement, ({}).showsCompletionBanner = {}, L1_15
	L7_21.listener = L2_16
	L3_17(L4_18, L7_21)
end
function gamecenterSupport.attainAchievement(A0_27)
	repeat
		if gamecenter and A0_27.gamecenterData then
			if _ENV then
				L6_6(A0_27)
				local L2_29 = L2_29
				break -- pseudo-goto
			end
			L2_29 = gamecenterSupport
			L2_29 = L2_29.init
			L2_29(function()
				_ENV(A0_27)
				local L1_30 = L1_30
			end)
		end
	until true
end
function gamecenterSupport.updateHighScore(A0_31, A1_32)
	repeat
		if gamecenter then
			if _ENV then
				local L3_34 = L3_34
				L3_34(A0_31, A1_32)
				local L4_35 = L4_35
				break -- pseudo-goto
			end
			L3_34 = gamecenterSupport
			L3_34 = L3_34.init
			function L4_35()
				local L1_36 = L1_36
				L1_36(A0_31, A1_32)
				local L2_37 = L2_37
			end
			L3_34(L4_35)
		end
	until true
end
function gamecenterSupport.loadFriends(A0_38)
	repeat
		local L2_40 = L2_40
		if gamecenter then
			L2_40 = _ENV
			if L2_40 then
				function L2_40(A0_48)
					_FOR_ = 1
					for _FORV_4_ = L4_52, _FOR_, _FOR_ do
						A0_48.data[_FORV_4_].gcID = A0_48.data[_FORV_4_].playerID
						A0_48.data[_FORV_4_].playerID = A0_48.data[_FORV_4_].playerID
					end
					L4_52 = _ENV
					L6_54 = A0_48.data
					L4_52(L6_54)
				end
				local L3_41 = L3_41
				local L4_42 = L4_42
				;({}).category = "com.smarterapps.littlegenerals.hs.kills"
				;({}).playerScope = "FriendsOnly"
				;({}).timeScope = "AllTime"
				local L7_45 = L7_45
				local L8_46 = L8_46
				L9_47.range, ({})[1] = {}, 1
				local L9_47.range, ({})[2], L9_47 = {}, 100, L9_47
				L8_46.leaderboard = L9_47
				L8_46.listener = L3_41
				L4_42(L7_45, L8_46)
				break -- pseudo-goto
			end
			L2_40 = gamecenterSupport
			L2_40 = L2_40.init
			function L3_41()
				loadFriends(_ENV)
				local L1_55 = L1_55
			end
			L2_40(L3_41)
		end
	until true
end
function gamecenterSupport.loadPlayers(A0_56, A1_57)
	repeat
		if gamecenter then
			if _ENV then
				local L3_59 = L3_59
				;({}).playerIDs = A0_56
				;({}).listener = A1_57
				L3_59("loadPlayers", {})
				local L4_60 = L4_60
				break -- pseudo-goto
			end
			L3_59 = gamecenterSupport
			L3_59 = L3_59.init
			function L4_60()
				local L1_61 = L1_61
				L1_61(_ENV, A1_57)
				local L2_62 = L2_62
			end
			L3_59(L4_60)
		end
	until true
end
function showHighScores(A0_63)
	gameNetwork.show("leaderboards")
	local L2_64 = L2_64
end
function showAchievements(A0_65)
	gameNetwork.show("achievements")
	local L2_66 = L2_66
end
function gotoGameCenter()
	local L0_67 = L0_67
	local L0_67, L1_68 = L0_67("environment"), L1_68
	L1_68 = "gamecenter:"
	if L0_67 == "simulator" then
		print("Cannot spawn this URL in the simulator")
	elseif _ENV() then
		local L2_69 = L2_69
		L2_69(L1_68)
		local L3_70 = L3_70
	end
end
