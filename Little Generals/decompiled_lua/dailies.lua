-- Decompiled & AI-Repaired from dailies.lu
-- Source disassembly preserved at: disasm/dailies.disasm

local L0_0, L1_1, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15 = L0_0, (...), L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15
L3_3 = package
L3_3 = L3_3.seeall
L0_0(L1_1, L3_3)
L0_0 = 50
L1_1 = "lastDay"
L3_3 = "eventTimes"
L4_4 = "playReminders"
L5_5 = false
L6_6 = 1
L7_7 = 1
L8_8 = 60 * L7_7
L9_9 = 60 * L8_8
L10_10 = 24 * L9_9
L11_11 = nil
L12_12 = nil
L13_13 = {}
L14_14 = {}
L15_15 = {}
L15_15.interval = 12 * L9_9
L15_15.attritionTime = 24 * L9_9
L14_14.warbuxCollection = L15_15
L15_15 = {}
L15_15.interval = 24 * L9_9
L15_15.amount = WARBUX_AWARDS.DAILY_ALLOWANCE
L14_14.dailyAllowance = L15_15
L15_15 = {}
;({}).id = "playReminder2day"
;({}).name = "2 Day Reminder"
;({}).interval = 2 * L10_10
;({}).msg = "You haven't inspected the troops in a while, Sir. HQ has sent you " .. WARBUX_AWARDS.REMINDER_2_DAY .. " free warbux."
;({}).func = function(A0_23)
	local L2_24 = L2_24
	do return L2_24(A0_23, WARBUX_AWARDS.REMINDER_2_DAY) end
	local L3_25 = L3_25
end
local L16_16 = L16_16
;({}).id = "playReminder7day"
;({}).name = "7 Day Reminder"
;({}).interval = 7 * L10_10
;({}).msg = "Sir! The troops are getting bored Sir! " .. WARBUX_AWARDS.REMINDER_2_DAY + WARBUX_AWARDS.REMINDER_7_DAY .. " free warbux needs spending on munitions!"
;({}).func = function(A0_26)
	local L2_27 = L2_27
	do return L2_27(A0_26, WARBUX_AWARDS.REMINDER_7_DAY) end
	local L3_28 = L3_28
end
local L17_17 = L17_17
;({}).id = "playReminder14day"
;({}).name = "14 Day Reminder"
;({}).interval = 14 * L10_10
;({}).msg = "Sir! In war there is no substitute for victory. " .. WARBUX_AWARDS.REMINDER_2_DAY + WARBUX_AWARDS.REMINDER_7_DAY + WARBUX_AWARDS.REMINDER_14_DAY .. " free warbux awaits you to help re-supply."
;({}).func = function(A0_29)
	local L2_30 = L2_30
	do return L2_30(A0_29, WARBUX_AWARDS.REMINDER_14_DAY) end
	local L3_31 = L3_31
end
local L18_18 = L18_18
;({}).id = "playReminder30day"
;({}).name = "30 Day Reminder"
;({}).interval = 30 * L10_10
local L21_21 = L21_21
local L22_22 = L22_22
L22_22.msg = "Sir! A pile of " .. WARBUX_AWARDS.REMINDER_2_DAY + WARBUX_AWARDS.REMINDER_7_DAY + WARBUX_AWARDS.REMINDER_14_DAY + WARBUX_AWARDS.REMINDER_30_DAY .. " free warbux is getting dusty, come spend it!"
function L22_22.func(A0_32)
	local L2_33 = L2_33
	do return L2_33(A0_32, WARBUX_AWARDS.REMINDER_30_DAY) end
	local L3_34 = L3_34
end
L16_16[1] = L17_17
L16_16[2] = L18_18
L16_16[3] = L21_21
L16_16[4] = L22_22
L15_15.reminders = L16_16
L14_14.playReminder = L15_15
function L15_15()
	do return utils.deepcopy(_ENV) end
	local L1_35 = L1_35
