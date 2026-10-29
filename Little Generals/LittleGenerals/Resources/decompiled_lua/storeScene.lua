-- Decompiled & AI-Repaired from storeScene.lu
-- Source disassembly preserved at: disasm/storeScene.disasm

local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11 = L3_3, "facebookSupport", L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
L3_3(L4_4)
L3_3 = require
L4_4 = "twitterSupport"
L3_3(L4_4)
L3_3 = require
L4_4 = "virtualCurrency"
L3_3 = L3_3(L4_4)
L4_4 = require
L5_5 = "iap"
L4_4 = L4_4(L5_5)
L5_5 = storyboard
L5_5 = L5_5.newScene
L5_5 = L5_5()
L6_6 = nil
L7_7 = nil
L8_8 = false
L9_9 = false
L10_10 = {}
L10_10.kaching = "res/sounds/kaching.mp3"
function L11_11()
	local L2_18 = sound.playSound
	L2_18(sound.globalSounds.button)
	L2_18 = timer
	L2_18 = L2_18.performWithDelay
	L2_18(1, function()
		local L0_19 = storyboard.getCurrentSceneName()
		storyboard.gotoScene(_ENV.previousScene)
		local L1_20 = L1_20
		L1_20(L0_19)
		local L2_21 = L2_21
	end)
end
function L5_5.createScene(A0_22, A1_23)
	local L6_28, L7_29 = storyboard.getPrevious, L7_29
	L6_28 = L6_28()
	A0_22.previousScene = L6_28
	L6_28 = A0_22.view
	L7_29 = false
	_ENV = L7_29
	L7_29 = sound
	L7_29 = L7_29.loadSoundBatch
	L7_29(L10_10)
	L7_29 = utils
	L7_29 = L7_29.drawBasicSceneBackground
	;({}).group = L6_28
	;({}).title = "GENERAL'S STORE"
	;({}).showBottomBar = true
	;({}).onClose = L11_11
	L7_29 = L7_29({})
	local L4_26 = L4_26
	local L4_26, L5_27 = L4_26(UI_SPRITE_SHEET)
	local L8_30 = L8_30
	;({}).width = 250
	;({}).height = L8_30
	;({}).topColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
	;({}).bottomColor = utils.pack(LITTLE_GENERALS_OFF_WHITE())
	L7_29:insert((utils.getTwoToneBox({})))
	utils.getTwoToneBox({}).y, utils.getTwoToneBox({}).x = display.contentHeight / 2 - 67 / 2, -screenWidth / 2 + utils.getTwoToneBox({}).contentWidth / 2 + 5
	local L9_31 = L9_31
	utils.newImageFromSpriteSet(L4_26, L5_27, "warbux_icon.png"):setReferencePoint(display.TopLeftReferencePoint)
	L7_29:insert((utils.newImageFromSpriteSet(L4_26, L5_27, "warbux_icon.png")))
	utils.newImageFromSpriteSet(L4_26, L5_27, "warbux_icon.png").x, utils.newImageFromSpriteSet(L4_26, L5_27, "warbux_icon.png").y = utils.getTwoToneBox({}).x - utils.getTwoToneBox({}).contentWidth / 2 - 6, utils.getTwoToneBox({}).y - utils.getTwoToneBox({}).contentHeight / 2 - 6
	local L10_32 = L10_32
	local L14_36 = L14_36
	local L15_37 = L15_37
	local L15_37, L16_38 = L15_37(L7_29, utils.comma_value(tostring(warbux.balance)), 0, 0, "SingleSleeve", 48), L16_38
	L7_7 = L15_37
	function L15_37()
		local L0_39, L1_40 = L0_39, L1_40
		L0_39(L1_40, display.CenterRightReferencePoint)
		local L2_41 = L2_41
		L0_39 = _ENV
		L1_40 = L10_32
		L1_40 = L1_40.x
		L2_41 = L10_32
		L2_41 = L2_41.contentWidth
		L2_41 = L2_41 / 2
		L1_40 = L1_40 + L2_41
		L1_40 = L1_40 - 15
		L0_39.x = L1_40
		L0_39 = _ENV
		L1_40 = L10_32
		L1_40 = L1_40.y
		L1_40 = L1_40 - 3
		L0_39.y = L1_40
	end
	L16_38 = L15_37
	L16_38()
	L16_38 = L7_7
	L16_38 = L16_38.setTextColor
	L16_38(L16_38, LITTLE_GENERALS_BROWN_DARK())
	L16_38 = L7_7
	function L16_38.warbuxListener(A0_42)
		_ENV.text = utils.comma_value(tostring(warbux.balance))
		L15_37()
		print(A0_42.type, A0_42.code, A0_42.message, A0_42.status)
		if A0_42.type == L0_0.CREDIT then
			if A0_42.status == L1_1.FAILURE then
				if not A0_42.code then
				end
				if not A0_42.message then
				end
				utils.logEvent("Warbux Purchase Failure - " .. tostring(A0_42.amount) .. " - " .. tostring("-1"))
				local L8_50 = L8_50
				local ({})[1], L7_49 = "OK", L7_49
				native.showAlert("Error", "There was a problem completing your purchase: " .. tostring("-1") .. "\n" .. "Unknown", {})
				break -- pseudo-goto
			end
			L8_50 = A0_42.status
			L7_49 = L1_1
			L7_49 = L7_49.SUCCESS
			if L8_50 == L7_49 then
				L8_50 = A0_42.fromTransaction
				if L8_50 then
					L8_50 = sound
					L8_50 = L8_50.playSound
					L7_49 = L10_10
					L7_49 = L7_49.kaching
					L8_50(L7_49)
					L8_50 = utils
					L8_50 = L8_50.logEvent
					L7_49 = "Warbux Purchase - "
					L7_49 = L7_49 .. tostring(A0_42.amount)
					L8_50(L7_49)
					L8_50 = native
					L8_50 = L8_50.showAlert
					L7_49 = "Success"
					local L3_45 = L3_45
					local L4_46 = L4_46
					local L4_46[1], L5_47 = "OK", L5_47
					repeat
						L8_50(L7_49, L3_45, L4_46)
					until true
				end
			end
		end
		L8_50 = false
		_ENV = L8_50
	end
	L16_38 = warbux
	L16_38 = L16_38.addBalanceListener
	L16_38(L16_38, L7_7.warbuxListener)
