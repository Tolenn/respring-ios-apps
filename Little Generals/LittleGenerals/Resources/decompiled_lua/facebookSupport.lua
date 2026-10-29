local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8 = L3_3, (...), L5_5, L6_6, L7_7, L8_8
L5_5 = package
L5_5 = L5_5.seeall
L3_3(L4_4, L5_5)
L3_3 = require
L4_4 = "facebook"
L3_3 = L3_3(L4_4)
L4_4 = require
L5_5 = "json"
L4_4 = L4_4(L5_5)
L5_5 = "facebookEnabled"
L6_6 = "facebookSolicited"
L7_7 = "facebookLiked"
L8_8 = "234431639968036"
local L9_9 = L9_9
;({})[1] = "publish_stream"
;({})[2] = "user_likes"
;({})[3] = "email"
local L10_10 = L10_10
local L13_13 = L13_13
facebookSupport.facebookEnabled = settings:get(L5_5, false)
facebookSupport.SHARE_TITLE = "I challenge you to a battle in Little Generals!"
facebookSupport.SHARE_CAPTION = "Battle your friends in Little Generals for free!"
facebookSupport.SHARE_TEXT = "Little Generals is a great new iPhone, iPad and iPod game that's free to play. Click here to download from the app store, sign in with facebook and start playing!"
facebookSupport.INVITE_TITLE = "Little Generals Challenge!"
facebookSupport.INVITE_CAPTION = "Battle your friends in Little Generals for free!"
facebookSupport.INVITE_TEXT = "FB_NAME has challenged you to a battle in Little Generals and is waiting to blow you up. Click here to download from the app store, sign in with facebook and start playing!"
function facebookSupport.runQueue()
	local L0_14
	repeat
		L0_14 = facebookSupport
		L0_14 = L0_14.runningRequest
		if not L0_14 then
			L0_14 = _ENV
			L0_14 = #L0_14
			if 0 < L0_14 then
				L0_14 = _ENV
				L0_14 = L0_14[1]
				table.remove(_ENV, 1)
				if not L0_14.request then
				end
				facebookSupport.runningRequest = L0_14.dialogType ~= nil
				facebookSupport.runningHandler = L0_14.handler
				if L0_14.request then
					L0_0.request(L0_14.request, L0_14.method, L0_14.params)
					local L4_18 = L4_18
					break -- pseudo-goto
				end
				L4_18 = L0_14.dialogType
				if L4_18 then
					L4_18 = L0_14.dialogParameters
					if L4_18 then
						L4_18 = L0_0
						L4_18 = L4_18.showDialog
						local L2_16 = L2_16
						L4_18(L2_16, L0_14.dialogParameters)
						local L3_17 = L3_17
					end
				end
			end
		end
	until true
end
function facebookSupport.makeRequest(A0_19, A1_20, A2_21, A3_22)
	if not A0_19 or not A1_20 then
		print("FB request must have handler")
		return
	end
	local L5_24 = L5_24
	;({}).request = A0_19
	;({}).handler = A1_20
	;({}).method = A2_21
	;({}).params = A3_22
	L5_24(_ENV, {})
	local L6_25 = L6_25
	L5_24 = facebookSupport
	L5_24 = L5_24.runQueue
	L5_24()
end
function facebookSupport.showDialog(A0_26, A1_27, A2_28)
	if not (A0_26 and A1_27) or not A2_28 then
		print("FB dialog must have handler")
		return
	end
	local L4_30 = L4_30
	;({}).dialogType = A0_26
	;({}).dialogParameters = A1_27
	;({}).handler = A2_28
	L4_30(_ENV, {})
	local L5_31 = L5_31
	L4_30 = facebookSupport
	L4_30 = L4_30.runQueue
	L4_30()
