local L0_0, L5_5 = L0_0, "storyboard"
L0_0 = L0_0(L5_5)
L5_5 = {}
L5_5.queue = {}
local L2_2, L3_3 = L2_2, L3_3
local L4_4 = L4_4
L2_2(L3_3, L4_4, function(A0_6)
	if A0_6.operation == "add" then
		local L2_7 = _ENV.getScene("battlefieldScene")
		if L2_7 == nil then
			L2_7 = L1_1
			L2_7 = L2_7.show
			L2_7()
		end
	end
end)
function L2_2(A0_8)
	if not A0_8.autoClose then
		A0_8.autoClose = 4000
	end
	table.insert(_ENV.queue, A0_8)
	local L1_9, L2_10 = L1_9, L2_10
	;({}).name = "notificationQueue"
	;({}).operation = "add"
	L1_9(L2_10, {})
	local L3_11 = L3_11
end
L5_5.add = L2_2
function L2_2()
	local L0_12, L1_13
	L0_12 = _ENV
	L0_12 = L0_12.queue
	L0_12 = #L0_12
	return L0_12
end
L5_5.size = L2_2
function L2_2()
	local L0_14, L1_15
	L0_14 = _ENV
	L0_14 = L0_14.current
	if L0_14 then
		return
	end
	L0_14 = _ENV
	L0_14 = L0_14.queue
	L0_14 = #L0_14
	if 0 < L0_14 then
		L0_14 = _ENV
		L0_14 = L0_14.queue
		L0_14 = L0_14[1]
		L1_15 = L0_14.onClose
		function L0_14.onClose(A0_19)
			_ENV.current = nil
			if L1_15 then
				L1_15(A0_19)
				local L2_21 = L2_21
			end
			L2_21 = _ENV
			L2_21 = L2_21.show
			L2_21()
		end
		table.remove(_ENV.queue, 1)
		local L4_18 = L4_18
		L4_18 = utils
		L4_18 = L4_18.getNotificationSlider
		local L4_18, L3_17 = L4_18(L0_14), L3_17
		L3_17 = {}
		L4_18.transitions = L3_17
		L3_17 = _ENV
		L3_17.current = L4_18
	end
end
L5_5.show = L2_2
function L2_2()
	local L0_22
	L0_22 = _ENV
	L0_22 = L0_22.current
	if L0_22 then
		L0_22 = _ENV
		L0_22 = L0_22.current
		L2_24 = L0_22.close
		L2_24()
		L2_24 = L0_22.timers
		if L2_24 then
			L2_24 = 1
			L3_25 = L0_22.timers
			L3_25 = #L3_25
			L4_26 = 1
			for _FORV_4_ = L2_24, L3_25, L4_26 do
				timer.cancel(L0_22.timers[_FORV_4_])
			end
		end
		L2_24 = L0_22.transitions
		if L2_24 then
			L2_24 = 1
			L3_25 = L0_22.transitions
			L3_25 = #L3_25
			L4_26 = 1
			for _FORV_4_ = L2_24, L3_25, L4_26 do
				transition.cancel(L0_22.transitions[_FORV_4_])
				local L6_28 = L6_28
			end
		end
	end
end
L5_5.hide = L2_2
return L5_5
