local L0_0
L0_0 = {}
require("gamecenterSupport")
require("utils")
local L1_1 = L1_1
local L1_1, L2_2 = L1_1("json"), L2_2
L2_2 = CUSTOM_OVERRIDES
L2_2 = L2_2.MULTIPLAYER_PUSH_REGISTER_ENDPOINT
if not L2_2 then
	L2_2 = "http://pushreg.little-generals.com/"
end
L0_0.REGISTER_ENDPOINT = L2_2
L2_2 = CUSTOM_OVERRIDES
L2_2 = L2_2.MULTIPLAYER_PUSH_SEND_ENDPOINT
if not L2_2 then
	L2_2 = "http://push.little-generals.com/"
end
L0_0.SEND_ENDPOINT = L2_2
function L2_2(A0_3)
	local L1_4 = L1_4
	local L2_5 = L2_5
	local L1_4, L2_5, L3_6 = L1_4(L2_5, "^(%a*)%s-(.*)")
	L3_6 = L2_5
	if not L3_6 then
		L3_6 = L1_4
	end
	if L3_6 then
		return _ENV.decode(L3_6)
	end
	local L4_7 = L4_7
	local L5_8 = L5_8
	L4_7(L5_8, L3_6)
	L4_7 = nil
	return L4_7
end
L0_0.parseActionString = L2_2
function L2_2(A0_9)
	if A0_9.type == "remoteRegistration" then
		_ENV.token = A0_9.token
		_ENV.register()
	elseif A0_9.type == "remote" then
		local L1_10 = L1_10
		L1_10 = L1_10(A0_9.action)
		if L1_10 then
			local L2_11 = L2_11
			L2_11(L1_10)
			local L3_12 = L3_12
		end
	end
end
L0_0.notificationListener = L2_2
function L2_2(A0_13, A1_14)
	local L2_15
	L2_15 = A0_13.v
	if L2_15 and L2_15 > CURRENT_VERSION then
		local L3_16 = L3_16
		L3_16("Upgrade available.")
		return
	end
	L3_16 = A0_13.nt
	if not L3_16 then
		L3_16 = 0
	end
	if L3_16 == 1 then
		local L4_17 = L4_17
		L4_17 = L4_17("multiplayer.match")
		if require("tutorial").isFirstFightTutorialsComplete() and _ENV.resumeTime and os.time() - _ENV.resumeTime < 5000 then
			_ENV.resumeTime = nil
			if storyboard.getScene("battlefieldScene") == nil then
				A1_14 = true
			end
		elseif not require("tutorial").isFirstFightTutorialsComplete() then
			A1_14 = false
		end
		local L5_18 = L5_18
		L5_18(A0_13, A1_14)
		local L7_20 = L7_20
		L5_18 = _ENV
		L7_20 = os
		L7_20 = L7_20.time
		L7_20 = L7_20()
		L5_18.notificationTime = L7_20
	end
end
L0_0.handleNotification = L2_2
function L2_2()
	Runtime:addEventListener("notification", _ENV.notificationListener)
	local L3_24 = L3_24
	L3_24 = Runtime
	L3_24 = L3_24.addEventListener
	local L2_23 = L2_23
	L3_24(L2_23, "system", function(A0_25)
		if A0_25.type == "applicationResume" then
			_ENV.resumeTime = os.time()
			if _ENV.notificationTime and os.time() - _ENV.notificationTime < 5000 then
				_ENV.notificationTime = nil
				if storyboard.getScene("battlefieldScene") == nil then
					storyboard.gotoScene("multiplayer.multiplayerSelectScene")
					local L1_26 = L1_26
					L1_26("splashScene")
					local L2_27 = L2_27
				end
			end
		end
	end)
end
L0_0.init = L2_2
function L2_2()
	repeat
		local L0_28 = L0_28
		L0_28 = L0_28(settings, "multiplayerId")
		local L1_29 = L1_29
		L1_29 = L1_29(settings, "lastPushToken", nil)
		local L2_30, L3_31 = L2_30, L3_31
		L2_30 = L2_30(L3_31, "lastRegistrationTime", 0)
		L3_31 = _ENV
		L3_31 = L3_31.token
		print("PushReg", L0_28, L3_31, L1_29)
		if L0_28 and L3_31 and (L3_31 ~= L1_29 or L2_30 + 21600 < os.time() or CUSTOM_OVERRIDES.FORCE_PUSH_REGISTRATION) then
			function networkListener(A0_43)
				if A0_43.status ~= 204 then
					print("Problem registering push token with LG servers", A0_43.status, A0_43.body)
				else
					print("Push registration successful.")
					require("time").refresh()
					local L1_44, L2_45 = L1_44, L2_45
					local L3_46 = L3_46
					L1_44(L2_45, L3_46, _ENV.token)
					L1_44 = settings
					L2_45 = L1_44
					L1_44 = L1_44.set
					L3_46 = "lastRegistrationTime"
					local L4_47 = os.time()
					L1_44(L2_45, L3_46, L4_47)
					L1_44 = _ENV
					L1_44.token = nil
					L1_44 = _ENV
					L1_44.isRegistered = true
				end
			end
			print("Combined id", L0_28 .. L3_31, L0_28, L3_31)
			local L6_34 = L6_34
			local L12_40 = L12_40
			local L13_41 = L13_41
			local L14_42 = L14_42
			L14_42 = L14_42("playerId=%s&pushToken=%s&hmac=%s", utils.urlencode(L0_28), L3_31, require("crypto").hmac(require("crypto").sha1, L6_34, REMOTE_SIGNING_KEY))
			L12_40.body = L14_42
			L14_42 = network
			L14_42 = L14_42.request
			local L10_38 = L10_38
			L14_42(L10_38, "POST", networkListener, L12_40)
			local L11_39 = L11_39
			break -- pseudo-goto
		end
		if L3_31 then
			L6_34 = _ENV
			L6_34.isRegistered = true
			L6_34 = require
			L12_40 = "time"
			L6_34 = L6_34(L12_40)
			L6_34 = L6_34.refresh
			L6_34()
		end
	until true
end
L0_0.register = L2_2
function L2_2(A0_48)
	local L1_49, L2_50, L3_51, L4_52, L5_53, L6_54
	L1_49 = A0_48.recipientId
	L2_50 = A0_48.message
	L3_51 = A0_48.data
	if not L3_51 then
		L3_51 = ""
	end
	L4_52 = A0_48.onComplete
	L5_53 = A0_48.sound
	if not L5_53 then
		L5_53 = ""
	end
	L6_54 = nil
	if type(L3_51) == "string" then
		L6_54 = L3_51
	else
		L6_54 = _ENV.encode(L3_51)
	end
	local L7_55 = L7_55
	L6_54 = L7_55 .. L6_54
	L7_55 = {}
	local L16_64 = L16_64
	local L17_65 = L17_65
	local L15_63 = L15_63
	L16_64 = L16_64(L17_65, L15_63, utils.urlencode(L2_50), crypto.hmac(crypto.sha1, L1_49 .. L2_50 .. L6_54 .. L5_53, REMOTE_SIGNING_KEY), utils.urlencode(L6_54), utils.urlencode(L5_53))
	L7_55.body = L16_64
	L16_64 = network
	L16_64 = L16_64.request
	L17_65 = L0_0
	L17_65 = L17_65.SEND_ENDPOINT
	L15_63 = "/push"
	L17_65 = L17_65 .. L15_63
	L15_63 = "POST"
	local L11_59 = L11_59
	L16_64(L17_65, L15_63, L11_59, L7_55)
	local L12_60 = L12_60
end
L0_0.send = L2_2
return L0_0
