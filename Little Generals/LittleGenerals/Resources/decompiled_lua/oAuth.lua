local L5_5 = L5_5
L5_5((...), package.seeall)
L5_5 = require
L5_5 = L5_5("socket.http")
local L1_1 = L1_1
L1_1 = L1_1("ltn12")
local L2_2 = L2_2
L2_2 = L2_2("crypto")
local L3_3 = L3_3
local L3_3, L4_4 = L3_3("mime"), L4_4
function L4_4(A0_6, A1_7, A2_8, A3_9)
	local L4_10
	L4_10 = {}
	L4_10.oauth_consumer_key = A0_6
	L4_10.oauth_timestamp = get_timestamp()
	L4_10.oauth_version = "1.0"
	L4_10.oauth_nonce = get_nonce()
	L4_10.oauth_callback = A1_7
	L4_10.oauth_signature_method = "HMAC-SHA1"
	local L5_11 = L5_11
	L5_11 = L5_11(A2_8, "POST", L4_10, A3_9)
	local L6_12 = L6_12
	L6_12 = L6_12(A2_8, L5_11)
	local L7_13 = L7_13
	L7_13 = L7_13(L6_12, "oauth_token=([^&]+)")
	local L8_14, L9_15 = L8_14, L9_15
	local L8_14, L10_16 = L8_14(L9_15, "oauth_token_secret=([^&]+)"), L10_16
	L9_15 = {}
	L9_15.token = L7_13
	L9_15.token_secret = L8_14
	return L9_15
end
getRequestToken = L4_4
function L4_4(A0_17, A1_18, A2_19, A3_20, A4_21, A5_22, A6_23)
	local L7_24
	L7_24 = {}
	L7_24.oauth_consumer_key = A3_20
	L7_24.oauth_timestamp = get_timestamp()
	L7_24.oauth_version = "1.0"
	L7_24.oauth_nonce = get_nonce()
	L7_24.oauth_token = A0_17
	L7_24.oauth_token_secret = A2_19
	L7_24.oauth_verifier = A1_18
	L7_24.oauth_signature_method = "HMAC-SHA1"
	local L8_25 = L8_25
	L8_25 = L8_25(A5_22, "POST", L7_24, A4_21)
	local L9_26 = L9_26
	local L10_27 = L10_27
	local L11_28 = L11_28
	local L9_26, L12_29 = L9_26(L10_27, L11_28, A6_23), L12_29
	return L9_26
end
getAccessToken = L4_4
function L4_4(A0_30, A1_31, A2_32, A3_33, A4_34, A5_35, A6_36, A7_37)
	local L8_38
	L8_38 = {}
	L8_38.oauth_consumer_key = A2_32
	L8_38.oauth_nonce = get_nonce()
	L8_38.oauth_signature_method = "HMAC-SHA1"
	L8_38.oauth_token = A3_33
	L8_38.oauth_timestamp = get_timestamp()
	L8_38.oauth_version = "1.0"
	L8_38.oauth_token_secret = A5_35
	_FOR_ = 1
	for _FORV_12_ = _FOR_, _FOR_, _FOR_ do
		L8_38[A1_31[_FORV_12_].key] = A1_31[_FORV_12_].value
	end
	local L9_39 = L9_39
	local L10_40 = L10_40
	L9_39 = L9_39(L10_40, A6_36, L8_38, A4_34)
	L10_40 = nil
	if A6_36 == "POST" then
		local L14_44 = rawPostRequest(A0_30, L9_39, A7_37)
		L10_40 = L14_44
		break -- pseudo-goto
	end
	L14_44 = rawGetRequest
	local L12_42 = L12_42
	local L14_44, L13_43 = L14_44(L12_42, A7_37), L13_43
	repeat
		L10_40 = L14_44
	until true
	return L10_40
