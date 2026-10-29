-- Decompiled & AI-Repaired from currentBattle.lu
-- Source disassembly preserved at: disasm/currentBattle.disasm

local L3_3 = L3_3
L3_3((...), package.seeall)
L3_3 = require
L3_3 = L3_3("themes")
local L1_1 = L1_1
L1_1("objectTemplates")
local L2_2 = L2_2
L1_1 = {}
L1_1.END_CONTEXT_SURRENDER = 1
L2_2 = nil
local L4_4 = L4_4
local L5_5 = L5_5
require("tankAvatar")
local L6_6 = L6_6
function L6_6()
	local L0_12, L1_13
	L0_12 = ROCKINFO
	L0_12 = L0_12.MINIMUM_ROCK_SIZE
	L0_12 = L0_12 / 0.0625
	L0_12 = L0_12 ^ 2
	L0_12 = 4000 * L0_12
	return L0_12
end
local L7_7 = L7_7
;({}).id = "human"
;({}).isHuman = true
;({}).id = "cpu"
L7_7.playerDetails, ({})[1] = {}, {}
L7_7.playerDetails, ({})[2] = {}, {}
L7_7.smallestRockScale = MULTIPLAYER_MINIMUM_ROCK_SIZE
L7_7.largestRock = MAXIMUM_ROCK_SIZE
L7_7.isSinglePlayer = true
L7_7[1] = seed
L7_7[2] = current_player
SinglePlayerBattle = L7_7
L7_7 = {}
L7_7.__index = SinglePlayerBattle
SinglePlayerBattle_mt = L7_7
L7_7 = SinglePlayerBattle
function L7_7.new(A0_14, A1_15, A2_16)
	local L3_17
	L3_17 = {}
	L3_17.seed = A1_15
	local L4_18 = L4_18
	local L5_19 = L5_19
	L4_18(L5_19, SinglePlayerBattle_mt)
	local L6_20 = L6_20
	return L3_17
end
L7_7 = SinglePlayerBattle
function L7_7.isLocalPlayer(A0_21, A1_22)
	return A1_22.isHuman
end
L7_7 = SinglePlayerBattle
function L7_7.enterScene(A0_23)
	local L1_24, L2_25, L3_26, L4_27
	L1_24 = A0_23.tutorialStage
	if L1_24 == 3 then
		L1_24 = nil
		function L2_25()
			_ENV:destroy()
			local L0_35, L1_36 = L0_35, L1_36
			L0_35, L1_36 = L0_35(L1_36, 0, 0)
			local L2_37 = L2_37
			;({}).id = "firstFight5"
			;({}).x = L0_35
			;({}).y = L1_36 - 40
			;({}).rotation = 0
			local L4_39 = L4_39
			local ({})[1], L5_40 = fireWeaponButton, L5_40
			L4_39.controls = L5_40
			function L5_40(A0_41)
				_ENV:destroy()
				local L2_42 = L2_42
			end
			L4_39.onComplete = L5_40
			L2_37 = L2_37(L4_39)
			_ENV = L2_37
		end
		function L3_26()
			local L0_43, L1_44
			L0_43 = shotPath
			L0_43 = L0_43.hit
			return L0_43
		end
		L4_27 = {}
		L8_31 = 1
		_FOR_ = 1
		for _FORV_8_ = L8_31, _FOR_, _FOR_ do
			if shotPath.circles[_FORV_8_].touch then
				table.insert(L4_27, shotPath.circles[_FORV_8_].touch)
			end
		end
		L8_31 = tutorial
		L8_31 = L8_31.new
		L9_32 = {}
		L9_32.id = "firstFight4"
		L10_33 = x
		L9_32.x = L10_33
		L10_33 = y
		L9_32.y = L10_33
		L9_32.rotation = 0
		L9_32.controls = L4_27
		L9_32.onComplete = L2_25
		L9_32.isComplete = L3_26
		L8_31 = L8_31(L9_32)
		L1_24 = L8_31
		L8_31 = shotPath
		function L9_32(A0_45, A1_46, A2_47, A3_48)
			if not A0_45.lastTest or A0_45.lastTest.vel ~= A1_46 or A0_45.lastTest.ang ~= A2_47 or not A0_45.hit then
				({}).vel = A1_46
				;({}).ang = A2_47
				A0_45.lastTest, ({}).hit = {}, false
				local L4_49, L5_50 = L4_49, L5_50
				L4_49, L5_50 = L4_49(L5_50, A3_48.x, A3_48.y)
				local L6_51, L7_52 = L6_51, L7_52
				L6_51, L7_52 = L6_51(L7_52, _ENV.players[2].x, _ENV.players[2].y)
				if L4_49 < L6_51 then
					local L8_53 = L8_53
					local L11_56 = L11_56
					local L12_57 = math.pow(L5_50 - L7_52, 2)
					L11_56 = L11_56 + L12_57
					L8_53 = L8_53(L11_56)
					if L8_53 < 15 then
						A0_45.hit = true
					end
				end
			end
		end
		L8_31.testFunction = L9_32
	end