end
getTimeEvents = L15_15
function L15_15(A0_36)
	local L1_37, L2_38, L3_39
	local L7_43 = os.time
	L7_43 = L7_43()
	L8_44 = pairs
	L9_45 = A0_36.countries
	L8_44, L9_45, L10_46 = L8_44(L9_45)
	for L11_47, _FORV_9_ in L8_44, L9_45, L10_46 do
		if _FORV_9_.underAttackDate then
			if L7_43 < _FORV_9_.underAttackDate and (not L2_38 or L2_38 > _FORV_9_.underAttackDate) then
				L2_38 = _FORV_9_.underAttackDate
			end
			if _FORV_9_.underAttackDate and L7_43 < _FORV_9_.underAttackDate + _ENV.cpuAttack.attritionTime and (not L3_39 or L3_39 > _FORV_9_.underAttackDate + _ENV.cpuAttack.attritionTime) then
				L3_39 = _FORV_9_.underAttackDate + _ENV.cpuAttack.attritionTime
			end
		end
	end
	if L2_38 and L3_39 then
		if L2_38 < L3_39 then
			L1_37 = L2_38
		else
			L1_37 = L3_39
		end
	elseif L2_38 then
		return L2_38
	elseif L3_39 then
		return L3_39
	end
	return L1_37
end
getNextAttackEventTime = L15_15
function L15_15(A0_48)
	local L1_49
	if A0_48 then
		L1_49 = _ENV
		L1_49 = L1_49.cpuAttack
		L1_49 = L1_49.attritionTime
		L1_49 = A0_48 + L1_49
		L1_49 = L1_49 - os.time()
		local L2_50 = L2_50
		do return L2_50(L1_49) end
		local L3_51 = L3_51
	end
	L1_49 = "00:00:00"
	return L1_49
end
getFormattedAttritionCountdown = L15_15
function L15_15(A0_52)
	if 0 < A0_52 then
		local L1_53 = L1_53
		L1_53 = L1_53(A0_52 / _ENV)
		if 0 < L1_53 then
			L1_53 = tostring(L1_53) .. "d "
		else
			L1_53 = ""
		end
		A0_52 = A0_52 % _ENV
		L1_53 = L1_53 .. utils.padText(math.floor(A0_52 / L9_9), -2, "0") .. ":"
		A0_52 = A0_52 % L9_9
		L1_53 = L1_53 .. utils.padText(math.floor(A0_52 / L8_8), -2, "0") .. ":"
		A0_52 = A0_52 % L8_8
		local L2_54 = L2_54
		local L4_56 = L4_56
		local L5_57 = L5_57
		local L4_56, L6_58 = L4_56(L5_57, -2, "0"), L6_58
		L1_53 = L2_54 .. L4_56
		return L1_53
	end
	L1_53 = "00:00:00"
	return L1_53
end
getFormattedCountdown = L15_15
function L15_15()
	settings:set(_ENV, nil)
	local L1_59 = L1_59
	local L2_60 = L2_60
	L1_59(L2_60, L2_2, nil)
	local L3_61 = L3_61
end
clearDailies = L15_15
function L15_15()
	local L1_62
	L1_62 = _ENV
	return L1_62
end
getEventLog = L15_15
function L15_15()
	local L1_63
	L1_63 = {}
	_ENV = L1_63
end
clearEventLog = L15_15
function L15_15(A0_64, A1_65)
	local L2_66
	L2_66 = false
	local L3_67, L4_68 = L3_67, L4_68
	local L3_67, L5_69 = L3_67(L4_68, _ENV), L5_69
	L4_68 = "cpuAttack"
	L5_69 = L14_14
	L5_69 = L5_69[L4_68]
	L2_66 = runPredictedAttacks(A0_64, A1_65)
	if L2_66 then
		L3_67[L4_68] = A1_65
		settings:set(_ENV, L3_67)
	end
	_FOR_, _FOR_, _FOR_ = pairs(A0_64.countries)
	for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
		if isExpiredAttack(A1_65, _FORV_10_.underAttackDate) then
			addToEventLog(_FORV_10_.underAttackDate + L14_14.cpuAttack.attritionTime, getLostCountryHeadline(_FORV_10_.name))
			L2_66 = true
			_FORV_10_.owned = false
			_FORV_10_.underAttackDate = nil
			_FORV_10_.moneyStartDate = nil
			_FORV_10_.moneyAmount = 0
		end
	end
	if L2_66 then
		L11_75 = settings
		L12_76 = L11_75
		L11_75 = L11_75.set
		L13_77 = _ENV
		L14_78 = L3_67
		L11_75(L12_76, L13_77, L14_78)
	end
	return L2_66
end
function L16_16(A0_79, A1_80)
	local L2_81
	L2_81 = {}
	L2_81.time = A0_79
	L2_81.text = A1_80
	local L3_82 = L3_82
	local L4_83 = L4_83
	L3_82(L4_83, L2_81)
	local L5_84 = L5_84
