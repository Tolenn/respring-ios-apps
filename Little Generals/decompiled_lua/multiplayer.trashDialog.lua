local L0_0, L1_1
L0_0 = {}
function L1_1(A0_2)
	local L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13
	L1_3 = A0_2.textEntered
	L2_4 = A0_2.onClose
	L3_5 = A0_2.onCancel
	L4_6 = A0_2.inputLength
	L5_7 = A0_2.showInputLength
	L6_8 = A0_2.confirmLabel
	if not L6_8 then
		L6_8 = "OKAY"
	end
	L7_9 = A0_2.caption
	if not L7_9 then
		L7_9 = nil
	end
	L8_10 = A0_2.font
	if not L8_10 then
		L8_10 = "SingleSleeve"
	end
	L9_11 = A0_2.allowsEmptyString
	L10_12 = A0_2.validationFunction
	L11_13 = 40
	if utils.isCorona() or utils.isIPad() then
		L11_13 = 80
	end
	local L12_14 = L12_14
	L12_14 = L12_14(screenX, 0, screenWidth, display.contentHeight)
	L12_14:setFillColor(0, 0, 0)
	L12_14.alpha = 0.5
	utils.addHitBlockListeners(L12_14)
	local L13_15 = display.newGroup()
	local L14_16 = L14_16
	;({}).x = screenX + 50
	;({}).y = 50
	;({}).width = screenWidth - 100
	;({}).height = 225
	L14_16 = L14_16({})
	local L15_17, L16_18 = L15_17, L16_18
	L15_17(L16_18, L14_16)
	L15_17 = nil
	function L16_18()
		_ENV:removeSelf()
		L13_15:removeSelf()
		L15_17:removeSelf()
		local L1_28 = L1_28
		L1_28 = L2_4
		if L1_28 then
			L1_28 = L2_4
			L1_28()
		end
	end
	local L17_19 = L17_19
	;({}).buttonText = L6_8
	;({}).onComplete = function()
		repeat
			if _ENV or L15_17.text:len() > 0 then
				if L10_12 and not L10_12(L15_17.text) then
					return
				end
				if L1_3 then
					L1_3(L15_17.text)
					local L1_29 = L1_29
				end
				L1_29 = L16_18
				L1_29()
				break -- pseudo-goto
			end
			L1_29 = L16_18
			L1_29()
		until true
	end
	L17_19 = L17_19({})
	L13_15:insert(L17_19)
	L17_19:setReferencePoint(display.BottomRightReferencePoint)
	L17_19.x, L17_19.y = L14_16.contentBounds.xMax - 25, L14_16.contentBounds.yMax - 25
	utils.scaleTo(L17_19.buttonText, L17_19.normal.contentWidth - 15)
	local L18_20 = L18_20
	;({}).buttonText = "CANCEL"
	;({}).onComplete = function()
		_ENV()
		if L3_5 then
			L3_5()
		end
	end
	L18_20 = L18_20({})
	L13_15:insert(L18_20)
	L18_20:setReferencePoint(display.BottomRightReferencePoint)
	L18_20.x, L18_20.y = L17_19.contentBounds.xMin - 25, L17_19.y
	if L4_6 and L5_7 then
		display.newText((function(A0_30)
			local L2_31 = L2_31
			local L3_32 = L3_32
			do return L2_31(L3_32, A0_30, _ENV) end
			local L4_33 = L4_33
		end)(L4_6), 0, 0, "SingleSleeve", 50):setTextColor(LITTLE_GENERALS_BROWN_DARK())
		L13_15:insert((display.newText((function(A0_34)
			local L2_35 = L2_35
			local L3_36 = L3_36
			do return L2_35(L3_36, A0_34, _ENV) end
			local L4_37 = L4_37
		end)(L4_6), 0, 0, "SingleSleeve", 50)))
		display.newText((function(A0_38)
			local L2_39 = L2_39
			local L3_40 = L3_40
			do return L2_39(L3_40, A0_38, _ENV) end
			local L4_41 = L4_41
		end)(L4_6), 0, 0, "SingleSleeve", 50):setReferencePoint(display.BottomLeftReferencePoint)
		display.newText((function(A0_42)
			local L2_43 = L2_43
			local L3_44 = L3_44
			do return L2_43(L3_44, A0_42, _ENV) end
			local L4_45 = L4_45
		end)(L4_6), 0, 0, "SingleSleeve", 50).x, display.newText((function(A0_46)
			local L2_47 = L2_47
			local L3_48 = L3_48
			do return L2_47(L3_48, A0_46, _ENV) end
			local L4_49 = L4_49
		end)(L4_6), 0, 0, "SingleSleeve", 50).y = L14_16.contentBounds.xMin + 25, L14_16.contentBounds.yMax - 25
		display.newText((function(A0_50)
			local L2_51 = L2_51
			local L3_52 = L3_52
			do return L2_51(L3_52, A0_50, _ENV) end
			local L4_53 = L4_53
		end)(L4_6), 0, 0, "SingleSleeve", 50).text = (function(A0_54)
			local L2_55 = L2_55
			local L3_56 = L3_56
			do return L2_55(L3_56, A0_54, _ENV) end
			local L4_57 = L4_57
		end)(0)
	end
	L15_17 = native.newTextField(screenX + 75, 75, screenWidth - 150, 100)
	L15_17:addEventListener("userInput", function(A0_58)
		if A0_58.phase == "editing" and _ENV then
			local L1_59, L2_60 = A0_58.text:len(), L2_60
			L2_60 = _ENV
			if L1_59 > L2_60 then
				L2_60 = L15_17
				local L5_63 = L5_63
				local L5_63, L6_64 = L5_63(A0_58.text, 1, _ENV), L6_64
				L2_60.text = L5_63
				L1_59 = _ENV
			end
			L2_60 = L5_7
			if L2_60 then
				L2_60 = maxCount
				L5_63 = countMessage
				L6_64 = L1_59
				L5_63 = L5_63(L6_64)
				L2_60.text = L5_63
			end
		end
	end)
	L15_17.hasBackground = false
	L15_17.isEditable = true
	L15_17.font = native.newFont(L8_10, L11_13)
	L15_17:setTextColor(LITTLE_GENERALS_BROWN_DARK())
	native.setKeyboardFocus(L15_17)
	if L7_9 then
		local L19_21 = L19_21
		local L23_25 = L23_25
		local L24_26 = L24_26
		local L19_21, L25_27 = L19_21(L23_25, L24_26, 0, 0, "SingleSleeve", 43), L25_27
		L24_26 = L19_21
		L23_25 = L19_21.setTextColor
		L25_27 = LITTLE_GENERALS_BROWN_DARK
		L25_27 = L25_27()
		L23_25(L24_26, L25_27, L25_27())
		L24_26 = L19_21
		L23_25 = L19_21.setReferencePoint
		L25_27 = display
		L25_27 = L25_27.CenterLeftReferencePoint
		L23_25(L24_26, L25_27)
		L23_25 = L15_17.x
		L24_26 = L15_17.contentWidth
		L24_26 = L24_26 / 2
		L23_25 = L23_25 - L24_26
		L24_26 = L18_20.y
		L25_27 = L18_20.contentHeight
		L25_27 = L25_27 / 2
		L24_26 = L24_26 - L25_27
		L19_21.y = L24_26
		L19_21.x = L23_25
	end
	return L13_15
end
L0_0.create = L1_1
return L0_0
