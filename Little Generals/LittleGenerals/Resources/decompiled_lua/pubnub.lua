-- Decompiled & AI-Repaired from pubnub.lu
-- Source disassembly preserved at: disasm/pubnub.disasm

local L2_2, L3_3, L4_4 = L2_2, "Json", L4_4
L2_2(L3_3)
L2_2 = require
L3_3 = "crypto"
L2_2(L3_3)
L2_2 = {}
pubnub = L2_2
L2_2 = 1700
L3_3 = 30000
L4_4 = {}
L4_4.publish_key = "pub-37c3873d-08ba-4bbe-adac-a22c6e9a40e8"
L4_4.subscribe_key = "sub-217f2ad9-6314-11e1-b7b1-535f0c319fa9"
L4_4.secret_key = "sec-10c47efa-04b1-4ad2-b56b-225c6a4bdad0"
L4_4.ssl = nil
L4_4.origin = "pubsub.pubnub.com"
function pubnub.new(A0_5)
	if not A0_5 then
		local L1_6 = L1_6
		local L1_6, L2_7 = L1_6(_ENV), L2_7
	end
	L2_7 = {}
	if L1_6.ssl then
		L1_6.origin = "https://" .. L1_6.origin
	else
		local L3_8 = L3_8
		local L3_8, L4_9 = L3_8 .. L1_6.origin, L4_9
		L1_6.origin = L3_8
	end
	function L3_8(A0_10, A1_11)
		local L2_12
		L2_12 = A1_11.callback
		if not L2_12 then


-- [End of decompiled block; see disassembly for inner stripped closures]
