-- Decompiled & AI-Repaired from iap.lu
-- Source disassembly preserved at: disasm/iap.disasm

local L0_0, L2_2, L3_3, L4_4, L5_5, L6_6 = L0_0, "store", L3_3, L4_4, L5_5, L6_6
L0_0 = L0_0(L2_2)
L2_2 = "virtualCurrency.loaded."
L3_3 = "virtualCurrency.balance."
L4_4 = "virtualCurrency.receipts."
L5_5 = {}
L6_6 = {}
L6_6.pendingOptionRequests = {}
L6_6.SUCCESS = "success"
L6_6.FAILURE = "failure"
L6_6.CANCEL = "cancel"
function L6_6.getProductStoreId(A0_7)
	if utils.isIOS() then
		if A0_7.idForIOS then
			return A0_7.idForIOS
		end
	else
		local L1_8 = utils.isAndroid()
		if L1_8 then
			L1_8 = A0_7.idForAndroid
			if L1_8 then
				L1_8 = A0_7.idForAndroid
				return L1_8
			end
		end
	end
	L1_8 = A0_7.id
	return L1_8
end
function L6_6.resolveStoreIdToProductId(A0_9, A1_10)
	local L6_15, L7_16 = utils.isIOS, L7_16
	L6_15 = L6_15()
	L7_16 = utils
	L7_16 = L7_16.isAndroid
	L7_16 = L7_16()
	L8_17 = pairs
	L9_18 = A1_10
	L8_17, L9_18, _FOR_ = L8_17(L9_18)
	for _FORV_7_, _FORV_8_ in L8_17, L9_18, _FOR_ do
		if _FORV_8_.id == A0_9 then
			return _FORV_8_.id
		elseif L6_15 then
			if _FORV_8_.idForIOS == A0_9 then
				return _FORV_8_.id
			end
		elseif L7_16 and _FORV_8_.idForAndroid == A0_9 then
			return _FORV_8_.id
		end
	end
end
function L6_6.resolveStoreIdToProduct(A0_19, A1_20)
	local L2_21 = L2_21
	local L3_22 = L3_22
	local L2_21, L4_23 = L2_21(L3_22, A1_20), L4_23
	L3_22 = A1_20[L2_21]
	return L3_22
end
function L6_6.resolveProductIdToStoreId(A0_24, A1_25)
	local L4_28, L5_29 = utils.isIOS, L5_29
	L4_28 = L4_28()
	L5_29 = utils
	L5_29 = L5_29.isAndroid
	L5_29 = L5_29()
	if L4_28 and A1_25[A0_24].idForIOS then
		return A1_25[A0_24].idForIOS
	elseif L5_29 and product.idForAndroid then
		return A1_25[A0_24].idForAndroid
	end
	return A1_25[A0_24].id
end
function L6_6.init()
	local L0_30
	function L0_30(A0_34)
		local L1_35 = L1_35
		L1_35("event", A0_34)
		L1_35 = A0_34.transaction
		print("transaction productIdentifier", L1_35.productIdentifier)
		print("transaction state", L1_35.state)
		print("transaction type", L1_35.errorType)
		local L2_36 = L2_36
		local L3_37 = L3_37
		L2_36(L3_37, L1_35.errorString)
		L2_36 = L1_35.productIdentifier
		L3_37 = nil
		_FOR_ = 1
		for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
			if table.indexOf(_ENV[_FORV_7_].productIds, L2_36) then
				L3_37 = _ENV[_FORV_7_].handler
				break
			end
		end
		if not L3_37 then
			L9_43 = print
			L10_44 = "Missing handler"
			L9_43(L10_44, L2_36)
			L9_43 = L0_0
			L9_43 = L9_43.finishTransaction
			L10_44 = L1_35
			L9_43(L10_44)
			return
		end
		L9_43 = L1_35.state
		if L9_43 == "purchased" then
			L9_43 = settings
			L10_44 = L9_43
			L9_43 = L9_43.set
			L9_43(L10_44, "storeUsed", true)
			L10_44 = L3_37
			L9_43 = L3_37.completePurchase
			L9_43(L10_44, L1_35)
		else
			L9_43 = L1_35.state
			if L9_43 == "failed" then
				L10_44 = L3_37
				L9_43 = L3_37.failedPurchase
				L9_43(L10_44, L1_35)
			else
				L9_43 = L1_35.state
				if L9_43 == "cancelled" then
					L10_44 = L3_37
					L9_43 = L3_37.cancelledPurchase
					L9_43(L10_44, L1_35)
				else
					L9_43 = L1_35.state
					if L9_43 == "restored" then
						L9_43 = L3_37.restoredPurchase
						if L9_43 then
							L9_43 = settings
							L10_44 = L9_43
							L9_43 = L9_43.set
							L9_43(L10_44, "storeUsed", true)
							L10_44 = L3_37
							L9_43 = L3_37.restoredPurchase
							L9_43(L10_44, L1_35)
							local L6_40 = L6_40
						end
					end
				end
			end
		end
	end
	if L0_0.availableStores.apple then
		L0_0.init("apple", L0_30)
	elseif L0_0.availableStores.google then
		local L1_31 = L1_31
		local L2_32 = L2_32
		L1_31(L2_32, L0_30)
		local L3_33 = L3_33
	end
	L1_31 = L6_6


-- [End of decompiled block; see disassembly for inner stripped closures]