end
L7_7 = SinglePlayerBattle
function L7_7.beginTurn(A0_58)
	local L1_59
	if true then
		L1_59 = A0_58
		if not L1_59.turn then
		end
		L1_59.turn = 0 + 1
		openArmoryButton.onTouch = nil
		if A0_58.current_player == 1 then
			if not tutorial.isFirstFightTutorialsComplete() then
				A0_58.players[1].weaponType = weaponTypes.TRACER
				Weapon.loadWeapon(A0_58.players[1].weaponType)
				BattleControls:updateWeapon()
				local L2_60, L3_61 = L2_60, L3_61
				L2_60, L3_61 = L2_60(L3_61, 0, -40)
				A0_58.tutorialInitiated = true
				;({}).id = "firstFight0"
				;({}).x = L2_60
				;({}).y = L3_61
				;({}).rotation = 0
				;({}).controls, ({})[1] = {}, screenGroup
				;({}).onComplete = function(A0_71)
					_ENV:destroy()
					local L1_72, L2_73 = L1_72, L2_73
					local L3_74 = L3_74
					local L1_72, L2_73, L4_75 = L1_72(L2_73, L3_74, -40)
					L3_74 = nil
					function L4_75()
						_ENV.tutorialStage = 3
						L3_74:destroy()
						local L0_80, L1_81 = L0_80, L1_81
					end
					local L5_76 = L5_76
					;({}).id = "firstFight1"
					;({}).x = L1_72
					;({}).y = L2_73
					;({}).rotation = 0
					local L7_78 = L7_78
					local ({})[1], L8_79 = openArmoryButton, L8_79
					L7_78.controls = L8_79
					L7_78.onComplete = L4_75
					L5_76 = L5_76(L7_78)
					L3_74 = L5_76
				end
			end
			else
				L2_60 = A0_58.players
				L2_60 = L2_60[1]
				L2_60 = L2_60.weaponType
				L3_61 = A0_58.players
				L3_61 = L3_61[1]
				L3_61.weaponType = settings:get("defaultWeapon", weaponTypes.BABY_MISSILE)
				L3_61 = false
				local L4_62 = _ENV.getAvailableWeapons()
				_FOR_ = 1
				for _FORV_8_ = _FOR_, _FOR_, _FOR_ do
					if L4_62[_FORV_8_] == player.weaponType and Weapon.tankCanUseWeapon(L4_62[_FORV_8_], player.tankType) then
						L3_61 = true
						break
					end
				end
				if not L3_61 then
					player.weaponType = weaponTypes.BABY_MISSILE
				end
				if not activeCountry.wheelOfFortune and not CUSTOM_OVERRIDES.WHEEL_OF_FORTUNE and L1_59.turn == 1 and not CUSTOM_OVERRIDES.OVERRIDE_UNLOCK then
					_FOR_ = 1
					for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
						if weaponTypes[_FORV_9_].tutorial and not tutorial.isTutorialComplete(weaponTypes[_FORV_9_].tutorial.id) and weaponTypes[_FORV_9_].unlockable and weaponTypes[_FORV_9_].unlockable.unlockState and tombstone:weaponIsUnused(_FORV_9_) then
							function showTutorial()
								local L0_82 = L0_82
								L0_82 = L0_82(weaponTypes[_ENV].tutorial)
								function L0_82.onComplete(A0_87)
									A0_87:complete()
								end
								tutorial.new(L0_82)
								A0_58.players[1].weaponType = _ENV
								settings:set("defaultWeapon", _ENV)
								local L4_86 = L4_86
								L4_86 = weaponTypes
								L4_86 = L4_86[_ENV]
								L4_86 = L4_86.inventory
								if L4_86 then
									L4_86 = weaponTypes
									L4_86 = L4_86[_ENV]
									L4_86 = L4_86.inventory
									L4_86 = L4_86.getQuantity
									L4_86 = L4_86(L4_86)
									if L4_86 == 0 then
										L4_86 = weaponTypes
										L4_86 = L4_86[_ENV]
										L4_86 = L4_86.inventory
										L4_86 = L4_86.add
										local L2_84 = L2_84
										L4_86(L2_84, 1)
										local L3_85 = L3_85
									end
								end
							end
							openArmoryButton.onTouch = showTutorial
							showTutorial()
							break
						end
					end
					if not true and BATTLES_THIS_SESSION >= 3 and not settings:get("missionsSeen", false) and not tutorial.isTutorialComplete("missions") then
						local L7_65, L8_66 = L7_65, L8_66
						;({}).x, ({}).id = BattleControls.missionsButton:localToContent(0, 0)
						;({}).y = BattleControls.missionsButton:localToContent(0, 0) - 40
						;({}).rotation = 0
						local L11_69 = L11_69
						local ({}).controls, ({})[1], L12_70 = {}, L8_66, L12_70
					end
				end
				L7_65 = A0_58.players
				L7_65 = L7_65[1]
				L7_65 = L7_65.weaponType
				if L2_60 ~= L7_65 then
					L7_65 = Weapon
					L7_65 = L7_65.loadWeapon
					L8_66 = A0_58.players
					L8_66 = L8_66[1]
					L8_66 = L8_66.weaponType
					L7_65(L8_66)
				end
				L7_65 = BattleControls
				L8_66 = L7_65
				L7_65 = L7_65.updateWeapon
				L7_65(L8_66)
			end
		end
end
L7_7 = SinglePlayerBattle
function L7_7.beginBattle(A0_88)
	if tutorial.isFirstFightTutorialsComplete() then
		local L4_92 = L4_92
		local L5_93 = L5_93
		local L6_94 = L6_94
		local L7_95 = L7_95
		local L8_96 = L8_96
		L7_95[1] = L8_96
		L7_95[2] = battlefieldFlair.AirFlairTypes.JET
		L7_95[3] = battlefieldFlair.AirFlairTypes.ZEPPELIN
		L7_95[4] = battlefieldFlair.AirFlairTypes.ZEPPELIN
		local L7_95[5], L9_97 = battlefieldFlair.AirFlairTypes.HOT_AIR_BALLOON, L9_97
		L6_94.AIR_TRAFFIC_TYPES = L7_95
		L6_94.MIN_SIMULTANEOUS_AIR_TRAFFIC = 0
		L6_94.MAX_SIMULTANEOUS_AIR_TRAFFIC = 2
		L4_92(L5_93, L6_94)
	end
	L5_93 = A0_88
	L4_92 = A0_88.resetWarbuxSpent
	L4_92(L5_93)
	A0_88.current_player = 1
	L4_92 = ai_init
	L5_93 = A0_88.level
	L6_94 = players
	L6_94 = L6_94[2]
	L4_92(L5_93, L6_94)
	L4_92 = A0_88.players
	L4_92 = L4_92[1]
	A0_88.humanPlayer = L4_92
	L4_92 = Weapon
	L4_92 = L4_92.loadWeapon
	L5_93 = A0_88.players
	L5_93 = L5_93[1]
	L5_93 = L5_93.weaponType
	L4_92(L5_93)
	L4_92 = Weapon
	L4_92 = L4_92.loadWeapon
	L5_93 = A0_88.players
	L5_93 = L5_93[2]
	L5_93 = L5_93.weaponType
	L4_92(L5_93)
	L4_92 = ALLOW_WIND
	L4_92 = L4_92.SINGLEPLAYER
	if L4_92 then
		L4_92 = CUSTOM_OVERRIDES
		L4_92 = L4_92.SP_WINDVALUE
		if not L4_92 then
			L4_92 = math
			L4_92 = L4_92.random
			L5_93 = -100
			L6_94 = 100
			L4_92 = L4_92(L5_93, L6_94)
			L4_92 = L4_92 / 10
		end
		L5_93 = _ENV
		L5_93 = L5_93.match
		L5_93.wind = L4_92
		break -- pseudo-goto
	end
	repeat
		L4_92 = _ENV
		L4_92 = L4_92.match
		L4_92.wind = 0
	until true
	L4_92 = physics
	L4_92 = L4_92.start
	L4_92()
