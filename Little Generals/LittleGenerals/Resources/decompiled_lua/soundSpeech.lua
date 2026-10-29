local L0_0 = L0_0
L0_0((...), package.seeall)
L0_0 = {}
local L1_1 = L1_1
local L2_2 = L2_2
local L3_3 = L3_3
local L4_4 = L4_4
local L5_5 = L5_5
local L6_6 = L6_6
L0_0[1] = L1_1
L0_0[2] = L2_2
L0_0[3] = L3_3
L0_0[4] = L4_4
L0_0[5] = L5_5
L0_0[6] = L6_6
local L0_0[7], L7_7 = "res/sounds/talk7.mp3", L7_7
function L1_1(A0_8)
	if A0_8 <= 0 or A0_8 > #_ENV then
		A0_8 = #_ENV
	end
	local L1_9 = L1_9
	local L2_10 = L2_10
	local ({}).channel, L4_12 = sound.getSpeechChannel(), L4_12
	function L4_12.onComplete()
		local L2_14 = L2_14
		L2_14(_ENV[A0_8])
	end
	L1_9(L2_10, L4_12)
end
say = L1_1
