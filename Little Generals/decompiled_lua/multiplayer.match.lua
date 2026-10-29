-- Decompiled & AI-Repaired from multiplayer.match.lu
-- Source disassembly preserved at: disasm/multiplayer.match.disasm

local L6_6, L7_7, L8_8, L9_9, L10_10, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35 = L6_6, (...), L8_8, L9_9, L10_10, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35
L8_8 = package
L8_8 = L8_8.seeall
L6_6(L7_7, L8_8)
L6_6 = require
L7_7 = "avatar"
L6_6(L7_7)
L6_6 = require
L7_7 = "gamecenterSupport"
L6_6(L7_7)
L6_6 = require
L7_7 = "facebookSupport"
L6_6(L7_7)
L6_6 = require
L7_7 = "currentBattle"
L6_6(L7_7)
L6_6 = require
L7_7 = "multiplayer.dataServer"
L6_6 = L6_6(L7_7)
L7_7 = require
L8_8 = "currentBattle"
L7_7 = L7_7(L8_8)
L8_8 = require
L9_9 = "push"
L8_8 = L8_8(L9_9)
L9_9 = require
L10_10 = "json"
L9_9 = L9_9(L10_10)
L10_10 = require
L14_14 = "time"
L10_10 = L10_10(L14_14)
L14_14 = "matches"
L15_15 = "random"
L16_16 = 3600
L17_17 = CUSTOM_OVERRIDES
L17_17 = L17_17.REFRESH_TIME
if not L17_17 then
	L17_17 = 300
end
L18_18 = "reminderList"
L19_19 = "lastSeenChallenge"
L20_20 = require
L23_23 = "settings"
L20_20 = L20_20(L23_23)
L20_20 = L20_20.new
L23_23 = "mp.json"
L20_20 = L20_20(L23_23)
L24_24 = L20_20
L23_23 = L20_20.load
L23_23(L24_24)
L23_23 = CUSTOM_OVERRIDES
L23_23 = L23_23.MULTIPLAYER_MATCH_FIRST_NOTICE
if not L23_23 then
	L23_23 = 86400
end
L24_24 = CUSTOM_OVERRIDES
L24_24 = L24_24.MULTIPLAYER_MATCH_SECOND_NOTICE
if not L24_24 then
	L24_24 = 345600
end
L25_25 = CUSTOM_OVERRIDES
L25_25 = L25_25.MULTIPLAYER_MATCH_EXPIRY
if not L25_25 then
	L25_25 = 432000
end
L26_26 = "res/sounds/not1.caf"
L27_27 = "25-"
L28_28 = {}
L28_28.FO_REAL = 1
L29_29 = CUSTOM_OVERRIDES
L29_29 = L29_29.MULTIPLAYER_RANDOM_ENDPOINT
if not L29_29 then
	L29_29 = "http://random.little-generals.com/"
end
L28_28.RANDOM_ENDPOINT = L29_29
L29_29 = CUSTOM_OVERRIDES
L29_29 = L29_29.MULTIPLAYER_MATCHES_ENDPOINT
if not L29_29 then
	L29_29 = "http://match.little-generals.com/"
end
L28_28.MATCHES_ENDPOINT = L29_29
L28_28.DEFAULT_NOTIFICATION_SOUND = L26_26
L29_29 = CUSTOM_OVERRIDES
L29_29 = L29_29.UPLOAD_RETRY_TIME
if not L29_29 then
	L29_29 = 5000
end
L28_28.UPLOAD_RETRY_TIME = L29_29
L29_29 = {}
L28_28.prepped = L29_29
function L29_29(A0_36)
	local L1_37, L2_38
	L1_37 = CURRENT_VERSION
	A0_36.version = L1_37
	A0_36.authorative = true
	L1_37 = true
	L2_38 = true
	return L1_37, L2_38
end
L30_30 = {}
L30_30["200"] = L29_29
function L31_31(A0_39)
	local L1_40 = L1_40
	local L1_40, L2_41 = L1_40(A0_39.version), L2_41
	L2_41 = settings
	L2_41 = L2_41.get
	L2_41 = L2_41(L2_41, "NEWEST_ENCOUNTERED_VERSION", tonumber(CURRENT_VERSION))
	if L1_40 > L2_41 then
		settings:set("NEWEST_ENCOUNTERED_VERSION", L1_40)
	end
	local L3_42 = L3_42
	L3_42 = L3_42(CURRENT_VERSION)
	if L1_40 ~= L3_42 then
		L3_42 = _ENV
		L3_42 = L3_42[A0_39.version]
		print("Migrating match", A0_39.matchId)
		local L6_45 = L6_45
		if L3_42 then
			L6_45 = L3_42
			do return L6_45(A0_39) end
			local L5_44 = L5_44
		end
		L6_45 = true
		L5_44 = false
		return L6_45, L5_44
	end
	L3_42 = true
	L6_45 = false
	return L3_42, L6_45
