-- Decompiled & AI-Repaired from creditsScene.lu
-- Source disassembly preserved at: disasm/creditsScene.disasm

local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7 = L2_2, "facebookSupport", L4_4, L5_5, L6_6, L7_7
L2_2(L3_3)
L2_2 = require
L3_3 = "twitterSupport"
L2_2(L3_3)
L2_2 = require
L3_3 = "spritesheetmanager"
L2_2(L3_3)
L2_2 = storyboard
L2_2 = L2_2.newScene
L2_2 = L2_2()
L3_3 = nil
L4_4 = {}
L4_4.size = 70
L4_4.offset = 0
L5_5 = {}
L5_5.size = 50
L6_6 = FONT_NAME
L5_5.font = L6_6
function L6_6()
	local L0_33, L1_34, L2_35
	L0_33 = 0
	L1_34 = 0
	L2_35 = 0
	return L0_33, L1_34, L2_35
end
L5_5.color = L6_6
L5_5.offset = 0
L6_6 = {}
L6_6.size = 40
L7_7 = FONT_NAME
L6_6.font = L7_7
L7_7 = LITTLE_GENERALS_BROWN_DARK
L6_6.color = L7_7
L6_6.offset = -10
L7_7 = {}
L7_7.size = 10
L7_7.font = FONT_NAME
L7_7.color = LITTLE_GENERALS_BROWN_DARK
L7_7.offset = 0
;({}).size = 10
;({}).font = FONT_NAME
;({}).color = LITTLE_GENERALS_BROWN_DARK
;({}).offset = 0
local L8_8 = L8_8
;({})[1] = " "
;({})[2] = {}
local L9_9 = L9_9
;({})[1] = "Little Generals"
;({})[2] = L4_4
local L10_10 = L10_10
;({})[1] = "Developed by Smarter Apps."
;({})[2] = L6_6
local L11_11 = L11_11
local L12_12 = L12_12
;({})[1] = "Development Team"
;({})[2] = L5_5
local L13_13 = L13_13
;({})[1] = "Kimberly Horne"
;({})[2] = L6_6
;({})[1] = "James O'Connor"
;({})[2] = L6_6
;({})[1] = "Graphics Team"
;({})[2] = L5_5
;({})[1] = "Jennifer Mealing"
;({})[2] = L6_6
local L18_18 = L18_18
;({})[1] = "Jo-Anne Rioux"
;({})[2] = L6_6
local L19_19 = L19_19
local L20_20 = L20_20
;({})[1] = "Production Team"
;({})[2] = L5_5
local L21_21 = L21_21
;({})[1] = "Paul Dumais"
;({})[2] = L6_6
local L22_22 = L22_22
;({})[1] = "Krista House"
;({})[2] = L6_6
local L23_23 = L23_23
;({})[1] = "David MacFarlane"
;({})[2] = L6_6
local L24_24 = L24_24
;({})[1] = "Sean Murphy"
;({})[2] = L6_6
local L25_25 = L25_25
;({})[1] = "Irving Navarrete"
;({})[2] = L6_6
local L26_26 = L26_26
;({})[1] = "Will Robertson"
;({})[2] = L6_6
local L27_27 = L27_27
local L28_28 = L28_28
local L29_29 = L29_29
;({})[1] = "Sound & Music"
;({})[2] = L5_5
local L30_30 = L30_30
;({})[1] = "Ken Campbell"
;({})[2] = L6_6
local L31_31 = L31_31
L10_10[1] = L11_11
L10_10[2] = L12_12
L10_10[3] = L13_13
L10_10[4] = L18_18
L10_10[5] = L19_19
L10_10[6] = L20_20
L10_10[7] = L21_21
L10_10[8] = L22_22
L10_10[9] = L23_23
L10_10[10] = L24_24
L10_10[11] = L25_25
L10_10[12] = L26_26
L10_10[13] = L27_27
L10_10[14] = L28_28
L10_10[15] = L29_29
L10_10[16] = L30_30
L10_10[17] = L31_31
L10_10[18] = {}
L10_10[19] = L9_9
L10_10[20] = L9_9
L10_10[21] = {}
L10_10[22] = {}
L10_10[23] = L9_9
local L10_10[24], L32_32 = L9_9, L32_32
function L11_11(A0_36, A1_37, A2_38)
	local L3_39 = L3_39
	L3_39 = L3_39(A0_36, "\n")
	_FOR_ = 1
	for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
		print("P", L3_39[_FORV_7_])
	end
	L9_45 = #L3_39
	if L9_45 ~= 4 then
		L9_45 = #L3_39
		if L9_45 ~= 5 then
			L9_45 = nil
			return L9_45
		end
	end
	L9_45 = crypto
	L9_45 = L9_45.hmac
	L10_46 = A1_37
	L9_45 = L9_45(L10_46, L3_39[2] .. L3_39[3] .. L3_39[4], A2_38)
	L10_46 = print
	local L6_42 = L6_42
	local L7_43 = L7_43
	L10_46(L6_42, L7_43, L3_39[1])
	local L8_44 = L8_44
	L10_46 = L3_39[1]
	if L10_46 == L9_45 then
		L10_46 = L3_39[3]
		L6_42 = L3_39[4]
		return L10_46, L6_42
	else
		L10_46 = nil
		return L10_46
	end
