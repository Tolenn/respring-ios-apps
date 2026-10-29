local L0_0, L1_1
L0_0 = {}
L1_1 = {}
local L2_2 = L2_2
local L3_3 = L3_3
local L4_4 = L4_4
local L5_5 = L5_5
local L6_6 = L6_6
local L7_7 = L7_7
local L8_8 = L8_8
L1_1[1] = L2_2
L1_1[2] = L3_3
L1_1[3] = L4_4
L1_1[4] = L5_5
L1_1[5] = L6_6
L1_1[6] = L7_7
L1_1[7] = L8_8
local L1_1[8], L9_9 = "nist1-ny.ustiming.org", L9_9
L0_0.serverList = L1_1
L1_1 = 2208988800
function L2_2(A0_10)
	if A0_10 then
		return _ENV.serverList[math.mod(A0_10, #_ENV.serverList) + 1], math.mod(A0_10, #_ENV.serverList) + 1
	end
	local L1_11 = L1_11
	local L2_12 = L2_12
	local L3_13 = #_ENV.serverList
	L1_11 = L1_11(L2_12, L3_13)
	L2_12 = _ENV
	L2_12 = L2_12.serverList
	L2_12 = L2_12[L1_11]
	L3_13 = L1_11
	return L2_12, L3_13
end
function L3_3(A0_14, A1_15)
	local L2_16 = L2_16
	L2_16 = L2_16(settings, "TIME_REFRESH", 0)
	if _ENV.offset and math.abs(os.time() - L2_16) < 3600 then
		return
	end
	local L3_17 = L3_17
	L3_17 = L3_17("socket")
	local L4_18 = L4_18
	local L4_18, L5_19 = L4_18(A0_14)
	local L6_20 = L6_20
	local L6_20, L7_21 = L6_20(L4_18), L7_21
	L7_21 = 37
	local L8_22 = L3_17.udp()
	if L6_20 and L8_22 then
		print("RT", L5_19)
		L8_22:setpeername(L6_20, L7_21)
		L8_22:settimeout(2)
		local L9_23, L10_24 = L9_23, L10_24
		L9_23, L10_24 = L9_23(L10_24, "")
		local L11_25, L12_26 = L8_22:receive()
		L8_22:close()
		L8_22 = nil
		if not L11_25 then
			print(L12_26)
			if not A1_15 then
			end
			if 0 < 5 then
				timer.performWithDelay(1000, _ENV.refresh(L5_19 + 1, 5 - 1))
			else
				settings:set("TIME_REFRESH", os.time())
			end
			return
		end
		function unpack_uint32(A0_33)
			local L1_34 = L1_34
			L1_34 = L1_34(A0_33)
			if L1_34 ~= 4 then
				L1_34 = false
				valid = L1_34
			else
				L1_34 = true
				valid = L1_34
				L1_34 = string
				L1_34 = L1_34.byte
				L1_34 = L1_34(string.sub(A0_33, 1, 1))
				a = L1_34
				L1_34 = string
				L1_34 = L1_34.byte
				L1_34 = L1_34(string.sub(A0_33, 2, 2))
				b = L1_34
				L1_34 = string
				L1_34 = L1_34.byte
				L1_34 = L1_34(string.sub(A0_33, 3, 3))
				c = L1_34
				L1_34 = string
				L1_34 = L1_34.byte
				local L2_35 = L2_35
				local L3_36 = L3_36
				local L4_37 = L4_37
				local L2_35, L3_36, L4_37, L5_38 = L2_35(L3_36, L4_37, 4)
				L1_34 = L1_34(L2_35, L3_36, L4_37, L5_38)
				d = L1_34
				L1_34 = a
				L1_34 = L1_34 * 256
				L1_34 = L1_34 * 256
				L1_34 = L1_34 * 256
				L2_35 = b
				L2_35 = L2_35 * 256
				L2_35 = L2_35 * 256
				L1_34 = L1_34 + L2_35
				L2_35 = c
				L2_35 = L2_35 * 256
				L1_34 = L1_34 + L2_35
				L2_35 = d
				L1_34 = L1_34 + L2_35
				result = L1_34
			end
			L1_34 = valid
			L2_35 = result
			return L1_34, L2_35
		end
		local L13_27 = L13_27
		local L13_27, L14_28 = L13_27(L11_25)
		if L13_27 then
			_ENV.offset = L14_28 - L1_1 - os.time()
			local L18_32 = L18_32
			L18_32(settings, "TIME_REFRESH", os.time())
			L18_32 = print
			local L16_30 = L16_30
			L18_32(L16_30, _ENV.offset)
			local L17_31 = L17_31
		end
	end
end
L0_0.refresh = L3_3
function L3_3()
	local L2_41 = timer.performWithDelay
	L2_41(1, function()
		_ENV.refresh()
	end)
	L2_41 = os
	L2_41 = L2_41.time
	L2_41 = L2_41()
	if not _ENV.offset then
	end
	L2_41 = L2_41 + 0
	return L2_41
end
L0_0.current = L3_3
return L0_0
