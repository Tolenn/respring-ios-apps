-- Decompiled & AI-Repaired from multiplayer.multiplayerSelectScene.lu
-- Source disassembly preserved at: disasm/multiplayer.multiplayerSelectScene.disasm

local L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20 = L4_4, "facebookSupport", L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20
L4_4(L5_5)
L4_4 = require
L5_5 = "twitterSupport"
L4_4(L5_5)
L4_4 = require
L5_5 = "multiplayer.match"
L4_4 = L4_4(L5_5)
L5_5 = storyboard
L5_5 = L5_5.newScene
L5_5 = L5_5()
L6_6 = require
L7_7 = "time"
L6_6 = L6_6(L7_7)
L7_7 = nil
L8_8 = nil
L9_9 = 80
L10_10 = {}
L11_11 = 0
L12_12 = 2
L13_13 = nil
L14_14 = nil
L15_15 = {}
L15_15.NOTHING = nil
L15_15.PULL_TO_REFRESH = 1
L15_15.RELEASE_TO_REFRESH = 2
L15_15.REFRESHING = 3
function L16_16(A0_25, A1_26)
	if A1_26 == _ENV.NOTHING then
		if A0_25.refreshLayer then
			display.remove(A0_25.refreshLayer)
			A0_25.refreshLayer = nil
		end
		A0_25.topPadding = 0
		A0_25:scrollToPosition(0, 0)
	else
		if A1_26 == _ENV.PULL_TO_REFRESH then
			if not A0_25.allItemsGroup then
				return
			elseif A0_25.refreshLayer then
				display.remove(A0_25.refreshLayer)
				A0_25.refreshLayer = nil
			end
			A0_25.topPadding = 0
			A0_25.allItemsGroup:insert((display.newGroup()))
			A0_25.refreshLayer = display.newGroup()
			;({}).size = 40
			display.newGroup():insert((utils.getOutlinedText("PULL DOWN TO REFRESH...", {})))
			utils.getOutlinedText("PULL DOWN TO REFRESH...", {}).x = A0_25.content:contentToLocal(screenX + screenWidth / 2, 0)
			utils.getOutlinedText("PULL DOWN TO REFRESH...", {}).y = -utils.getOutlinedText("PULL DOWN TO REFRESH...", {}).contentHeight / 2
			display.newImageRect("res/ui/refreshArrow.png", 45, 45).rotation = 180
			display.newImageRect("res/ui/refreshArrow.png", 45, 45).xScale, display.newImageRect("res/ui/refreshArrow.png", 45, 45).yScale = 0.8, 0.8
			display.newGroup():insert((display.newImageRect("res/ui/refreshArrow.png", 45, 45)))
			local L8_33 = L8_33
			local display.newImageRect("res/ui/refreshArrow.png", 45, 45).x, display.newImageRect("res/ui/refreshArrow.png", 45, 45).y, L7_32 = utils.getOutlinedText("PULL DOWN TO REFRESH...", {}).x - 150, utils.getOutlinedText("PULL DOWN TO REFRESH...", {}).y, L7_32
			A0_25.topPadding = 0
			L8_33.arrow, L8_33.text = display.newImageRect("res/ui/refreshArrow.png", 45, 45), L7_32
			break -- pseudo-goto
		end
		L8_33 = _ENV
		L8_33 = L8_33.RELEASE_TO_REFRESH
		if A1_26 == L8_33 then
			L8_33 = transition
			L8_33 = L8_33.to
			L7_32 = A0_25.refreshLayer
			L7_32 = L7_32.arrow
			;({}).time = 250
			;({}).rotation = 0
			L8_33(L7_32, {})
			L8_33 = A0_25.refreshLayer
			L8_33 = L8_33.text
			if L8_33 then
				L8_33 = A0_25.refreshLayer
				L8_33 = L8_33.text
				L8_33 = L8_33.x
				if L8_33 then
					L8_33 = A0_25.refreshLayer
					L8_33 = L8_33.text
					L8_33 = L8_33.setText
					L7_32 = "RELEASE TO REFRESH..."
					L8_33(L7_32)
				end
			end
			A0_25.topPadding = 35
			break -- pseudo-goto
		end
		L8_33 = _ENV
		L8_33 = L8_33.REFRESHING
		if A1_26 == L8_33 then
			L8_33 = display
			L8_33 = L8_33.remove
			L7_32 = A0_25.refreshLayer
			L7_32 = L7_32.arrow
			L8_33(L7_32)
			L8_33 = A0_25.refreshLayer
			L8_33.arrow = nil
			L8_33 = A0_25.refreshLayer
			L8_33 = L8_33.text
			if L8_33 then
				L8_33 = A0_25.refreshLayer
				L8_33 = L8_33.text
				L8_33 = L8_33.x
				if L8_33 then
					L8_33 = A0_25.refreshLayer
					L8_33 = L8_33.text
					L8_33 = L8_33.setText
					L7_32 = "LOADING..."
					L8_33(L7_32)
				end
			end
			repeat
				A0_25.topPadding = 35
			until true
		end
	end
	A0_25.refreshState = A1_26