end
function facebookSupport.init(A0_32)
	if "simulator" == system.getInfo("environment") then
		local L1_33 = L1_33
		L1_33("Facebook isn't supported on the simulator.")
		return
	end
	function L1_33(A0_38)
		if "session" == A0_38.type then
			if "login" == A0_38.phase then
				_ENV = A0_38.token
				facebookSupport.facebookEnabled = true
				;({}).fields = "id,name,email"
				facebookSupport.makeRequest("me", function(A0_44)
					if not A0_44.isError then
						local L1_45 = L1_45
						L1_45 = L1_45(A0_44.response)
						facebookSupport.facebookId = L1_45.id
						facebookSupport.facebookName = L1_45.name
						facebookSupport.facebookEmail = L1_45.email
						local L2_46 = L2_46
						local L3_47 = L3_47
						L2_46(L3_47, facebookSupport.facebookId)
						local L4_48 = L4_48
					end
				end, "GET", {})
				local L5_43 = L5_43
				repeat
					L5_43 = facebookSupport
					L5_43 = L5_43.refreshLikes
					L5_43()
					L5_43 = A0_32
					if not L5_43 then
						goto lbl_39
					end
					L5_43 = A0_32
					L5_43(A0_38)
					L5_43 = nil
					A0_32 = L5_43
					do break end -- pseudo-goto
					L5_43 = A0_38.phase
					if "logout" == L5_43 then
						L5_43 = nil
						_ENV = L5_43
						L5_43 = facebookSupport
						L5_43.facebookEnabled = false
					end
				until true
			end
			::lbl_39::
			L5_43 = settings
			L5_43 = L5_43.set
			L5_43(L5_43, L2_2, facebookSupport.facebookEnabled)
			local L4_42 = L4_42
			repeat
				do break end -- pseudo-goto
				L5_43 = A0_38.type
				if "request" ~= L5_43 then
					L5_43 = A0_38.type
					if "dialog" ~= L5_43 then
						goto lbl_67
					end
				end
				L5_43 = facebookSupport
				L5_43 = L5_43.runningHandler
				if L5_43 then
					L5_43 = facebookSupport
					L5_43 = L5_43.runningHandler
					L4_42 = A0_38
					L5_43(L4_42)
				end
				L5_43 = facebookSupport
				L5_43.runningRequest = nil
				L5_43 = facebookSupport
				L5_43.runningHandler = nil
				L5_43 = facebookSupport
				L5_43 = L5_43.runQueue
				L5_43()
			until true
		end
		::lbl_67::
		L5_43 = settings
		L4_42 = L5_43
		L5_43 = L5_43.save
		L5_43(L4_42)
	end
	local L2_34 = L2_34
	local L3_35 = L3_35
	local L4_36 = L4_36
	L2_34(L3_35, L4_36, L13_13)
	local L5_37 = L5_37
end
function facebookSupport.friendQuery(A0_49, A1_50, A2_51)
	repeat
		local L4_53 = L4_53
		if not A2_51 then
			return
		end
		L4_53 = facebookSupport
		L4_53 = L4_53.facebookEnabled
		if L4_53 then
			L4_53 = _ENV
			if L4_53 then
				L4_53 = nil
				if not A1_50 or not 1 then
				end
				if A0_49 and A0_49 ~= "" then
				end
				local L5_54 = L5_54
				local L6_55 = L6_55
				local L7_56 = L7_56
				local L8_57 = L8_57
				local L9_58 = L9_58
				;({}).q = L6_55
				L7_56(L8_57, L9_58, "GET", {})
				local L10_59 = L10_59
				break -- pseudo-goto
			end
		end
		L4_53 = facebookSupport
		L4_53 = L4_53.init
		function L5_54()
			local L1_60 = L1_60
			local L2_61 = L2_61
			L1_60(L2_61, A1_50, A2_51)
			local L3_62 = L3_62
		end
		L4_53(L5_54)
	until true
end
function facebookSupport.getEmailAddresses(A0_63)
	repeat
		if facebookSupport.facebookEnabled then
			if _ENV then
				local ({})[1], L3_66 = facebookSupport.facebookEmail, L3_66
				L3_66({})
				break -- pseudo-goto
			end
			L3_66 = facebookSupport
			L3_66 = L3_66.init
			L3_66(function()
				facebookSupport.getEmailAddresses(_ENV)
				local L1_67 = L1_67
			end)
			break -- pseudo-goto
		end
		L3_66 = A0_63
		L3_66({})
		local L2_65 = L2_65
	until true
end
function facebookSupport.getChallenges(A0_68)
	repeat
		local L3_71 = facebookSupport.facebookEnabled
		if L3_71 then
			L3_71 = _ENV
			if L3_71 then
				L3_71 = facebookSupport
				L3_71 = L3_71.makeRequest
				local L4_72 = L4_72
				L3_71(L4_72, function(A0_74)
					repeat
						local L7_81 = L7_81
						if not A0_74.isError then
							L7_81 = _ENV
							L7_81 = L7_81.decode
							L7_81 = L7_81(A0_74.response)
							if L7_81 and L7_81.data then
								_FOR_ = 1
								for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
									if L7_81.data[_FORV_7_].application and L7_81.data[_FORV_7_].application.id == L8_8 then
										print("found challenge", L7_81.data[_FORV_7_].data, L7_81.data[_FORV_7_].id)
										if L7_81.data[_FORV_7_].data then
											({}).matchId = L7_81.data[_FORV_7_].data
											;({}).requestId = L7_81.data[_FORV_7_].id
											table.insert({}, {})
										else
											local L8_82 = L8_82
											local L9_83 = L9_83
											;({}).requestId = L8_82[_FORV_7_].id
											;({})[1] = {}
											facebookSupport.removeChallenges({})
										end
									end
								end
								L11_85 = A0_68
								L11_85(L9_83)
								break -- pseudo-goto
							end
							L8_82 = A0_68
							L9_83 = {}
							L8_82(L9_83)
							break -- pseudo-goto
						end
						L7_81 = A0_68
						L8_82 = {}
						L7_81(L8_82)
					until true
				end, "GET", {})
				local L5_73 = L5_73
				break -- pseudo-goto
			end
			L3_71 = facebookSupport
			L3_71 = L3_71.init
			function L4_72()
				facebookSupport.getChallenges(_ENV)
				local L1_86 = L1_86
			end
			L3_71(L4_72)
			break -- pseudo-goto
		end
		L3_71 = A0_68
		L4_72 = {}
		L3_71(L4_72)
	until true