end
addToEventLog = L16_16
function L16_16(A0_85)
	local L1_86 = L1_86
	L1_86 = L1_86(1, 10)
	local L2_87 = L2_87
	L2_87 = L2_87 .. A0_85 .. " in a hail of hot lead and fire."
	if L1_86 == 1 then
		L2_87 = A0_85 .. " now under enemy control."
	elseif L1_86 == 2 then
		L2_87 = "Your forces were defeated in " .. A0_85
	elseif L1_86 == 3 then
		L2_87 = "You callously left your troops for dead in " .. A0_85
	elseif L1_86 == 4 then
		L2_87 = "You were soundly whooped in " .. A0_85
	elseif L1_86 == 5 then
		L2_87 = "Your troops curse your name as the enemy rolls into " .. A0_85
	elseif L1_86 == 6 then
		local L3_88 = L3_88
		local L2_87, L4_89 = L3_88 .. " defeneses overrun.", L4_89
	end
	return L2_87
end
getLostCountryHeadline = L16_16
function L16_16(A0_90)
	local L1_91 = L1_91
	L1_91 = L1_91(1, 10)
	local L2_92 = L2_92
	L2_92 = L2_92 .. " has come under attack!"
	if L1_91 == 1 then
		L2_92 = A0_90 .. " besieged by enemy forces!"
	elseif L1_91 == 2 then
		L2_92 = A0_90 .. " requires your skilled defense!"
	elseif L1_91 == 3 then
		L2_92 = "Enemy tanks rolling into " .. A0_90
	elseif L1_91 == 4 then
		local L3_93 = L3_93
		local L2_92, L4_94 = L3_93 .. A0_90, L4_94
	end
	return L2_92
end
getCountryUnderAttackHeadline = L16_16
function L16_16()
	local L0_95, L1_96 = L0_95, L1_96
	local L0_95, L2_97 = L0_95(L1_96, _ENV), L2_97
	if L0_95 ~= nil then
		L1_96 = L0_95.cpuAttack
		if L1_96 then
			return L1_96
		end
	end
	L1_96 = nil
	return L1_96
end
getLastCPUAttackTime = L16_16
function L16_16(A0_98, A1_99)
	local L2_100
	L2_100 = false
	L5_103 = pairs
	L6_104 = A0_98.countries
	L5_103, L6_104, L7_105 = L5_103(L6_104)
	for _FORV_6_, _FORV_7_ in L5_103, L6_104, L7_105 do
		if _FORV_7_.underAttackDate then
			if isExpiredAttack(A1_99, _FORV_7_.underAttackDate) then
				addToEventLog(_FORV_7_.underAttackDate + _ENV.cpuAttack.attritionTime, getLostCountryHeadline(_FORV_7_.name))
				_FORV_7_.owned = false
				_FORV_7_.underAttackDate = nil
				_FORV_7_.moneyStartDate = nil
				_FORV_7_.moneyAmount = 0
				L2_100 = true
			elseif A1_99 >= _FORV_7_.underAttackDate and _FORV_7_.underAttackDate > A1_99 - L6_6 then
				local L10_108 = L10_108
				local L11_109 = L11_109
				repeat
					L10_108(L11_109, getCountryUnderAttackHeadline(_FORV_7_.name))
					_FORV_7_.moneyStartDate = nil
					_FORV_7_.moneyAmount = 0
					L2_100 = true
					break -- pseudo-goto
				until true
			end
		end
	end
	return L2_100
end
runPredictedAttacks = L16_16
function L16_16(A0_110, A1_111)
	local L3_113 = system.getTimer
	L3_113 = L3_113()
	local L4_114 = L4_114
	_FOR_, _FOR_, _FOR_ = pairs(A0_110.countries)
	for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_8_.underAttackDate and A1_111 < _FORV_8_.underAttackDate then
			_FORV_8_.underAttackDate = nil
		end
	end
	L9_119 = 0
	while 0 < L4_114 and L9_119 <= 100 do
		A1_111 = A1_111 + _ENV.cpuAttack.interval
		L4_114 = makeNewCountryAttacks(A0_110, A1_111)
		L9_119 = L9_119 + 1
	end
	setAttackReminders(A0_110)
	local L8_118 = L8_118
	L8_118("attack predictions took " .. L9_119 .. " loops", system.getTimer() - L3_113)
	local L7_117 = L7_117
end
predictAllFutureAttacks = L16_16
function L16_16(A0_120, A1_121)
	local L2_122, L3_123
	L2_122 = A1_121 or nil
	if A1_121 then
		L2_122 = A0_120 - A1_121
		L3_123 = _ENV
		L3_123 = L3_123.cpuAttack
		L3_123 = L3_123.attritionTime
		L2_122 = L2_122 >= L3_123
	end
	return L2_122