end
makeRequest = L4_4
function L4_4(A0_45, A1_46, A2_47, A3_48)
	local L4_49, L5_50
	repeat
		L4_49 = A2_47.oauth_token_secret
		if not L4_49 then
			L4_49 = ""
		end
		A2_47.oauth_token_secret = nil
		L5_50 = {}
		_FOR_, _FOR_, _FOR_ = pairs(A2_47)
		for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
			({}).key = encode_parameter(_FORV_9_)
			;({}).val = encode_parameter(_FORV_10_)
			table.insert(L5_50, {})
		end
		local L6_51 = L6_51
		L6_51(L5_50, function(A0_62, A1_63)
			local L2_64, L3_65
			L2_64 = A0_62.key
			L3_65 = A1_63.key
			if L2_64 < L3_65 then
				L2_64 = true
				return L2_64
			else
				L2_64 = A0_62.key
				L3_65 = A1_63.key
				if L2_64 > L3_65 then
					L2_64 = false
					return L2_64
				else
					L2_64 = A0_62.val
					L3_65 = A1_63.val
					L2_64 = L2_64 < L3_65
					return L2_64
				end
			end
		end)
		L6_51 = {}
		_FOR_, _FOR_, _FOR_ = pairs(L5_50)
		for _FORV_10_, _FORV_11_ in _FOR_, _FOR_, _FOR_ do
			table.insert(L6_51, _FORV_11_.key .. "=" .. _FORV_11_.val)
		end
		L16_61 = table
		L16_61 = L16_61.concat
		L16_61 = L16_61(L6_51, "&")
		local L8_53 = L8_53
		L8_53 = L8_53 .. "&" .. encode_parameter(A0_45) .. "&" .. encode_parameter(L16_61)
		local L9_54 = L9_54
		L9_54 = L9_54 .. "&" .. encode_parameter(L4_49)
		local L10_55 = L10_55
		L10_55 = L10_55(L8_53, L9_54, true)
		local L11_56 = L11_56
		L11_56 = L11_56(L10_55)
		local L12_57 = L12_57
		L12_57 = L12_57 .. "&oauth_signature=" .. encode_parameter(L11_56)
		if A1_46 == "GET" then
			local L13_58 = L13_58
			local L14_59 = L14_59
			local L13_58, L15_60 = L13_58 .. L14_59 .. L12_57, L15_60
			do return L13_58 end
			break -- pseudo-goto
		end
		return L12_57
	until true
end
oAuthSign = L4_4
function L4_4(A0_66)
	local L1_67, L2_68, L4_70 = L1_67, L2_68, "[^-%._~a-zA-Z0-9]"
	return L1_67(L2_68, L4_70, function(A0_71)
		local L3_74, L4_75 = L3_74, L4_75
		L3_74 = L3_74(L4_75, A0_71:byte())
		L4_75 = L3_74
		L3_74 = L3_74.upper
		return L3_74(L4_75)
	end)
end
encode_parameter = L4_4
function L4_4(A0_76, A1_77, A2_78)
	if not A2_78 then
		A2_78 = false
	end
	local L3_79 = L3_79
	local L4_80 = L4_80
	local L5_81 = L5_81
	local L6_82 = L6_82
	do return L3_79(L4_80, L5_81, L6_82, A2_78) end
	local L7_83 = L7_83
end
sha1 = L4_4
function L4_4()
	local L0_84
	L0_84 = _ENV
	L0_84 = L0_84.b64
	local L1_85 = L1_85
	local L2_86 = L2_86
	local L6_90 = L6_90
	L6_90 = L6_90 .. "random" .. tostring(os.time())
	local L1_85, L2_86, L6_90, L4_88 = L1_85(L2_86, L6_90, "keyyyy")
	return L0_84(L1_85, L2_86, L6_90, L4_88, L1_85(L2_86, L6_90, "keyyyy"))
end
get_nonce = L4_4
function L4_4()
	do return tostring(os.time() + 1) end
	local L1_91 = L1_91