end
function facebookSupport.removeChallenges(A0_87)
	local L1_88, L2_89, L3_90, L4_91
	L1_88 = 1
	L2_89 = #A0_87
	L3_90 = 1
	for L4_91 = L1_88, L2_89, L3_90 do
		local L5_92 = L5_92
		local L7_94 = "/" .. A0_87[L4_91].requestId
		local L8_95 = L8_95
		L5_92(L7_94, L8_95, "DELETE", {})
		local L9_96 = L9_96
	end
end
function facebookSupport.challengeFriend(A0_97, A1_98, A2_99, A3_100)
	repeat
		local L7_104 = facebookSupport.facebookEnabled
		if L7_104 then
			L7_104 = _ENV
			if L7_104 then
				L7_104 = facebookSupport
				L7_104 = L7_104.showDialog
				;({}).to = A0_97
				;({}).data = A1_98
				;({}).title = "Attention Soldier!"
				;({}).message = "I challenge you to a battle!"
				local L6_103 = L6_103
				L7_104(L6_103, {}, function(A0_105)
					local L3_108 = L3_108
					if A0_105.didComplete and not A0_105.isError and A0_105.response and string.match(A0_105.response, ".*%?(.+)") then
						_FOR_, _FOR_, _FOR_ = string.gmatch(string.match(A0_105.response, ".*%?(.+)"), "([%w%%]*)=([%w%%]*)&*")
						for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
							local L10_115 = L10_115
							local L11_116 = L11_116
							table.insert({}, (L3_108.unescape(_FORV_8_)))
						end
						L12_117 = facebookSupport
						L12_117 = L12_117.postToFeed
						L13_118 = string
						L13_118 = L13_118.gsub
						if not facebookSupport.facebookName then
						end
						L13_118 = L13_118(facebookSupport.INVITE_TEXT, "FB_NAME", "")
						L12_117(L13_118, nil, facebookSupport.INVITE_TITLE, utils.getExternalStoreLink(), _ENV)
						L12_117 = A3_100
						if L12_117 then
							L12_117 = A3_100
							L13_118 = L11_116
							L12_117(L13_118)
							return
						end
					end
					L3_108 = A3_100
					if L3_108 then
						L3_108 = A3_100
						L10_115 = {}
						L3_108(L10_115)
					end
				end)
				break -- pseudo-goto
			end
		end
		L7_104 = facebookSupport
		L7_104 = L7_104.init
		function L6_103()
			local L1_119 = L1_119
			local L2_120 = L2_120
			local L3_121 = L3_121
			L1_119(L2_120, L3_121, A2_99, A3_100)
			local L4_122 = L4_122
		end
		L7_104(L6_103)
	until true
end
function facebookSupport.postToFeed(A0_123, A1_124, A2_125, A3_126, A4_127)
	local L5_128
	repeat
		L5_128 = A4_127 or nil
		if not A4_127 then
			L5_128 = "me"
		end
		if facebookSupport.facebookEnabled then
			if _ENV then
				({}).message = A0_123
				if A1_124 then
					({}).picture = A1_124
				end
				if A2_125 then
					({}).description = A2_125
				end
				if A3_126 then
					({}).link = A3_126
				end
				local L7_130 = L7_130
				local L8_131 = L8_131
				local L9_132 = L9_132
				L8_131(L9_132, "POST", L7_130)
				local L10_133 = L10_133
				break -- pseudo-goto
			end
			L7_130 = facebookSupport
			L7_130 = L7_130.init
			function L8_131(A0_134)
				local L2_135 = L2_135
				local L3_136 = L3_136
				local L4_137 = L4_137
				local L5_138 = L5_138
				L2_135(L3_136, L4_137, L5_138, A3_126, L5_128)
				local L6_139 = L6_139
			end
			L7_130(L8_131)
		end
	until true