end
isExpiredAttack = L16_16
function L16_16(A0_124, A1_125, A2_126)
	local L6_130 = L6_130
	if A1_125.owned then
		L6_130 = A1_125.underAttackDate
		if L6_130 == nil then
			goto lbl_9
		end
	end
	L6_130 = false
	do return L6_130 end
	::lbl_9::
	L6_130 = getAdjacentCountries
	L7_131 = A0_124
	L8_132 = A1_125
	L6_130 = L6_130(L7_131, L8_132)
	L7_131 = pairs
	L8_132 = L6_130
	L7_131, L8_132, _FOR_ = L7_131(L8_132)
	for _FORV_7_, _FORV_8_ in L7_131, L8_132, _FOR_ do
		if _FORV_8_.owned then
			if not _FORV_8_.underAttackDate then
				goto lbl_44
			end
		end
		if isExpiredAttack(A2_126, _FORV_8_.underAttackDate) and #_FORV_8_.lands > 0 and A0_124.lands[_FORV_8_.lands[1]].landType ~= landType.WATER then
			return true
		end
		::lbl_44::
	end
	L7_131 = false
	return L7_131
end
countryCanBeAttackedByBots = L16_16
function L16_16(A0_136, A1_137)
	local L2_138, L3_139, L4_140
	L3_139 = false
	L4_140 = 0
	L7_143 = pairs
	L8_144 = A0_136.countries
	L7_143, L8_144, L9_145 = L7_143(L8_144)
	for _FORV_8_, _FORV_9_ in L7_143, L8_144, L9_145 do
		if _FORV_9_.id ~= HOMELAND_COUNTRY_ID and _FORV_9_.landType ~= landType.WATER then
			if countryCanBeAttackedByBots(A0_136, _FORV_9_, A1_137) then
				local L12_148 = math.random(1, 100)
				if 50 <= L12_148 and L12_148 <= 59 then
					L3_139 = true
					_FORV_9_.underAttackDate = A1_137
				elseif L2_138 == nil then
					L2_138 = _FORV_9_
				end
			end
			L12_148 = _FORV_9_.underAttackDate
			if not L12_148 then
				L12_148 = _FORV_9_.owned
				if L12_148 then
					L4_140 = L4_140 + 1
				end
			end
		end
	end
	if not L3_139 and L2_138 ~= nil then
		L2_138.underAttackDate = A1_137
		L4_140 = L4_140 - 1
	end
	return L4_140
end
makeNewCountryAttacks = L16_16
function L16_16(A0_150)
	local L1_151
	L1_151 = {}
	local L6_156 = os
	L6_156 = L6_156.time
	L6_156 = L6_156()
	L7_157 = pairs
	L7_157, _FOR_, _FOR_ = L7_157(A0_150.countries)
	for _FORV_6_, _FORV_7_ in L7_157, _FOR_, _FOR_ do
		if _FORV_7_.underAttackDate and L6_156 < _FORV_7_.underAttackDate then
			if L1_151[tostring(_FORV_7_.underAttackDate)] then
				L1_151[tostring(_FORV_7_.underAttackDate)] = L1_151[tostring(_FORV_7_.underAttackDate)] + 1
			else
				L1_151[tostring(_FORV_7_.underAttackDate)] = 1
			end
		end
	end
	L7_157 = pairs
	L7_157, L4_154, _FOR_ = L7_157(L1_151)
	for _FORV_6_, _FORV_7_ in L7_157, L4_154, _FOR_ do
		scheduleNotification(tonumber(_FORV_6_), "You're being attacked in " .. _FORV_7_ .. " countries!", _FORV_7_)
		local L11_161 = L11_161
	end
end
setAttackReminders = L16_16
function L16_16(A0_163, A1_164, A2_165, A3_166, A4_167)
	local L6_169 = L6_169
	if A2_165 == nil then
		A2_165 = 0
	end
	L6_169 = os
	L6_169 = L6_169.time
	L6_169 = L6_169()
	L6_169 = A0_163 - L6_169
	;({}).alert = A1_164
	;({}).badge = A2_165
	;({}).custom = A4_167
	local L7_170 = L7_170
	local L8_171 = L8_171
	do return L8_171(L6_169, L7_170) end
	local L9_172 = L9_172
end
scheduleNotification = L16_16


-- [End of decompiled block; see disassembly for inner stripped closures]