end
get_timestamp = L4_4
function L4_4(A0_92, A1_93)
	repeat
		if A1_93 then
			local L2_94 = L2_94
			local L3_95 = L3_95
			local L4_96 = L4_96
			local L5_97 = L5_97
			L2_94(L3_95, L4_96, L5_97, nil)
			break -- pseudo-goto
		end
		L2_94 = nil
		L3_95 = nil
		L4_96 = nil
		L5_97 = {}
		;({}).url = A0_92
		local L9_101 = L9_101
		;({}).sink = L1_1.sink.table(L5_97)
		L3_95, L4_96, L9_101 = L9_101({})
		L2_94 = L9_101
		L9_101 = table
		L9_101 = L9_101.concat
		local L7_99 = L7_99
		local L9_101, L8_100 = L9_101(L7_99, ""), L8_100
		L7_99 = L2_94
		L8_100 = L3_95
		return L9_101, L7_99, L8_100, L4_96
	until true
end
function rawPostRequest(A0_102, A1_103, A2_104)
	local L3_105
	repeat
		if A2_104 then
			L3_105 = {}
			;({})["Content-Type"] = "application/x-www-form-urlencoded"
			L3_105.header, ({})["Content-Length"] = {}, string.len(A1_103)
			L3_105.body = A1_103
			local L4_106 = L4_106
			local L5_107 = L5_107
			local L6_108 = L6_108
			L4_106(L5_107, L6_108, A2_104, L3_105)
			break -- pseudo-goto
		end
		L3_105 = nil
		L4_106 = nil
		L5_107 = nil
		L6_108 = {}
		;({}).url = A0_102
		;({}).method = "POST"
		;({})["Content-Type"] = "application/x-www-form-urlencoded"
		local L11_113 = L11_113
		;({}).headers, ({})["Content-Length"] = {}, string.len(A1_103)
		;({}).source = L1_1.source.string(A1_103)
		;({}).sink = L1_1.sink.table(L6_108)
		L4_106, L5_107, L11_113 = L11_113({})
		L3_105 = L11_113
		L11_113 = table
		L11_113 = L11_113.concat
		local L8_110 = L8_110
		do return L11_113(L8_110, "") end
		local L9_111 = L9_111
	until true
end
function responseToTable(A0_114, A1_115)
	local L2_116
	L2_116 = {}
	while A0_114:find(A1_115[1]) ~= nil do
		if 1 < #A1_115 then
			A0_114 = A0_114:sub(A0_114:find(A1_115[1]) + A1_115[1]:len())
			if A0_114:find(A1_115[2]) == nil then
			else
				local L12_126 = L12_126
				A0_114 = A0_114:sub(A0_114:find(A1_115[2]) + A1_115[2]:len(), A0_114:len())
			end
			L2_116[A0_114:sub(1, A0_114:find(A1_115[1]) - 1)] = A0_114:sub(1, A0_114:find(A1_115[2]) - 1)
			print(A0_114:sub(1, A0_114:find(A1_115[1]) - 1) .. ":" .. A0_114:sub(1, A0_114:find(A1_115[2]) - 1))
			break -- pseudo-goto
		end
		L12_126 = A0_114.find
		L12_126 = L12_126(A0_114, A1_115[1])
		local L4_118, L5_119 = L4_118, L5_119
		L4_118 = L4_118(L5_119, L12_126 + A1_115[1]:len())
		A0_114 = L4_118
		L4_118 = nil
		L5_119 = nil
		if A0_114:find(A1_115[1]) == nil then
			L4_118 = A0_114:len()
			L5_119 = A0_114
		else
			L4_118 = A0_114:find(A1_115[1])
			L5_119 = A0_114:sub(1, L4_118 - 1)
			local L8_122 = L8_122
			local L9_123, L10_124 = L9_123, L10_124
			L8_122 = L8_122(L9_123, L10_124, A0_114:len())
			A0_114 = L8_122
		end
		L8_122 = #L2_116
		L8_122 = L8_122 + 1
		L2_116[L8_122] = L5_119
		L8_122 = print
		L9_123 = L5_119
		L8_122(L9_123)
		repeat
		until true
	end
	return L2_116
end