end
function facebookSupport.canSolicit()
	local L0_140, L1_141 = L0_140, L1_141
	local L2_142 = L2_142
	local L0_140, L3_143 = L0_140(L1_141, L2_142, false), L3_143
	L0_140 = not L0_140
	return L0_140
end
function facebookSupport.setSolicited(A0_144)
	local L2_145 = L2_145
	local L3_146 = L3_146
	L2_145(L3_146, _ENV, A0_144)
	local L4_147 = L4_147
end
function facebookSupport.solicit(A0_148)
	repeat
		if canSolicit() then
			if facebookSupport.facebookEnabled and _ENV then
				if facebookSupport.pendingLikeCallbacks then
					local L3_151 = L3_151
					table.insert(facebookSupport.pendingLikeCallbacks, function()
						local L2_155 = L2_155
						local L2_155, L3_156 = L2_155(settings, _ENV, false), L3_156
						if L2_155 then
							L2_155 = A0_148
							L3_156 = true
							L2_155(L3_156)
						else
							L2_155 = utils
							L2_155 = L2_155.getDialog
							L3_156 = {}
							L3_156.textLine1 = "Like via Facebook website"
							L3_156.textLine2 = "And return to Little Generals"
							function L3_156.confirmFunction()
								local L2_159 = timer.performWithDelay
								local L1_158 = L1_158
								L2_159(L1_158, function()
									system.openURL("http://facebook.com/littlegenerals")
									local L1_160 = L1_160
								end)
							end
							L2_155(L3_156)
						end
					end)
					local L4_152 = L4_152
					break -- pseudo-goto
				end
				L4_152 = L3_151
				L4_152()
				break -- pseudo-goto
			end
			L3_151 = facebookSupport
			L3_151 = L3_151.init
			function L4_152()
				solicit(_ENV)
				local L1_161 = L1_161
			end
			L3_151(L4_152)
		end
	until true
end
function facebookSupport.refreshLikes(A0_162)
	local L1_163
	function L1_163(A0_169)
		if not A0_169.isError then
			L1_170 = L1_170(A0_169.response, "\"page_id\":(%d+)", "\"id\":\"%1\"")
			L2_171 = L2_171(L1_170)
			if L2_171 and L2_171.data then
				print("Found likes", #L2_171.data)
				_FOR_ = 1
				for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
					if L2_171.data[_FORV_7_].id == L9_9 then
						settings:set(L7_7, true)
					end
				end
			end
			L8_177 = A0_162
			if L8_177 then
				L8_177 = A0_162
				L9_178 = facebookSupport
				L9_178 = L9_178.canSolicit
				L9_178 = L9_178()
				if L9_178 then
					L9_178 = settings
					L10_179 = L9_178
					L9_178 = L9_178.get
					L11_180 = L7_7
					L12_181 = false
					L9_178 = L9_178(L10_179, L11_180, L12_181)
				end
				L8_177(L9_178)
			end
		end
		L1_170 = facebookSupport
		L1_170 = L1_170.pendingLikeCallbacks
		if L1_170 then
			L1_170 = 1
			L2_171 = facebookSupport
			L2_171 = L2_171.pendingLikeCallbacks
			L2_171 = #L2_171
			L8_177 = 1
			for L9_178 = L1_170, L2_171, L8_177 do
				L10_179 = facebookSupport
				L10_179 = L10_179.pendingLikeCallbacks
				L10_179 = L10_179[L9_178]
				L10_179()
			end
			L1_170 = facebookSupport
			L1_170.pendingLikeCallbacks = nil
		end
	end
	if not facebookSupport.pendingLikeCallbacks then
		facebookSupport.pendingLikeCallbacks = {}
	end
	print("refreshing likes")
	local L2_164 = L2_164
	local L3_165 = L3_165
	local L4_166 = L4_166
	local L5_167 = L5_167
	;({}).q = "SELECT page_id FROM page WHERE page_id IN (SELECT page_id FROM page_fan WHERE uid=me()) AND page_id=248687161869713"
	L2_164(L3_165, L4_166, L5_167, {})
	local L6_168 = L6_168
end
function facebookSupport.stop()
	_ENV.logout()
	facebookSupport.facebookEnabled = false
	facebookSupport.facebookId = nil
	facebookSupport.facebookName = nil
	_UPVALUE1_ = nil
	local L2_184 = L2_184
	L2_184(settings, L2_2, false)
	local L3_185 = L3_185
	L2_184 = settings
	L3_185 = L2_184
	L2_184 = L2_184.save
	L2_184(L3_185)
end
if facebookSupport.facebookEnabled then
	print("Eager FB init")
	facebookSupport.init(function()
		print("Eager FB init complete")
		local L1_186 = L1_186
	end)
end