end
function L17_17(A0_34)
	local L1_35
	L1_35 = false
	local L6_40 = _ENV
	L6_40 = L6_40 + 1
	_ENV = L6_40
	L6_40 = _ENV
	L6_40 = L6_40 % L12_12
	if L6_40 == L12_12 - 1 then
		L1_35 = true
		L6_40 = utils
		L6_40 = L6_40.logEvent
		L6_40("Forced Refresh - Select Screen")
	end
	L6_40 = storyboard
	L6_40 = L6_40.showOverlay
	local L3_37 = L3_37
	;({}).title = "LOOKING FOR BATTLES"
	;({}).closeable = true
	;({}).params, ({}).onComplete = {}, function()
		if require("multiplayer.dataServer").testConnection() then
			({}).force = L1_35
			_ENV.refreshAll(function(A0_45)
				local L4_49 = storyboard.getCurrentSceneName
				L4_49 = L4_49()
				if L4_49 == "multiplayer.multiplayerSelectScene" then
					L4_49 = _ENV
					L4_49 = L4_49.populateBattles
					L4_49()
					L4_49 = storyboard
					L4_49 = L4_49.getScene
					L4_49 = L4_49("multiplayer.multiplayerLoadingScene")
					if L4_49 and L4_49.isShowing then
						local L2_47 = L2_47
						local L3_48 = L3_48
						L2_47(L3_48, function()
							storyboard.removeScene("multiplayer.multiplayerLoadingScene")
							local L1_50 = L1_50
						end)
					end
				end
			end, {})
		else
			utils.displayNoNetworkConnection()
			local L0_41 = L0_41
			L0_41 = L0_41("multiplayer.multiplayerLoadingScene")
			if L0_41 and L0_41.isShowing then
				timer.performWithDelay(1, function()
					storyboard.removeScene("multiplayer.multiplayerLoadingScene")
					local L1_51 = L1_51
				end)
			end
			if A0_34 then
				local L1_42 = L1_42
				local L2_43 = L2_43
				L1_42(L2_43, L15_15.NOTHING)
				local L3_44 = L3_44
			end
		end
	end
	local L5_39 = L5_39
	L6_40(L3_37, L5_39)