end
function L5_5.enterScene(A0_51, A1_52)
	L21_72 = A0_51.view
	local L6_57, L21_72, L22_73 = A0_51.view.toFront, L21_72, L22_73
	L6_57(L21_72)
	L6_57 = Runtime
	L21_72 = L6_57
	L6_57 = L6_57.addEventListener
	L22_73 = "system"
	L6_57(L21_72, L22_73, _ENV)
	L6_57 = _ENV
	L6_57 = L6_57.view
	L21_72 = spritesheetmanager
	L21_72 = L21_72.getSpriteSet
	L22_73 = UI_SPRITE_SHEET
	L21_72, L22_73 = L21_72(L22_73)
	if L6_6 then
		_UPVALUE2_()
		local L5_56 = L5_56
	end
	L5_56 = screenWidth
	L5_56 = L5_56 - 60
	if screenWidth > 1050 then
	end
	;({}).width = L5_56
	;({}).maskFile, ({}).height = "res/mask1200x400.png", 400
	;({}).bgColor, ({})[1] = {}, 255
	;({}).bgColor, ({})[2] = {}, 255
	;({}).bgColor, ({})[3] = {}, 255
	;({}).bgColor, ({})[4] = {}, 0
	;({}).listener = utils.scrollViewListener
	L6_6 = require("widget").newScrollView({})
	L6_6.buttons = {}
	L6_6:setReferencePoint(display.TopCenterReferencePoint)
	L6_57:insert(L6_6)
	L6_6.x = screenX + screenWidth / 2
	L6_6.y = 120
	local L7_58 = L7_58
	local L8_59, L9_60 = L8_59, L9_60
	L9_60(L6_6, (display.newGroup()))
	L9_60 = L6_6
	L9_60 = L9_60.content
	L9_60.verticalScrollDisabled = true
	L9_60 = L6_6
	L9_60.allItemsGroup = L8_59
	L9_60 = 0
	if facebookSupport.canSolicit() then
		({}).image = "facebook_icon.png"
		;({}).warbuxAmount = "5,000"
		;({}).description1 = "Like us on Facebook"
		;({}).description2 = nil
		;({}).onComplete = function()
			local L1_83 = L1_83
			if not _ENV then
				L1_83 = true
				_ENV = L1_83
				L1_83 = facebookSupport
				L1_83 = L1_83.solicit
				L1_83(function(A0_84)
					if A0_84 then
						_ENV()
						local L1_85 = L1_85
					end
				end)
			end
		end
		_UPVALUE3_(L8_59, L21_72, L22_73, {}).x = 20 * L9_60 + _UPVALUE3_(L8_59, L21_72, L22_73, {}).contentWidth / 2 + _UPVALUE3_(L8_59, L21_72, L22_73, {}).contentWidth * L9_60
		_UPVALUE3_(L8_59, L21_72, L22_73, {}).y = L6_6.contentHeight / 2 - 75
		L9_60 = L9_60 + 1
	end
	if twitterSupport.canSolicit() then
		local L10_61 = L10_61
		;({}).image = "twitter_icon.png"
		;({}).warbuxAmount = "2,000"
		;({}).description1 = "Tweet about us"
		;({}).description2 = nil
		;({}).onComplete = function()
			sound.playSound(sound.globalSounds.button)
			local L1_87 = L1_87
			L1_87 = twitterSupport
			L1_87 = L1_87.solicit
			L1_87(function()
				local L3_90 = L3_90
				L3_90("Twitter Warbux " .. tostring(2000))
				L3_90 = warbux
				L3_90 = L3_90.credit
				L3_90(L3_90, 2000)
				L3_90 = settings
				L3_90 = L3_90.save
				L3_90(L3_90)
				L3_90 = _ENV
				L3_90()
			end)
		end
		_UPVALUE3_(L8_59, L21_72, L22_73, {}).x = L10_61 * L9_60 + _UPVALUE3_(L8_59, L21_72, L22_73, {}).contentWidth / 2 + _UPVALUE3_(L8_59, L21_72, L22_73, {}).contentWidth * L9_60
		_UPVALUE3_(L8_59, L21_72, L22_73, {}).y = L6_6.contentHeight / 2 - 75
		L9_60 = L9_60 + 1
	end
	if CUSTOM_OVERRIDES.TESTING_BUILD then
		local L11_62 = L11_62
		;({}).image = nil
		;({}).warbuxAmount = "???"
		;({}).description1 = "CHANGE WARBUX"
		;({}).description2 = "For debug purposes."
		;({}).onComplete = function()
			local L0_91 = L0_91
			local L2_93 = tostring(warbux.balance)
			L0_91(L2_93, function(A0_94)
				local L2_95 = L2_95
				L2_95(warbux, A0_94)
				local L3_96 = L3_96
			end)
		end
		_UPVALUE3_(L8_59, L21_72, L22_73, {}).x = L10_61 * L9_60 + _UPVALUE3_(L8_59, L21_72, L22_73, {}).contentWidth / 2 + _UPVALUE3_(L8_59, L21_72, L22_73, {}).contentWidth * L9_60
		_UPVALUE3_(L8_59, L21_72, L22_73, {}).y = L6_6.contentHeight / 2 - 75
		L9_60 = L9_60 + 1
		local L15_66 = L15_66
		;({}).image = nil
		;({}).warbuxAmount = "???"
		;({}).description1 = "CHANGE WINS"
		;({}).description2 = "For debug purposes."
		;({}).onComplete = function()
			local L0_97 = L0_97
			local L2_99 = L2_99
			local L3_100 = L3_100
			local L2_99, L4_101 = L2_99(L3_100, "statistics.kills", 0), L4_101
			function L3_100(A0_102)
				local L2_103 = L2_103
				local L3_104 = L3_104
				L2_103(L3_104, "statistics.kills", A0_102)
				local L4_105 = L4_105
			end
			L0_97(L2_99, L3_100)
		end
		_UPVALUE3_(L8_59, L21_72, L22_73, {}).x = L10_61 * L9_60 + _UPVALUE3_(L8_59, L21_72, L22_73, {}).contentWidth / 2 + _UPVALUE3_(L8_59, L21_72, L22_73, {}).contentWidth * L9_60
		_UPVALUE3_(L8_59, L21_72, L22_73, {}).y = L6_6.contentHeight / 2 - 75
		L9_60 = L9_60 + 1
	end
	function L11_62(A0_106)
		return function()
			if not _ENV then
				_ENV = true
				local L0_107, L1_108 = L0_107, L1_108
				local L2_109 = L2_109
				local L2_109[1], L3_110 = A0_106, L3_110
				L0_107(L1_108, L2_109)
			end
		end
	end
	L15_66 = {}
	_FOR_ = 1
	for _FORV_15_ = _FOR_, _FOR_, _FOR_ do
		table.insert(L15_66, L1_1.resolveStoreIdToProduct(warbux.productIds[_FORV_15_], warbux.rootProducts))
	end
	L16_67 = table
	L16_67 = L16_67.sort
	L17_68 = L15_66
	function L18_69(A0_111, A1_112)
		local L2_113, L3_114
		L2_113 = A0_111.quantity
		L3_114 = A1_112.quantity
		L2_113 = L2_113 < L3_114
		return L2_113
	end
	L16_67(L17_68, L18_69)
	L16_67 = 1
	L17_68 = #L15_66
	L18_69 = 1
	for _FORV_15_ = L16_67, L17_68, L18_69 do
		local L20_71 = L20_71
		local L23_74 = L23_74
		if L20_71.localizedPrice then
			local L24_75 = L24_75
			local L25_76 = L25_76
			local L26_77 = L26_77
			local L27_78 = L27_78
			;({}).image = L27_78
			;({}).description1, ({}).warbuxAmount = L20_71.localizedPrice, L25_76
			;({}).description2 = L26_77
			local L30_81 = L30_81
			;({}).onComplete = L11_62((L1_1.getProductStoreId(L20_71)))
			_UPVALUE3_(L8_59, L21_72, L22_73, {}).x = L10_61 * L9_60 + _UPVALUE3_(L8_59, L21_72, L22_73, {}).contentWidth / 2 + _UPVALUE3_(L8_59, L21_72, L22_73, {}).contentWidth * L9_60
			_UPVALUE3_(L8_59, L21_72, L22_73, {}).y = L6_6.contentHeight / 2 - 75
			L9_60 = L9_60 + 1
		end
	end
end
function L5_5.system(A0_115, A1_116)
	if _ENV and not L2_2.checkDialog and A1_116.type == "applicationResume" then
		({}).title = "FACEBOOK"
		;({}).closeable = false
		;({}).width = 680
		;({}).height = 387
		

-- [End of decompiled block; see disassembly for inner stripped closures]
