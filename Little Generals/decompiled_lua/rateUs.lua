local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = 86400
L1_1 = CUSTOM_OVERRIDES
L1_1 = L1_1.RATE_US_REMINDER_IN_SECONDS
if not L1_1 then
	L1_1 = 7 * L0_0
end
L2_2 = {}
function L3_3()
	if not settings then
		settings = require("settings").new("settings.json")
		settings:load()
		local L0_6 = L0_6
	end
	L0_6 = _ENV
	L0_6.lastReminded = settings:get("rateUsReminderDate", nil)
	L0_6 = _ENV
	L0_6.remind = settings:get("rateUsReminder", true)
	L0_6 = _ENV
	L0_6.versionRated = settings:get("rateUsVersion", nil)
	L0_6 = _ENV
	local L1_7, L2_8 = L1_7, L2_8
	local L3_9 = L3_9
	local L1_7, L4_10 = L1_7(L2_8, L3_9, false), L4_10
	L0_6.hasRated = L1_7
end
L2_2.reload = L3_3
function L4_4()
	_ENV.reload()
	if not _ENV.lastReminded then
		_ENV.lastReminded = os.time()
		local L2_13 = L2_13
		L2_13(settings, "rateUsReminderDate", _ENV.lastReminded)
		local L3_14 = L3_14
		L2_13 = settings
		L3_14 = L2_13
		L2_13 = L2_13.save
		L2_13(L3_14)
	end
	L2_13 = _ENV
	L2_13 = L2_13.hasRated
	if not L2_13 then
		L2_13 = _ENV
		L2_13 = L2_13.remind
		if L2_13 then
			L2_13 = os
			L2_13 = L2_13.time
			L2_13 = L2_13()
			L3_14 = _ENV
			L3_14 = L3_14.lastReminded
			L2_13 = L2_13 - L3_14
			L3_14 = L1_1
			if L2_13 >= L3_14 then
				L2_13 = _ENV
				L2_13 = L2_13.popRateDialog
				L2_13()
			end
		end
	end
end
L2_2.popRateDialogIfAppropriate = L4_4
function L5_5()
	local L0_15
	function L0_15(A0_23)
		if "clicked" == A0_23.action then
			_ENV.lastReminded = os.time()
			local L1_24 = L1_24
			L1_24(settings, "rateUsReminderDate", _ENV.lastReminded)
			L1_24 = A0_23.index
			if 3 == L1_24 then
				settings:set("rateUsReminder", false)
				settings:set("rateUsVersion", CURRENT_VERSION)
			elseif 2 == L1_24 then
				settings:set("rateUsReminder", true)
			elseif 1 == L1_24 then
				settings:set("rateUsCompleted", true)
				local L4_27 = L4_27
				L4_27(settings, "rateUsVersion", CURRENT_VERSION)
				local L5_28 = L5_28
				L4_27 = settings
				L5_28 = L4_27
				L4_27 = L4_27.save
				L4_27(L5_28)
				L4_27 = system
				L4_27 = L4_27.openURL
				L5_28 = utils
				L5_28 = L5_28.getRateUsLink
				L5_28 = L5_28()
				L4_27(L5_28, L5_28())
			end
			L4_27 = settings
			L5_28 = L4_27
			L4_27 = L4_27.save
			L4_27(L5_28)
		end
	end
	_ENV.lastReminded = os.time()
	settings:set("rateUsReminderDate", _ENV.lastReminded)
	settings:save()
	local L1_16 = L1_16
	local L2_17 = L2_17
	local L3_18 = L3_18
	local L4_19 = L4_19
	local L6_21 = L6_21
	L4_19[1] = L6_21
	L4_19[2] = "Remind Me Later"
	local L4_19[3], L7_22 = "No, don't ask again", L7_22
	L6_21 = L0_15
	L1_16 = L1_16(L2_17, L3_18, L4_19, L6_21)
end
L2_2.popRateDialog = L5_5
return L2_2