end
function L18_18(A0_52)
	local L1_53
	L1_53 = A0_52.target
	if not L1_53 or L1_53.state == _ENV.REFRESHING then
		return true
	end
	if A0_52.type == "beganScroll" then
	elseif A0_52.type == "endedScroll" then
		L1_53.allItemsGroup.activeRow = nil
	elseif A0_52.type == "movingToTopLimit" then
		if L1_53.refreshState == _ENV.RELEASE_TO_REFRESH then
			L16_16(L1_53, _ENV.REFRESHING)
			utils.logEvent("MP Refresh Button Pushed")
			L1_53:scrollToPosition(0, 40)
			L17_17(L1_53)
		end
	elseif A0_52.type == "movingToBottomLimit" then
	elseif A0_52.type == "movingToLeftLimit" then
	elseif A0_52.type == "movingToRightLimit" then
	else
		local L2_54, L3_55 = L1_53:getContentPosition()
		if L1_53.refreshState == _ENV.NOTHING and 10 < L3_55 then
			L16_16(L1_53, _ENV.PULL_TO_REFRESH)
		elseif L1_53.refreshState == _ENV.PULL_TO_REFRESH and 60 < L3_55 then
			L16_16(L1_53, _ENV.RELEASE_TO_REFRESH)
		elseif L1_53.allItemsGroup.activeRow and not L1_53.allItemsGroup.activeRow.deleteShowing and math.abs(A0_52.x - A0_52.xStart) > 50 and math.abs(A0_52.y - A0_52.yStart) < 15 then
			L1_53.allItemsGroup.activeRow:showDelete()
		else
			local L4_56 = L4_56
			local L6_58 = A0_52.y - A0_52.yStart
			L4_56 = L4_56(L6_58)
			if 15 <= L4_56 then
				L4_56 = L1_53.allItemsGroup
				L4_56.activeRow = nil
			end
		end
	end
end
function L19_19()
	if not _ENV then
		return
	end
	L3_62 = _ENV
	L3_62 = L3_62.refreshLayer
	if L3_62 then
		L3_62 = _ENV
		L3_62 = L3_62.refreshLayer
		L3_62.text = nil
	end
	L3_62 = _ENV
	L3_62.refreshLayer = nil
	L3_62 = _ENV
	L3_62 = L3_62.allItemsGroup
	if L3_62 then
		L3_62 = display
		L3_62 = L3_62.remove
		L4_63 = _ENV
		L4_63 = L4_63.allItemsGroup
		L3_62(L4_63)
	end
	L3_62 = _ENV
	L3_62.allItemsGroup = nil
	L3_62 = pairs
	L4_63 = _ENV
	L4_63 = L4_63.rows
	L3_62, L4_63, _FOR_ = L3_62(L4_63)
	for _FORV_3_, _FORV_4_ in L3_62, L4_63, _FOR_ do
		if _FORV_4_.destroy then
			_FORV_4_:destroy()
		end
		_ENV.rows[_FORV_3_] = nil
	end
	L3_62 = _ENV
	L3_62.rows = nil
	L3_62 = display
	L3_62 = L3_62.remove
	L4_63 = _ENV
	L3_62(L4_63)
	L3_62 = nil
	_ENV = L3_62
end
function L20_20(A0_66)
	local L1_67
	L1_67 = _ENV
	L1_67 = L1_67.view
	local L2_68 = L2_68
	;({}).size = 70
	L2_68 = L2_68(A0_66, {})
	local L3_69, L4_70 = L3_69, L4_70
	L3_69(L4_70, L2_68)
	local L5_71 = L5_71
	function L3_69(A0_74)
		if A0_74.transition then
			transition.cancel(A0_74.transition)
			local L2_75 = L2_75
		end
		A0_74.transition = nil
	end
	function L4_70(A0_76)
		A0_76:killTransition()
		local L1_77, L5_81 = L1_77, L5_81
		L1_77 = 0.25
		L5_81 = A0_76.alpha
		if L5_81 < 0.75 then
			L1_77 = 1
		end
		L5_81 = transition
		L5_81 = L5_81.to
		local L3_79 = L3_79
		;({}).time = 1000
		;({}).alpha = L1_77
		;({}).onComplete = function()
			_ENV:pulse()
			local L1_82 = L1_82
		end
		local L5_81, L4_80 = L5_81(L3_79, {}), L4_80
		A0_76.transition = L5_81
	end
	function L5_71(A0_83)
		A0_83:killTransition()
		A0_83.alpha = 1
	end
	L2_68.killTransition = L3_69
	L2_68.stopPulse = L5_71
	L2_68.pulse = L4_70
	L2_68:pulse()
	local L6_72, L7_73 = L6_72, L7_73
	function L6_72(A0_84)
		A0_84:killTransition()
	end
	L2_68.destroy = L6_72
	return L2_68
