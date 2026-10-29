local L0_0, L3_3, L4_4, L5_5 = L0_0, "store", L4_4, L5_5
L0_0 = L0_0(L3_3)
L3_3 = require
L4_4 = "iap"
L3_3 = L3_3(L4_4)
L4_4 = "virtualCurrency.loaded."
L5_5 = "virtualCurrency.balance."
local L6_6 = L6_6
local L7_7 = L7_7
local L8_8 = L8_8
local L9_9 = L9_9
local L10_10 = L10_10
L7_7[1] = L8_8
L7_7[2] = L9_9
L7_7[3] = L10_10
L7_7[4] = rootProducts
L7_7[5] = callbacks
local L7_7[6], L11_11 = debug, L11_11
VirtualCurrency = L7_7
L7_7 = {}
L8_8 = VirtualCurrency
L7_7.__index = L8_8
VirtualCurrency_mt = L7_7
function L7_7(A0_12, A1_13)
	local L2_14 = L2_14
	local L2_14, L3_15 = L2_14 .. A1_13, L3_15
	return L2_14
end
L8_8 = {}
L9_9 = VirtualCurrency
function L10_10(A0_16)
	repeat
		local L5_21 = L5_21
		if not A0_16.products then
			function L5_21(A0_27)
				_FOR_ = 1
				for _FORV_4_ = L4_31, _FOR_, _FOR_ do
					_ENV.resolveStoreIdToProduct(A0_27.products[_FORV_4_].productIdentifier, A0_16.rootProducts).displayName = A0_27.products[_FORV_4_].title .. " - " .. A0_27.products[_FORV_4_].localizedPrice
					_ENV.resolveStoreIdToProduct(A0_27.products[_FORV_4_].productIdentifier, A0_16.rootProducts).displayDesc = A0_27.products[_FORV_4_].description
					if A0_27.products[_FORV_4_].localizedPrice then
						_ENV.resolveStoreIdToProduct(A0_27.products[_FORV_4_].productIdentifier, A0_16.rootProducts).localizedPrice = A0_27.products[_FORV_4_].localizedPrice
					end
					local L10_37 = L10_37
					local L11_38 = L11_38
					print("\tProduct", A0_27.products[_FORV_4_].productIdentifier, _ENV.resolveStoreIdToProduct(A0_27.products[_FORV_4_].productIdentifier, A0_16.rootProducts).displayName, _ENV.resolveStoreIdToProduct(A0_27.products[_FORV_4_].productIdentifier, A0_16.rootProducts).displayDesc)
					local L12_39 = L12_39
				end
				L4_31 = print
				L7_34 = "Invalid Products"
				L8_35 = A0_27.invalidProducts
				L8_35 = #L8_35
				L4_31(L7_34, L8_35)
				L4_31 = 1
				L7_34 = A0_27.invalidProducts
				L7_34 = #L7_34
				L8_35 = 1
				for L9_36 = L4_31, L7_34, L8_35 do
					L10_37 = print
					L11_38 = A0_27.invalidProducts
					L11_38 = L11_38[L9_36]
					L10_37(L11_38)
				end
			end
			L6_22 = utils
			L6_22 = L6_22.isIOS
			L6_22 = L6_22()
			if L6_22 then
				L6_22 = print
				L6_22("Loading remote consumables...")
				L6_22 = _ENV
				L6_22 = L6_22.purchaseOptions
				L6_22(A0_16.productIds, function(A0_40)
					_ENV.products = A0_40.products
					local L1_41 = L1_41
					L1_41(A0_40)
					local L2_42 = L2_42
				end)
			else
				L6_22 = {}
				A0_16.products = L6_22
				L6_22 = print
				L6_22("Loading local consumables...")
				L6_22 = pairs
				L6_22, _FOR_, _FOR_ = L6_22(A0_16.rootProducts)
				for _FORV_5_, _FORV_6_ in L6_22, _FOR_, _FOR_ do
					({}).productIdentifier = _FORV_5_
					;({}).title = _FORV_6_.name
					;({}).description = _FORV_6_.desc
					;({}).price = _FORV_6_.price
					;({}).localizedPrice = _FORV_6_.localizedPrice
					table.insert(A0_16.products, {})
				end
				L6_22 = L5_21
				L7_23 = {}
				L8_24 = A0_16.products
				L7_23.products = L8_24
				L8_24 = {}
				L7_23.invalidProducts = L8_24
				L6_22(L7_23)
			end
			break -- pseudo-goto
		end
		L5_21 = productCallback
		L6_22 = {}
		L7_23 = A0_16.products
		L6_22.products = L7_23
		L7_23 = {}
		L6_22.invalidProducts = L7_23
		L5_21(L6_22)
	until true
