module((...), package.seeall)
local L0_0 = L0_0
L0_0("oAuth")
L0_0 = twitterSupport
L0_0.TWITTER_ENABLED = "twitterEnabled"
L0_0 = twitterSupport
L0_0.TWITTER_SOLICITED = "twitterSolicited"
L0_0 = twitterSupport
L0_0.ACCESS_TOKEN = "twitterAccessToken"
L0_0 = twitterSupport
L0_0.ACCESS_TOKEN_SECRET = "twitterAccessTokenSecret"
L0_0 = twitterSupport
L0_0.CONSUMER_KEY = "paNMMaQFrK7HZfc7mCTg"
L0_0 = twitterSupport
L0_0.CONSUMER_SECRET = "M0iXAtuQTt2p6TnYkjObsKoRFz7TC9lmTAPT0iB1uk"
L0_0 = twitterSupport
L0_0.twitterEnabled = settings:get(twitterSupport.TWITTER_ENABLED, false)
L0_0 = twitterSupport
L0_0.accessToken = settings:get(twitterSupport.ACCESS_TOKEN, nil)
L0_0 = twitterSupport
local L1_1, L2_2 = L1_1, L2_2
local L3_3 = L3_3
local L1_1, L4_4 = L1_1(L2_2, L3_3, nil), L4_4
L0_0.accessTokenSecret = L1_1
L0_0 = twitterSupport
L0_0.userId = nil
L0_0 = twitterSupport
L0_0.screenName = nil
L0_0 = twitterSupport
L0_0.onSuccess = nil
L0_0 = twitterSupport
function L1_1(A0_5)
	local twitterSupport.onSuccess, L3_8 = A0_5, L3_8
	L3_8 = timer
	L3_8 = L3_8.performWithDelay
	local L2_7 = L2_7
	L3_8(L2_7, function()
		storyboard.gotoScene("twitterSetupScene")
		local L1_9 = L1_9
	end)
end
L0_0.init = L1_1
L0_0 = twitterSupport
function L1_1(A0_10, A1_11)
	local L3_13 = L3_13
	L3_13("TWEET", A0_10)
	local L4_14 = L4_14
	L3_13 = twitterSupport
	L3_13 = L3_13.twitterEnabled
	if L3_13 then
		L3_13 = pcall
		function L4_14()
			repeat
				if twitterSupport.accessToken then
					({}).key = "status"
					;({})[1], ({}).value = {}, _ENV
					print("d", twitterSupport.CONSUMER_KEY, twitterSupport.accessToken, twitterSupport.CONSUMER_SECRET, twitterSupport.accessTokenSecret)
					local L4_19 = L4_19
					local L5_20 = L5_20
					local L6_21 = L6_21
					local L7_22 = L7_22
					local L5_20, L8_23 = L5_20(L6_21, L7_22, twitterSupport.CONSUMER_KEY, twitterSupport.accessToken, twitterSupport.CONSUMER_SECRET, twitterSupport.accessTokenSecret, "POST"), L8_23
					L6_21 = print
					L7_22 = "TWEET RESPONSE"
					L6_21(L7_22)
					L6_21 = utils
					L6_21 = L6_21.table_print
					L7_22 = L5_20
					L6_21(L7_22)
					L6_21 = A1_11
					if not L6_21 then
						goto lbl_55
					end
					L6_21 = A1_11
					L6_21()
					break -- pseudo-goto
				end
				L4_19 = twitterSupport
				L4_19 = L4_19.init
				function L5_20(A0_24)
					local L2_25 = L2_25
					L2_25(_ENV, A1_11)
					local L3_26 = L3_26
				end
				L4_19(L5_20)
			until true
			::lbl_55::
		end
		L3_13(L4_14)
	end
end
L0_0.tweet = L1_1
L0_0 = twitterSupport
function L1_1()
	local L0_27, L1_28 = L0_27, L1_28
	local L2_29 = L2_29
	local L0_27, L3_30 = L0_27(L1_28, L2_29, false), L3_30
	L0_27 = not L0_27
	return L0_27
end
L0_0.canSolicit = L1_1
L0_0 = twitterSupport
function L1_1(A0_31)
	repeat
		if twitterSupport.canSolicit() then
			if twitterSupport.twitterEnabled then
				local L3_34 = L3_34
				L3_34("I'm playing Little Generals by Smarter Apps " .. utils.getExternalStoreLink(), function()
					_ENV()
					local L1_35 = L1_35
					local L2_36 = L2_36
					L1_35(L2_36, twitterSupport.TWITTER_SOLICITED, true)
					local L3_37 = L3_37
				end)
				break -- pseudo-goto
			end
			L3_34 = twitterSupport
			L3_34 = L3_34.init
			L3_34(function()
				solicit(_ENV)
				local L1_38 = L1_38
			end)
		end
	until true
end
L0_0.solicit = L1_1
L0_0 = twitterSupport
function L1_1()
	twitterSupport.accessToken = nil
	twitterSupport.accessTokenSecret = nil
	twitterSupport.twitterEnabled = false
	settings:set(ACCESS_TOKEN, nil)
	settings:set(ACCESS_TOKEN_SECRET, nil)
	local L2_41 = L2_41
	L2_41(settings, TWITTER_ENABLED, false)
	local L3_42 = L3_42
	L2_41 = settings
	L3_42 = L2_41
	L2_41 = L2_41.save
	L2_41(L3_42)
end
L0_0.stop = L1_1
