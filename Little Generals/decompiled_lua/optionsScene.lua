-- Decompiled & AI-Repaired from optionsScene.lu
-- Source disassembly preserved at: disasm/optionsScene.disasm

require("facebookSupport")
require("twitterSupport")
local L1_1 = L1_1
L1_1 = storyboard
L1_1 = L1_1.newScene
L1_1 = L1_1()
local L2_2 = L2_2
local L3_3 = L3_3
L2_2[1] = L3_3
L2_2[2] = 247
L2_2[3] = 219
function L3_3(A0_8, A1_9, A2_10, A3_11)
	local L14_22 = display.newGroup
	L14_22 = L14_22()
	local L5_13 = L5_13
	L5_13 = L5_13(A0_8)
	local L6_14 = L6_14
	L6_14 = L6_14(A1_9, "toggle_back.png")
	L5_13.width = L6_14.spriteSourceSize.width
	L5_13.height = L6_14.spriteSourceSize.height
	L5_13:prepare("toggle_back.png")
	L14_22:insert(L5_13)
	local L7_15 = L7_15
	L7_15 = L7_15(A0_8)
	local L8_16 = L8_16
	L8_16 = L8_16(A1_9, "toggle_slider.png")
	L7_15.width = L6_14.spriteSourceSize.width
	L7_15.height = L6_14.spriteSourceSize.height
	L7_15:prepare("toggle_slider.png")
	local L9_17, L10_18 = L9_17, L10_18
	L9_17(L10_18, L7_15)
	L9_17 = L5_13.width
	L9_17 = -L9_17
	L9_17 = L9_17 * 0.25
	L10_18 = L5_13.width
	L10_18 = L10_18 * 0.25
	function L14_22.setChecked(A0_23)
		local L1_24, L2_25
		L1_24 = _ENV
		L2_25 = L5_13
		L2_25 = L2_25.width
		L2_25 = L2_25 * 0.25
		L1_24.x = L2_25
		if A0_23 then
			L1_24 = _ENV
			L2_25 = _ENV
			L2_25 = L2_25.x
			L2_25 = L2_25 * -1
			L1_24.x = L2_25
		end
		L1_24 = L4_12
		L1_24.currentState = A0_23
	end
	L14_22.setChecked(A2_10)
	local L11_19, L12_20 = L11_19, L12_20
	local L13_21 = L13_21
	L11_19(L12_20, L13_21, function(A0_26)
		repeat
			if A0_26.phase == "began" then
				display.getCurrentStage():setFocus(A0_26.target)
			else
				if A0_26.phase == "moved" then
					local L5_31 = L5_31
					L7_15.x = math.min(math.max(L9_17, (_ENV:contentToLocal(A0_26.x, A0_26.y))), L10_18)
					break -- pseudo-goto
				end
				L5_31 = A0_26.phase
				if L5_31 ~= "ended" then
					L5_31 = A0_26.phase
					if L5_31 ~= "cancelled" then
						goto lbl_95
					end
				end
				L5_31 = display
				L5_31 = L5_31.getCurrentStage
				L5_31 = L5_31()
				L5_31 = L5_31.setFocus
				L5_31(L5_31, nil)
				L5_31 = _ENV
				L5_31 = L5_31.contentToLocal
				L5_31 = L5_31(L5_31, A0_26.x, A0_26.y)
				if 0 < L5_31 then
					L7_15.x = L10_18
					if L4_12.currentState ~= false then
						L4_12.currentState = false
						if A3_11 and A3_11(L4_12, false) == false then
							L4_12.setChecked(false)
						end
					end
				else
					L7_15.x = L9_17
					if L4_12.currentState ~= true then
						L4_12.currentState = true
						if A3_11 then
							local L2_28 = L2_28
							L2_28 = L2_28(L4_12, true)
							if L2_28 == false then
								local L3_29 = L3_29
								L3_29(false)
								local L4_30 = L4_30
							end
						end
					end
				end
			end
		until true
		::lbl_95::
	end)
	return L14_22