end
L10_10.createPulsingText = L20_20
function L10_10.populateBattles()
	local L0_85
	L0_85 = _ENV
	L0_85 = L0_85.view
	if not L0_85 then
		return
	end
	if L8_8 then
		L19_19()
	end
	;({}).width = 740
	;({}).height = 400
	;({}).maskFile = "res/mask740x400.png"
	local L6_91 = L6_91
	L7_92.bgColor, ({})[1] = {}, 255
	L7_92.bgColor, ({})[2] = {}, 255
	L7_92.bgColor, ({})[3] = {}, 255
	local L7_92.bgColor, ({})[4], L7_92 = {}, 0, L7_92
	L7_92.listener = L18_18
	L6_91 = L6_91(L7_92)
	L8_8 = L6_91
	L6_91 = L8_8
	L7_92 = {}
	L6_91.rows = L7_92
	L6_91 = L8_8
	L7_92 = L6_91
	L6_91 = L6_91.setReferencePoint
	L6_91(L7_92, display.TopCenterReferencePoint)
	L7_92 = L0_85
	L6_91 = L0_85.insert
	L6_91(L7_92, L8_8)
	L6_91 = L8_8
	L7_92 = newMatchButton
	L7_92 = L7_92.x
	L6_91.x = L7_92
	L6_91 = L8_8
	L7_92 = newMatchButton
	L7_92 = L7_92.y
	L7_92 = L7_92 + newMatchButton.contentHeight / 2
	L7_92 = L7_92 + 10
	L6_91.y = L7_92
	L6_91 = display
	L6_91 = L6_91.newGroup
	L6_91 = L6_91()
	L7_92 = L6_91.setReferencePoint
	L7_92(L6_91, display.TopCenterReferencePoint)
	L7_92 = L8_8
	L7_92 = L7_92.insert
	L7_92(L7_92, L6_91)
	L7_92 = L8_8
	L7_92 = L7_92.content
	L7_92.horizontalScrollDisabled = true
	L7_92 = L8_8
	L7_92.allItemsGroup = L6_91
	L7_92 = L0_0
	L7_92 = L7_92.randomMatchOutstanding
	L7_92 = L7_92()
	if L7_92 then
		L7_92 = _UPVALUE5_
		local L3_88 = L3_88
		;({}).spriteSet = L13_13
		;({}).spriteData = L14_14
		;({}).imageName = "randomdice.png"
		;({}).opponent, ({}).alias = {}, "Random Opponent"
		;({}).description = "Waiting for match-up."
		;({}).description2 = nil
		;({}).actionImage = nil
		;({}).allowDelete = false
		L7_92 = L7_92(L3_88, {})
		L3_88 = L8_8
		L3_88 = L3_88.rows
		L3_88[L7_92] = L7_92
	end
	L7_92 = nil
	function L3_88()
		local L9_102, L10_103 = L9_102, L10_103
		if _ENV then
			L2_95 = table
			L2_95 = L2_95.sort
			L3_96 = _ENV
			function L4_97(A0_110, A1_111)
				if A0_110.updateTime == nil then
					A0_110.updateTime = _ENV.current()
				end
				if A1_111.updateTime == nil then
					A1_111.updateTime = _ENV.current()
				end
				if (A0_110.accepted or L0_0.opponent(A0_110).id == A0_110.nextPlayer) and not A0_110.specialState and L0_0.myTurn(A0_110) then
					if not A1_111.accepted and L0_0.opponent(A1_111).id ~= A1_111.nextPlayer or A1_111.specialState or not L0_0.myTurn(A1_111) then
						return true
					else
						return A0_110.updateTime > A1_111.updateTime
					end
				else
					if (A1_111.accepted or L0_0.opponent(A1_111).id == A1_111.nextPlayer) and not A1_111.specialState then
						local L2_112 = L2_112
						local L2_112, L3_113 = L2_112(A1_111), L3_113
						if L2_112 then
							goto lbl_93
						end
					end
					L2_112 = A0_110.updateTime
					L3_113 = A1_111.updateTime
					L2_112 = L2_112 > L3_113
					return L2_112
				end
				::lbl_93::
				L2_112 = false
				return L2_112
			end
			L2_95(L3_96, L4_97)
			L2_95 = 1
			L3_96 = _ENV
			L3_96 = #L3_96
			L4_97 = 1
			for L5_98 = L2_95, L3_96, L4_97 do
				L9_102 = _ENV
				L9_102 = L9_102[L5_98]
				L9_102 = L9_102.typeDescription
				if not L9_102 then
					L9_102 = "Broken state!!"
				end
				L10_103 = nil
				if not L0_0.opponent(_ENV[L5_98]).avatar then
					L0_0.opponent(_ENV[L5_98]).unknownAvatar = true
				end
				local L8_101 = L8_101
				if not L8_101.wins then
				end
				if not L0_0.self(_ENV[L5_98]).wins then
				end
				if _ENV[L5_98].winner then
					if L0_0.myTurn(_ENV[L5_98]) then
						if _ENV[L5_98].winner ~= L0_0.self(_ENV[L5_98]).id then
							if _ENV[L5_98].specialState then
							else
							end
						elseif _ENV[L5_98].specialState then
						end
					else
						if _ENV[L5_98].winner ~= L0_0.self(_ENV[L5_98]).id then
							if _ENV[L5_98].specialState then
							else
							end
						else
						end
					end
				end
				if _ENV[L5_98].specialState ~= "Ending..." and (0 <= 0 + 1 - 1 - 1 + 1 or 0 <= 0 + 1) then
				end
				if _ENV[L5_98].accepted or L8_101.id == _ENV[L5_98].nextPlayer then
					if not _ENV[L5_98].specialState and L0_0.myTurn(_ENV[L5_98]) then
						L9_102 = "Your turn!"
						;({}).buttonText = "PLAY"
						;({}).width = 100
						;({}).normalTopColor, ({})[1] = {}, 158
						;({}).normalTopColor, ({})[2] = {}, 226
						;({}).normalTopColor, ({})[3] = {}, 145
						;({}).normalBottomColor, ({})[1] = {}, 76
						;({}).normalBottomColor, ({})[2] = {}, 187
						;({}).normalBottomColor, ({})[3] = {}, 58
						;({}).normalBorderColor, ({})[1] = {}, 48
						;({}).normalBorderColor, ({})[2] = {}, 99
						;({}).normalBorderColor, ({})[3] = {}, 24
						local L15_108 = L15_108
						;({}).normalTextShadowColor, ({})[1] = {}, 48
						;({}).normalTextShadowColor, ({})[2] = {}, 99
						local ({}).normalTextShadowColor, ({})[3], L16_109 = {}, 24, L16_109
						repeat
							({}).onComplete = function()
								local L0_114 = L0_114
								L0_114 = L0_114(_ENV[L5_98])
								if not L0_114 then
									sound.playSound(sound.globalSounds.button)
									_ENV.playTurn(_ENV[L5_98])
								else
									local L1_115 = L1_115
									L1_115 = L1_115("notificationQueue")
									local L2_116 = L2_116
									L2_116(L0_114)
									local L3_117 = L3_117
								end
							end
							L10_103 = utils.getBasicButton({})
							do break end -- pseudo-goto
							L9_102 = "Their Move"
							if _ENV[L5_98].specialState then
								L9_102 = _ENV[L5_98].specialState
							end
							L10_103 = utils.newImageFromSpriteSet(L13_13, L14_14, "waiting.png")
						until true
					end
					if _ENV[L5_98].updateTime then
						if 1 < (L2_2.current() - _ENV[L5_98].updateTime) / 86400 then
						elseif 1 < (tostring(math.floor((L2_2.current() - _ENV[L5_98].updateTime) / 86400)) .. " days") / 3600 then
						else
						end
						L9_102 = L9_102 .. " - " .. tostring(math.floor((tostring(math.floor((tostring(math.floor((L2_2.current() - _ENV[L5_98].updateTime) / 86400)) .. " days") / 3600)) .. " hours") / 60)) .. " mins"
					end
					;({}).spriteSet = L13_13
					;({}).spriteData = L14_14
					;({}).imageName = "challenge.png"
					;({}).opponent = L8_101
					;({}).description2, ({}).description = string.format("Wins: %d  Losses: %d", 0 + 1, 0 + 1 - 1 - 1 + 1), L9_102
					;({}).match = _ENV[L5_98]
					;({}).wounded = 0 + 1 < L16_109
					;({}).actionImage = L10_103
					;({}).allowDelete = true
					L8_8.rows[_UPVALUE5_(L8_8.allItemsGroup, {})] = _UPVALUE5_(L8_8.allItemsGroup, {})
					break -- pseudo-goto
				end
				if not _ENV[L5_98].specialState then
					L9_102 = "New challenge!"
					L10_103 = display.newGroup()
					;({}).buttonText = "RESPOND"
					;({}).width = "100"
					;({}).onComplete = function()
						sound.playSound(sound.globalSounds.button)
						repeat
							if require("multiplayer.dataServer").testConnection() then
								if not _ENV.matchProblems(_ENV[L5_98]) then
									local L4_122 = L4_122
									;({}).challenge = _ENV[L5_98]
									;({}).title = "ACCEPT CHALLENGE"
									;({}).readOnlyMatchType = true
									;({}).recordMatchStart = true
									;({}).allowDecline = true
									;({}).onDecline = _UPVALUE3_
									require("multiplayer.multiplayer_utils").getSetupBattleDialog({})
									break -- pseudo-goto
								end
								local L2_120 = L2_120
								require("notificationQueue").add(L4_122)
								local L3_121 = L3_121
								break -- pseudo-goto
							end
							L4_122 = utils
							L4_122 = L4_122.displayNoNetworkConnection
							L4_122()
						until true
					end
					L10_103:insert((utils.getBasicButton({})))
				else
					L9_102 = _ENV[L5_98].specialState
					L10_103 = utils.newImageFromSpriteSet(L13_13, L14_14, "waiting.png")
				end
				;({}).spriteSet = L13_13
				;({}).spriteData = L14_14
				;({}).imageName = "challenge.png"
				;({}).opponent = L8_101
				;({}).description2, ({}).description = string.format("Wins: %d  Losses: %d", 0 + 1, 0 + 1 - 1 - 1 + 1), L9_102
				local ({}).match, L14_107 = _ENV[L5_98], L14_107
				;({}).actionImage = L10_103
				;({}).allowDelete = true
				repeat
					L8_8.rows[_UPVALUE5_(L8_8.allItemsGroup, {})] = _UPVALUE5_(L8_8.allItemsGroup, {})
				until true
			end
		end
	end
	L0_0.matches(function(A0_123)
		if not A0_123 then
		end
		_ENV = {}
		L3_88()
		if not _ENV or #_ENV == 0 and not L0_0.randomMatchOutstanding() then
			local L1_124 = L1_124
			L1_124 = L1_124(0, 0, 500, 400)
			L1_86:insert(L1_124)
			L1_124.x, L1_124.y = L1_86:contentToLocal(screenX + screenWidth / 2, display.contentHeight / 2)
			L1_124.alpha = 0
			L1_124.isHitTestable = true
			local L2_125 = L2_125
			;({}).size = 60
			L2_125 = L2_125("NO BATTLES FOUND", {})
			L1_86:insert(L2_125)
			local L3_126, L4_127 = L3_126, L4_127
			local L5_128 = L5_128
			local L3_126, L4_127, L6_129 = L3_126(L4_127, L5_128, display.contentHeight / 2)
			L2_125.y = L4_127
			L2_125.x = L3_126
		end
	end)
	newMatchButton:toFront()
	local L4_89, L5_90 = L4_89, L5_90