end
function L12_12(A0_47)
	local L1_48
	if A0_47 then
		L1_48 = CUSTOM_OVERRIDES
		L1_48 = L1_48.MULTIPLAYER_USERS_ENDPOINT
		if not L1_48 then
			L1_48 = "http://users.little-generals.com/"
		end
		USERS_ENDPOINT = L1_48
		L1_48 = tostring
		local L2_49 = os.time()
		L1_48 = L1_48(L2_49, os.time())
		L2_49 = string
		L2_49 = L2_49.format
		local L7_54 = L7_54
		local L8_55 = L8_55
		local L9_56 = L9_56
		local L10_57 = L10_57
		L2_49 = L2_49(L7_54, L8_55, L9_56, L10_57, crypto.hmac(crypto.sha1, A0_47 .. L1_48, REMOTE_SIGNING_KEY))
		L7_54 = network
		L7_54 = L7_54.request
		L8_55 = USERS_ENDPOINT
		L9_56 = "/credit?"
		L10_57 = L2_49
		L8_55 = L8_55 .. L9_56 .. L10_57
		L9_56 = "GET"
		function L10_57(A0_58)
			if A0_58.status == 200 and (_ENV(A0_58.response, crypto.sha1, REMOTE_SIGNING_KEY) or _ENV(A0_58.response, crypto.sha1, REMOTE_SIGNING_KEY)) then
				if _ENV(A0_58.response, crypto.sha1, REMOTE_SIGNING_KEY) then
					({})[#{} + 1] = utils.comma_value(tostring(_ENV(A0_58.response, crypto.sha1, REMOTE_SIGNING_KEY))) .. " warbux added."
					warbux:credit(tonumber(_ENV(A0_58.response, crypto.sha1, REMOTE_SIGNING_KEY)))
				end
				if _ENV(A0_58.response, crypto.sha1, REMOTE_SIGNING_KEY) and tonumber(_ENV(A0_58.response, crypto.sha1, REMOTE_SIGNING_KEY)) > 0 then
					({})[#{} + 1] = utils.comma_value(tostring(_ENV(A0_58.response, crypto.sha1, REMOTE_SIGNING_KEY))) .. " wins added."
					local L7_65 = L7_65
					settings:set("statistics.kills", settings:get("statistics.kills", 0) + tonumber(_ENV(A0_58.response, crypto.sha1, REMOTE_SIGNING_KEY)))
					local L8_66 = L8_66
				end
				;({}).textLine1 = ({})[1]
				;({}).textLine2 = ({})[2]
				utils.getDialog({})
				return
			end
			L7_65 = utils
			L7_65 = L7_65.getDialog
			L8_66 = {}
			L8_66.textLine1 = "Invalid Code"
			L7_65(L8_66)
			L7_65 = print
			L8_66 = "DB"
			local L3_61 = L3_61
			L7_65(L8_66, L3_61, A0_58.status)
			local L4_62 = L4_62
		end
		L7_54(L8_55, L9_56, L10_57)
	end
end
function L13_13()
	local L0_67 = L0_67
	L0_67 = L0_67("multiplayer.trashDialog")
	local L1_68 = L1_68
	;({}).allowsEmptyString = false
	;({}).inputLength = 140
	local ({}).font, L3_70 = native.systemFontBold, L3_70
	L3_70.caption = "Credits Code"
	L3_70.confirmLabel = "CHECK"
	function L3_70.textEntered(A0_71)
		_ENV(A0_71)
		local L2_72 = L2_72
	end
	L3_70.validationFunction = nil
	L1_68(L3_70)
end
function L18_18()
	if _ENV.refreshLayer then
		_ENV.refreshLayer.text = nil
	end
	_ENV.refreshLayer = nil
	if _ENV.allItemsGroup then
		display.remove(_ENV.allItemsGroup)
	end
	_ENV.allItemsGroup = nil
	local L0_73 = L0_73
	L0_73(_ENV)
	local L1_74 = L1_74
	L0_73 = _ENV
	L0_73.buttons = nil
	L0_73 = nil
	_ENV = L0_73
end
function L19_19(A0_75, A1_76, A2_77, A3_78)
	local L4_79
	if A1_76 == _ENV then
		({}).size = A1_76.size
		L4_79 = utils.getOutlinedText(A0_75, {})
	else
		local L10_85 = display.newText(A0_75, 0, 0, A1_76.font, A1_76.size)
		L4_79 = L10_85
		L10_85 = A1_76.color
		if L10_85 then
			L10_85 = L4_79.setTextColor
			L10_85(L4_79, A1_76.color())
		else
			L10_85 = L4_79.setTextColor
			L10_85(L4_79, 0, 0, 0)
		end
	end
	L10_85 = L4_79.setReferencePoint
	L10_85(L4_79, display.TopCenterReferencePoint)
	L10_85 = display
	L10_85 = L10_85.newGroup
	L10_85 = L10_85()
	L10_85:insert(L4_79)
	local L6_81, L7_82 = L6_81, L7_82
	L6_81(L7_82, display.TopCenterReferencePoint)
	local L8_83 = L8_83
	L10_85.font = A1_76
	return L10_85
end
function L20_20(A0_86, A1_87)
	local L2_88 = storyboard.getPrevious()
	A0_86.previousScene = L2_88
	L2_88 = A0_86.view
	local L3_89 = display.newGroup()
	local L4_90 = L4_90
	L4_90(L2_88, L3_89)
	L4_90 = 405
	local L5_91 = L5_91
	;({}).group = L2_88
	;({}).title = "CREDITS"
	;({}).showBottomBar = false
	;({}).onClose = function()
		sound.playSound(sound.globalSounds.button)
		local L0_105 = storyboard.getCurrentSceneName()
		storyboard.gotoScene(_ENV.previousScene)
		local L1_106 = L1_106
		L1_106(L0_105)
		local L2_107 = L2_107
	end
	L5_91 = L5_91({})
	local L6_92 = L6_92
	;({}).buttonText = "GET CREDITS"
	;({}).onComplete = function()
		_ENV()
	end
	L6_92 = L6_92({})
	L2_88:insert(L6_92)
	L6_92.x = screenX + screenWidth / 2
	L6_92.y = 65
	L6_92.isHitTestable = true
	L6_92.alpha = 0
	local L7_93 = L7_93
	L7_93 = L7_93(L2_88, 0, 140, screenWidth - 200, L4_90)
	L7_93:setFillColor(LITTLE_GENERALS_BACKGROUND_LIGHT())
	L7_93:setStrokeColor(LITTLE_GENERALS_BROWN_DARK())
	L7_93.strokeWidth = 6
	L7_93:setReferencePoint(display.TopCenterReferencePoint)
	L7_93.x = screenX + screenWidth / 2
	if L3_3 then
		L18_18()
	end
	;({}).width = L7_93.width
	;({}).height = L4_90 - 5
	;({}).maskFile = "res/mask740x400.png"
	;({}).bgColor, ({})[1] = {}, 255
	;({}).bgColor, ({})[2] = {}, 255
	;({}).bgColor, ({})[3] = {}, 255
	;({}).bgColor, ({})[4] = {}, 0
	L3_3 = require("widget").newScrollView({})
	L3_3.rows = {}
	L3_3:setReferencePoint(display.TopCenterReferencePoint)
	L2_88:insert(L3_3)
	L3_3.x, L3_3.y = L7_93.x, L7_93.y + 5
	local L8_94 = display.newGroup()
	L8_94.numLines = 0
	L3_3:insert(L8_94)
	L3_3.content.horizontalScrollDisabled = true
	L3_3.allItemsGroup = L8_94
	local L9_95, L10_96 = L9_95, L10_96
	L9_95 = L9_95(L10_96, screenX + screenWidth / 2, 0)
	function L10_96(A0_108)
		local L1_109
		L1_109 = _ENV
		L1_109 = L1_109.contentHeight
		local L2_110, L3_111 = L2_110, L3_111
		L2_110(L3_111, A0_108)
		local L4_112 = L4_112
		L2_110 = L9_95
		A0_108.x = L2_110
		A0_108.y = L1_109
		L2_110 = A0_108.font
		if L2_110 then
			L2_110 = A0_108.y
			L3_111 = A0_108.font
			L3_111 = L3_111.offset
			if not L3_111 then
				L3_111 = 0
			end
			L2_110 = L2_110 + L3_111
			A0_108.y = L2_110
		end
		L2_110 = _ENV
		L3_111 = _ENV
		L3_111 = L3_111.numLines
		L3_111 = L3_111 + 1
		L2_110.numLines = L3_111
	end
	_FOR_ = 1
	for _FORV_14_ = _FOR_, _FOR_, _FOR_ do
		L10_96(L19_19(unpack(L10_10[_FORV_14_])))
	end
	L18_104 = L10_96
	L18_104(L19_19(unpack(L9_9)))
	L18_104 = display
	L18_104 = L18_104.newImage
	L18_104 = L18_104("res/corona-badge.png")
	L18_104:setReferencePoint(display.TopCenterReferencePoint)
	local L12_98 = L12_98
	L12_98(L18_104)
	local L13_99 = L13_99
	L12_98 = L10_96
	L13_99 = L19_19
	local L16_102 = L16_102
	;({})[1] = "This application was developed using Corona SDK."
	local ({})[2], L17_103 = L6_6, L17_103
	L16_102, L17_103 = L16_102(L17_103)
	L13_99, L16_102, L17_103 = L13_99(L16_102, L17_103, L16_102(L17_103))
	L12_98(L13_99, L16_102, L17_103, L13_99(L16_102, L17_103, L16_102(L17_103)))
	L12_98 = L10_96
	L13_99 = L19_19
	L16_102 = unpack
	L17_103 = L9_9
	L16_102, L17_103 = L16_102(L17_103)
	L13_99, L16_102, L17_103 = L13_99(L16_102, L17_103, L16_102(L17_103))
	L12_98(L13_99, L16_102, L17_103, L13_99(L16_102, L17_103, L16_102(L17_103)))
	L12_98 = L10_96
	L13_99 = L19_19
	L16_102 = unpack
	L17_103 = L9_9
	L16_102, L17_103 = L16_102(L17_103)
	L13_99, L16_102, L17_103 = L13_99(L16_102, L17_103, L16_102(L17_103))
	L12_98(L13_99, L16_102, L17_103, L13_99(L16_102, L17_103, L16_102(L17_103)))
end
L2_2.createScene = L20_20


-- [End of decompiled block; see disassembly for inner stripped closures]
