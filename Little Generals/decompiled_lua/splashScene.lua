local L0_0
L0_0 = "res/sounds/button_metal.mp3"
local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12 = storyboard, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
L2_2 = L2_2.newScene
L2_2 = L2_2()
L3_3 = nil
L4_4 = nil
L5_5 = nil
L6_6 = nil
L7_7 = 300
L8_8 = nil
L9_9 = nil
L10_10 = nil
function L11_11(A0_17, A1_18)
	local L2_19, L3_20, L4_21
	L3_20 = "Default.png"
	L4_21 = -90
	if utils.isIPad() then
		L3_20 = "Default-Landscape.png"
		if display.contentWidth / display.contentScaleX >= 2048 then
			L3_20 = "Default-Landscape@2x.png"
		end
		L4_21 = 0
	elseif display.pixelHeight > 960 then
		L3_20 = "Default-568h@2x.png"
	end
	L2_19 = display.newImage(L3_20, 0, 0, true)
	local L5_22 = L5_22
	L5_22 = L5_22(display.contentHeight, screenWidth)
	L5_22 = L5_22 / math.min(L2_19.height, L2_19.width)
	local L6_23 = L6_23
	L6_23(L2_19, L5_22, L5_22)
	L2_19.rotation = L4_21
	L6_23 = screenWidth
	L6_23 = L6_23 / 2
	L6_23 = L6_23 + screenX
	L2_19.x = L6_23
	L6_23 = display
	L6_23 = L6_23.contentHeight
	L6_23 = L6_23 / 2
	L2_19.y = L6_23
	L6_23 = false
	_FOR_, _FOR_, _FOR_ = pairs(CUSTOM_OVERRIDES)
	for _FORV_10_, _FORV_11_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_11_ then
			L6_23 = true
			break
		end
	end
	if L6_23 then
		L2_19:setFillColor(255, 0, 0)
		_ENV = display.newGroup()
		local L13_29 = L13_29
		local L14_30 = display.newText(_ENV, "DO NOT DISTRIBUTE", 0, 150, "SingleSleeve", 100)
		L14_30:setReferencePoint(display.TopCenterReferencePoint)
		L14_30.x = L13_29.contentWidth / 2
		_ENV:setReferencePoint(display.CenterReferencePoint)
		_ENV.x, _ENV.y = (screenX + display.contentWidth) / 2, display.contentHeight / 2
		_ENV.rotation = 30
	end
	L13_29 = spritesheetmanager
	L13_29 = L13_29.getSpriteSet
	L14_30 = "res/splash/splashscreen.png"
	L13_29 = L13_29(L14_30)
	L4_4 = L13_29
	L13_29 = sprite
	L13_29 = L13_29.newSprite
	L14_30 = L4_4
	L13_29 = L13_29(L14_30)
	L5_5 = L13_29
	L13_29 = L5_5
	L13_29.width = 190
	L13_29 = L5_5
	L13_29.height = 91
	L13_29 = L5_5
	L14_30 = L13_29
	L13_29 = L13_29.setReferencePoint
	L13_29(L14_30, display.CenterReferencePoint)
	L13_29 = L5_5
	L14_30 = L13_29
	L13_29 = L13_29.prepare
	L13_29(L14_30, "play_normal_btn.png")
	L13_29 = L5_5
	L14_30 = L13_29
	L13_29 = L13_29.addEventListener
	L13_29(L14_30, "touch", function(A0_31)
		if A0_31.phase == "began" then
			display.getCurrentStage():setFocus(_ENV)
			_ENV:prepare("play_select_btn.png")
		elseif A0_31.phase == "ended" or A0_31.phase == "cancelled" then
			display.getCurrentStage():setFocus(nil)
			_ENV:prepare("play_normal_btn.png")
			;({}).onComplete = function(A0_44)
				if A0_44.completed then
					sound.dispose(_ENV)
					local L2_45 = L2_45
				end
			end
			sound.playSound(L0_0, {})
			local L1_32 = L1_32
			L1_32 = L1_32(settings, "lastVersionAcknowledged")
			print("Verison", L1_32)
			if L1_32 and tonumber(L1_32) < tonumber(CURRENT_VERSION) then
				storyboard.gotoScene("newsScene")
			else
				settings:set("lastVersionAcknowledged", CURRENT_VERSION)
				if not CUSTOM_OVERRIDES.SPECIAL_PERSON or not CUSTOM_OVERRIDES.SPECIAL_PERSON.ID then
				end
				if CUSTOM_OVERRIDES.SPECIAL_PERSON and not settings:get("specialBuild." .. "") then
					if not CUSTOM_OVERRIDES.SPECIAL_PERSON.CASH then
					end
					warbux:set(0)
					if not CUSTOM_OVERRIDES.SPECIAL_PERSON.WINS then
					end
					;({}).kills = 0
					achievementList.updateStatistics({})
					achievementList.acknowledgeAll()
					;(function(A0_46)
						local L1_47, L2_48, L3_49, L4_50
						L1_47 = 1
						L2_48 = #A0_46
						L3_49 = 1
						for L4_50 = L1_47, L2_48, L3_49 do
							local L5_51 = L5_51
							L5_51(A0_46[L4_50])
							local L6_52 = L6_52
						end
					end)(require("tutorial").getMapTutorialIds())
					;(function(A0_53)
						local L1_54, L2_55, L3_56, L4_57
						L1_54 = 1
						L2_55 = #A0_53
						L3_56 = 1
						for L4_57 = L1_54, L2_55, L3_56 do
							local L5_58 = L5_58
							L5_58(A0_53[L4_57])
							local L6_59 = L6_59
						end
					end)(require("tutorial").getBattleTutorialIds())
					_FOR_ = 1
					for _FORV_8_ = _FOR_, _FOR_, _FOR_ do
						if weaponTypes[_FORV_8_].unlockable and weaponTypes[_FORV_8_].unlockable.unlockState then
							local L9_40 = L9_40
							do
								local L12_43 = L12_43
								require("tutorial").setTutorialComplete("weaponUnlock" .. tostring(_FORV_8_))
								settings:set(L9_40, true)
								if CUSTOM_OVERRIDES.SPECIAL_PERSON.MESSAGE then
									({}).textLine1 = CUSTOM_OVERRIDES.SPECIAL_PERSON.MESSAGE
									utils.getDialog({})
								end
								L12_43 = settings
								L12_43 = L12_43.save
								L12_43(L12_43)
								L12_43 = storyboard
								L12_43 = L12_43.gotoScene
								L12_43("campaignMapScene")
								L9_40 = storyboard
								L9_40 = L9_40.removeScene
								L12_43 = "splashScene"
								L9_40(L12_43)
								L1_32 = true
								return L1_32
							end
						end
					end
				end
			end
		end
	end)
	L13_29 = sprite
	L13_29 = L13_29.newSprite
	L14_30 = L4_4
	L13_29 = L13_29(L14_30)
	L6_6 = L13_29
	L13_29 = L6_6
	L14_30 = L13_29
	L13_29 = L13_29.prepare
	L13_29(L14_30, "loading_text.png")
	L13_29 = L6_6
	L14_30 = screenWidth
	L14_30 = L14_30 / 2
	L14_30 = L14_30 + screenX
	L13_29.x = L14_30
	L13_29 = L6_6
	L14_30 = display
	L14_30 = L14_30.contentHeight
	L14_30 = L14_30 / 2
	L14_30 = L14_30 + 200
	L13_29.y = L14_30
	L13_29 = L6_6
	L13_29.width = 196
	L13_29 = L6_6
	L13_29.height = 61
	L13_29 = L6_6
	L14_30 = L13_29
	L13_29 = L13_29.setReferencePoint
	L13_29(L14_30, display.CenterReferencePoint)
	L13_29 = A0_17.view
	L14_30 = L13_29
	L13_29 = L13_29.insert
	L13_29(L14_30, L2_19)
	L13_29 = A0_17.view
	L14_30 = L13_29
	L13_29 = L13_29.insert
	L13_29(L14_30, L5_5)
	L13_29 = A0_17.view
	L14_30 = L13_29
	L13_29 = L13_29.insert
	L13_29(L14_30, L6_6)
	L13_29 = L5_5
	L13_29.isVisible = false
	L13_29 = display
	L13_29 = L13_29.newRect
	L14_30 = 0
	L13_29 = L13_29(L14_30, 0, L7_7, 10)
	L8_8 = L13_29
	L13_29 = L8_8
	L13_29.strokeWidth = 2
	L13_29 = L8_8
	L14_30 = L13_29
	L13_29 = L13_29.setStrokeColor
	L13_29(L14_30, 0, 0, 0, 128)
	L13_29 = L8_8
	L14_30 = L13_29
	L13_29 = L13_29.setFillColor
	L13_29(L14_30, 255, 255, 255, 128)
	L13_29 = L8_8
	L14_30 = L8_8
	L13_29.x, L14_30.y = L6_6.x, L6_6.y + L6_6.contentHeight / 2 + L8_8.contentHeight / 2 + 5
	L13_29 = A0_17.view
	L14_30 = L13_29
	L13_29 = L13_29.insert
	L13_29(L14_30, L8_8)
	L13_29 = A0_17.view
	L14_30 = screenX
	L13_29.x = L14_30
	L13_29 = display
	L13_29 = L13_29.newText
	L14_30 = "v"
	L14_30 = L14_30 .. CURRENT_VERSION_FOR_DISPLAY
	L13_29 = L13_29(L14_30, 0, 0, "SingleSleeve", 25)
	L13_29.alpha = 0.75
	L14_30 = L13_29.setTextColor
	L14_30(L13_29, LITTLE_GENERALS_BROWN_DARK())
	L14_30 = A0_17.view
	L14_30 = L14_30.insert
	local L9_26 = L9_26
	L14_30(L9_26, L13_29)
	local L10_27 = L10_27
	L14_30 = screenX
	L9_26 = screenWidth
	L14_30 = L14_30 + L9_26
	L9_26 = L13_29.contentWidth
	L9_26 = L9_26 / 2
	L14_30 = L14_30 - L9_26
	L14_30 = L14_30 - 2
	L9_26 = L2_19.x
	L10_27 = L2_19.contentWidth
	L10_27 = L10_27 / 2
	L9_26 = L9_26 + L10_27
	L10_27 = screenX
	L10_27 = L10_27 + screenWidth
	if L9_26 < L10_27 then
		L9_26 = L2_19.x
		L10_27 = L2_19.contentWidth
		L10_27 = L10_27 / 2
		L9_26 = L9_26 + L10_27
		L10_27 = L13_29.contentWidth
		L10_27 = L10_27 / 2
		L9_26 = L9_26 - L10_27
		L14_30 = L9_26 - 2
	end
	L13_29.x = L14_30
	L9_26 = display
	L9_26 = L9_26.contentHeight
	L10_27 = L13_29.contentHeight
	L10_27 = L10_27 / 2
	L9_26 = L9_26 - L10_27
	L9_26 = L9_26 - 2
	L13_29.y = L9_26
end
L2_2.createScene = L11_11
L11_11 = loadActions
L11_11 = #L11_11
L11_11 = 100 / L11_11
L12_12 = 0
function L2_2.enterScene(A0_60, A1_61)
	_ENV()
end
function L2_2.destroyScene(A0_62, A1_63)
	if _ENV then
		_ENV:removeSelf()
	end
	if L10_10 then
		L10_10:removeSelf()
	end
	L5_5:removeSelf()
	L5_5 = nil
	L4_4 = nil
	_ENV = nil
	L1_1 = nil
	spritesheetmanager.disposeSpriteSet("res/splash/splashscreen.png")
	local L3_64 = L3_64
end
function L2_2.exitScene(A0_65, A1_66)
	local L2_67
	L2_67 = _ENV
	L2_67.isVisible = false
end
L2_2:addEventListener("createScene", L2_2)
L2_2:addEventListener("enterScene", L2_2)
L2_2:addEventListener("destroyScene", L2_2)
local L13_13, L14_14 = L13_13, L14_14
local L15_15 = L15_15
L14_14(L15_15, "exitScene", L2_2)
local L16_16 = L16_16
return L2_2
