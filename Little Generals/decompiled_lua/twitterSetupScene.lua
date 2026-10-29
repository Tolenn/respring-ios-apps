-- Decompiled & AI-Repaired from twitterSetupScene.lu
-- Source disassembly preserved at: disasm/twitterSetupScene.disasm

require("twitterSupport")
local L1_1 = L1_1
L1_1 = storyboard
L1_1 = L1_1.newScene
L1_1 = L1_1()
function L1_1.createScene(A0_6, A1_7)
	local L2_8 = storyboard.getPrevious()
	A0_6.previousScene = L2_8
	L2_8 = A0_6.view
	local L3_9 = L3_9
	;({}).group = L2_8
	;({}).title = "TWITTER"
	;({}).showBottomBar = false
	;({}).onClose = function()
		local L3_21 = sound.playSound
		L3_21(sound.globalSounds.button)
		L3_21 = storyboard
		L3_21 = L3_21.getCurrentSceneName
		L3_21 = L3_21()
		timer.performWithDelay(1, function()
			storyboard.removeScene(_ENV)
			local L1_22 = L1_22
		end)
		local L1_19 = L1_19
		L1_19(_ENV.previousScene)
		local L2_20 = L2_20
	end
	L3_9 = L3_9({})
	local L4_10 = L4_10
	L4_10 = L4_10(L2_8, 0, 0, 700, 440)
	L4_10.strokeWidth = 20
	L4_10:setStrokeColor(98, 64, 23)
	L4_10:setFillColor(0, 0, 0, 0)
	L4_10:setReferencePoint(display.TopCenterReferencePoint)
	L4_10.x = screenX + screenWidth / 2
	L4_10.y = 120
	L2_8:insert(L4_10)
	local L5_11 = L5_11
	L5_11 = L5_11(L2_8, 0, 0, 700, 440)
	L5_11.strokeWidth = 10
	L5_11:setReferencePoint(display.TopCenterReferencePoint)
	L5_11:setStrokeColor(245, 167, 88)
	L5_11:setFillColor(0, 0, 0, 0)
	L5_11.x = L4_10.x
	L5_11.y = L4_10.y + 5
	local L6_12 = L6_12
	L6_12(L2_8, L5_11)
	local L8_14 = L8_14
	function L6_12()
		local L2_25 = utils.getDialog
		;({}).textLine1 = "Unable to contact Twitter at this time."
		;({}).confirmFunction = function()
			local L3_29 = storyboard.getCurrentSceneName
			L3_29 = L3_29()
			timer.performWithDelay(1, function()
				storyboard.removeScene(_ENV)
				local L1_30 = L1_30
			end)
			local L1_27 = L1_27
			L1_27(_ENV.previousScene)
			local L2_28 = L2_28
		end
		L2_25({})
		local L1_24 = L1_24
	end
	L8_14 = pcall
	L8_14 = L8_14(function()
		repeat
			local L5_36, L6_37, L7_38 = oAuth.getRequestToken, L6_37, L7_38
			L6_37 = twitterSupport
			L6_37 = L6_37.CONSUMER_KEY
			L7_38 = "finished"
			local L3_34 = L3_34
			local L5_36, L4_35 = L5_36(L6_37, L7_38, L3_34, twitterSupport.CONSUMER_SECRET), L4_35
			L6_37 = L5_36.token
			L7_38 = L5_36.token_secret
			function L3_34(A0_46)
				local L1_47, L2_48
				L1_47 = true
				L2_48 = A0_46.url
				if L2_48:find("finished") then
					L2_48 = L2_48:sub(L2_48:find("?") + 1, L2_48:len())
					local L3_49 = L3_49
					;({})[1] = "="
					;({})[2] = "&"
					L3_49 = L3_49(L2_48, {})
					L1_47 = false
					local L4_50 = L4_50
					local L4_50, L10_56 = L4_50(L3_49.oauth_token, L3_49.oauth_verifier, _ENV, twitterSupport.CONSUMER_KEY, twitterSupport.CONSUMER_SECRET, "https://api.twitter.com/oauth/access_token"), L10_56
					if L4_50 then
						L10_56 = oAuth
						L10_56 = L10_56.responseToTable
						;({})[1] = "="
						;({})[2] = "&"
						L10_56 = L10_56(L4_50, {})
						twitterSupport.accessToken = L10_56.oauth_token
						twitterSupport.accessTokenSecret = L10_56.oauth_token_secret
						twitterSupport.userId = L10_56.user_id
						twitterSupport.screenName = L10_56.screen_name
						twitterSupport.twitterEnabled = true
						settings:set(twitterSupport.ACCESS_TOKEN, twitterSupport.accessToken)
						settings:set(twitterSupport.ACCESS_TOKEN_SECRET, twitterSupport.accessTokenSecret)
						settings:set(twitterSupport.TWITTER_ENABLED, true)
						settings:save()
						timer.performWithDelay(1, function()
							local L0_57 = L0_57
							L0_57(_ENV)
							L0_57 = twitterSupport
							L0_57 = L0_57.onSuccess
							if L0_57 then
								L0_57 = twitterSupport
								L0_57 = L0_57.onSuccess
								twitterSupport.onSuccess = nil
								L0_57()
								local L1_58 = L1_58
							end
						end)
						storyboard.gotoScene(_ENV.previousScene)
						local L8_54 = L8_54
						break -- pseudo-goto
					end
					L10_56 = print
					L8_54 = "no accessToken"
					L10_56(L8_54)
					L10_56 = L6_12
					L10_56()
				end
				repeat
				until true
				return L1_47
			end
			L4_35 = 60
			if L6_37 then
				local L10_41 = L10_41
				local L11_42 = L11_42
				local L12_43 = L12_43
				local L13_44 = L13_44
				;({}).urlRequest = L3_34
				L13_44(screenX + (screenWidth - L4_10.contentWidth) / 2 + 20, 140, L4_10.contentWidth - 40, L4_10.contentHeight - 40, "https://api.twitter.com/oauth/authorize?oauth_token=" .. L6_37, {})
				local L14_45 = L14_45
				break -- pseudo-goto
			end
			L13_44 = print
			L14_45 = "no request token"
			L13_44(L14_45)
			L13_44 = L6_12
			L13_44()
		until true
	end)
	if not L8_14 then
		local L10_16 = L10_16
		print("error", L8_14(function()
			repeat
				local L5_64, L6_65, L7_66 = oAuth.getRequestToken, L6_65, L7_66
				L6_65 = twitterSupport
				L6_65 = L6_65.CONSUMER_KEY
				L7_66 = "finished"
				local L3_62 = L3_62
				local L5_64, L4_63 = L5_64(L6_65, L7_66, L3_62, twitterSupport.CONSUMER_SECRET), L4_63
				L6_65 = L5_64.token
				L7_66 = L5_64.token_secret
				function L3_62(A0_74)
					local L1_75, L2_76
					L1_75 = true
					L2_76 = A0_74.url
					if L2_76:find("finished") then
						L2_76 = L2_76:sub(L2_76:find("?") + 1, L2_76:len())
						local L3_77 = L3_77
						;({})[1] = "="
						;({})[2] = "&"
						L3_77 = L3_77(L2_76, {})
						L1_75 = false
						local L4_78 = L4_78
						local L4_78, L10_84 = L4_78(L3_77.oauth_token, L3_77.oauth_verifier, _ENV, twitterSupport.CONSUMER_KEY, twitterSupport.CONSUMER_SECRET, "https://api.twitter.com/oauth/access_token"), L10_84
						if L4_78 then
							L10_84 = oAuth
							L10_84 = L10_84.responseToTable
							;({})[1] = "="
							;({})[2] = "&"
							L10_84 = L10_84(L4_78, {})
							twitterSupport.accessToken = L10_84.oauth_token
							twitterSupport.accessTokenSecret = L10_84.oauth_token_secret
							twitterSupport.userId = L10_84.user_id
							twitterSupport.screenName = L10_84.screen_name
							twitterSupport.twitterEnabled = true
							settings:set(twitterSupport.ACCESS_TOKEN, twitterSupport.accessToken)
							settings:set(twitterSupport.ACCESS_TOKEN_SECRET, twitterSupport.accessTokenSecret)
							settings:set(twitterSupport.TWITTER_ENABLED, true)
							settings:save()
							timer.performWithDelay(1, function()
								local L0_85 = L0_85
								L0_85(_ENV)
								L0_85 = twitterSupport
								L0_85 = L0_85.onSuccess
								if L0_85 then
									L0_85 = twitterSupport
									L0_85 = L0_85.onSuccess
									twitterSupport.onSuccess = nil
									L0_85()
									local L1_86 = L1_86
								end
							end)
							storyboard.gotoScene(_ENV.previousScene)
							local L8_82 = L8_82
							break -- pseudo-goto
						end
						L10_84 = print
						L8_82 = "no accessToken"
						L10_84(L8_82)
						L10_84 = L6_12
						L10_84()
					end
					repeat
					until true
					return L1_75
				end
				L4_63 = 60
				if L6_65 then
					local L10_69 = L10_69
					local L11_70 = L11_70
					local L12_71 = L12_71
					local L13_72 = L13_72
					;({}).urlRequest = L3_62
					L13_72(screenX + (screenWidth - L4_10.contentWidth) / 2 + 20, 140, L4_10.contentWidth - 40, L4_10.contentHeight - 40, "https://api.twitter.com/oauth/authorize?oauth_token=" .. L6_65, {})
					local L14_73 = L14_73
					break -- pseudo-goto
				end
				L13_72 = print
				L14_73 = "no request token"
				L13_72(L14_73)
				L13_72 = L6_12
				L13_72()
			until true
		end))
		local L11_17 = L11_17
		L11_17 = L6_12
		L11_17()
	end
end
function L1_1.enterScene(A0_87, A1_88)
	A0_87.view:toFront()
	local L3_89, L4_90 = L3_89, L4_90
end


-- [End of decompiled block; see disassembly for inner stripped closures]
