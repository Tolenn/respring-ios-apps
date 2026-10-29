-- Decompiled & AI-Repaired from validate.lu
-- Source disassembly preserved at: disasm/validate.disasm

local L0_0, L3_3, L4_4, L5_5 = L0_0, "json", L4_4, L5_5
L0_0 = L0_0(L3_3)
L3_3 = require
L4_4 = "base64"
L3_3 = L3_3(L4_4)
L4_4 = {}
L4_4["0"] = "No Error"
L4_4["21000"] = "The App Store could not read the JSON object you provided."
L4_4["21002"] = "The data in the receipt-data property was malformed."
L4_4["21003"] = "The receipt could not be authenticated."
L4_4["21004"] = "The shared secret you provided does not match the shared secret on file for your account."
L4_4["21005"] = "The receipt server is not currently available."
L4_4["21006"] = "This receipt is valid but the subscription has expired. When this status code is returned to your server, the receipt data is also decoded and returned as part of the response."
L4_4["21007"] = "This receipt is a sandbox receipt, but it was sent to the production service for verification."
L4_4["21008"] = "This receipt is a production receipt, but it was sent to the sandbox service for verification."
function L5_5(A0_6, A1_7)
	local L2_8, L3_9
	L2_8 = A1_7.password
	L3_9 = A1_7.serverValidation
	A0_6 = A0_6:sub(2, -2)
	local L4_10 = L4_10
	L4_10 = L4_10(A0_6, " ", "")
	A0_6 = L4_10
	L4_10 = ""
	local L5_11 = A0_6:len()
	_FOR_ = 2
	for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
		if tonumber(A0_6:sub(_FORV_9_, _FORV_9_ + 1), 16) then
			L4_10 = L4_10 .. string.char((tonumber(A0_6:sub(_FORV_9_, _FORV_9_ + 1), 16)))
		end
	end
	L12_18 = _ENV
	L12_18 = L12_18.encode
	L13_19 = L4_10
	L12_18 = L12_18(L13_19)
	if L3_9 then
		return L12_18
	end
	L13_19 = L0_0
	L13_19 = L13_19.encode
	L14_20 = {}
	L14_20.receipt_data = L12_18
	L14_20.password = L2_8
	L13_19 = L13_19(L14_20)
	L14_20 = L13_19.gsub
	local L9_15 = L9_15
	local L10_16 = L10_16
	local L14_20, L11_17 = L14_20(L9_15, L10_16, "receipt-data"), L11_17
	L13_19 = L14_20
	return L13_19
end
;({}).start = function(A0_21)
	local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29
	L1_22 = A0_21.listener
	if not L1_22 then


-- [End of decompiled block; see disassembly for inner stripped closures]