end
function L5_5.createScene(A0_130, A1_131)
	local L11_141 = spritesheetmanager.getSpriteSet
	L14_14, L11_141 = L11_141(UI_SPRITE_SHEET)
	_ENV = L11_141
	L11_141 = storyboard
	L11_141 = L11_141.getPrevious
	L11_141 = L11_141()
	A0_130.previousScene = L11_141
	L11_141 = A0_130.view
	local L3_133 = L3_133
	;({}).group = L11_141
	;({}).title = "CURRENT BATTLES"
	;({}).showBottomBar = false
	;({}).onClose = _UPVALUE2_
	local L3_133, L4_134 = L3_133({}), L4_134
	L4_134 = settings
	L4_134 = L4_134.get
	L4_134 = L4_134(L4_134, "NEWEST_ENCOUNTERED_VERSION", tonumber(CURRENT_VERSION))
	if L4_134 > tonumber(CURRENT_VERSION) then
		display.newImage("res/ui/upgrade.png", 0, 0, true):setFillColor(LITTLE_GENERALS_BLUE_MED())
		;({}).onComplete = function()
			local L0_142
			L0_142 = system
			L0_142 = L0_142.openURL
			local L1_143 = utils.getExternalStoreLink()
			L0_142(L1_143)
		end
		L3_133:insert((utils.newTwoStateButton(display.newImage("res/ui/upgrade.png", 0, 0, true), display.newImage("res/ui/upgrade.png", 0, 0, true), {})))
		utils.newTwoStateButton(display.newImage("res/ui/upgrade.png", 0, 0, true), display.newImage("res/ui/upgrade.png", 0, 0, true), {}):setReferencePoint(display.TopLeftReferencePoint)
		utils.newTwoStateButton(display.newImage("res/ui/upgrade.png", 0, 0, true), display.newImage("res/ui/upgrade.png", 0, 0, true), {}).x = -screenWidth / 2 + 10
		utils.newTwoStateButton(display.newImage("res/ui/upgrade.png", 0, 0, true), display.newImage("res/ui/upgrade.png", 0, 0, true), {}).y = -display.contentHeight / 2 + 10
		local L9_139 = L9_139
		utils.newTwoStateButton(display.newImage("res/ui/upgrade.png", 0, 0, true), display.newImage("res/ui/upgrade.png", 0, 0, true), {}):setReferencePoint(display.CenterReferencePoint)
		local L10_140 = L10_140
	end
	L9_139 = utils
	L9_139 = L9_139.getBasicButton
	L10_140 = {}
	L10_140.buttonText = "NEW BATTLE"
	function L10_140.onComplete()
		sound.playSound(sound.globalSounds.button)
		if #_ENV.matches() < 20 then
			if require("multiplayer.dataServer").testConnection() then
				_UPVALUE1_()
			else
				utils.displayNoNetworkConnection()
			end
		else
			local L0_144 = L0_144
			;({}).textLine1 = "Too many battles!"
			;({}).textLine2 = "Finish some battles first."
			;({}).icon = utils.DIALOG_ATTACK
			local ({}).confirmSound, L2_146 = sound.globalSounds.button, L2_146
			L0_144(L2_146)
		end
	end
	L9_139 = L9_139(L10_140)
	newMatchButton = L9_139
	L10_140 = L11_141
	L9_139 = L11_141.insert
	L9_139(L10_140, newMatchButton)
	L9_139 = L3_133.titleBar
	L10_140 = L9_139
	L9_139 = L9_139.localToContent
	local L7_137 = L7_137
	local L9_139, L10_140, L8_138 = L9_139(L10_140, L7_137, 0)
	L7_137 = newMatchButton
	L8_138 = newMatchButton
	L7_137.x, L8_138.y = L9_139, L10_140 + L3_133.titleBar.contentHeight / 2 + newMatchButton.contentHeight / 2 + 10
end
function L5_5.enterScene(A0_147, A1_148)
	storyboard.removeScene("battlefieldScene")
	local L4_151 = L4_151
	L4_151(settings, "multiplayerSeen", true)
	local L5_152 = L5_152
	L4_151 = settings
	L5_152 = L4_151
	L4_151 = L4_151.save
	L4_151(L5_152)
	L4_151 = 0
	_ENV = L4_151
	L4_151 = A0_147.view
	L5_152 = L10_10
	L5_152 = L5_152.populateBattles
	L5_152()
	L5_152 = L17_17
	L5_152()
end
function L5_5.exitScene(A0_153, A1_154)
	_ENV()
end


-- [End of decompiled block; see disassembly for inner stripped closures]