end
L7_7 = SinglePlayerBattle
function L7_7.endTurn(A0_98)
	if not tutorial.isFirstFightTutorialsComplete() then
		tutorial.setFirstFightTutorialsComplete()
	end
	if not (#A0_98.players <= 1) then
		local L1_99 = _ENV.isGameOver()
		if not L1_99 then
			goto lbl_19
		end
	end
	do return end
	::lbl_19::
	L1_99 = ARCADE_MODE
	if not L1_99 then
		L1_99 = A0_98.current_player
		L1_99 = L1_99 + 1
		A0_98.current_player = L1_99
		L1_99 = A0_98.current_player
		if L1_99 == 0 then
			A0_98.current_player = 1
		else
			L1_99 = A0_98.current_player
			if L1_99 > #A0_98.players then
				A0_98.current_player = 1
			end
		end
		L1_99 = A0_98.players
		L1_99 = L1_99[A0_98.current_player]
		BattleControls:setPlayer(L1_99)
		centerViewPort(L1_99, true)
		local L4_102 = L4_102
		L4_102 = L1_99.isHuman
		if L4_102 then
			L4_102 = _ENV
			L4_102 = L4_102.beginTurn
			L4_102()
			L4_102 = ai_player_turn
			L4_102(players[2].AI)
		else
			L4_102 = weaponTypes
			L4_102 = L4_102.BABY_NUKE
			L1_99.weaponType = L4_102
			L4_102 = timer
			L4_102 = L4_102.performWithDelay
			L4_102 = L4_102(1000, function(A0_103)
				ai_turn(players[2].AI)
				local L2_104 = L2_104
			end)
			L4_4 = L4_102
		end
		L4_102 = fixTankRotation
		L4_102(L1_99)
		local L3_101 = L3_101
		L1_99.firedThisTurn = false
	end
end
function L7_7(A0_105, A1_106, A2_107, A3_108)
	local L6_111, L7_112 = math.randomseed, L7_112
	L7_112 = _ENV
	L7_112 = L7_112.seed
	L6_111(L7_112)
	L6_111 = nil
	L7_112 = nil
	if not A3_108 and not tutorial.isFirstFightTutorialsComplete() then
		L6_111 = 1300
		L7_112 = 100
	else
		L6_111 = math.random(1300, 1500)
		L7_112 = math.random(225, math.min(2048 - L6_111, 400))
		local L8_113 = L8_113
		if not MINIMUM_PLATEAUS then
		end
		if not MAXIMUM_PLATEAUS then
		end
	end
	local L12_117 = L12_117
	local L13_118 = L13_118
	local L14_119 = L14_119
	local L15_120 = L15_120
	local L16_121 = L16_121
	local L17_122 = L17_122
	local L18_123 = L18_123
	local L19_124 = L19_124
	L13_118 = L13_118(L14_119, L15_120, L16_121, L17_122, L18_123, L19_124, L8_113, L12_117, _ENV.largestRock, _ENV.smallestRockScale, L1_1.getTheme())
	L15_120 = L13_118
	L14_119 = L13_118.build
	L16_121 = true
	L14_119(L15_120, L16_121)
	L15_120 = L13_118
	L14_119 = L13_118.createPlayers
	L16_121 = _ENV
	L16_121 = L16_121.playerDetails
	L14_119 = L14_119(L15_120, L16_121)
	if not A3_108 then
		L16_121 = L13_118
		L15_120 = L13_118.createFlair
		L15_120(L16_121)
	end
	L16_121 = L13_118
	L15_120 = L13_118.finishCreation
	L15_120(L16_121)
	L15_120 = L13_118
	L16_121 = L14_119
	return L15_120, L16_121
end
function SinglePlayerBattle.getLevel(A0_125, A1_126, A2_127, A3_128)
	local L4_129, L5_130
	L4_129 = _ENV
	L4_129 = L4_129.level
	if L4_129 then
		return
	end
	L4_129 = _ENV
	L5_130 = _ENV
	local L6_131 = L6_131
	local L7_132 = L7_132
	local L8_133 = L8_133
	local L9_134 = L9_134
	local L6_131, L7_132, L10_135 = L6_131(L7_132, L8_133, L9_134, false)
	L5_130.players = L7_132
	L4_129.level = L6_131
	L4_129 = tutorial
	L4_129 = L4_129.isFirstFightTutorialsComplete
	if not L4_129 then
		L4_129 = _ENV
		L4_129 = L4_129.players
		L4_129 = L4_129[1]
		L5_130 = weaponTypes
		L5_130 = L5_130.TRACER
		L4_129.weaponType = L5_130
	end
end
function SinglePlayerBattle.endCurrentBattle(A0_136, A1_137, A2_138)
	if not tutorial.isFirstFightTutorialsComplete() then
		tutorial.setFirstFightTutorialsComplete()
	end
	if _ENV then
		timer.cancel(_ENV)
	end
	_ENV = nil
	ai_destroy(players[2])
	ai_destroyLocals()
	missions:dismissAlertMsg()
	local L3_139 = L3_139
	L3_139 = A0_136.humanPlayer
	activeCampaign.totalShots = activeCampaign.totalShots + L3_139.shots
	activeCampaign.totalHits = activeCampaign.totalHits + L3_139.hits
	tombstone:addToStat("totalShots", L3_139.shots)
	tombstone:addToStat("totalHits", L3_139.hits)
	if L3_139.weaponShots then
		_FOR_, _FOR_, _FOR_ = pairs(L3_139.weaponShots)
		for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
			_FORV_7_ = "weaponType_" .. tostring(_FORV_7_)
			if not activeCampaign.totalWeaponShots[_FORV_7_] then
				activeCampaign.totalWeaponShots[_FORV_7_] = 0
			end
			activeCampaign.totalWeaponShots[_FORV_7_] = activeCampaign.totalWeaponShots[_FORV_7_] + _FORV_8_
			tombstone:addToStat("weaponShots." .. _FORV_7_, _FORV_8_)
		end
	end
	if L3_139.weaponHits then
		L4_140, L5_141, _FOR_ = L4_140(L3_139.weaponHits)
		for _FORV_7_, _FORV_8_ in L4_140, L5_141, _FOR_ do
			_FORV_7_ = "weaponType_" .. tostring(_FORV_7_)
			if not activeCampaign.totalWeaponHits[_FORV_7_] then
				activeCampaign.totalWeaponHits[_FORV_7_] = 0
			end
			activeCampaign.totalWeaponHits[_FORV_7_] = activeCampaign.totalWeaponHits[_FORV_7_] + _FORV_8_
			tombstone:addToStat("weaponHits." .. _FORV_7_, _FORV_8_)
		end
	end
	L4_140 = activeCountry
	L4_140.underAttackDate = nil
	L4_140 = nil
	L5_141 = nil
	if A1_137.isHuman then
		tombstone:addToStat("wins", 1)
		tombstone:setStat("currentLoseStreak", 0)
		if tombstone:addToStat("currentWinStreak", 1) > tombstone:getStat("longestWinStreak", 0) then
			tombstone:setStat("longestWinStreak", (tombstone:addToStat("currentWinStreak", 1)))
		end
		tombstone:addToStat("amountWon", L1_1.getPot())
		tombstone:addToStat("amountSpent", L1_1.getWarbuxSpent())
		activeCountry.owned = true
		activeCountry.won = true
		if activeCountry.wins then
			activeCountry.wins = activeCountry.wins + 1
		else
			activeCountry.wins = 1
		end
		activeCampaign.wins = activeCampaign.wins + 1
		activeCountry.winDate = os.time()
		if A1_137.health / A1_137.maxHealth * 100 <= 5 then
			achievementList.unlockAchievement(achievementList.miscAchievements.PURPLE_HEART)
		end
		_FOR_, _FOR_, _FOR_ = pairs(activeCampaign.countries)
		for _FORV_14_, _FORV_15_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_15_.owned and _FORV_15_.losses ~= nil and 0 < _FORV_15_.losses then
			end
		end
		if 0 + 1 >= 5 then
			achievementList.unlockAchievement(achievementList.miscAchievements.VIVA_LA_REVOLUTION)
		end
		L4_140 = p1Avatar
		L5_141 = p2Avatar
		utils.logEvent("BattleWon")
		;({}).isMultiplayer = false
		;({}).amountWon = L1_1.getPot()
		;({}).amountSpent = L1_1.getWarbuxSpent()
		utils.logEventMoneyPot({})
		local L13_149 = L13_149
		missions:addToStat("winStreak", 1)
		local L14_150 = L14_150
		dailies.setPredictNewAttacks(true)
		if activeCountry.factoryType then
			activeCountry.factoryStartDate = os.time()
			if weaponTypes[activeCountry.factoryType].unlockable then
				require("achievementList").unlockWeapon(activeCountry.factoryType)
			end
		end
		saveCampaignStates()
		break -- pseudo-goto
	end
	L13_149 = tombstone
	L14_150 = L13_149
	L13_149 = L13_149.addToStat
	L13_149(L14_150, "losses", 1)
	L13_149 = tombstone
	L14_150 = L13_149
	L13_149 = L13_149.addToStat
	L13_149 = L13_149(L14_150, "currentLoseStreak", 1)
	L14_150 = tombstone
	L14_150 = L14_150.getStat
	L14_150 = L14_150(L14_150, "longestLoseStreak", 0)
	tombstone:setStat("currentWinStreak", 0)
	if L13_149 > L14_150 then
		tombstone:setStat("longestLoseStreak", L13_149)
	end
	tombstone:addToStat("amountLost", L1_1.getPot())
	tombstone:addToStat("amountSpent", L1_1.getWarbuxSpent())
	L4_140 = p2Avatar
	L5_141 = p1Avatar
	utils.logEvent("BattleLost")
	;({}).isMultiplayer = false
	;({}).amountWon = nil
	;({}).amountSpent = L1_1.getWarbuxSpent()
	utils.logEventMoneyPot({})
	missions:setStat("winStreak", 0)
	missions:resetPostBattleStatsAfterLoss()
	if activeCountry.id == 1 then
		activeCountry.owned = true
	else
		activeCountry.owned = false
	end
	activeCountry.winDate = nil
	activeCountry.moneyStartDate = nil
	activeCountry.moneyAmount = 0
	activeCampaign.losses = activeCampaign.losses + 1
	if getAdjacentCountries(activeCampaign, activeCountry) then
		_FOR_, _FOR_, _FOR_ = pairs((getAdjacentCountries(activeCampaign, activeCountry)))
		for _FORV_13_, _FORV_14_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_14_.owned and _FORV_14_.landType ~= landType.WATER and _FORV_14_.id ~= HOMELAND_COUNTRY_ID then
				local L15_151 = L15_151
				local L16_152 = L16_152
				table.insert({}, _FORV_14_)
			end
			repeat
				L17_153 = #L16_152
				if 0 < L17_153 then
					L17_153 = math
					L17_153 = L17_153.random
					L17_153 = L17_153(1, #L16_152)
					L17_153 = L16_152[L17_153]
					if L17_153.losses then
						L17_153.losses = L17_153.losses + 1
					else
						L17_153.losses = 1
					end
					L17_153.owned = false
					L17_153.lossDate = os.time()
					L17_153.winDate = nil
					L17_153.moneyStartDate = nil
					L17_153.moneyAmount = 0
				end
				L16_152 = saveCampaignStates
				L16_152()
				L16_152 = activeCountry
				L16_152.won = false
			until true
		end
	end
	L13_149 = math
	L13_149 = L13_149.random
	L14_150 = 0
	L15_151 = 1
	L13_149 = L13_149(L14_150, L15_151)
	L13_149 = L13_149 == 0
	function L14_150()
		local L2_156 = timer.performWithDelay
		local L1_155 = L1_155
		L2_156(L1_155, function()
			storyboard.gotoScene("battleOverScene")
			local L1_157 = L1_157
		end)
	end
	done = L14_150
	if A2_138 then
		L14_150 = A2_138.circumstance
		L15_151 = L1_1
		L15_151 = L15_151.END_CONTEXT_SURRENDER
		if L14_150 == L15_151 then
			L14_150 = timer
			L14_150 = L14_150.performWithDelay
			L15_151 = 1
			function L16_152()
				storyboard.gotoScene("battleOverScene")
				local L1_158 = L1_158
			end
			L14_150(L15_151, L16_152)
	end
	elseif L13_149 then
		L14_150 = battleAvatar
		L14_150 = L14_150.voiceQueue
		L15_151 = L5_141
		L16_152 = trashTalk
		L16_152 = L16_152.LOSS
		L17_153 = L16_152
		L16_152 = L16_152.random
		L16_152 = L16_152(L17_153)
		L17_153 = done
		L14_150(L15_151, L16_152, L17_153, true)
	else
		L14_150 = battleAvatar
		L14_150 = L14_150.voiceQueue
		L15_151 = L4_140
		L16_152 = trashTalk
		L16_152 = L16_152.WIN
		L17_153 = L16_152
		L16_152 = L16_152.random
		L16_152 = L16_152(L17_153)
		L17_153 = done
		L14_150(L15_151, L16_152, L17_153, true)
		local L11_147 = L11_147
	end
end
function SinglePlayerBattle.getAvailableWeapons(A0_159)
	if A0_159.availableWeapons then
		L4_163 = A0_159.availableWeapons
		return L4_163
	end
	L4_163 = {}
	A0_159.availableWeapons = L4_163
	L4_163 = pairs
	L5_164 = orderedWeaponTypes
	L4_163, L5_164, _FOR_ = L4_163(L5_164)
	for _FORV_4_, _FORV_5_ in L4_163, L5_164, _FOR_ do
		if type(_FORV_5_) == "number" then
			table.insert(A0_159.availableWeapons, _FORV_5_)
		end
	end
	L4_163 = table
	L4_163 = L4_163.sort
	L5_164 = A0_159.availableWeapons
	L4_163(L5_164)
	L4_163 = A0_159.availableWeapons
	return L4_163
end
function L1_1.createSinglePlayerBattle(A0_168)
	_ENV.isMultiplayer = false
	L4_172 = ROCKINFO
	L4_172.MINIMUM_ROCK_SIZE = MINIMUM_ROCK_SIZE
	L4_172 = _ENV
	L4_172.ROCK_COLLISION_THRESHOLD = L6_6()
	L4_172 = objectTemplates
	L4_172 = L4_172.buildRocksForScale
	L4_172()
	L4_172 = SinglePlayerBattle
	L4_172 = L4_172.new
	if not A0_168.seed then
	end
	L4_172 = L4_172(L2_170, (os.time()))
	L2_2 = L4_172
	L4_172 = L2_2
	L2_170 = A0_168.landType
	L4_172.landType = L2_170
	L4_172 = L2_2
	L2_170 = {}
	L3_171 = WARBUX_AWARDS
	L3_171 = L3_171.INITIAL_POT_AMOUNT
	L2_170.pot = L3_171
	L4_172.match = L2_170
	L4_172 = 1
	L2_170 = L2_2
	L2_170 = L2_170.playerDetails
	L2_170 = #L2_170
	L3_171 = 1
	for _FORV_4_ = L4_172, L2_170, L3_171 do
		if L2_2.playerDetails[_FORV_4_].isHuman then
			L2_2.playerDetails[_FORV_4_].tank, ({}).id = {}, tankAvatar.getPlayerAvatarType()
			break -- pseudo-goto
		end
		local L6_174 = L6_174
		if not pcall(function()
			local L0_180, L1_181
			L0_180 = tankAvatar
			L0_180 = L0_180.getARandomOpponentBasedOnPlayerKills
			L1_181 = _ENV
			local L2_182 = tankAvatar.getPlayerAvatarType()
			return L0_180(L1_181, L2_182)
		end) then
			print("ERROR trying to grab random tank model", pcall(function()
				local L0_183, L1_184
				L0_183 = tankAvatar
				L0_183 = L0_183.getARandomOpponentBasedOnPlayerKills
				L1_184 = _ENV
				local L2_185 = tankAvatar.getPlayerAvatarType()
				return L0_183(L1_184, L2_185)
			end))
		else
			L2_2.playerDetails[_FORV_4_].tank, ({}).id = {}, pcall(function()
				local L0_186, L1_187
				L0_186 = tankAvatar
				L0_186 = L0_186.getARandomOpponentBasedOnPlayerKills
				L1_187 = _ENV
				local L2_188 = tankAvatar.getPlayerAvatarType()
				return L0_186(L1_187, L2_188)
			end)
		end
		if L2_2.playerDetails[_FORV_4_].tank == nil then
			print("ERROR no tank chosen using skill level chances...using any ol' chance for each model")
			local L11_179 = L11_179
			L2_2.playerDetails[_FORV_4_].tank, ({}).id = {}, tankAvatar.randomAvatarType(tankAvatar.getPlayerAvatarType())
		end
		local L9_177 = L9_177
		print("CPU tanktype is ", L2_2.playerDetails[_FORV_4_].tank.id)
		local L10_178 = L10_178
		repeat
		until true
	end
end
local L8_8 = L8_8
local L9_9 = L9_9
local L10_10 = L10_10
L8_8.smallestRockScale = MULTIPLAYER_MINIMUM_ROCK_SIZE
local L8_8.largestRock, L11_11 = MAXIMUM_ROCK_SIZE, L11_11
L8_8[1] = L9_9
L8_8[2] = L10_10
L8_8[3] = L11_11
MultiPlayerBattle = L8_8
L8_8 = {}
L9_9 = MultiPlayerBattle
L8_8.__index = L9_9
MultiPlayerBattle_mt = L8_8
L8_8 = MultiPlayerBattle
function L9_9(A0_189, A1_190)
	local L2_191
	L2_191 = {}
	L2_191.seed = A1_190
	local L3_192 = L3_192
	local L4_193 = L4_193
	L3_192(L4_193, MultiPlayerBattle_mt)
	local L5_194 = L5_194
	return L2_191
end
L8_8.new = L9_9
L8_8 = MultiPlayerBattle
function L9_9(A0_195)
	if A0_195.availableWeapons then
		L4_199 = A0_195.availableWeapons
		return L4_199
	end
	L4_199 = {}
	A0_195.availableWeapons = L4_199
	L4_199 = pairs
	L5_200 = orderedWeaponTypes
	L4_199, L5_200, _FOR_ = L4_199(L5_200)
	for _FORV_4_, _FORV_5_ in L4_199, L5_200, _FOR_ do
		if type(_FORV_5_) == "number" then
			table.insert(A0_195.availableWeapons, _FORV_5_)
		end
	end
	L4_199 = table
	L4_199 = L4_199.sort
	L5_200 = A0_195.availableWeapons
	L4_199(L5_200)
	L4_199 = A0_195.availableWeapons
	return L4_199
end
L8_8.getAvailableWeapons = L9_9
L8_8 = MultiPlayerBattle
function L9_9(A0_204, A1_205)
	local L2_206 = L2_206
	local L2_206, L3_207 = L2_206(A0_204.match), L3_207
	L2_206 = L2_206.id
	L3_207 = A1_205.playerId
	L2_206 = L2_206 == L3_207
	return L2_206
end
L8_8.isLocalPlayer = L9_9
L8_8 = MultiPlayerBattle
function L9_9(A0_208, A1_209, A2_210)
	local L3_211
	if not A1_209 then
		L3_211 = {}
		A1_209 = L3_211
	end
	L3_211 = A1_209.playback
	if not L3_211 then
		L3_211 = false
	end
	local L4_212 = L4_212
	local ({}).match, L6_214 = A0_208.match, L6_214
	L6_214.onAcknowledgement = A2_210
	L6_214.playback = L3_211
	L4_212(L6_214)
end
L8_8.finishMatch = L9_9
L8_8 = MultiPlayerBattle
function L9_9(A0_215, A1_216, A2_217, A3_218)
	repeat
		L11_226 = _ENV.level
		if L11_226 then
			return
		end
		L11_226 = math
		L11_226 = L11_226.randomseed
		L11_226(_ENV.seed)
		L11_226 = A0_215.match
		L11_226 = L11_226.fileName
		if L11_226 then
			L11_226 = Level
			L11_226 = L11_226.loadLevel
			A0_215.players, L11_226 = L11_226(L11_226, A1_216, A2_217, A3_218, A0_215.match.fileName, function()
				repeat
					local L7_236 = _ENV.match
					L7_236 = L7_236.winner
					if L7_236 then
						L7_236 = false
						local L3_232 = L3_232
						if _ENV.match.winner == require("multiplayer.match").self(_ENV.match).id then
							L7_236 = true
						end
						local L4_233, L5_234 = L4_233, L5_234
						;({}).playback = true
						local L6_235 = L6_235
						L6_235(_ENV, {}, function()
							local L4_241 = L4_241
							L4_241 = L4_241("multiplayer.match")
							L4_241 = L4_241.finishMatch
							L4_241(_ENV.match)
							L4_241 = storyboard
							L4_241 = L4_241.gotoScene
							;({}).title = "LOADING DATA"
							;({}).params, ({}).onComplete = {}, function()
								local L0_242 = L0_242
								;({}).challenge = _ENV.match
								;({}).title = "NEXT ROUND"
								;({}).readOnlyMatchType = L2_231
								;({}).readOnlyLabel = L3_232
								local ({}).recordMatchStart, L2_244 = L4_233, L2_244
								L2_244.closable = false
								function L2_244.postOnComplete()
									storyboard.removeScene("multiplayer.multiplayerLoadingScene")
									local L1_245 = L1_245
								end
								L0_242(L2_244)
							end
							L4_241("multiplayer.multiplayerLoadingScene", {})
							L4_241 = storyboard
							L4_241 = L4_241.removeScene
							L4_241("battlefieldScene")
							local L1_238 = L1_238
						end)
						break -- pseudo-goto
					end
					L7_236 = utils
					L7_236 = L7_236.getNotificationSlider
					L3_232 = {}
					L3_232.autoClose = 2000
					L3_232.text = "Your Turn!"
					function L4_233()
						physics.start()
						BattleControls:enable()
						local L1_246 = L1_246
					end
					L3_232.onShow = L4_233
					L7_236(L3_232)
				until true
			end)
			A0_215.level = L11_226
			L11_226 = A0_215.level
			L11_226 = L11_226.theme
			A0_215.theme = L11_226
			L11_226 = 1
			_FOR_ = 1
			for _FORV_7_ = L11_226, _FOR_, _FOR_ do
				_FOR_ = 1
				for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
					if A0_215.playerDetails[_FORV_7_].id == A0_215.players[_FORV_11_].playerId then
						A0_215.players[_FORV_11_].alias = A0_215.playerDetails[_FORV_7_].alias
					end
				end
			end
			break -- pseudo-goto
		end
		L11_226 = L7_7
		L10_225 = A1_216
		L13_228 = A2_217
		local L7_222 = L7_222
		local L11_226, L10_225, L8_223 = L11_226(L10_225, L13_228, L7_222, true)
		A0_215.players = L10_225
		A0_215.level = L11_226
	until true
end
L8_8.getLevel = L9_9
L8_8 = MultiPlayerBattle
function L9_9(A0_247)
	local L1_248 = L1_248
	L1_248 = L1_248(A0_247.match.matchId .. ".json", system.TemporaryDirectory)
	local L2_249 = L2_249
	L2_249 = L2_249(L1_248, "w")
	if not L2_249 then
		local L3_250 = L3_250
		L3_250("writeFileName open error!")
		local L4_251 = L4_251
		L3_250 = nil
		L4_251 = nil
		return L3_250, L4_251
	end
	L3_250 = L2_249
	L4_251 = L1_248
	return L3_250, L4_251
end
L8_8.createTempFile = L9_9
L8_8 = MultiPlayerBattle
function L9_9(A0_252)
	print("self.match.turn", A0_252.match.turn)
	local L3_254 = L3_254
	L3_254 = A0_252.match
	L3_254 = L3_254.turn
	if not L3_254 then
		L3_254 = 0
	end
	L3_254 = L3_254 % 2
	if L3_254 == 0 then
		A0_252.current_player = 1
	else
		A0_252.current_player = 2
	end
	L3_254 = A0_252.getWarbuxSpent
	L3_254 = L3_254(A0_252)
	if not L3_254 then
		L3_254 = A0_252.resetWarbuxSpent
		L3_254(A0_252)
	end
end
L8_8.beginBattle = L9_9
L8_8 = MultiPlayerBattle
function L9_9(A0_255, A1_256)
	local L2_257, L3_258
	L2_257 = A0_255.match
	L2_257 = L2_257.parameters
	L3_258 = A0_255.match
	L3_258 = L3_258.parameters
	L3_258 = L3_258.warbuxSpent
	L3_258 = L3_258 + A1_256
	L2_257.warbuxSpent = L3_258
end
L8_8.addToWarbuxSpent = L9_9
L8_8 = MultiPlayerBattle
function L9_9(A0_259)
	local L1_260
	L1_260 = A0_259.match
	L1_260 = L1_260.parameters
	L1_260 = L1_260.warbuxSpent
	return L1_260
end
L8_8.getWarbuxSpent = L9_9
L8_8 = MultiPlayerBattle
function L9_9(A0_261)
	local L1_262
	L1_262 = A0_261.match
	L1_262 = L1_262.parameters
	L1_262.warbuxSpent = 0
end
L8_8.resetWarbuxSpent = L9_9
L8_8 = MultiPlayerBattle
function L9_9(A0_263)
	local L1_264
	L1_264 = A0_263.file
	local L4_267 = A0_263.currentChangeBatch
	if not L4_267 then
		L4_267 = A0_263.level
		L5_268 = L4_267
		L4_267 = L4_267.trackChanges
		L4_267 = L4_267(L5_268)
		A0_263.currentChangeBatch = L4_267
		L4_267 = A0_263.currentChangeBatch
		function L5_268()
			io.close(_ENV)
			_ENV = nil
			physics.pause()
			local L0_275 = require("currentBattle").getActivePlayer()
			local L1_276 = L1_276
			L1_276 = L1_276(A0_263.match)
			L1_276.weaponType = L0_275.weaponType
			L1_276.shieldsUsedState = L0_275.shieldsUsedState
			tombstone:addToStat("totalShots", L0_275.shots)
			tombstone:addToStat("totalHits", L0_275.hits)
			if L0_275.weaponShots then
				_FOR_, _FOR_, _FOR_ = pairs(L0_275.weaponShots)
				for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
					_FORV_5_ = "weaponType_" .. tostring(_FORV_5_)
					tombstone:addToStat("weaponShots." .. _FORV_5_, _FORV_6_)
				end
			end
			if L0_275.weaponHits then
				_FOR_, _FOR_, _FOR_ = pairs(L0_275.weaponHits)
				for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
					_FORV_5_ = "weaponType_" .. tostring(_FORV_5_)
					tombstone:addToStat("weaponHits." .. _FORV_5_, _FORV_6_)
				end
			end
			L9_284 = tombstone
			L10_285 = L9_284
			L9_284 = L9_284.save
			L9_284(L10_285)
			L9_284 = A0_263
			L9_284 = L9_284.match
			L9_284 = L9_284.winner
			if L9_284 then
				L9_284 = false
				L10_285 = nil
				if A0_263.match.winner == require("multiplayer.match").self(A0_263.match).id then
					L9_284 = true
					L10_285 = "Opponent's Choice"
				end
				local L6_281, L7_282 = L6_281, L7_282
				;({}).playback = false
				local L8_283 = L8_283
				L8_283(A0_263, {}, function()
					local L4_290 = storyboard.gotoScene
					;({}).title = "LOADING DATA"
					;({}).params, ({}).onComplete = {}, function()
						local L0_291 = L0_291
						L0_291 = L0_291(_ENV.match)
						local L1_292 = L1_292
						;({}).challenge = _ENV.match
						;({}).title = "NEXT ROUND"
						;({}).readOnlyMatchType = L4_279
						;({}).readOnlyLabel = L5_280
						local ({}).recordMatchStart, L3_294 = L6_281, L3_294
						L3_294.closable = false
						function L3_294.onComplete(A0_295)
							if not _ENV.tank then
							end
							_ENV.tank = {}
							_ENV.tank.id = A0_295
							require("multiplayer.match").transmitTurn(_ENV)
							local L1_296 = L1_296
							L1_296("multiplayer.multiplayerSelectScene")
							local L2_297 = L2_297
						end
						function L3_294.postOnComplete()
							storyboard.removeScene("multiplayer.multiplayerLoadingScene")
							local L1_298 = L1_298
						end
						L1_292(L3_294)
					end
					L4_290("multiplayer.multiplayerLoadingScene", {})
					L4_290 = storyboard
					L4_290 = L4_290.removeScene
					L4_290("battlefieldScene")
					local L1_287 = L1_287
				end)
				break -- pseudo-goto
			end
			L9_284 = A0_263
			L9_284 = L9_284.match
			L9_284 = L9_284.delete
			if not L9_284 then
				L9_284 = require
				L10_285 = "multiplayer.match"
				L9_284 = L9_284(L10_285)
				L9_284 = L9_284.transmitTurn
				L10_285 = A0_263
				L9_284(L10_285)
			end
			L9_284 = utils
			L9_284 = L9_284.getNotificationSlider
			L10_285 = {}
			L10_285.autoClose = 4000
			L10_285.text = "Turn Complete!"
			function L6_281()
				sound.stop()
			end
			L10_285.onShow = L6_281
			function L6_281()
				storyboard.gotoScene("multiplayer.multiplayerSelectScene")
				storyboard.removeScene("battlefieldScene")
				local L1_299 = L1_299
			end
			L10_285.onClose = L6_281
			L9_284(L10_285)
			repeat
			until true
			L9_284 = monitor
			if L9_284 then
			end
		end
		L4_267.onComplete = L5_268
		L4_267 = false
		L5_268 = A0_263.currentChangeBatch
		function L6_269(A0_300)
			if _ENV or not L1_264 then
				return
			end
			local L4_304 = L4_304
			L4_304 = L4_304(L1_264, _ENV.encode(A0_300))
			if not L4_304 then
				L4_304 = print
				L4_304("write error!")
				L4_304 = true
				_ENV = L4_304
			end
			L4_304 = L1_264
			L4_304 = L4_304.write
			L4_304(L4_304, "\n")
			L4_304 = L1_264
			L4_304 = L4_304.flush
			L4_304(L4_304)
			local L2_302 = L2_302
		end
		L5_268.onData = L6_269
		L5_268 = A0_263.deferredCommands
		if L5_268 then
			L5_268 = 1
			L6_269 = A0_263.deferredCommands
			L6_269 = #L6_269
			L7_270 = 1
			for _FORV_6_ = L5_268, L6_269, L7_270 do
				local L9_272 = L9_272
				local L10_273 = L10_273
				L10_273(A0_263.currentChangeBatch, A0_263.deferredCommands[_FORV_6_].name, L9_272.data)
				local L11_274 = L11_274
			end
		end
	end
end
L8_8.beginTracking = L9_9
L8_8 = SinglePlayerBattle
function L9_9(A0_305, A1_306, A2_307)
	if A1_306.cost then
		A1_306.cost = nil
	end
end
L8_8.trackObject = L9_9
L8_8 = SinglePlayerBattle
function L9_9(A0_308, A1_309)
	local L2_310, L3_311
	L2_310 = A0_308.match
	L3_311 = A0_308.match
	L3_311 = L3_311.warbuxSpent
	L3_311 = L3_311 + A1_309
	L2_310.warbuxSpent = L3_311
end
L8_8.addToWarbuxSpent = L9_9
L8_8 = SinglePlayerBattle
function L9_9(A0_312)
	local L1_313
	L1_313 = A0_312.match
	L1_313 = L1_313.warbuxSpent
	return L1_313
end
L8_8.getWarbuxSpent = L9_9
L8_8 = SinglePlayerBattle
function L9_9(A0_314)
	local L1_315
	L1_315 = A0_314.match
	L1_315.warbuxSpent = 0
end
L8_8.resetWarbuxSpent = L9_9
function L8_8()
	if _ENV then
		_ENV:resetWarbuxSpent()
		local L1_316 = L1_316
	end
end
L1_1.resetWarbuxSpent = L8_8
function L8_8(A0_317)
	if _ENV then
		local L2_318 = L2_318
		L2_318(_ENV, A0_317)
		local L3_319 = L3_319
	end
end
L1_1.addToWarbuxSpent = L8_8
function L8_8()
	if _ENV then
		do return _ENV:getWarbuxSpent() end
		local L0_320, L1_321 = L0_320, L1_321
	end
	L0_320 = nil
	return L0_320
end
L1_1.getWarbuxSpent = L8_8
function L8_8()
	if _ENV then
		local L0_322 = L0_322
		do return L0_322(_ENV.match.pot) end
		local L1_323 = L1_323
	end
	L0_322 = 0
	return L0_322
end
L1_1.getPot = L8_8
function L8_8()
	local L0_324, L1_325
	L0_324 = 0
	L1_325 = _ENV
	if L1_325 then
		L1_325 = L1_1
		L1_325 = L1_325.isMultiplayer
		if L1_325 then
			L1_325 = ALLOW_WIND
			L1_325 = L1_325.MULTIPLAYER
			if L1_325 then
				L1_325 = _ENV
				L1_325 = L1_325.match
				L1_325 = L1_325.parameters
				L1_325 = L1_325.windVal
				if not L1_325 then
					L1_325 = _ENV
					L1_325 = L1_325.match
					L1_325 = L1_325.parameters
					L1_325 = L1_325.prevMatch
				end
				if L1_325 then
					L1_325 = _ENV
					L1_325 = L1_325.match
					L1_325 = L1_325.parameters
					L1_325 = L1_325.prevMatch
					if L1_325 then
						L1_325 = _ENV
						L1_325 = L1_325.match
						L1_325 = L1_325.parameters
						L1_325 = L1_325.prevMatch
						L1_325 = L1_325.windVal
						if L1_325 then
							L1_325 = _ENV
							L1_325 = L1_325.match
							L1_325 = L1_325.parameters
							L1_325 = L1_325.prevMatch
							L0_324 = L1_325.windVal
						end
					else
						L1_325 = _ENV
						L1_325 = L1_325.match
						L1_325 = L1_325.parameters
						L1_325 = L1_325.windVal
						if L1_325 then
							L1_325 = _ENV
							L1_325 = L1_325.match
							L1_325 = L1_325.parameters
							L0_324 = L1_325.windVal
						end
					end
				end
			end
		else
			L1_325 = ALLOW_WIND
			L1_325 = L1_325.SINGLEPLAYER
			if L1_325 then
				L1_325 = _ENV
				L1_325 = L1_325.match
				L1_325 = L1_325.wind
				if L1_325 then
					L1_325 = _ENV
					L1_325 = L1_325.match
					L0_324 = L1_325.wind
				end
			end
		end
	end
	return L0_324
end
L1_1.getWind = L8_8
function L8_8(A0_326, A1_327)
	local L2_328 = L2_328
	local L2_328, L3_329 = L2_328(A1_327), L3_329
	L3_329 = _ENV
	if L3_329 and A0_326 then
		L3_329 = _ENV
		if L3_329 then
			L3_329 = _ENV
			L3_329 = L3_329.match
			L3_329 = L3_329.pot
			if L3_329 then
				A0_326 = A0_326 * L2_328
				L3_329 = _ENV
				L3_329 = L3_329.match
				L3_329.pot = _ENV.match.pot + A0_326
				L3_329 = updatePotMoney
				local L4_330 = L1_1.getPot()
				L3_329(L4_330)
			end
		end
	end
	L3_329 = L2_328
	L4_330 = A0_326
	return L3_329, L4_330
end
L1_1.addToPot = L8_8
function L8_8()
	local L0_331, L1_332
	L0_331 = _ENV
	L0_331 = L0_331.match
	return L0_331
end
L1_1.getMatch = L8_8
L8_8 = MultiPlayerBattle
function L9_9(A0_333, A1_334, A2_335)
	if not A0_333.currentChangeBatch then
		A0_333:beginTracking()
	else
		local L3_336, L4_337 = L3_336, L4_337
		local L5_338 = L5_338
		if not A2_335 then
		end
		L3_336(L4_337, L5_338, false)
		local L6_339 = L6_339
	end
	L3_336 = A1_334.cost
	if L3_336 then
		A1_334.cost = nil
	end
end
L8_8.trackObject = L9_9
L8_8 = MultiPlayerBattle
function L9_9(A0_340, A1_341, A2_342)
	if not A0_340.currentChangeBatch then
		if not A0_340.deferredCommands then
			A0_340.deferredCommands = {}
		end
		;({}).name = "talk"
		;({}).pid = A1_341.playerId
		;({}).data, ({}).tx = {}, A2_342
		table.insert(A0_340.deferredCommands, {})
	else
		local L3_343, L4_344 = L3_343, L4_344
		local L5_345 = L5_345
		local ({}).pid, L7_347 = A1_341.playerId, L7_347
		L7_347.tx = A2_342
		L3_343(L4_344, L5_345, L7_347)
	end
end
L8_8.trackText = L9_9
L8_8 = MultiPlayerBattle
function L9_9(A0_348)
	local L1_349
	L1_349 = A0_348.players
	L1_349 = L1_349[A0_348.current_player]
	local L2_350 = L2_350
	L2_350 = L2_350(A0_348.match)
	if L2_350.weaponType ~= nil then
		if A0_348.match.parameters.availableWeapons then
			_FOR_ = 1
			local L7_355 = L7_355
			for _FORV_8_ = _FOR_, _FOR_, _FOR_ do
				if L7_355[_FORV_8_] == L2_350.weaponType then
					L1_349.weaponType = L2_350.weaponType
					break
				end
			end
		end
		if not weaponFound then
			_FOR_ = 1
			for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
				if L7_355[_FORV_7_] == L1_349.weaponType then
					weaponFound = true
					break
				end
			end
		end
		if not weaponFound or not Weapon.tankCanUseWeapon(L1_349.weaponType, L1_349.tankType) then
			L1_349.weaponType = weaponTypes.BABY_MISSILE
		end
	end
	L7_355 = BattleControls
	L7_355 = L7_355.setPlayer
	L7_355(L7_355, L1_349)
	L7_355 = BattleControls
	L7_355 = L7_355.updateWeapon
	L7_355(L7_355)
	L7_355 = A0_348.createTempFile
	local L7_355, L4_352 = L7_355(A0_348)
	A0_348.turnDataLocation = L4_352
	A0_348.file = L7_355
	if L7_355 == nil or L4_352 == nil then
	end
	if not A0_348.match.fileName then
		physics.start()
	else
		BattleControls:disable()
		local L6_354 = require("multiplayer.match")
		L6_354 = L6_354.selfId
		L6_354 = L6_354()
		if A0_348.match.player1.id == L6_354 then
		else
		end
		if A0_348.match.player1.alias == nil then
		end
		if ("OPPONENT"):len() > 15 then
		end
		local L8_356 = L8_356
		;({}).title = (("OPPONENT"):sub(1, 15) .. "...") .. "'S TURN"
		;({}).showImmediately = true
		;({}).closeImmediately = false
		;({}).closeable = false
		;({}).height = 250
		local L9_357 = L9_357
		;({}).buttonText = "WATCH"
		;({}).buttonTextSize = 50
		;({}).width = 200
		;({}).height = 60
		;({}).onComplete = function()
			sound.playSound(sound.globalSounds.button)
			local L1_362 = L1_362
			L1_362 = _ENV
			L1_362 = L1_362.close
			L1_362(function()
				local L2_365 = timer.performWithDelay
				L2_365(2000, function()
					_ENV.level.resumePlayback()
				end)
			end)
		end
		utils.getDrawnDialogBox({}):insert((utils.getBasicButton({})))
		local L12_360 = L12_360
		utils.getBasicButton({}).x, utils.getBasicButton({}).y = 0, 50
		storyboard.removeScene("multiplayer.multiplayerLoadingScene")
		physics.pause()
	end
end
L8_8.beginTurn = L9_9
L8_8 = MultiPlayerBattle


-- [End of decompiled block; see disassembly for inner stripped closures]