end
L32_32 = require
L33_33 = "reminders"
L32_32 = L32_32(L33_33)
function L33_33(A0_46)
	local L1_47 = _ENV.selfId()
	if A0_46.nextPlayer == L1_47 then
		local L2_48 = L2_48
		local L3_49 = L3_49
		local L4_50 = L4_50
		;({}).time = os.time() + L21_21
		;({}).alert = string.format("%s is waiting for you to play your turn!", _ENV.opponent(A0_46).alias)
		;({}).alert, ({}).sound = {}, L26_26
		;({}).time = os.time() + L22_22
		local L9_55 = L9_55
		local L11_57 = L11_57
		;({}).alert = string.format("You are about to forfeit your match with %s!", _ENV.opponent(A0_46).alias)
		L11_57.alert, ({}).sound = {}, L26_26
		L4_50[1] = L9_55
		L4_50[2] = L11_57
		L9_55 = false
		L2_48(L3_49, L4_50, L9_55)
	end
end
function L34_34(A0_58)
	if A0_58.nextPlayer ~= _ENV.selfId() then
		local L2_59 = L2_59
		L32_32.cancelIfPresent(A0_58.matchId)
		local L3_60 = L3_60
	end
end
function L35_35(A0_61, A1_62)
	local L2_63, L3_64, L4_65, L5_66
	L2_63 = A0_61.player1
	L2_63 = L2_63.id
	L3_64 = A0_61.player2
	L3_64 = L3_64.id
	L4_65 = A0_61.matchId
	L5_66 = {}
	local L9_70 = L9_70
	local L11_72 = L11_72
	local L12_73 = L12_73
	local L13_74 = L13_74
	local L16_77 = L16_77
	local L17_78 = L17_78
	L9_70 = L9_70(L11_72, L12_73, L13_74, L16_77, L17_78, crypto.hmac(crypto.sha1, L2_63 .. L3_64 .. L4_65 .. A1_62, REMOTE_SIGNING_KEY))
	L5_66.body = L9_70
	L9_70 = network
	L9_70 = L9_70.request
	L11_72 = _ENV
	L11_72 = L11_72.MATCHES_ENDPOINT
	L12_73 = "/matches"
	L11_72 = L11_72 .. L12_73
	L12_73 = "POST"
	function L13_74(A0_79)
		local L2_80 = L2_80
		local L3_81 = L3_81
		L2_80(L3_81, _ENV, A0_79.status)
		local L4_82 = L4_82
	end
	L16_77 = L5_66
	L9_70(L11_72, L12_73, L13_74, L16_77)
end
;({}).start = function()
	if _ENV.isRunning then
		return
	end
	if _ENV.retryTimer then
		local L0_83 = L0_83
		L0_83(_ENV.retryTimer)
	end
	L0_83 = _ENV
	local L1_84 = L1_84
	local L2_85 = L2_85
	local L1_84, L3_86 = L1_84(L2_85, _ENV.run), L3_86
	L0_83.retryTimer = L1_84
end
;({}).run = function()
	local L0_87
	repeat
		L0_87 = _ENV
		L0_87.isRunning = true
		L0_87 = _ENV
		L0_87 = #L0_87
		if 0 < L0_87 then
			L0_87 = _ENV
			L0_87 = L0_87[1]
			local L1_88 = L1_88
			L1_88(L0_87)
			local L2_89 = L2_89
			break -- pseudo-goto
		end
		L0_87 = _ENV
		L0_87.isRunning = false
	until true
end
function L28_28.randomMatchOutstanding()
	local L0_90 = L0_90
	local L2_92 = L2_92
	local L0_90, L3_93 = L0_90(L2_92, _UPVALUE1_(), 0), L3_93
	L2_92 = L4_4
	L2_92 = L2_92.current
	L2_92 = L2_92()
	L2_92 = L2_92 - L0_90
	L3_93 = L12_12
	L2_92 = L2_92 < L3_93
	return L2_92
end
function L28_28.handleNotification(A0_94, A1_95)
	local L2_96
	L2_96 = A0_94.mid
	print("fetching data", L2_96)
	local L3_97 = L3_97
	local L5_99 = L2_96 .. ".json"
	local L6_100 = L6_100
	L3_97(L5_99, L6_100, true, true)
	local L7_101 = L7_101
