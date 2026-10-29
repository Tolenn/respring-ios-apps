local L1_1, L2_2, L3_3, L4_4, L5_5 = storyboard.newScene, L2_2, L3_3, L4_4, L5_5
L1_1 = L1_1()
L2_2 = nil
L3_3 = nil
L4_4 = nil
L5_5 = nil
function L1_1.createScene(A0_10, A1_11)
	local L3_13, L4_14, L5_15 = storyboard.getPrevious, L4_14, L5_15
	L3_13 = L3_13()
	A0_10.previousScene = L3_13
	L3_13 = A0_10.view
	L4_14 = "LOADING DATA"
	L5_15 = nil
	if A1_11.params then
		L4_14 = A1_11.params.title or L4_14
		if not A1_11.params.title then
		end
		L5_15 = A1_11.params.text or L5_15
		if not A1_11.params.text then
		end
	end
	local L6_16 = L6_16
	;({}).title = L4_14
	;({}).showImmediately = true
	;({}).closeImmediately = L6_16
	;({}).closeable = true
	;({}).height = 250
	;({}).cancelFunc = function()
		storyboard.removeScene("multiplayer.multiplayerLoadingScene")
		local L1_22 = L1_22
	end
	local L7_17 = utils.getDrawnDialogBox({})
	_ENV = L7_17
	L7_17 = _ENV
	L7_17 = L7_17.cancelButton
	L7_17.isVisible = false
	L7_17 = _ENV
	L7_17 = L7_17.cancelButton
	L7_17.isHitTestable = false
	function L7_17(A0_23, A1_24, A2_25)
		if A2_25 ~= 1 then
			A2_25 = -1
		end
		if not origRotation then
		end
		A0_23.rotation = 0
		local L3_26 = L3_26
		local L4_27 = L4_27
		;({}).time = A1_24
		local L7_30 = L7_30
		L7_30.rotation = A0_23.rotation + 360 * A2_25
		function L7_30.onComplete()
			local L1_31 = L1_31
			local L2_32 = L2_32
			L1_31(L2_32, A1_24, A2_25)
			local L3_33 = L3_33
		end
		L3_26 = L3_26(L4_27, L7_30)
		A0_23.infiniteRotateTransition = L3_26
	end
	_UPVALUE1_ = display.newGroup()
	_ENV:insert(_UPVALUE1_)
	_UPVALUE1_.x, _UPVALUE1_.y = 0, 0
	L3_3 = display.newImageRect("res/ui/biggear.png", 81, 81)
	_UPVALUE1_:insert(L3_3)
	L3_3.x, L3_3.y = 0 + L3_3.contentWidth / 2 - 20, 55
	L3_3.infiniteRotate = L7_17
	function L3_3.destroy(A0_34)
		if A0_34.infiniteRotateTransition then
			transition.cancel(A0_34.infiniteRotateTransition)
		end
		A0_34.infiniteRotateTransition = nil
		display.remove(A0_34)
		local L2_35 = L2_35
	end
	L3_3:infiniteRotate(10000, -1)
	L5_5 = display.newImageRect("res/ui/smallgear.png", 54, 54)
	_UPVALUE1_:insert(L5_5)
	L5_5.origRotation = -2
	L5_5.x, L5_5.y = L3_3.x - 55, L3_3.y - 28
	L5_5.infiniteRotate = L7_17
	function L5_5.destroy(A0_36)
		if A0_36.infiniteRotateTransition then
			transition.cancel(A0_36.infiniteRotateTransition)
		end
		A0_36.infiniteRotateTransition = nil
		display.remove(A0_36)
		local L2_37 = L2_37
	end
	local L8_18, L9_19 = L8_18, L9_19
	local L10_20 = L10_20
	L9_19(L10_20, 6666.666666666666, 1)
	local L11_21 = L11_21
	L9_19 = _ENV
	L9_19.isVisible = false
	L9_19 = _ENV
	L9_19 = L9_19.washOut
	L9_19.isVisible = false
	L9_19 = L0_0
	L9_19 = L9_19.view
	L9_19.isVisible = false
end
function L1_1.getDialogAndLoadingImage(A0_38)
	local L1_39, L2_40
	L1_39 = _ENV
	L2_40 = _UPVALUE1_
	return L1_39, L2_40
end
function L1_1.hideClose(A0_41)
	local L1_42
	L1_42 = _ENV
	L1_42 = L1_42.cancelButton
	L1_42.isVisible = false
end
function L1_1.showClose(A0_43)
	local L1_44
	L1_44 = _ENV
	L1_44 = L1_44.cancelButton
	L1_44.isVisible = true
end
function L1_1.enterScene(A0_45, A1_46)
	local L5_50 = L5_50
	L5_50.showTimer = timer.performWithDelay(1000, function()
		local L0_51, L1_52
		L0_51 = _ENV
		if L0_51 then
			L0_51 = _ENV
			L0_51.showTimer = nil
			L0_51 = _ENV
			L0_51.isVisible = true
			L0_51 = _ENV
			L0_51 = L0_51.washOut
			L0_51.isVisible = true
			L0_51 = _ENV
			L0_51 = L0_51.view
			L0_51.isVisible = true
		end
	end)
	L5_50 = _ENV
	L5_50.isShowing = true
	L5_50 = A1_46.params
	if L5_50 then
		L5_50 = A1_46.params
		L5_50 = L5_50.closeable
		if L5_50 then
			L5_50 = L2_2
			L5_50 = L5_50.cancelButton
			L5_50.isVisible = true
		end
		L5_50 = A1_46.params
		L5_50 = L5_50.onComplete
		if L5_50 then
			L5_50 = A1_46.params
			L5_50 = L5_50.onComplete
			L5_50()
		end
	end
end
function L1_1.exitScene(A0_53, A1_54)
	_ENV.isShowing = false
	if _ENV.showTimer then
		local L2_55 = L2_55
		L2_55(_ENV.showTimer)
		local L3_56 = L3_56
		L2_55 = _ENV
		L2_55.showTimer = nil
	end
end
function L1_1.destroyScene(A0_57, A1_58)
	if _ENV then
		_ENV:destroy()
	end
	_ENV = nil
	if L4_4 then
		L4_4:destroy()
	end
	L4_4 = nil
	if L5_5 then
		L5_5:destroy()
		local L3_59 = L3_59
	end
	L3_59 = nil
	L5_5 = L3_59
	L3_59 = L2_2
	if L3_59 then
		L3_59 = L2_2
		L3_59 = L3_59.isClosed
		if not L3_59 then
			L3_59 = L2_2
			L3_59 = L3_59.close
			L3_59()
		end
	end
	L3_59 = nil
	L2_2 = L3_59
end
L1_1:addEventListener("createScene", L1_1)
L1_1:addEventListener("enterScene", L1_1)
L1_1:addEventListener("exitScene", L1_1)
local L6_6, L7_7 = L6_6, L7_7
local L8_8 = L8_8
L7_7(L8_8, "destroyScene", L1_1)
local L9_9 = L9_9
return L1_1