end
function slideControl(A0_32, A1_33, A2_34, A3_35)
	local L17_49 = display.newGroup
	L17_49 = L17_49()
	local L5_37 = L5_37
	L5_37 = L5_37(A0_32)
	local L6_38 = L6_38
	L6_38 = L6_38(A1_33, "slider_back.png")
	L5_37.width = L6_38.spriteSourceSize.width
	L5_37.height = L6_38.spriteSourceSize.height
	L5_37:prepare("slider_back.png")
	L5_37:setReferencePoint(display.CenterRightReferencePoint)
	local L7_39 = L7_39
	L7_39 = L7_39(A0_32)
	local L8_40 = L8_40
	L8_40 = L8_40(A1_33, "slider_fill.png")
	L7_39.width = L8_40.spriteSourceSize.width
	L7_39.height = L8_40.spriteSourceSize.height
	L7_39:prepare("slider_fill.png")
	L7_39:setReferencePoint(display.CenterRightReferencePoint)
	local L9_41 = L9_41
	L9_41 = L9_41("res/options/bar_mask.png")
	L7_39:setMask(L9_41)
	L7_39.maskX = 0
	local L10_42 = L10_42
	L10_42 = L10_42(A0_32)
	local L11_43 = L11_43
	L11_43 = L11_43(A1_33, "emptycircle.png")
	L10_42.width = L11_43.spriteSourceSize.width
	L10_42.height = L11_43.spriteSourceSize.height
	L10_42:prepare("emptycircle.png")
	L10_42.xOrigin = 0
	function L17_49.update(A0_50)
		local L4_54 = L4_54
		L4_54.x = L7_39.width / 2 - L7_39.width * (1 - A0_50)
		L4_54 = L7_39
		L4_54.x = -L7_39.width * (1 - A0_50) + L7_39.width / 2
		L4_54 = L7_39
		L4_54.maskX = -L7_39.x - 1 + L7_39.width / 2 + 5
		L4_54 = A3_35
		if L4_54 then
			L4_54 = A3_35
			L4_54(A0_50)
			local L2_52 = L2_52
		end
	end
	L17_49:insert(L5_37)
	L17_49:insert(L7_39)
	L17_49:insert(L10_42)
	local L12_44 = L12_44
	L12_44(A2_34)
	local L13_45 = L13_45
	L12_44 = L5_37.width
	L12_44 = -L12_44
	L12_44 = L12_44 / 2
	L13_45 = L5_37.width
	L13_45 = L13_45 / 2
	local L14_46, L15_47 = L14_46, L15_47
	local L16_48 = L16_48
	L14_46(L15_47, L16_48, function(A0_55)
		repeat
			if A0_55.phase == "began" then
				display.getCurrentStage():setFocus(A0_55.target)
			else
				if A0_55.phase == "moved" then
					local L5_60 = L5_60
					L4_36.update((_ENV.width / 2 + math.min(math.max(L12_44, (_ENV:contentToLocal(A0_55.x, A0_55.y))), L13_45)) / _ENV.width)
					break -- pseudo-goto
				end
				L5_60 = A0_55.phase
				if L5_60 ~= "ended" then
					L5_60 = A0_55.phase
					if L5_60 ~= "cancelled" then
						goto lbl_51
					end
				end
				L5_60 = display
				L5_60 = L5_60.getCurrentStage
				L5_60 = L5_60()
				L5_60 = L5_60.setFocus
				local L2_57 = L2_57
				L5_60(L2_57, nil)
				local L3_58 = L3_58
			end
		until true
		::lbl_51::
	end)
	return L17_49
