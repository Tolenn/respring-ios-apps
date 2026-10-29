local L0_0
L0_0 = {}
L0_0.list = settings:get("reminderList", nil)
if not L0_0.list then
	L0_0.list = {}
	local L1_1, L2_2 = L1_1, L2_2
	local L3_3 = L3_3
	L1_1(L2_2, L3_3, L0_0.list)
	local L4_4 = L4_4
end
function L1_1(A0_5, A1_6, A2_7)
	local L3_8, L4_9
	L3_8 = A2_7 or L3_8
	L3_8 = A2_7 ~= nil and A2_7 or A2_7 == nil
	L4_9 = REMINDERS_ENABLED
	if not L4_9 then
		return
	end
	L4_9 = _ENV
	L4_9 = L4_9.list
	L8_13 = L4_9[A0_5]
	if L8_13 and not L3_8 then
		return
	end
	L8_13 = L4_9[A0_5]
	if not L8_13 then
		L8_13 = {}
		L4_9[A0_5] = L8_13
	elseif L3_8 then
		L8_13 = _ENV
		L8_13 = L8_13.cancelIfPresent
		L8_13(A0_5)
		L8_13 = {}
		L4_9[A0_5] = L8_13
	end
	L8_13 = 1
	_FOR_ = 1
	for _FORV_8_ = L8_13, _FOR_, _FOR_ do
		local L12_17 = L12_17
		table.insert(L4_9[A0_5], A1_6[_FORV_8_])
		local L13_18 = L13_18
	end
	L8_13 = settings
	L9_14 = L8_13
	L8_13 = L8_13.save
	L8_13(L9_14)
end
L0_0.scheduleIfNecessary = L1_1
function L1_1(A0_19)
	local L1_20, L2_21
	L1_20 = _ENV
	L1_20 = L1_20.list
	L2_21 = L1_20[A0_19]
	if L2_21 then
		L1_20[A0_19] = nil
		L6_25 = system
		L6_25 = L6_25.cancelNotification
		L6_25()
		L6_25 = pairs
		L7_26 = L1_20
		L6_25, L7_26, L9_28 = L6_25(L7_26)
		for L11_30, _FORV_7_ in L6_25, L7_26, L9_28 do
			_FOR_ = 1
			for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
				if _FORV_7_[_FORV_11_].time - os.time() > 0 then
					system.scheduleNotification(_FORV_7_[_FORV_11_].time - os.time(), _FORV_7_[_FORV_11_].alert)
				end
			end
		end
		L6_25 = settings
		L7_26 = L6_25
		L6_25 = L6_25.save
		L6_25(L7_26)
	end
end
L0_0.cancelIfPresent = L1_1
function L1_1()
	system.cancelNotification()
	_ENV.list = {}
	local L2_38 = L2_38
	L2_38(settings, "reminderList", _ENV.list)
	local L3_39 = L3_39
	L2_38 = settings
	L3_39 = L2_38
	L2_38 = L2_38.save
	L2_38(L3_39)
end
L0_0.cancelAll = L1_1
return L0_0