end
L9_9.purchaseOptions = L10_10
function L9_9(A0_43, A1_44, A2_45, A3_46, A4_47)
	local L5_48, L6_49, L7_50
	L5_48 = A3_46 or nil
	if not A3_46 then
		L5_48 = 0
	end
	L6_49 = {}
	if A2_45 then
		L6_49[1] = A2_45
	end
	L7_50 = {}
	L8_51, _FOR_, _FOR_ = L8_51(A1_44)
	for _FORV_11_, _FORV_12_ in L8_51, _FOR_, _FOR_ do
		table.insert(L7_50, (_ENV.getProductStoreId(_FORV_12_)))
	end
	L8_51 = {}
	L8_51.currencyType = A0_43
	L14_57 = settings
	L15_58 = L14_57
	L14_57 = L14_57.get
	L16_59 = L7_7
	L16_59 = L16_59(L5_5, A0_43)
	L14_57 = L14_57(L15_58, L16_59, L5_48)
	L8_51.balance = L14_57
	L14_57 = settings
	L15_58 = L14_57
	L14_57 = L14_57.get
	L16_59 = L7_7
	L16_59 = L16_59(L6_6, A0_43)
	L14_57 = L14_57(L15_58, L16_59, {})
	L8_51.receipts = L14_57
	L8_51.debug = A4_47
	L8_51.productIds = L7_50
	L8_51.rootProducts = A1_44
	L8_51.callbacks = L6_49
	L14_57 = setmetatable
	L15_58 = L8_51
	L16_59 = VirtualCurrency_mt
	L14_57(L15_58, L16_59)
	L14_57 = _ENV
	L14_57 = L14_57.registerHandler
	L15_58 = L7_50
	L16_59 = L8_51
	L14_57(L15_58, L16_59)
	L15_58 = L8_51
	L14_57 = L8_51.purchaseOptions
	L14_57(L15_58)
	return L8_51
end
L8_8.create = L9_9
L8_8.CREDIT = "credit"
L8_8.DEBIT = "debit"
L8_8.SET = "set"
function L9_9(A0_60, A1_61)
	local L2_62, L3_63, L4_64, L5_65
	L2_62 = 1
	L3_63 = #A0_60
	L4_64 = 1
	for L5_65 = L2_62, L3_63, L4_64 do
		if A0_60[L5_65] then
			local L6_66 = L6_66
			L6_66 = L6_66(A0_60[L5_65], A1_61)
			local L7_67 = L7_67
			local L8_68 = L8_68
			local L9_69 = L9_69
			L7_67(L8_68, L9_69, L6_66)
			local L10_70 = L10_70
		end
	end
end
L10_10 = VirtualCurrency
function L11_11(A0_71, A1_72)
	({}).serverValidation = true
	;({}).testing = CUSTOM_OVERRIDES.USE_SANDBOX
	;({}).serverLink = "http://validate.little-generals.com/validate"
	;({}).receipt = A1_72.receipt
	;({}).listener = function(A0_79)
		if A0_79.iTunes_StatusCode == 0 then
			utils.logEvent("Purchase validation success")
		else
			utils.logEvent("Purchase validation failure")
			local L2_80 = L2_80
		end
	end
	require("validate").start({})
	local L2_73 = L2_73
	L2_73 = L2_73(A0_71, A1_72.productIdentifier)
	if L2_73 then
		table.insert(A0_71.receipts, A1_72.originalIdentifier)
		settings:set(_ENV(L6_6, A0_71.currencyType), receipts)
		settings:save()
		local L6_77 = L6_77
		L6_77(A0_71, L2_73, nil, true)
		local L7_78 = L7_78
		break -- pseudo-goto
	end
	L6_77 = print
	L7_78 = "Missing credit amount for"
	L6_77(L7_78, A1_72.productIdentifier)
	repeat
	until true
	L6_77 = L0_0
	L6_77 = L6_77.finishTransaction
	L7_78 = A1_72
	L6_77(L7_78)
end
L10_10.completePurchase = L11_11
L10_10 = VirtualCurrency
function L11_11(A0_81, A1_82)
	({}).balance = A0_81.balance
	;({}).type = L8_8.CREDIT
	;({}).status = iapFAILURE
	;({}).code = A1_82.errorType
	local ({}).message, L5_86 = A1_82.errorString, L5_86
	L5_86(A0_81.callbacks, {})
	L5_86 = L0_0
	L5_86 = L5_86.finishTransaction
	L5_86(A1_82)
	local L3_84 = L3_84
end
L10_10.failedPurchase = L11_11
L10_10 = VirtualCurrency
function L11_11(A0_87, A1_88)
	({}).balance = A0_87.balance
	;({}).type = L8_8.CREDIT
	local ({}).status, L5_92 = iapCANCEL, L5_92
	L5_92(A0_87.callbacks, {})
	L5_92 = L0_0
	L5_92 = L5_92.finishTransaction
	L5_92(A1_88)
	local L3_90 = L3_90