end
function L28_28.updateMatch(A0_102, A1_103, A2_104)
	if not A2_104 and A1_103.specialState then
		local L3_105 = L3_105
		L3_105("skipping")
		return
	end
	L3_105 = nil
	if A0_102.nextPlayer ~= A1_103.nextPlayer and A0_102.nextPlayer == _ENV.selfId() then
		if A0_102.accepted then
			L3_105 = string.format("%s has played their turn!", _ENV.opponent(A0_102).alias)
		else
			L3_105 = string.format("%s has challenged you!", _ENV.opponent(A0_102).alias)
		end
	end
	_FOR_, _FOR_, _FOR_ = pairs(A0_102)
	for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
		A1_103[_FORV_7_] = _FORV_8_
	end
	A1_103.winner = A0_102.winner
	A1_103.refreshTime = L4_4.current()
	A1_103.delete = A0_102.delete
	if A1_103.isRandom then
		A1_103.isRandom = nil
		L20_20:set(_UPVALUE3_(), nil)
		L20_20:save()
	end
	A1_103.specialState = A0_102.specialState
	A1_103.version = math.max(A0_102.version, A1_103.version)
	if A1_103.delete then
		if A1_103.accepted then
			if A1_103.winner == _ENV.selfId() then
				if not A1_103.pot then
				end
				warbux:credit(math.round(0))
				if not A0_102.pot then
				end
				L3_105 = string.format("%s has ended the match. You win %d Warbux.", _ENV.opponent(A0_102).alias, 0)
			else
				L3_105 = string.format("You have forfeited your match with %s!", _ENV.opponent(A0_102).alias)
			end
		else
			local L7_109 = L7_109
			L7_109 = L7_109("%s has declined your invitation.", _ENV.opponent(A0_102).alias)
			L3_105 = L7_109
		end
		L7_109 = _ENV
		L7_109 = L7_109.deleteMatch
		L7_109(A1_103, false)
	end
	if L3_105 then
		L7_109 = require
		L7_109 = L7_109("notificationQueue")
		;({}).direction = "down"
		;({}).text = L3_105
		;({}).onClose = function(A0_110)
			if _ENV.size() == 0 and storyboard.getCurrentSceneName() == "multiplayer.multiplayerSelectScene" then
				storyboard.gotoScene("multiplayer.multiplayerLoadingScene")
				storyboard.removeScene("multiplayer.multiplayerSelectScene")
				local L2_112 = L2_112
				L2_112 = _ENV
				L2_112 = L2_112.refreshAll
				;({}).force = false
				L2_112(function(A0_114)
					storyboard.gotoScene("multiplayer.multiplayerSelectScene")
					storyboard.removeScene("multiplayer.multiplayerLoadingScene")
					local L2_115 = L2_115
				end, {})
				local L3_113 = L3_113
			end
		end
		L7_109.add({})
	end
	L7_109 = L34_34
	L7_109(A1_103)
	L7_109 = L33_33
	L7_109(A1_103)
	local L5_107 = L5_107
end
function L28_28.matches(A0_116)
	local L1_117, L2_118 = L1_117, L2_118
	L1_117 = L1_117(L2_118, _UPVALUE1_(), {})
	L2_118 = nil
	_FOR_ = 1
	for _FORV_6_ = _FOR_, _FOR_, _FOR_ do
		if not L31_31(L1_117[_FORV_6_]) then
			L2_118 = true
			table.remove(L1_117, _FORV_6_)
			local L12_128 = L12_128
			_FORV_6_ = _FORV_6_ - 1
			break -- pseudo-goto
		end
		repeat
			if L31_31(L1_117[_FORV_6_]) then
				L2_118 = true
			end
		until true
	end
	L8_124 = L28_28
	L8_124 = L8_124.prepped
	L9_125 = _UPVALUE1_
	L9_125 = L9_125()
	L8_124 = L8_124[L9_125]
	if not L8_124 then
		L8_124 = 1
		L9_125 = #L1_117
		L10_126 = 1
		for L11_127 = L8_124, L9_125, L10_126 do
			L12_128 = L1_117[L11_127]
			L12_128 = L12_128.specialState
			if L12_128 then
				L2_118 = true
				L12_128 = L1_117[L11_127]
				L12_128.specialState = nil
			end
		end
		L8_124 = L28_28
		L8_124 = L8_124.prepped
		L9_125 = _UPVALUE1_
		L9_125 = L9_125()
		L8_124[L9_125] = true
	end
	if L2_118 then
		L8_124 = _UPVALUE4_
		L9_125 = L1_117
		L8_124(L9_125)
	end
	if A0_116 then
		L8_124 = A0_116
		L9_125 = L1_117
		L8_124(L9_125)
	end
	return L1_117
end
function L28_28.endStaleMatches()
	local L1_130, L10_139 = _ENV.matches, L10_139
	L1_130 = L1_130()
	L2_131 = 1
	L3_132 = #L1_130
	L4_133 = 1
	for L5_134 = L2_131, L3_132, L4_133 do
		L10_139 = L1_130[L5_134]
		if L10_139.updateTime and L10_139.updateTime + L25_25 < L4_4.current() then
			if _ENV.myTurn(L10_139) then
				L10_139.winner = _ENV.opponent(L10_139).id
				if not L10_139.pot then
				end
				;({}).text, ({}).direction = string.format("You have forfeited your match with %s!", _ENV.opponent(L10_139).alias, 0), "down"
				

-- [End of decompiled block; see disassembly for inner stripped closures]