end
function L1_1.createScene(A0_61, A1_62)
	local L2_63
	L2_63 = true
	local L7_68 = system
	L7_68 = L7_68.getInfo
	L7_68 = L7_68("environment")
	if "simulator" == L7_68 then
		L2_63 = false
	end
	L7_68 = storyboard
	L7_68 = L7_68.getPrevious
	L7_68 = L7_68()
	A0_61.previousScene = L7_68
	L7_68 = A0_61.view
	local L4_65 = L4_65
	;({}).group = L7_68
	;({}).title = "OPTIONS"
	;({}).showBottomBar = false
	;({}).onClose = function()
		sound.playSound(sound.globalSounds.button)
		if not REMINDERS_ENABLED then
			require("reminders").cancelAll()
		end
		settings:save()
		local L0_84 = storyboard.getCurrentSceneName()
		storyboard.gotoScene(_ENV.previousScene, "slideUp")
		local L3_87 = L3_87
		L3_87 = storyboard
		L3_87 = L3_87.removeScene
		L3_87(L0_84)
		local L2_86 = L2_86
	end
	L4_65 = L4_65({})
	local L5_66 = L5_66
	local L5_66, L6_67 = L5_66(UI_SPRITE_SHEET)
	local L8_69 = L8_69
	utils.newButton(L5_66, L6_67, "credits_medallion.png", nil, L8_69):setReferencePoint(display.TopLeftReferencePoint)
	utils.newButton(L5_66, L6_67, "credits_medallion.png", nil, L8_69).x = screenX - 16
	utils.newButton(L5_66, L6_67, "credits_medallion.png", nil, L8_69).y = -30
	L7_68:insert((utils.newButton(L5_66, L6_67, "credits_medallion.png", nil, L8_69)))
	local L9_70 = L9_70
	L7_68:insert((display.newGroup()))
	local L10_71 = L10_71
	_ENV(L10_71, L5_66, L6_67, "speech_icon.png", "SPEECH", (slideControl(L5_66, L6_67, sound.getSpeechVolume(), function(A0_88)
		sound.setSpeechVolume(A0_88)
		local L2_89 = L2_89
	end)))
	local L11_72 = L11_72
	local L12_73 = L12_73
	_ENV(L10_71, L5_66, L6_67, "sound_icon.png", "SOUND", L12_73)
	print(L12_73.x, L12_73.y, L12_73.xOrigin, L12_73.yOrigin, L12_73.xReference, L12_73.yReference)
	local L13_74 = L13_74
	_ENV(L10_71, L5_66, L6_67, "reminders_icon.png", "REMINDERS", (L3_3(L5_66, L6_67, REMINDERS_ENABLED, function(A0_90, A1_91)
		REMINDERS_ENABLED = A1_91
		local L2_92, L3_93 = L2_92, L3_93
		local L4_94 = L4_94
		L2_92(L3_93, L4_94, A1_91)
		local L5_95 = L5_95
	end)))
	local L14_75 = L14_75
	_ENV(L10_71, L5_66, L6_67, "optionsfacebook_icon.png", "FACEBOOK", (L3_3(L5_66, L6_67, facebookSupport.facebookEnabled, function(A0_96, A1_97)
		repeat
			local L3_99 = L3_99
			if A1_97 then
				L3_99 = facebookSupport
				L3_99 = L3_99.init
				L3_99(function()
					local L1_100 = L1_100
					L1_100(_ENV, true)
					local L2_101 = L2_101
				end)
				L3_99 = false
				do return L3_99 end
				break -- pseudo-goto
			end
			L3_99 = facebookSupport
			L3_99 = L3_99.stop
			L3_99()
		until true
	end)))
	local L15_76 = L15_76
	local L19_80 = L19_80
	local L20_81 = L20_81
	local L21_82 = L21_82
	L20_81(L21_82, L5_66, L6_67, "optionstwitter_icon.png", "TWITTER", L19_80)
	local L22_83 = L22_83
	L21_82 = L10_71
	L20_81 = L10_71.setReferencePoint
	L22_83 = display
	L22_83 = L22_83.TopCenterReferencePoint
	L20_81(L21_82, L22_83)
	L10_71.y = 125
	L20_81 = screenX
	L21_82 = screenWidth
	L21_82 = L21_82 / 2
	L20_81 = L20_81 + L21_82
	L10_71.x = L20_81
end


-- [End of decompiled block; see disassembly for inner stripped closures]