end
L10_10.cancelledPurchase = L11_11
L10_10 = VirtualCurrency
function L11_11(A0_93, A1_94)
	local L2_95 = L2_95
	local L3_96 = L3_96
	local L2_95, L4_97 = L2_95(L3_96, A0_93.rootProducts), L4_97
	L3_96 = A0_93.rootProducts
	L3_96 = L3_96[L2_95]
	if not L3_96 then
		L3_96 = 0
		return L3_96
	end
	L3_96 = A0_93.rootProducts
	L3_96 = L3_96[L2_95]
	L3_96 = L3_96.quantity
	return L3_96
end
L10_10.findCreditAmountForProduct = L11_11
L10_10 = VirtualCurrency
function L11_11(A0_98, A1_99, A2_100)
	repeat
		local L3_101 = L3_101
		L3_101 = L3_101(A0_98.callbacks)
		if A2_100 then
			L3_101[#L3_101 + 1] = A2_100
		end
		if A1_99 <= A0_98.balance then
			A0_98.balance = A0_98.balance - A1_99
			local L8_106 = L8_106
			L8_106(settings, _ENV(L5_5, A0_98.currencyType), A0_98.balance)
			L8_106 = settings
			L8_106 = L8_106.save
			L8_106(L8_106)
			L8_106 = L9_9
			;({}).amount = A1_99
			;({}).balance = A0_98.balance
			;({}).type = L8_8.DEBIT
			;({}).status = L1_1.SUCCESS
			L8_106(L3_101, {})
			break -- pseudo-goto
		end
		L8_106 = L9_9
		local L5_103 = L5_103
		;({}).amount = A1_99
		;({}).balance = A0_98.balance
		;({}).type = L8_8.DEBIT
		local ({}).status, L7_105 = iapFAILURE, L7_105
		L8_106(L5_103, L7_105)
	until true
end
L10_10.debit = L11_11
L10_10 = VirtualCurrency
function L11_11(A0_107, A1_108, A2_109, A3_110)
	local L4_111 = L4_111
	L4_111 = L4_111(A0_107.callbacks)
	if A2_109 then
		L4_111[#L4_111 + 1] = A2_109
	end
	A0_107.balance = A0_107.balance + A1_108
	local L9_116 = L9_116
	L9_116(settings, _ENV(L5_5, A0_107.currencyType), A0_107.balance)
	L9_116 = L9_9
	local L6_113 = L6_113
	;({}).amount = A1_108
	;({}).balance = A0_107.balance
	;({}).type = L8_8.CREDIT
	local ({}).status, L8_115 = iapSUCCESS, L8_115
	L8_115.fromTransaction = A3_110
	L9_116(L6_113, L8_115)
end
L10_10.credit = L11_11
L10_10 = VirtualCurrency
function L11_11(A0_117, A1_118, A2_119)
	local L3_120 = L3_120
	L3_120 = L3_120(A0_117.callbacks)
	if A2_119 then
		L3_120[#L3_120 + 1] = A2_119
	end
	A0_117.balance = A1_118
	local L8_125 = L8_125
	L8_125(settings, _ENV(L5_5, A0_117.currencyType), A0_117.balance)
	L8_125 = settings
	L8_125 = L8_125.save
	L8_125(L8_125)
	L8_125 = L9_9
	local L5_122 = L5_122
	;({}).balance = A0_117.balance
	;({}).type = L8_8.SET
	local ({}).status, L7_124 = iapSUCCESS, L7_124
	L8_125(L5_122, L7_124)
end
L10_10.set = L11_11
L10_10 = VirtualCurrency
function L11_11(A0_126, A1_127)
	local L2_128 = L2_128
	local L3_129 = L3_129
	local L2_128, L4_130 = L2_128(L3_129, A1_127), L4_130
	if not L2_128 then
		L2_128 = A0_126.callbacks
		L3_129 = A0_126.callbacks
		L3_129 = #L3_129
		L3_129 = L3_129 + 1
		L2_128[L3_129] = A1_127
	end
end
L10_10.addBalanceListener = L11_11
L10_10 = VirtualCurrency
function L11_11(A0_131, A1_132)
	local L2_133 = L2_133
	L2_133 = L2_133(A0_131.callbacks, A1_132)
	if L2_133 then
		local L3_134 = L3_134
		local L4_135 = L4_135
		L3_134(L4_135, L2_133)
		local L5_136 = L5_136
	end
end
L10_10.removeBalanceListener = L11_11
L10_10 = VirtualCurrency
function L11_11(A0_137, A1_138)
	repeat
		if A0_137.debug then
			L5_142 = 1
			_FOR_ = 1
			for _FORV_5_ = L5_142, _FOR_, _FOR_ do
				({}).productIdentifier = A1_138[_FORV_5_]
				;({}).originalIdentifier = os.time()
				A0_137:completePurchase({})
			end
			break -- pseudo-goto
		end
		L5_142 = _ENV
		L5_142 = L5_142.purchase
		L6_143 = A1_138
		L5_142(L6_143)
	until true
end
L10_10.purchaseCurrency = L11_11
return L8_8
