local L3_3, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43, L44_44, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63, L64_64, L65_65, L66_66 = L3_3, "widgetTracker", L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32, L33_33, L34_34, L35_35, L36_36, L37_37, L38_38, L39_39, L40_40, L41_41, L42_42, L43_43, L44_44, L45_45, L46_46, L47_47, L48_48, L49_49, L50_50, L51_51, L52_52, L53_53, L54_54, L55_55, L56_56, L57_57, L58_58, L59_59, L60_60, L61_61, L62_62, L63_63, L64_64, L65_65, L66_66
L3_3(L6_6)
L3_3 = require
L6_6 = "battleAvatar"
L3_3(L6_6)
L3_3 = require
L6_6 = "tankAvatar"
L3_3(L6_6)
L3_3 = require
L6_6 = "objectTemplates"
L3_3(L6_6)
L3_3 = require
L6_6 = "achievementList"
L3_3(L6_6)
L3_3 = require
L6_6 = "notificationQueue"
L3_3 = L3_3(L6_6)
L6_6 = nil
L7_7 = storyboard
L7_7 = L7_7.newScene
L7_7 = L7_7()
L8_8 = nil
L9_9 = WidgetTracker
L10_10 = L9_9
L9_9 = L9_9.new
L9_9 = L9_9(L10_10)
L10_10 = 12
L11_11 = false
L12_12 = false
L13_13 = false
L14_14 = false
L15_15 = nil
L16_16 = nil
L17_17 = nil
L18_18 = nil
L19_19 = nil
L20_20 = nil
L21_21 = nil
L22_22 = nil
L23_23 = nil
L24_24 = nil
L25_25 = 0
L26_26 = 0
L27_27 = 0
L28_28 = 0
L29_29 = 0
L30_30 = 0
L31_31 = 0
L32_32 = 0
L33_33 = nil
L34_34 = nil
L35_35 = nil
L36_36 = nil
L37_37 = nil
L38_38 = nil
L39_39 = nil
L40_40 = nil
L41_41 = nil
L42_42 = nil
L43_43 = {}
L44_44 = {}
L45_45 = {}
L46_46 = {}
L47_47 = true
L48_48 = nil
L49_49 = screenX
L50_50 = screenWidth
L50_50 = L50_50 / 2
L49_49 = L49_49 + L50_50
L50_50 = display
L50_50 = L50_50.contentHeight
L50_50 = L50_50 / 2
L51_51 = 0.75
L52_52 = nil
L53_53 = nil
L54_54 = nil
L55_55 = nil
L56_56 = nil
L57_57 = {}
L58_58 = {}
L58_58.fileName = "res/sounds/march1.mp3"
L58_58.isStream = false
L57_57.marchmusic = L58_58
L57_57.kaching = "res/sounds/kaching.mp3"
L57_57.select = "res/sounds/weapon_select.mp3"
function L58_58()
	local L0_73, L1_74 = L0_73, L1_74
	local L0_73, L2_75 = L0_73(L1_74, "mapState"), L2_75
	if not L0_73 then
		L0_73 = {}
	end
	L1_74 = L0_73.MAP_INITIAL_X
	if not L1_74 then
		L1_74 = _ENV
	end
	_ENV = L1_74
	L1_74 = L0_73.MAP_INITIAL_Y
	if not L1_74 then
		L1_74 = L50_50
	end
	L50_50 = L1_74
	L1_74 = L0_73.MAP_INITIAL_SCALE
	if not L1_74 then
		L1_74 = L51_51
	end
	L51_51 = L1_74
end
function L59_59()
	local L0_76 = L0_76
	L50_50, L0_76 = L0_76(L16_16, 0, 0)
	_ENV = L0_76
	L0_76 = L16_16
	L0_76 = L0_76.xScale
	L51_51 = L0_76
	L0_76 = {}
	L0_76.MAP_INITIAL_X = _ENV
	L0_76.MAP_INITIAL_Y = L50_50
	L0_76.MAP_INITIAL_SCALE = L51_51
	local L3_79 = L3_79
	L3_79(settings, "mapState", L0_76)
	local L4_80 = L4_80
	L3_79 = settings
	L4_80 = L3_79
	L3_79 = L3_79.save
	L3_79(L4_80)
end
function L60_60()
	if #achievementList.unacknowledgedUpdates > 0 then
		local L0_81 = storyboard.getPrevious()
		_ENV()
		local L1_82 = L1_82
		L1_82("achievementScene")
		local L2_83 = L2_83
	end
end
function L61_61(A0_84, A1_85)
	sound.loadSoundBatch(_ENV)
	if activeCampaign.lands[2] == nil then
		buildNewCampaign(activeCampaign)
	end
	if not activeCampaign.outIslands or #activeCampaign.outIslands == 0 then
		generateCampaignOutIslands(activeCampaign)
	end
	if activeCampaign.countries[HOMELAND_COUNTRY_ID].moneyStartDate == nil then
		activeCampaign.countries[HOMELAND_COUNTRY_ID].moneyStartDate = os.time() - dailies.getTimeEvents().dailyAllowance.interval
		activeCampaign.countries[HOMELAND_COUNTRY_ID].moneyAmount = calculateDailyAmount(activeCampaign)
	end
	L52_52, L53_53 = spritesheetmanager.getSpriteSet(UI_SPRITE_SHEET)
	loadNewCampaignTheme(activeCampaign.theme)
	local L3_87 = L3_87
	L3_87 = system
	L3_87 = L3_87.getTimer
	L3_87 = L3_87()
	L15_15 = display.newGroup()
	A0_84.view:insert(L15_15)
	local L4_88 = L4_88
	;({})[1] = 0
	;({})[2] = 0
	;({})[3] = 0
	;({})[4] = 255
	;({})[1] = 0
	;({})[2] = 0
	;({})[3] = 0
	;({})[4] = 0
	display.newRect(L15_15, screenX, -120, screenWidth, display.contentHeight / 2 + 100):setFillColor(graphics.newGradient({}, {}, "down"))
	;({})[1] = 0
	;({})[2] = 0
	;({})[3] = 0
	;({})[4] = 255
	;({})[1] = 0
	;({})[2] = 0
	;({})[3] = 0
	;({})[4] = 0
	display.newRect(L15_15, screenX, display.contentHeight / 2 + 20, screenWidth, display.contentHeight / 2 + 100):setFillColor(graphics.newGradient({}, {}, "up"))
	local L5_89 = L5_89
	display.newRect(L15_15, screenX, 0, screenWidth, display.contentHeight).strokeWidth = 16
	display.newRect(L15_15, screenX, 0, screenWidth, display.contentHeight):setStrokeColor(98, 65, 24)
	display.newRect(L15_15, screenX, 0, screenWidth, display.contentHeight):setFillColor(0, 0, 0, 0)
	display.newRect(L15_15, screenX + 4, 4, screenWidth - 8, display.contentHeight - 8).strokeWidth = 3
	display.newRect(L15_15, screenX + 4, 4, screenWidth - 8, display.contentHeight - 8):setStrokeColor(224, 140, 38)
	display.newRect(L15_15, screenX + 4, 4, screenWidth - 8, display.contentHeight - 8):setFillColor(0, 0, 0, 0)
	local L6_90 = L6_90
	utils.newButton(L52_52, L53_53, "options_normal_btn.png", "options_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		_ENV()
		local L0_104 = L0_104
		local L1_105 = L1_105
		L0_104(L1_105, "fromBottom")
		local L2_106 = L2_106
		L0_104 = true
		return L0_104
	end).x = screenX + screenWidth - L10_10 - utils.newButton(L52_52, L53_53, "options_normal_btn.png", "options_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		_ENV()
		local L0_107 = L0_107
		local L1_108 = L1_108
		L0_107(L1_108, "fromBottom")
		local L2_109 = L2_109
		L0_107 = true
		return L0_107
	end).contentWidth / 2
	utils.newButton(L52_52, L53_53, "options_normal_btn.png", "options_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		_ENV()
		local L0_110 = L0_110
		local L1_111 = L1_111
		L0_110(L1_111, "fromBottom")
		local L2_112 = L2_112
		L0_110 = true
		return L0_110
	end).y = display.contentHeight - L10_10 - utils.newButton(L52_52, L53_53, "options_normal_btn.png", "options_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		_ENV()
		local L0_113 = L0_113
		local L1_114 = L1_114
		L0_113(L1_114, "fromBottom")
		local L2_115 = L2_115
		L0_113 = true
		return L0_113
	end).contentHeight / 2
	utils.parentWidget(utils.newButton(L52_52, L53_53, "options_normal_btn.png", "options_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		_ENV()
		local L0_116 = L0_116
		local L1_117 = L1_117
		L0_116(L1_117, "fromBottom")
		local L2_118 = L2_118
		L0_116 = true
		return L0_116
	end), L15_15)
	local L7_91 = L7_91
	utils.newButton(L52_52, L53_53, "missions_normal_btn.png", "missions_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		_ENV()
		local L0_119 = L0_119
		local L1_120 = L1_120
		L0_119(L1_120, "fromBottom")
		local L2_121 = L2_121
		L0_119 = true
		return L0_119
	end).x = screenX + L10_10 + utils.newButton(L52_52, L53_53, "missions_normal_btn.png", "missions_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		_ENV()
		local L0_122 = L0_122
		local L1_123 = L1_123
		L0_122(L1_123, "fromBottom")
		local L2_124 = L2_124
		L0_122 = true
		return L0_122
	end).contentWidth / 2
	utils.newButton(L52_52, L53_53, "missions_normal_btn.png", "missions_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		_ENV()
		local L0_125 = L0_125
		local L1_126 = L1_126
		L0_125(L1_126, "fromBottom")
		local L2_127 = L2_127
		L0_125 = true
		return L0_125
	end).y = display.contentHeight - L10_10 - utils.newButton(L52_52, L53_53, "missions_normal_btn.png", "missions_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		_ENV()
		local L0_128 = L0_128
		local L1_129 = L1_129
		L0_128(L1_129, "fromBottom")
		local L2_130 = L2_130
		L0_128 = true
		return L0_128
	end).contentHeight / 2
	utils.parentWidget(utils.newButton(L52_52, L53_53, "missions_normal_btn.png", "missions_select_btn.png", function()
		sound.playSound(sound.globalSounds.button)
		_ENV()
		local L0_131 = L0_131
		local L1_132 = L1_132
		L0_131(L1_132, "fromBottom")
		local L2_133 = L2_133
		L0_131 = true
		return L0_131
	end), L15_15)
	L24_24 = display.newGroup()
	L35_35 = display.newRect(0, 0, 510, 62)
	utils.parentWidget(L35_35, L24_24)
	L35_35:setFillColor(LITTLE_GENERALS_OFF_WHITE())
	L35_35.x = screenX + screenWidth / 2
	L35_35.y = L10_10 + L35_35.contentHeight / 2
	L35_35:addEventListener("touch", function()
		local L1_134
		L1_134 = true
		return L1_134
	end)
	;({}).width = 100
	;({}).padLeft = 0
	;({}).padRight = 0
	;({}).padTop = 20
	;({}).extraHitArea, ({}).padBottom = {}, 10
	;({}).onComplete = function()
		local L2_137 = L2_137
		local L2_137, L3_138 = L2_137(settings, "isCheater", false), L3_138
		if L2_137 then
			L2_137 = _ENV
			L2_137 = L2_137.add
			L3_138 = {}
			L3_138.direction = "down"
			L3_138.text = "Your Little Generals save files have been tampered with. "
			function L3_138.onClose()
				local L0_139 = L0_139
				;({}).direction = "down"
				;({}).text = "Please re-install to use multiplayer."
				L0_139({})
				local L1_140 = L1_140
			end
			L2_137(L3_138)
			return
		end
		function L2_137()
			repeat
				local L0_141 = require("multiplayer.dataServer").testConnection()
				if L0_141 then
					if settings:get("multiplayerId") and not CUSTOM_OVERRIDES.ALWAYS_SIGNUP then
						if utils.isCorona() then
							display.newText("START", native.newTextBox(15, 70, 280, 70).contentBounds.xMax + 30, native.newTextBox(15, 70, 280, 70).contentBounds.yMax - 30).size = 30
							local L6_147 = L6_147
							display.newText("START", native.newTextBox(15, 70, 280, 70).contentBounds.xMax + 30, native.newTextBox(15, 70, 280, 70).contentBounds.yMax - 30):setTextColor(0, 0, 0)
							local L7_148 = L7_148
							L7_148:addEventListener("touch", function(A0_149)
								if A0_149.phase == "ended" or A0_149.phase == "cancelled" then
									local L3_152 = L3_152
									L3_152(settings, "multiplayerId", _ENV.text)
									local L4_153 = L4_153
									L3_152 = _ENV
									L4_153 = L3_152
									L3_152 = L3_152.removeSelf
									L3_152(L4_153)
									L3_152 = L7_148
									L4_153 = L3_152
									L3_152 = L3_152.removeSelf
									L3_152(L4_153)
									L3_152 = storyboard
									L3_152 = L3_152.gotoScene
									L4_153 = "multiplayer.multiplayerSelectScene"
									L3_152(L4_153)
								end
								L3_152 = true
								return L3_152
							end)
							if not "multiplayerId" then
							end
							L6_147.text = settings:get(CUSTOM_OVERRIDES.MULTIPLAYER_TEST_PREFIX)
							L6_147.isEditable = true
							break -- pseudo-goto
						end
						L6_147 = storyboard
						L6_147 = L6_147.gotoScene
						L7_148 = "multiplayer.multiplayerSelectScene"
						L6_147(L7_148)
						break -- pseudo-goto
					end
					L6_147 = require
					L7_148 = "multiplayer.multiplayerSignupDialog"
					L6_147 = L6_147(L7_148)
					L6_147 = L6_147.getSignupDialog
					L6_147()
					break -- pseudo-goto
				end
				if not L0_141 then
					L6_147 = _ENV
					L6_147 = L6_147.add
					L7_148 = {}
					L7_148.direction = "down"
					L7_148.text = "Unable to reach Little Generals servers."
					function L7_148.onClose()
						local L0_154 = L0_154
						;({}).direction = "down"
						;({}).text = "Ensure you have network connectivity and try again."
						L0_154({})
						local L1_155 = L1_155
					end
					L6_147(L7_148)
				end
			until true
		end
		L3_138 = L2_137
		L3_138()
		L3_138 = true
		return L3_138
	end
	L36_36 = utils.getBasicButton({})
	utils.parentWidget(L36_36, L24_24)
	L36_36.x = L35_35.x
	L36_36.y = L35_35.y
	local L8_92 = L8_92
	utils.newImageFromSpriteSet(L52_52, L53_53, "multiplayer_icon.png"):scale(0.9, 0.9)
	local L9_93 = L9_93
	local L10_94 = L10_94
	L10_94(utils.newImageFromSpriteSet(L52_52, L53_53, "multiplayer_icon.png"), L24_24)
	local L11_95 = L11_95
	L10_94 = 135
	L11_95 = 42
	;({}).width = 250
	;({}).padLeft = 0
	;({}).padRight = 0
	;({}).padTop = 20
	;({}).extraHitArea, ({}).padBottom = {}, 10
	;({}).onComplete = function()
		sound.playSound(sound.globalSounds.button)
		storyboard.gotoScene("storeScene")
		local L1_156 = L1_156
	end
	L38_38 = utils.getBasicButton({})
	L24_24:insert(L38_38)
	local L12_96 = L12_96
	L24_24:insert((utils.newImageFromSpriteSet(L52_52, L53_53, "warbux_icon.png")))
	utils.newImageFromSpriteSet(L52_52, L53_53, "warbux_icon.png"):toFront()
	local L13_97 = L13_97
	local L19_103 = display.newText(L24_24, utils.comma_value(tostring(warbux.balance)), 0, 0, "SingleSleeve", 48)
	L19_103:setTextColor(LITTLE_GENERALS_BROWN_DARK())
	L38_38.textOutput = L19_103
	L38_38.x = L35_35.x - L36_36.contentWidth / 2 - L12_96 - L38_38.contentWidth / 2
	L38_38.x = L35_35.x - L35_35.contentWidth / 5
	L38_38.y = L35_35.y
	utils.parentWidget(L38_38, L24_24)
	L38_38.parent:insert(L38_38.textOutput)
	if utils.isIOSDevice() then
		({}).width = 100
		;({}).padLeft = 0
		;({}).padRight = 0
		;({}).padTop = 20
		;({}).extraHitArea, ({}).padBottom = {}, 10
		;({}).onComplete = function()
			sound.playSound(sound.globalSounds.button)
			local L1_158 = L1_158
			L1_158 = gamecenterSupport
			L1_158 = L1_158.init
			L1_158(function()
				local L2_160 = L2_160
				L2_160(require("achievementList").HIGHSCORE_KILLS)
			end)
			L1_158 = true
			return L1_158
		end
		L37_37 = utils.getBasicButton({})
		L37_37.x = L35_35.x + L36_36.contentWidth / 2 + L12_96 + L37_37.contentWidth / 2
		L37_37.y = L35_35.y
		utils.parentWidget(L37_37, L24_24)
		utils.newImageFromSpriteSet(L52_52, L53_53, "gamecenter_icon.png"):scale(0.7, 0.7)
		local L18_102 = L18_102
		utils.parentWidget(L18_102, L24_24)
	end
	L15_15:insert(L24_24)
	L35_35.width = L36_36.width + L38_38.width
	if L37_37 then
		L35_35.width = L35_35.width + L37_37.width
	else
		L35_35.width = L35_35.width + 4
	end
	L38_38.x = L35_35.x - L35_35.contentWidth / 2 + L38_38.contentWidth / 2 + 4
	L13_97:toFront()
	L13_97.x, L13_97.y = L38_38.x - L38_38.contentWidth / 2 + L13_97.contentWidth / 2, L38_38.y
	updateWarbuxOutput()
	L36_36.x = L38_38.x + L38_38.contentWidth / 2 + L36_36.contentWidth / 2 - 4
	L9_93.x, L9_93.y = L36_36.x, L36_36.y
	if L37_37 then
		L37_37.x = L36_36.x + L36_36.contentWidth / 2 + L37_37.contentWidth / 2 - 4
		L18_102.x, L18_102.y = L37_37.x, L37_37.y
	end
end
L7_7.createScene = L61_61
function L61_61(A0_161)
	utils.removeDisplayObject(A0_161)
	local L2_162 = L2_162
	A0_161 = nil
end
cleanUp = L61_61
function L61_61()
	local L0_163
	L0_163 = _ENV
	if L0_163 then
		L0_163 = _ENV
		L0_163 = #L0_163
		if 1 <= L0_163 then
			L0_163 = _ENV
			local L1_164 = L1_164
			local L2_165 = L2_165
			L1_164 = L1_164(L2_165, #_ENV)
			L0_163 = L0_163[L1_164]
			if L0_163 then
				L1_164 = L0_163.landGroup
				if L1_164 then
					goto lbl_22
				end
			end
			do return end
			::lbl_22::
			L1_164 = L0_163.landGroup
			L1_164 = L1_164.x
			L2_165 = L0_163.landGroup
			L2_165 = L2_165.y
			if L0_163.landGroup then
				sprite.newSprite(L54_54):prepare("fishjump")
				sprite.newSprite(L54_54).sprite = function(A0_171, A1_172)
					if A1_172.phase == "end" then
						display.remove(A1_172.sprite)
						local L3_173 = L3_173
					end
				end
				sprite.newSprite(L54_54):addEventListener("sprite", (sprite.newSprite(L54_54)))
				sprite.newSprite(L54_54):play()
				L20_20:insert((sprite.newSprite(L54_54)))
				local L7_170 = L7_170
				if math.random(1, 2) == 1 then
					L7_170.xScale = math.random(50, 100) / 100
				else
					L7_170.xScale = -1 * (math.random(50, 100) / 100)
				end
				L7_170.yScale = math.random(50, 100) / 100
				L7_170.x = L1_164
				L7_170.y = L2_165
			end
			L7_170 = timer
			L7_170 = L7_170.performWithDelay
			local L5_168 = L5_168
			local L5_168, L6_169 = L5_168(2000, 10000), L6_169
			function L6_169()
				jumpFish()
			end
			L7_170 = L7_170(L5_168, L6_169)
			L42_42 = L7_170
		end
	end
end
jumpFish = L61_61
function L61_61()
	if _ENV ~= nil then
		_ENV.avatar:dispose()
		utils.removeDisplayObject(_ENV)
	end
	if L23_23 ~= nil then
		L23_23.tank:destroy()
		L23_23:removeSelf()
		local L0_174 = L0_174
	end
	function L0_174()
		sound.playSound(sound.globalSounds.button)
		local L1_184 = L1_184
		L1_184 = gotoAvatarBuilder
		L1_184()
		L1_184 = true
		return L1_184
	end
	_ENV = display.newGroup()
	_ENV.avatar = battleAvatar.buildUi(require("avatar").playerAvatar(), 1, "left", true)
	_ENV.avatar:addEventListener("touch", function(A0_185)
		if A0_185.phase == "ended" or A0_185.phase == "cancelled" then
			_ENV()
			local L1_186 = L1_186
		end
		L1_186 = true
		return L1_186
	end)
	_ENV.avatar:scale(0.5, 0.5)
	_ENV:insert(_ENV.avatar)
	local L1_175 = L1_175
	L1_175 = L1_175(_ENV, 0, 0, _ENV.avatar.rect.contentWidth + 1, 155)
	L1_175:setFillColor(LITTLE_GENERALS_OFF_WHITE())
	L1_175:setReferencePoint(display.TopLeftReferencePoint)
	L1_175.x = -11
	L1_175.y = -11
	L1_175:toBack()
	local L2_176 = L2_176
	;({}).width = _ENV.avatar.contentWidth - 16
	;({}).height = 45
	;({}).normalBorderWidth = 5
	;({}).pressedBorderWidth = 5
	;({}).buttonText = "AVATAR"
	;({}).onComplete = L0_174
	L2_176 = L2_176({})
	_ENV:insert(L2_176)
	L2_176:setReferencePoint(display.TopLeftReferencePoint)
	L2_176.x = -6
	L2_176.y = _ENV.avatar.rect.contentBounds.yMax - 15
	_ENV:setReferencePoint(display.BottomLeftReferencePoint)
	_ENV.x = screenX + L10_10
	_ENV.y = L10_10 + _ENV.avatar.rect.contentHeight + L2_176.contentHeight - 9
	_ENV.avatar:idleAnimation()
	L15_15:insert(_ENV)
	L23_23 = display.newGroup()
	L23_23.tank = tankAvatar.playerAvatar()
	L23_23.x = screenX + screenWidth - L10_10 - L23_23.tank.rect.contentWidth / 2 - 1
	L23_23.y = L10_10 + L23_23.tank.rect.contentHeight / 2 + 1
	L23_23:insert(L23_23.tank)
	L23_23:addEventListener("touch", function(A0_187)
		if A0_187.phase == "ended" or A0_187.phase == "cancelled" then
			sound.playSound(sound.globalSounds.button)
			local L2_189 = L2_189
			L2_189 = gotoTankAvatarBuilder
			L2_189()
		end
		L2_189 = true
		return L2_189
	end)
	local L3_177 = L3_177
	local L3_177, L8_182 = L3_177(L23_23, 0, 0, L23_23.tank.rect.contentWidth + 2, 155), L8_182
	L8_182 = L3_177.setFillColor
	L8_182(L3_177, LITTLE_GENERALS_OFF_WHITE())
	L3_177.x = 0
	L3_177.y = 23
	L8_182 = L3_177.toBack
	L8_182(L3_177)
	L8_182 = utils
	L8_182 = L8_182.getBasicButton
	;({}).width = _ENV.avatar.contentWidth - 16
	;({}).height = 45
	;({}).normalBorderWidth = 5
	;({}).pressedBorderWidth = 5
	;({}).buttonText = "TANKS"
	;({}).onComplete = function()
		sound.playSound(sound.globalSounds.button)
		local L1_191 = L1_191
		L1_191 = gotoTankAvatarBuilder
		L1_191()
		L1_191 = true
		return L1_191
	end
	L8_182 = L8_182({})
	L23_23:insert(L8_182)
	L8_182.x = 0
	L8_182.y = 69
	local L5_179, L6_180 = L5_179, L6_180
	L5_179(L6_180, L23_23)
	local L7_181 = L7_181
	L5_179 = L23_23
	L5_179.isVisible = false
	L5_179 = _ENV
	L5_179.isVisible = false
	L5_179 = L24_24
	L5_179.isVisible = false
end
buildAvatarAndTankOutputBoxes = L61_61
function L61_61(A0_192)
	if _ENV ~= nil then
		L4_196 = 1
		_FOR_ = 1
		for _FORV_4_ = L4_196, _FOR_, _FOR_ do
			spritesheetmanager.disposeSpriteSet(_ENV.mapFrames[_FORV_4_].sheetFile)
		end
	end
	L4_196 = require
	L5_197 = "campaignThemes"
	L4_196 = L4_196(L5_197)
	L4_196 = L4_196.themes
	L5_197 = activeCampaign
	L5_197 = L5_197.theme
	L4_196 = L4_196[L5_197]
	_ENV = L4_196
end
loadNewCampaignTheme = L61_61
function L61_61(A0_199)
	local L1_200 = os.time()
	local L2_201 = L2_201
	L2_201 = L2_201(activeCampaign, L1_200)
	if L2_201.somethingChanged and L2_201.moneyAmount > 0 then
		({}).direction = "up"
		local L6_205 = L6_205
		local L7_206 = L7_206
		L7_206.text = "Welcome back! [[IMG]] " .. L2_201.moneyAmount .. " free warbux!"
		L7_206.spriteImage = UI_SPRITE_SHEET
		L7_206.spriteName = "warbucks_1.png"
		function L7_206.onClose(A0_207)
			local L1_208 = L1_208
			L1_208 = L1_208(_ENV, L53_53, "warbucks_1.png")
			local L2_209 = L2_209
			local L3_210 = L3_210
			L2_209(L3_210, A0_199)
			L2_209 = A0_207.x
			L3_210 = A0_207.y
			L1_208.x, L1_208.y = L2_209, L3_210
			local L4_211, L5_212 = L4_211, L5_212
			L4_211, L5_212 = L4_211(L5_212, 0, 0)
			L4_211, L5_212 = A0_199:contentToLocal(L4_211, L5_212)
			local L6_213 = L6_213
			L6_213(L57_57.kaching)
			local L7_214 = L7_214
			L6_213 = table
			L6_213 = L6_213.insert
			L7_214 = A0_207.transitions
			local L8_215 = L8_215
			local L9_216 = L9_216
			;({}).time = 1500
			local ({}).transition, L11_218 = easing.outInQuad, L11_218
			L11_218.alpha = 0
			L11_218.x = L4_211
			L11_218.y = L5_212
			function L11_218.onComplete()
				updateWarbuxOutput()
			end
			L8_215, L9_216, L11_218 = L8_215(L9_216, L11_218)
			L6_213(L7_214, L8_215, L9_216, L11_218, L8_215(L9_216, L11_218))
		end
		L6_205(L7_206)
		L6_205 = dailies
		L6_205 = L6_205.setLastGameAccessTime
		L7_206 = os
		L7_206 = L7_206.time
		L7_206 = L7_206()
		L6_205(L7_206, L7_206())
	end
	L6_205 = settings
	L7_206 = L6_205
	L6_205 = L6_205.save
	L6_205(L7_206)
	L6_205 = _ENV
	L6_205 = L6_205.show
	L6_205()
	L6_205 = timer
	L6_205 = L6_205.performWithDelay
	L7_206 = 5000
	L6_205 = L6_205(L7_206, function()
		checkForEvents(_ENV)
		local L1_219 = L1_219
	end)
	L41_41 = L6_205
end
checkForEvents = L61_61
function L61_61()
	_ENV()
	local L1_220 = L1_220
	L1_220("avatarBuilder", "fromLeft")
	local L2_221 = L2_221
end
gotoAvatarBuilder = L61_61
function L61_61()
	_ENV()
	local L1_222 = L1_222
	L1_222("tanks.tankDepot", "fromRight")
	local L2_223 = L2_223
end
gotoTankAvatarBuilder = L61_61
function L61_61()
	local L3_227 = L3_227
	L3_227.text = utils.comma_value(tostring(warbux.balance))
	L3_227 = _ENV
	L3_227 = L3_227.textOutput
	L3_227 = L3_227.setReferencePoint
	local L1_225 = L1_225
	L3_227(L1_225, display.CenterRightReferencePoint)
	local L2_226 = L2_226
	L3_227 = _ENV
	L3_227 = L3_227.textOutput
	L1_225 = _ENV
	L1_225 = L1_225.x
	L2_226 = _ENV
	L2_226 = L2_226.contentWidth
	L2_226 = L2_226 / 2
	L1_225 = L1_225 + L2_226
	L1_225 = L1_225 - 15
	L3_227.x = L1_225
	L3_227 = _ENV
	L3_227 = L3_227.textOutput
	L1_225 = _ENV
	L1_225 = L1_225.y
	L1_225 = L1_225 - 3
	L3_227.y = L1_225
end
updateWarbuxOutput = L61_61
function L61_61()
	buildAvatarAndTankOutputBoxes()
	updateWarbuxOutput()
end
updatePlayerOutputs = L61_61
function L61_61(A0_228)
	local L1_229, L2_230, L3_231
	L1_229 = {}
	L2_230 = activeCampaign
	L2_230 = L2_230.lands
	L3_231 = A0_228.lands
	L3_231 = L3_231[1]
	L2_230 = L2_230[L3_231]
	L1_229[1] = L2_230
	L2_230 = L1_229[1]
	L3_231 = 2
	_FOR_ = 1
	for _FORV_6_ = L3_231, _FOR_, _FOR_ do
		_FOR_ = 1
		for _FORV_12_ = _FOR_, _FOR_, _FOR_ do
			if not false and L1_229[_FORV_12_].landGroup.x > activeCampaign.lands[A0_228.lands[_FORV_6_]].landGroup.x then
				table.insert(L1_229, _FORV_12_, activeCampaign.lands[A0_228.lands[_FORV_6_]])
			end
		end
		if not true then
			table.insert(L1_229, activeCampaign.lands[A0_228.lands[_FORV_6_]])
		end
	end
	L3_231 = #L1_229
	if 2 < L3_231 then
		L3_231 = {}
		L8_236 = math
		L8_236 = L8_236.ceil
		L14_242 = #L1_229
		L14_242 = L14_242 / 2
		L8_236 = L8_236(L14_242)
		L8_236 = L1_229[L8_236]
		L14_242 = #L1_229
		_FOR_ = -1
		for _FORV_8_ = L14_242, _FOR_, _FOR_ do
			if L1_229[_FORV_8_].landGroup.x ~= L8_236.landGroup.x then
				table.remove(L1_229, _FORV_8_)
			end
		end
		L14_242 = 1
		_FOR_ = 1
		for _FORV_8_ = L14_242, _FOR_, _FOR_ do
			_FOR_ = 1
			for _FORV_14_ = _FOR_, _FOR_, _FOR_ do
				if L3_231[_FORV_14_].landGroup.y > L1_229[_FORV_8_].landGroup.y then
					local L17_245 = L17_245
					table.insert(L3_231, _FORV_14_, L1_229[_FORV_8_])
					local L18_246 = L18_246
					break
				end
			end
			if not L17_245 then
				table.insert(L3_231, L18_246)
			end
		end
		L14_242 = math
		L14_242 = L14_242.ceil
		L10_238 = #L3_231
		L10_238 = L10_238 / 2
		L14_242 = L14_242(L10_238)
		repeat
			L2_230 = L3_231[L14_242]
			do break end -- pseudo-goto
			L3_231 = #L1_229
			if 0 < L3_231 then
				L2_230 = L1_229[1]
			end
		until true
	end
	return L2_230
end
getCountryMidLand = L61_61
function L61_61(A0_247, A1_248, A2_249, A3_250)
	local L4_251, L5_252, L6_253
	if A3_250 == nil or not (0 < A3_250) then
		A3_250 = 11
	end
	L4_251 = A2_249.landGroup
	L4_251 = L4_251.x
	L5_252 = A2_249.landGroup
	L5_252 = L5_252.y
	L6_253 = nil
	local L7_254 = L7_254
	L7_254 = L7_254(A2_249, A1_248, L4_251, L5_252)
	if L7_254 ~= nil then
		L6_253 = display.newLine(L7_254[1], L7_254[2], L7_254[3], L7_254[4])
		_FOR_ = 2
		for _FORV_11_ = _FOR_, _FOR_, _FOR_ do
			L6_253:append(L7_254[_FORV_11_], L7_254[_FORV_11_ + 1])
		end
		L14_261 = L6_253
		L13_260 = L6_253.setColor
		L15_262 = 255
		L13_260(L14_261, L15_262, 0, 0)
		L6_253.width = A3_250
		L14_261 = A0_247
		L13_260 = A0_247.insert
		L15_262 = L6_253
		L13_260(L14_261, L15_262)
		L13_260 = drawJoinDot
		L14_261 = A0_247
		L15_262 = L7_254[1]
		L13_260(L14_261, L15_262, L7_254[2])
		L13_260 = drawJoinDot
		L14_261 = A0_247
		L15_262 = #L7_254
		L15_262 = L15_262 - 1
		L15_262 = L7_254[L15_262]
		L13_260(L14_261, L15_262, L7_254[#L7_254])
		local L11_258 = L11_258
	end
	return L6_253
end
function L62_62(A0_263)
	local L1_264, L2_265, L3_266
	L1_264 = A0_263.parentGroup
	local L2_265, L8_271 = A0_263.country, L8_271
	L3_266 = A0_263.drawColourOverride
	L8_271 = L2_265.countryId
	if L8_271 then
		L8_271 = activeCampaign
		L8_271 = L8_271.countries
		L2_265 = L8_271[L2_265.countryId]
	end
	L8_271 = display
	L8_271 = L8_271.newGroup
	L8_271 = L8_271()
	_FOR_ = 1
	for _FORV_8_ = _FOR_, _FOR_, _FOR_ do
		if activeCampaign.lands[L2_265.lands[_FORV_8_]].countryId == L2_265.id and activeCampaign.lands[L2_265.lands[_FORV_8_]] and L2_265 and not activeCampaign.lands[L2_265.lands[_FORV_8_]].deleted then
			L8_271:insert(getLandGroup(activeCampaign.lands[L2_265.lands[_FORV_8_]], L2_265.canAttack, L3_266))
		end
	end
	L12_275 = 1
	L13_276 = L2_265.lands
	L13_276 = #L13_276
	L14_277 = 1
	for L15_278 = L12_275, L13_276, L14_277 do
		if activeCampaign.lands[L2_265.lands[L15_278]].countryId == L2_265.id and activeCampaign.lands[L2_265.lands[L15_278]] and L2_265 and not activeCampaign.lands[L2_265.lands[L15_278]].deleted then
			({}).land, ({}).parentGroup = activeCampaign.lands[L2_265.lands[L15_278]], L8_271
			;({}).drawAllBorders = true
			;({}).drawColourOverride = L3_266
			drawCountryBorders({})
		end
	end
	L13_276 = L1_264
	L12_275 = L1_264.insert
	L14_277 = L8_271
	L12_275(L13_276, L14_277)
	L12_275 = _ENV
	L13_276 = L12_275
	L12_275 = L12_275.toFront
	L12_275(L13_276)
	return L8_271
end
function L63_63(A0_279)
	local L1_280
	L1_280 = A0_279.owned
	if not L1_280 then
		L1_280 = A0_279.canAttack
		if L1_280 then
			goto lbl_19
		end
	end
	L1_280 = A0_279.owned
	if L1_280 then
		L1_280 = A0_279.underAttackDate
		if L1_280 ~= nil then
			L1_280 = A0_279.underAttackDate
			local L2_281 = os.time()
			::lbl_19::
			if L1_280 <= L2_281 then
				L1_280 = A0_279.landType
				L2_281 = landType
				L2_281 = L2_281.WATER
				if L1_280 ~= L2_281 then
					L1_280 = true
					return L1_280
				end
			end
		end
	end
	L1_280 = false
	return L1_280
end
function L64_64()
	local L0_282 = L0_282
	L0_282 = L0_282(screenX, 0, screenWidth, display.contentHeight)
	L0_282:setFillColor(0, 0, 0)
	local L5_287 = L5_287
	L0_282.alpha = 0
	L5_287 = utils
	L5_287 = L5_287.getMinimalistLoadingOverlay
	L5_287 = L5_287()
	PRE_BATTLE_LOADING = L5_287
	L5_287 = PRE_BATTLE_LOADING
	L5_287.x, PRE_BATTLE_LOADING.y = screenX + screenWidth / 2, display.contentHeight / 2
	L5_287 = transition
	L5_287 = L5_287.to
	local L2_284 = L2_284
	;({}).delay = 0
	;({}).alpha = 1
	;({}).time = 500
	local ({}).transition, L4_286 = easing.inOutQuad, L4_286
	function L4_286.onComplete()
		_ENV:removeSelf()
		storyboard.gotoScene("battlefieldScene")
		local L1_288 = L1_288
	end
	L5_287(L2_284, L4_286)
end
function L65_65(A0_289, A1_290, A2_291)
	local L3_292, L4_293
	repeat
		L3_292 = activeCampaign
		L3_292 = L3_292.countries
		L4_293 = A0_289.countryId
		L3_292 = L3_292[L4_293]
		L4_293 = L3_292.name
		local L5_294 = os.time()
		if _ENV(L3_292) then
			setCountry(activeCampaign, L3_292)
			;({}).parentGroup = L20_20
			;({}).country = A0_289
			;({}).drawColourOverride = "UNDER_ATTACK"
			if L13_13 then
				L59_59()
				require("currentBattle").createSinglePlayerBattle(activeCountry)
				L64_64()
			else
				sound.playSound(L57_57.select)
				;({}).screenGroup = L16_16.parent
				;({}).textLine1 = "Are you sure you want to attack"
				;({}).textLine2 = L4_293 .. "?"
				;({}).icon = utils.DIALOG_ATTACK
				;({}).confirmSound = sound.globalSounds.button
				;({}).cancelSound = sound.globalSounds.button
				;({}).confirmFunction = function()
					local L2_306 = activeCountry.seed
					if L2_306 == nil then
						L2_306 = activeCountry
						L2_306.seed = _ENV
					end
					L2_306 = L59_59
					L2_306()
					L2_306 = require
					L2_306 = L2_306("currentBattle")
					L2_306 = L2_306.createSinglePlayerBattle
					L2_306(activeCountry)
					L2_306 = timer
					L2_306 = L2_306.performWithDelay
					L2_306(250, function()
						_ENV()
					end)
				end
				;({}).cancelFunction = function()
					utils.removeDisplayObject(_ENV)
					local L1_307 = L1_307
				end
			end
		else
			if L3_292.owned and countryHasFactory(L3_292) and L3_292.factoryStartDate and L3_292.factoryRuns < weaponFactories[tostring(L3_292.factoryType)].maxRuns then
				if dailies.isFactoryPending(L3_292, L5_294) then
					if not weaponTypes[L3_292.factoryType].namePlural then
					end
					;({}).screenGroup = L16_16.parent
					;({}).confirmSound = sound.globalSounds.button
					;({}).textLine1 = tostring(weaponFactories[tostring(L3_292.factoryType)].output) .. " " .. (weaponTypes[L3_292.factoryType].name .. "s") .. " collectable in"
					local L14_303 = L14_303
					;({}).textLine2 = "T minus " .. dailies.getFormattedCountdown(dailies.getTimeTillFactory(L3_292, os.time()))
					;({}).icon = utils.DIALOG_WIN
					utils.getDialog({})
					break -- pseudo-goto
				end
				L14_303 = doFactoryCollectionWithAnimation
				L14_303(L3_292, false, nil, 1500)
				break -- pseudo-goto
			end
			L14_303 = L3_292.owned
			if L14_303 then
				L14_303 = L3_292.moneyStartDate
				if L14_303 then
					L14_303 = L3_292.id
					if L14_303 == HOMELAND_COUNTRY_ID then
						L14_303 = dailies
						L14_303 = L14_303.isMoneyPending
						L14_303 = L14_303(L3_292, L5_294, "dailyAllowance")
						if L14_303 then
							L14_303 = utils
							L14_303 = L14_303.getDialog
							;({}).screenGroup = L16_16.parent
							;({}).confirmSound = sound.globalSounds.button
							;({}).textLine1 = dailies.getMoneyAmount(L3_292) .. " Warbux allowance collectable in "
							local L11_300 = L11_300
							local L12_301 = L12_301
							local L13_302 = L13_302
							L13_302 = L13_302(dailies.getTimeTillMoney(L3_292, os.time(), "dailyAllowance"))
							L12_301 = L12_301 .. L13_302
							L11_300.textLine2 = L12_301
							L12_301 = utils
							L12_301 = L12_301.DIALOG_WIN
							L11_300.icon = L12_301
							L14_303(L11_300)
							break -- pseudo-goto
						end
						L14_303 = doMoneyCollectionWithAnimation
						L11_300 = L16_16
						L11_300 = L11_300.parent
						L12_301 = L3_292
						L13_302 = nil
						L14_303(L11_300, L12_301, L13_302)
						break -- pseudo-goto
					end
				end
			end
		end
	until true
end
function L66_66(A0_308, A1_309)
	local L2_310, L3_311, L5_313 = L2_310, L3_311, "tap"
	L2_310(L3_311, L5_313, function(A0_314)
		local L10_324 = L10_324
		if not _ENV then
			L10_324 = print
			L10_324("tap listeners ain't listening")
			return
		end
		L10_324 = A1_309
		L10_324 = L10_324.landGroup
		L10_324 = L10_324.contentToLocal
		local L2_316 = L2_316
		L10_324, L2_316 = L10_324(L2_316, A0_314.x, A0_314.y)
		local L3_317 = L3_317
		local L4_318 = L4_318
		local L5_319 = L5_319
		L3_317 = L3_317(L4_318, L5_319, 0)
		L4_318 = nil
		L5_319 = nil
		if L14_14 then
			if A1_309.countryId == HOMELAND_COUNTRY_ID then
				L4_318 = A1_309
				L5_319 = activeCampaign.countries[A1_309.countryId]
				L14_14 = false
			end
		elseif utils.pointInPolygon(L3_317, L10_324, L2_316) then
			L4_318 = A1_309
			L5_319 = activeCampaign.countries[A1_309.countryId]
		else
			_FOR_, _FOR_, _FOR_ = pairs(A1_309.borders)
			for _FORV_9_, _FORV_10_ in _FOR_, _FOR_, _FOR_ do
				if L4_318 == nil and isADoubleBorderValue(_FORV_9_, math.abs(_FORV_10_)) then
					L10_324, L2_316 = activeCampaign.lands[A1_309.adjacent[_FORV_9_]].landGroup:contentToLocal(A0_314.x, A0_314.y)
					L3_317 = getBorderPolygonPoints(activeCampaign.lands[A1_309.adjacent[_FORV_9_]], 0, 0)
					if L63_63(activeCampaign.countries[activeCampaign.lands[A1_309.adjacent[_FORV_9_]].countryId]) then
						if utils.pointInPolygon(L3_317, L10_324, L2_316) then
							L5_319, L4_318 = activeCampaign.countries[activeCampaign.lands[A1_309.adjacent[_FORV_9_]].countryId], activeCampaign.lands[A1_309.adjacent[_FORV_9_]]
						end
					end
				end
			end
		end
		if L4_318 and L5_319 then
			L11_325 = L5_319.landType
			L12_326 = landType
			L12_326 = L12_326.WATER
			if L11_325 ~= L12_326 then
				L11_325 = L65_65
				L12_326 = L4_318
				L14_328 = L10_324
				L15_329 = L2_316
				L11_325(L12_326, L14_328, L15_329)
				L11_325 = true
				return L11_325
			end
		end
		L11_325 = false
		return L11_325
	end)
end
function drawMap(A0_331)
	local L3_334, L4_335, L5_336, L8_339, L25_356 = system.getTimer, L4_335, L5_336, L8_339, L25_356
	L3_334 = L3_334()
	L4_335 = display
	L4_335 = L4_335.newGroup
	L4_335 = L4_335()
	_ENV = L4_335
	L4_335 = display
	L4_335 = L4_335.newGroup
	L4_335 = L4_335()
	L20_20 = L4_335
	L4_335 = display
	L4_335 = L4_335.newGroup
	L4_335 = L4_335()
	L21_21 = L4_335
	L4_335 = display
	L4_335 = L4_335.newGroup
	L4_335 = L4_335()
	L19_19 = L4_335
	L4_335 = 2.42
	L5_336 = 2.4
	L8_339 = -30
	L25_356 = 80
	_FOR_ = 1
	for _FORV_12_ = _FOR_, _FOR_, _FOR_ do
		if activeCampaign.outIslands[_FORV_12_].y <= 0 then
			_ENV:insert((utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L48_48.islandSheetFile))))
			utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L48_48.islandSheetFile)).x = activeCampaign.outIslands[_FORV_12_].x
			utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L48_48.islandSheetFile)).y = activeCampaign.outIslands[_FORV_12_].y
		else
			break
		end
	end
	local L9_340 = L9_340
	display.newImage(_ENV, L48_48.mainIslandTopCenter):scale(L4_335, L5_336)
	display.newImage(_ENV, L48_48.mainIslandTopCenter).x, display.newImage(_ENV, L48_48.mainIslandTopCenter).y = L8_339, L25_356 - display.newImage(_ENV, L48_48.mainIslandTopCenter).contentHeight / 2
	display.newImage(_ENV, L48_48.mainIslandBottomCenter):scale(L4_335, L5_336)
	display.newImage(_ENV, L48_48.mainIslandBottomCenter).x, display.newImage(_ENV, L48_48.mainIslandBottomCenter).y = L8_339, L25_356 + display.newImage(_ENV, L48_48.mainIslandBottomCenter).contentHeight / 2
	local L10_341 = L10_341
	display.newImage(_ENV, L48_48.mainIslandTopLeft):scale(L4_335, L5_336)
	display.newImage(_ENV, L48_48.mainIslandTopLeft).x, display.newImage(_ENV, L48_48.mainIslandTopLeft).y = display.newImage(_ENV, L48_48.mainIslandBottomCenter).x - display.newImage(_ENV, L48_48.mainIslandBottomCenter).contentWidth / 2 - display.newImage(_ENV, L48_48.mainIslandTopLeft).contentWidth / 2, L25_356 - display.newImage(_ENV, L48_48.mainIslandTopLeft).contentHeight / 2
	display.newImage(_ENV, L48_48.mainIslandBottomLeft):scale(L4_335, L5_336)
	display.newImage(_ENV, L48_48.mainIslandBottomLeft).x, display.newImage(_ENV, L48_48.mainIslandBottomLeft).y = display.newImage(_ENV, L48_48.mainIslandBottomCenter).x - display.newImage(_ENV, L48_48.mainIslandBottomCenter).contentWidth / 2 - display.newImage(_ENV, L48_48.mainIslandBottomLeft).contentWidth / 2, L25_356 + display.newImage(_ENV, L48_48.mainIslandBottomLeft).contentHeight / 2
	local L11_342 = L11_342
	display.newImage(_ENV, L48_48.mainIslandTopRight):scale(L4_335, L5_336)
	display.newImage(_ENV, L48_48.mainIslandTopRight).x, display.newImage(_ENV, L48_48.mainIslandTopRight).y = display.newImage(_ENV, L48_48.mainIslandBottomCenter).x + display.newImage(_ENV, L48_48.mainIslandBottomCenter).contentWidth / 2 + display.newImage(_ENV, L48_48.mainIslandTopRight).contentWidth / 2, L25_356 - display.newImage(_ENV, L48_48.mainIslandTopRight).contentHeight / 2
	display.newImage(_ENV, L48_48.mainIslandBottomRight):scale(L4_335, L5_336)
	display.newImage(_ENV, L48_48.mainIslandBottomRight).x, display.newImage(_ENV, L48_48.mainIslandBottomRight).y = display.newImage(_ENV, L48_48.mainIslandBottomCenter).x + display.newImage(_ENV, L48_48.mainIslandBottomCenter).contentWidth / 2 + display.newImage(_ENV, L48_48.mainIslandBottomRight).contentWidth / 2, L25_356 + display.newImage(_ENV, L48_48.mainIslandBottomRight).contentHeight / 2
	_FOR_ = 1
	for _FORV_15_ = _FOR_, _FOR_, _FOR_ do
		if activeCampaign.outIslands[_FORV_15_].y >= 0 then
			_ENV:insert((utils.newImageFromSpriteSet(L9_340, L10_341, L10_341[math.min(#L10_341, activeCampaign.outIslands[_FORV_15_].frame)].name)))
			utils.newImageFromSpriteSet(L9_340, L10_341, L10_341[math.min(#L10_341, activeCampaign.outIslands[_FORV_15_].frame)].name).x = activeCampaign.outIslands[_FORV_15_].x
			utils.newImageFromSpriteSet(L9_340, L10_341, L10_341[math.min(#L10_341, activeCampaign.outIslands[_FORV_15_].frame)].name).y = activeCampaign.outIslands[_FORV_15_].y
		end
	end
	L25_25 = L25_25 + 8
	_FOR_ = 1
	for _FORV_15_ = _FOR_, _FOR_, _FOR_ do
		activeCampaign.countries[_FORV_15_].canAttack = canAnyAdjacentAttack(activeCampaign, activeCampaign.countries[_FORV_15_])
		activeCampaign.countries[_FORV_15_].attackArrowDrawn = false
	end
	_UPVALUE6_(L19_19)
	_ENV:insert(L19_19)
	L19_19.x = 0
	L19_19.y = 0
	_ENV.x = screenX + screenWidth / 2
	_ENV.y = display.contentHeight / 2
	A0_331:insert(1, _ENV)
	L17_17 = display.newRect(A0_331, 0, 0, screenWidth + 100, display.contentHeight + 100)
	A0_331:insert(1, L17_17)
	local L15_346 = L15_346
	L17_17:setFillColor(7, 180, 226)
	local L16_347 = L16_347
	L17_17.x = screenX + screenWidth / 2
	L17_17.y = display.contentHeight / 2
	L25_25 = L25_25 + 1
	L46_46 = {}
	_UPVALUE9_(activeCampaign, getFurthestLands(activeCampaign).N.y, getFurthestLands(activeCampaign).E.x, getFurthestLands(activeCampaign).S.y, getFurthestLands(activeCampaign).W.x, function(A0_357)
		if not A0_357.deleted then
			({}).parentGroup = _ENV
			;({}).land = A0_357
			;({}).drawAllBorders = false
			drawCountryBorders({})
			if activeCampaign.countries[A0_357.countryId].landType == landType.WATER and landHasRoomForBigSprite(A0_357) then
				local L1_358 = L1_358
				local L2_359 = L2_359
				L1_358(L2_359, A0_357)
				local L3_360 = L3_360
			end
		end
	end)
	local L17_348 = L17_348
	_ENV:insert(L20_20)
	L20_20.x = 0
	L20_20.y = 0
	local L18_349 = L18_349
	display.newImage("res/maps/citysmaller.png").yReference = 50
	display.newImage("res/maps/citysmaller.png").x, display.newImage("res/maps/citysmaller.png").y = activeCampaign.lands[1].x, activeCampaign.lands[1].y
	_ENV:insert((display.newImage("res/maps/citysmaller.png")))
	_ENV:insert(L21_21)
	_UPVALUE9_(activeCampaign, getFurthestLands(activeCampaign).N.y, getFurthestLands(activeCampaign).E.x, getFurthestLands(activeCampaign).S.y, getFurthestLands(activeCampaign).W.x, function(A0_361)
		local L1_362
		L1_362 = A0_361.deleted
		if not L1_362 then
			L1_362 = activeCampaign
			L1_362 = L1_362.countries
			L1_362 = L1_362[A0_361.countryId]
			if L1_362.factoryType and L1_362.factoryLandId == A0_361.id then
				getFactoryImage(L1_362)
			elseif not L1_362.owned then
				if L1_362.wheelOfFortune then
					getWheelOfFortuneImage(L1_362)
				else
					local L2_363 = L2_363
					local L3_364 = L3_364
					L2_363(L3_364, A0_361)
					local L4_365 = L4_365
				end
			end
		end
	end)
	L20_20.x = 0
	L20_20.y = 0
	local L23_354 = L23_354
	local L24_355 = L24_355
	_UPVALUE9_(activeCampaign, getFurthestLands(activeCampaign).N.y, getFurthestLands(activeCampaign).E.x, getFurthestLands(activeCampaign).S.y, getFurthestLands(activeCampaign).W.x, function(A0_366)
		local L1_367
		L1_367 = activeCampaign
		L1_367 = L1_367.countries
		L4_370 = A0_366.countryId
		L1_367 = L1_367[L4_370]
		L4_370 = A0_366.deleted
		if not L4_370 then
			L4_370 = L1_367.landType
			L5_371 = landType
			L5_371 = L5_371.WATER
			if L4_370 ~= L5_371 then
				L4_370 = L1_367.canAttack
				if L4_370 then
					L4_370 = L1_367.owned
					if not L4_370 then
						L4_370 = L1_367.attackArrowDrawn
						if not L4_370 then
							L4_370 = pairs
							L5_371 = A0_366.adjacent
							L4_370, L5_371, L6_372 = L4_370(L5_371)
							for L7_373, L8_374 in L4_370, L5_371, L6_372 do
								if L8_374 ~= 0 and activeCampaign.countries[activeCampaign.lands[L8_374].countryId].owned and (not activeCampaign.countries[activeCampaign.lands[L8_374].countryId].underAttackDate or activeCampaign.countries[activeCampaign.lands[L8_374].countryId].underAttackDate > os.time()) and not L1_367.attackArrowDrawn then
									_ENV = _ENV + 1
									if L7_373 == "N" or L7_373 == "W" then
										if L7_373 == "N" then
											utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L48_48.mapFrames.RIGHT_ARROW.sheetFile)).rotation = 45
										end
									else
										local L12_378 = L12_378
										local L13_379 = L13_379
										local L14_380 = L14_380
										L13_379 = utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(L48_48.mapFrames.LEFT_ARROW.sheetFile))
										if L7_373 == "E" then
											L13_379.rotation = -45
										end
									end
									L14_380 = L21_21
									L14_380 = L14_380.insert
									L14_380(L14_380, L13_379)
									L14_380 = A0_366.landGroup
									L14_380 = L14_380.x
									L14_380 = L14_380 + LandImageSteps[L7_373].x / 2
									L13_379.x = L14_380
									L14_380 = A0_366.landGroup
									L14_380 = L14_380.y
									L14_380 = L14_380 + LandImageSteps[L7_373].y / 2
									L13_379.y = L14_380
									L1_367.attackArrowDrawn = true
								end
							end
						end
					end
				end
			end
		end
	end)
	drawMonies()
	drawFactories()
	L42_42 = timer.performWithDelay(5000, function()
		jumpFish()
	end)
	print("drawing map took", system.getTimer() - L3_334, #activeCampaign.countries)
	if L33_33 ~= nil then
		_ENV:insert(L33_33)
		local L21_352 = L21_352
	end
end
function getWheelOfFortuneImage(A0_381)
	if not A0_381.wheelOfFortune then
		return
	end
	local L1_382 = L1_382
	local L2_383 = L2_383
	L1_382, L2_383 = L1_382(L2_383, nil, true)
	local L3_384 = L3_384
	L3_384(L1_382, "WoSF", 1, #L2_383, 400, 0)
	L3_384 = nil
	if A0_381.wheelImage then
		L3_384 = A0_381.wheelImage
		if L3_384.numChildren ~= nil and 0 < L3_384.numChildren then
			_FOR_ = -1
			for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
				display.remove(L3_384[_FORV_7_])
				L3_384[_FORV_7_] = nil
			end
		end
	else
		L3_384 = display.newGroup()
		local L4_385 = L4_385
		L4_385(_ENV, L3_384)
		A0_381.wheelImage = L3_384
	end
	L4_385 = nil
	if A0_381.wheelLandId then
		L4_385 = activeCampaign.lands[A0_381.wheelLandId]
	else
		L4_385 = getCountryMidLand(A0_381)
	end
	local L5_386, L6_387 = L5_386, L6_387
	L5_386, L6_387 = L5_386(L6_387, 0, 0)
	L3_384.x, L3_384.y = _ENV:contentToLocal(L5_386, L6_387)
	L4_385.wheelImage = L3_384
	local L7_388 = L7_388
	L7_388 = L7_388(L1_382)
	L7_388:prepare("WoSF")
	L7_388.currentFrame = math.random(1, #L2_383)
	L7_388.yReference = L7_388.contentHeight / 2 - 5
	L7_388:play()
	if not A0_381.canAttack then
		local L11_392 = L11_392
		L11_392(L7_388, 175, 175, 175)
		local L12_393 = L12_393
	end
	L11_392 = 0
	L7_388.y = 0
	L7_388.x = L11_392
	L12_393 = L3_384
	L11_392 = L3_384.insert
	L11_392(L12_393, L7_388)
	local L10_391 = L10_391
end
function getFactoryImage(A0_394)
	if not countryHasFactory(A0_394) then
		return
	end
	local L1_395 = L1_395
	local L1_395, L2_396 = L1_395("res/weapons/weapon_icons.png")
	local L3_397 = L3_397
	local L4_398 = L4_398
	L3_397, L4_398 = L3_397(L4_398, nil, true)
	local L5_399 = L5_399
	L5_399(L3_397, "factory", 1, #L4_398, 500, 0)
	L5_399 = nil
	if A0_394.factoryImage then
		L5_399 = A0_394.factoryImage
		if L5_399.numChildren ~= nil and 0 < L5_399.numChildren then
			_FOR_ = -1
			for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
				display.remove(L5_399[_FORV_9_])
				L5_399[_FORV_9_] = nil
			end
		end
	else
		L5_399 = display.newGroup()
		local L6_400 = L6_400
		L6_400(_ENV, L5_399)
		A0_394.factoryImage = L5_399
	end
	L6_400 = nil
	if A0_394.factoryLandId then
		L6_400 = activeCampaign.lands[A0_394.factoryLandId]
	else
		L6_400 = getCountryMidLand(A0_394)
	end
	local L7_401, L8_402 = L7_401, L8_402
	L7_401, L8_402 = L7_401(L8_402, 0, 0)
	local L9_403, L10_404 = L9_403, L10_404
	local L11_405 = L11_405
	local L9_403, L10_404, L12_406 = L9_403(L10_404, L11_405, L8_402)
	L5_399.y = L10_404
	L5_399.x = L9_403
	L6_400.factoryImage = L5_399
	L9_403 = nil
	L10_404 = true
	L11_405 = 0
	L12_406 = 0
	if not A0_394.factoryStartDate and not A0_394.owned then
		L9_403 = display.newImage("res/maps/factorysmokeless.png")
		L9_403.yReference = 42
		L11_405, L12_406 = -30, -30
	elseif A0_394.factoryRuns and A0_394.factoryRuns >= weaponFactories[tostring(A0_394.factoryType)].maxRuns then
		L9_403 = display.newImage("res/maps/brokenfactory.png")
		L10_404 = false
		L9_403.yReference = 27
	elseif A0_394.owned then
		L9_403 = sprite.newSprite(L3_397)
		L9_403:prepare("factory")
		L9_403.currentFrame = math.random(1, #L4_398)
		L9_403:play()
		L9_403.yReference = 60
		L11_405, L12_406 = -30, -30
	else
		L9_403 = display.newImage("res/maps/factorysmokeless.png")
		L9_403.yReference = 42
		L11_405, L12_406 = -30, -30
	end
	if not A0_394.owned then
		L9_403:setFillColor(175, 175, 175)
	end
	L9_403.x, L9_403.y = 0, 0
	L5_399:insert(L9_403)
	if L10_404 then
		local L13_407 = L13_407
		L13_407 = L13_407(L1_395, L2_396, weaponTypes[A0_394.factoryType].listImage .. ".png")
		L5_399:insert(L13_407)
		L13_407.x, L13_407.y = L11_405, L12_406
		if weaponTypes[A0_394.factoryType].iconText then
			local L14_408 = L14_408
			;({}).size = weaponTypes[A0_394.factoryType].iconTextSize
			local L18_412 = L18_412
			local L19_413 = L19_413
			;({})[1] = 0
			;({})[2] = 0
			local ({})[3], L20_414 = 0, L20_414
			L19_413.shadowColor = L20_414
			L14_408 = L14_408(L18_412, L19_413)
			L19_413 = L5_399
			L18_412 = L5_399.insert
			L20_414 = L14_408
			L18_412(L19_413, L20_414)
			L18_412 = L13_407.x
			L19_413 = L13_407.y
			L14_408.y = L19_413
			L14_408.x = L18_412
		end
	end
end
function loadMoneyActionCountries()
	local L0_415, L1_416
	L0_415 = {}
	_ENV = L0_415
	L0_415 = activeCampaign
	L0_415 = L0_415.countries
	L1_416 = HOMELAND_COUNTRY_ID
	L0_415 = L0_415[L1_416]
	L1_416 = L0_415.underAttackDate
	if L1_416 then
		L1_416 = L0_415.underAttackDate
		local L2_417 = os.time()
		if L1_416 <= L2_417 then
			L0_415.moneyStartDate = nil
			L0_415.moneyAmount = 0
	end
	else
		L1_416 = L0_415.moneyStartDate
		if L1_416 then
			L0_415.moneyPendingDrawn = false
			L0_415.moneyReadyDrawn = false
			L0_415.moneyExpiredDrawn = false
			L1_416 = _ENV
			L1_416[L0_415] = L0_415
		end
	end
end
function unloadMoneyActionCountries()
	L2_420 = _ENV
	L0_418, L2_420, L3_421 = L0_418(L2_420)
	for L4_422, L5_423 in L0_418, L2_420, L3_421 do
		_ENV[L4_422] = nil
	end
	L0_418 = {}
	_ENV = L0_418
end
function loadFactoryCountries()
	_ENV = {}
	L2_426 = pairs
	L3_427 = activeCampaign
	L3_427 = L3_427.countries
	L2_426, L3_427, L4_428 = L2_426(L3_427)
	for _FORV_3_, _FORV_4_ in L2_426, L3_427, L4_428 do
		if _FORV_4_.owned and _FORV_4_.factoryStartDate and _FORV_4_.factoryRuns then
			if not countryHasFactory(_FORV_4_) then
				print("ERROR: tried to index non-existent weaponFactory", _FORV_4_.id, _FORV_4_.factoryType)
				break -- pseudo-goto
			end
			local L7_431 = L7_431
			local L8_432 = L8_432
			repeat
				L8_432 = L8_432[tostring(_FORV_4_.factoryType)]
				L8_432 = L8_432.maxRuns
				if L7_431 < L8_432 then
					L7_431 = _ENV
					L7_431[_FORV_4_] = _FORV_4_
				end
			until true
		end
	end
end
function unloadFactoryCountries()
	L2_435 = _ENV
	L0_433, L2_435, L3_436 = L0_433(L2_435)
	for L4_437, L5_438 in L0_433, L2_435, L3_436 do
		_ENV[L4_437] = nil
	end
	L0_433 = {}
	_ENV = L0_433
end
function L7_7.enterScene(A0_439, A1_440)
	local L16_455 = storyboard.removeScene
	L16_455("battlefieldScene")
	L16_455 = dailies
	L16_455 = L16_455.setLastGameAccessTime
	L16_455(os.time())
	L16_455 = nil
	_ENV = L16_455
	L16_455 = sound
	L16_455 = L16_455.shouldPlayMusic
	L16_455 = L16_455()
	if L16_455 then
		L16_455 = L34_34
		if L16_455 then
			L16_455 = sound
			L16_455 = L16_455.getChannelSound
			L16_455 = L16_455(L34_34)
			if L16_455 == L57_57.marchmusic.fileName then
				goto lbl_39
			end
		end
		L16_455 = sound
		L16_455 = L16_455.playStream
		;({}).loops = -1
		L16_455 = L16_455(L57_57.marchmusic.fileName, {})
		L34_34 = L16_455
	end
	::lbl_39::
	L16_455 = A0_439.view
	loadMoneyActionCountries()
	loadFactoryCountries()
	drawMap(L16_455)
	local L3_442 = L3_442
	L3_442 = L3_442(screenX, 0, screenWidth, display.contentHeight)
	L3_442:setFillColor(0, 0, 0)
	;({}).alpha = 0
	;({}).time = 1000
	;({}).transition = easing.inOutQuad
	;({}).onComplete = function()
		_ENV:removeSelf()
		local L1_457 = L1_457
	end
	transition.to(L3_442, {})
	L16_455:insert(L3_442)
	local L4_443 = L4_443
	L4_443 = L4_443("easingx")
	updatePlayerOutputs()
	L58_58()
	initView()
	selectedACountry = false
	L16_455:insert(L15_15)
	checkForEvents(L16_455)
	saveCampaignStates()
	campaignSettings:save()
	L11_11 = false
	timer.performWithDelay(1000, function()
		local L1_458
		L1_458 = true
		_ENV = L1_458
	end)
	if isCampaignFinished(activeCampaign) then
		local L5_444 = L5_444
		L5_444(L16_455)
	end
	L5_444 = L4_443.easeIn
	L23_23.isVisible = true
	L22_22.isVisible = true
	L24_24.isVisible = true
	Runtime:addEventListener("enterFrame", mapEnterFrame)
	L13_13 = false
	L14_14 = false
	showFirstWarbuxTutorial()
	L54_54, L55_55 = spritesheetmanager.getSpriteSet("res/maps/fish_jump.png")
	sprite.add(L54_54, "fishjump", 1, #L55_55, 700, 1)
	animateCountryLosses(L16_455)
	if not tutorial.isTutorialComplete("firstFactory") and not tutorial.isTutorialComplete("firstFactoryProduces") and L45_45 then
		_FOR_, _FOR_, _FOR_ = pairs(L45_45)
		for _FORV_11_, _FORV_12_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_12_.factoryImage then
				if dailies.isFactoryReady(_FORV_12_, os.time()) then
					break
				elseif nil == nil then
				end
			end
		end
		if not true and _FORV_12_ and getCountryMidLand(_FORV_12_) then
			local L12_451 = L12_451
			local L13_452 = L13_452
			local L14_453 = L14_453
			local L15_454 = L15_454
			L1_1:centerViewPortOn(_FORV_12_.factoryImage.x, _FORV_12_.factoryImage.y, L1_1.maxScale, function()
				showFirstFactoryTutorial(_ENV)
				local L1_459 = L1_459
			end, 250)
			local L17_456 = L17_456
		end
		repeat
			do break end -- pseudo-goto
			L12_451 = L60_60
			L12_451()
		until true
	end
	L12_451 = system
	L12_451 = L12_451.activate
	L13_452 = "multitouch"
	L12_451(L13_452)
	L12_451 = tutorial
	L12_451 = L12_451.areTutorialsShowing
	L12_451 = L12_451()
	if not L12_451 then
		L12_451 = achievementList
		L12_451 = L12_451.playerKills
		L12_451 = L12_451()
		if 15 <= L12_451 then
			L12_451 = BATTLES_THIS_SESSION
			if 3 <= L12_451 then
				L12_451 = settings
				L13_452 = L12_451
				L12_451 = L12_451.get
				L14_453 = "multiplayerSeen"
				L15_454 = false
				L12_451 = L12_451(L13_452, L14_453, L15_454)
				if not L12_451 then
					L12_451 = tutorial
					L12_451 = L12_451.isTutorialComplete
					L13_452 = "multiplayerAware"
					L12_451 = L12_451(L13_452)
					if not L12_451 then
						L12_451 = L36_36
						L13_452 = L12_451
						L12_451 = L12_451.localToContent
						L14_453 = 0
						L15_454 = 0
						L12_451, L13_452 = L12_451(L13_452, L14_453, L15_454)
						L14_453 = tutorial
						L14_453 = L14_453.new
						L15_454 = {}
						L15_454.id = "multiplayerAware"
						L15_454.x = L12_451
						L17_456 = L13_452 + 40
						L15_454.y = L17_456
						L15_454.rotation = 180
						L17_456 = {}
						L17_456[1] = L36_36
						L15_454.controls = L17_456
						L14_453 = L14_453(L15_454)
					end
				end
			end
		end
	end
end
function animateCountryLosses(A0_460)
	local L1_461, L2_462, L3_463, L4_464, L5_465
	L1_461 = 1
	local L2_462, L8_468, L14_474 = activeCampaign, L8_468, L14_474
	L2_462 = L2_462.countries
	L2_462 = #L2_462
	L3_463 = 1
	for L4_464 = L1_461, L2_462, L3_463 do
		L5_465 = activeCampaign
		L5_465 = L5_465.countries
		L5_465 = L5_465[L4_464]
		L8_468 = L5_465.lossDate
		if L8_468 then
			L8_468 = getCountryMidLand
			L14_474 = L5_465
			L8_468 = L8_468(L14_474)
			if L8_468 then
				L14_474 = L8_468.landGroup
				L14_474 = L14_474.x
				local L9_469, L10_470 = L9_469, L10_470
				local L11_471 = L11_471
				local L12_472 = L12_472
				local L13_473 = L13_473
				L10_470(L11_471, L12_472, L13_473, _ENV.maxScale, function()
					local L1_476 = L1_476
					L1_476(_ENV, L5_465)
					local L2_477 = L2_477
				end, 250)
				local L15_475 = L15_475
			end
			return
		end
	end
end
function animateCountryLoss(A0_478, A1_479)
	local L2_480 = L2_480
	;({}).parentGroup = L20_20
	;({}).country = A1_479
	;({}).drawAllBorders = true
	;({}).drawColourOverride = "PLAYER_OWNED"
	L2_480 = L2_480({})
	local L3_481 = L3_481
	;({}).parentGroup = L20_20
	;({}).country = A1_479
	;({}).drawAllBorders = true
	;({}).drawColourOverride = "UNDER_ATTACK"
	local L3_481, L4_482 = L3_481({}), L4_482
	L3_481.alpha = 0
	L3_481.numTimesFlashed = 0
	L4_482 = 10
	local L5_483 = L5_483
	local L5_483, L6_484 = L5_483("firstLoss"), L6_484
	if not L5_483 then
		L4_482 = -1
	end
	function L5_483()
		if not _ENV.alpha then
			if _ENV.transitionHandle then
				transition.cancel(_ENV.transitionHandle)
			end
			return
		end
		_ENV.numTimesFlashed = _ENV.numTimesFlashed + 1
		local L1_493 = L1_493
		if L4_482 ~= -1 and _ENV.numTimesFlashed >= L4_482 then
			L1_493 = A1_479
			L1_493 = L1_493.endFlashing
			L1_493()
			return
		end
		L1_493 = 0
		if _ENV.alpha < 0.5 then
			L1_493 = 1
		end
		local L2_494 = L2_494
		local L3_495 = L3_495
		;({}).time = 0
		;({}).delay = 200
		;({}).alpha = L1_493
		local ({}).onComplete, L5_497 = L5_483, L5_497
		L3_495 = L3_495(L5_497, {})
		L2_494.transitionHandle = L3_495
	end
	function L6_484()
		if _ENV.transitionHandle then
			transition.cancel(_ENV.transitionHandle)
		end
		display.remove(_ENV)
		display.remove(L2_480)
		A1_479.lossDate = nil
		saveCampaignStates(activeCampaign)
		campaignSettings:save()
		local L0_498, L1_499 = L0_498, L1_499
	end
	A1_479.flashCountry = L5_483
	A1_479.endFlashing = L6_484
	if not tutorial.isTutorialComplete("firstLoss") then
		local L8_486 = L8_486
		local L9_487 = L9_487
		;({}).id = "firstLoss"
		;({}).y, ({}).x = getCountryMidLand(A1_479).landGroup:localToContent(0, 0) - 50, L9_487
		;({}).rotation = 45
		;({}).events, ({})[1] = {}, "tap"
		;({}).confirmationRequired = true
		local L12_490 = L12_490
		local ({}).controls, ({})[1], L13_491 = {}, L16_16, L13_491
		;({}).onComplete = function(A0_500)
			A0_500:complete()
			_ENV.endFlashing()
		end
		L13_491 = L13_491({})
		L56_56 = L13_491
	end
	L8_486 = A1_479.flashCountry
	L8_486()
end
function showFirstFactoryProducesTutorial(A0_501)
	if not tutorial.isTutorialComplete("firstFactoryProduces") and A0_501.factoryImage then
		local L1_502, L2_503 = L1_502, L2_503
		local L3_504 = L3_504
		local L1_502, L2_503, L4_505 = L1_502(L2_503, L3_504, 0)
		L1_502 = L1_502 - 50
		L2_503 = L2_503 - 50
		L3_504 = {}
		L4_505 = {}
		L4_505[1] = _ENV
		if L56_56 then
			L56_56:destroy()
			L56_56 = nil
		end
		local L5_506 = L5_506
		;({}).id = "firstFactoryProduces"
		;({}).x = L1_502
		;({}).y = L2_503
		local L7_508 = L7_508
		local ({})[1], L8_509 = "tap", L8_509
		L7_508.events = L8_509
		L7_508.rotation = -45
		L7_508.controls = L4_505
		L5_506 = L5_506(L7_508)
		L56_56 = L5_506
	end
end
function showFirstFactoryDegradesTutorial(A0_510)
	if not tutorial.isTutorialComplete("firstFactoryDegrades") and A0_510.factoryImage then
		local L1_511, L2_512 = L1_511, L2_512
		local L3_513 = L3_513
		L1_511, L2_512 = L1_511(L2_512, L3_513, 0)
		L1_511 = L1_511 - 50
		L2_512 = L2_512 - 50
		L3_513 = {}
		L3_513[1] = _ENV
		local L4_514 = L4_514
		;({}).id = "firstFactoryDegrades"
		;({}).x = L1_511
		;({}).y = L2_512
		local L6_516 = L6_516
		local ({})[1], L7_517 = "tap", L7_517
		L6_516.events = L7_517
		L6_516.rotation = -45
		L6_516.confirmationRequired = true
		L6_516.controls = L3_513
		L4_514 = L4_514(L6_516)
		L56_56 = L4_514
	end
end
function showFirstFactoryTutorial(A0_518)
	if not tutorial.isTutorialComplete("firstFactory") and A0_518.factoryImage then
		local L1_519, L2_520 = L1_519, L2_520
		L1_519, L2_520 = L1_519(L2_520, 0, 0)
		L1_519 = L1_519 - 50
		L2_520 = L2_520 - 50
		local L3_521 = L3_521
		;({}).id = "firstFactory"
		;({}).events, ({})[1] = {}, "tap"
		;({}).x = L1_519
		;({}).y = L2_520
		;({}).rotation = -45
		;({}).confirmationRequired = true
		local L5_523 = L5_523
		local ({})[1], L6_524 = L16_16, L6_524
		L5_523.controls = L6_524
		L3_521 = L3_521(L5_523)
		_ENV = L3_521
	end
end
function showFirstWarbuxTutorial()
	local L0_525
	repeat
		L0_525 = activeCampaign
		L0_525 = L0_525.countries
		L0_525 = L0_525[HOMELAND_COUNTRY_ID]
		if not tutorial.isTutorialComplete("firstWarbux") and L0_525.moneyImage then
			_FOR_, _FOR_, _FOR_ = pairs(L0_525.lands)
			for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
				local L8_533 = L8_533
				table.insert({}, activeCampaign.lands[_FORV_6_].landGroup.landImage)
			end
			L9_534 = L0_525.moneyImage
			L9_534 = L9_534.localToContent
			L9_534 = L9_534(L9_534, 0, -40)
			;({}).id = "firstWarbux"
			;({}).y, ({}).x = L9_534(L9_534, 0, -40)
			;({}).rotation = 0
			;({}).controls = L8_533
			local L6_531 = L6_531
			local ({}).events, ({})[1], L7_532 = {}, "tap", L7_532
			;({}).onComplete = function(A0_535)
				A0_535:complete()
				local L3_538 = L3_538
				L3_538 = timer
				L3_538 = L3_538.performWithDelay
				local L2_537 = L2_537
				L3_538(L2_537, function()
					showFirstAttackTutorial()
				end)
			end
			L7_532 = L7_532({})
			_ENV = L7_532
			L7_532 = true
			L14_14 = L7_532
			break -- pseudo-goto
		end
		L8_533 = showFirstAttackTutorial
		L8_533()
	until true
end
function showFirstAttackTutorial()
	local L10_549, L11_550 = tutorial.isTutorialComplete, L11_550
	L11_550 = "firstAttack"
	L10_549 = L10_549(L11_550)
	if not L10_549 then
		L10_549 = {}
		L11_550 = nil
		L2_541, L3_542, _FOR_ = L2_541(activeCampaign.countries)
		for _FORV_5_, _FORV_6_ in L2_541, L3_542, _FOR_ do
			if _ENV(_FORV_6_) then
				if L11_550 == nil then
					L11_550 = getCountryMidLand(_FORV_6_)
				end
				_FOR_, _FOR_, _FOR_ = pairs(_FORV_6_.lands)
				for _FORV_10_, _FORV_11_ in _FOR_, _FOR_, _FOR_ do
					table.insert(L10_549, activeCampaign.lands[_FORV_11_].landGroup.landImage)
				end
			end
		end
		L2_541 = #L10_549
		if 0 < L2_541 then
			L2_541 = true
			L13_13 = L2_541
			L2_541 = nil
			L3_542 = nil
			if L11_550 ~= nil then
				L8_547 = L11_550.landGroup
				L9_548 = L8_547
				L8_547 = L8_547.localToContent
				L12_551 = 0
				L13_552 = 0
				L8_547, L9_548 = L8_547(L9_548, L12_551, L13_552)
				L3_542 = L9_548
				L2_541 = L8_547
			end
			L8_547 = tutorial
			L8_547 = L8_547.new
			L9_548 = {}
			L9_548.id = "firstAttack"
			L12_551 = {}
			L13_552 = "tap"
			L12_551[1] = L13_552
			L9_548.events = L12_551
			L9_548.x = L2_541
			L9_548.y = L3_542
			L9_548.controls = L10_549
			L8_547 = L8_547(L9_548)
			L56_56 = L8_547
		end
	end
end
function showEndCampaignDialog(A0_554)
	local L1_555 = L1_555
	;({}).screenGroup = _ENV.parent
	;({}).icon = utils.DIALOG_WIN
	;({}).textLine1 = "CONTINENT CONQUERED!"
	;({}).textLine2 = "COLLECTING STUFF & MOVING TO NEW CONTINENT"
	local ({}).confirmSound, L3_557 = sound.globalSounds.button, L3_557
	function L3_557.confirmFunction()
		doEndCampaignStuff(_ENV)
		local L1_558 = L1_558
	end
	L1_555 = L1_555(L3_557)
end
function doEndCampaignStuff(A0_559, A1_560)
	local L2_561, L3_562
	L2_561 = false
	local _ENV, L10_569, L20_579 = L2_561, L10_569, L20_579
	L2_561 = true
	L12_12 = L2_561
	if not A1_560 then
		L2_561 = {}
		A1_560 = L2_561
	end
	L2_561 = A1_560.doneMoneyHarvest
	if not L2_561 then
		L2_561 = false
	end
	L3_562 = A1_560.doneFactoryHarvest
	if not L3_562 then
		L3_562 = false
	end
	L10_569 = os
	L10_569 = L10_569.time
	L10_569 = L10_569()
	if not L2_561 then
	end
	if not L3_562 then
		L20_579 = {}
		_FOR_ = 1
		for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
			if countryHasFactory(activeCampaign.countries[_FORV_10_]) and activeCampaign.countries[_FORV_10_].factoryRuns and activeCampaign.countries[_FORV_10_].factoryRuns < weaponFactories[tostring(activeCampaign.countries[_FORV_10_].factoryType)].maxRuns then
				local L12_571 = L12_571
				if getCountryMidLand(activeCampaign.countries[_FORV_10_]) then
					do
						local L17_576 = L17_576
						local L18_577 = L18_577
						local L19_578 = L19_578
						L1_1:centerViewPortOn(getCountryMidLand(activeCampaign.countries[_FORV_10_]).landGroup.x, getCountryMidLand(activeCampaign.countries[_FORV_10_]).landGroup.y, L1_1.maxScale, function()
							local L3_584 = L3_584
							local L2_583 = L2_583
							L3_584(L2_583, true, function()
								local L0_586 = L0_586
								local L1_587 = L1_587
								;({}).doneMoneyHarvest = false
								local ({}).doneFactoryHarvest, L3_589 = L3_562, L3_589
								L0_586(L1_587, L3_589)
							end, 1000)
							local L4_585 = L4_585
						end, 250)
						local L21_580 = L21_580
						do return end
						L20_579 = L1_1
						L12_571 = L20_579
						L20_579 = L20_579.centerViewPortOn
						L13_572 = activeCampaign
						L13_572 = L13_572.lands
						L13_572 = L13_572[1]
						L13_572 = L13_572.x
						L14_573 = activeCampaign
						L14_573 = L14_573.lands
						L14_573 = L14_573[1]
						L14_573 = L14_573.y
						L15_574 = L1_1
						L15_574 = L15_574.minScale
						function L16_575()
							moveToNewCampaign(_ENV)
							local L1_590 = L1_590
						end
						L20_579(L12_571, L13_572, L14_573, L15_574, L16_575)
						return
					end
				end
			end
		end
	end
end
function moveToNewCampaign(A0_591)
	local L1_592
	L1_592 = screenX
	L1_592 = L1_592 - _ENV.contentWidth
	local L2_593 = L2_593
	local L3_594 = L3_594
	;({}).time = 500
	local ({}).transition, L5_596 = easing.inExpo, L5_596
	L5_596.x = L1_592
	function L5_596.onComplete()
		local L0_597, L1_598, L2_599
		L0_597 = activeCampaign
		L0_597 = L0_597.countries
		L1_598 = HOMELAND_COUNTRY_ID
		L0_597 = L0_597[L1_598]
		L1_598 = L0_597.moneyStartDate
		L2_599 = L0_597.moneyAmount
		_ENV = _ENV.xScale
		undrawMap()
		local L3_600 = L3_600
		L3_600 = 1
		loadNewCampaignTheme(L3_600)
		activeCampaign = finishCampaignAndStartNew(activeCampaign, L3_600, L1_598, L2_599)
		if activeCampaign.previousCampaigns and #activeCampaign.previousCampaigns >= 50 then
			achievementList.unlockAchievement(achievementList.campaignAchievements.CAMPAIGN_50_COMPLETED)
		end
		if activeCampaign.previousCampaigns and #activeCampaign.previousCampaigns >= 25 then
			achievementList.unlockAchievement(achievementList.campaignAchievements.CAMPAIGN_25_COMPLETED)
		end
		if activeCampaign.previousCampaigns and #activeCampaign.previousCampaigns >= 10 then
			achievementList.unlockAchievement(achievementList.campaignAchievements.CAMPAIGN_10_COMPLETED)
		end
		if activeCampaign.previousCampaigns and #activeCampaign.previousCampaigns >= 5 then
			achievementList.unlockAchievement(achievementList.campaignAchievements.CAMPAIGN_05_COMPLETED)
		end
		if activeCampaign.previousCampaigns and 1 <= #activeCampaign.previousCampaigns then
			achievementList.unlockAchievement(achievementList.campaignAchievements.CAMPAIGN_01_COMPLETED)
		end
		loadMoneyActionCountries()
		loadFactoryCountries()
		campaigns[1] = activeCampaign
		activeCampaign.countries[HOMELAND_COUNTRY_ID].moneyAmount = calculateDailyAmount(activeCampaign)
		saveCampaignStates()
		utils.logEvent("New Campaign Started: " .. tostring(activeCampaign.num))
		campaignSettings:save()
		dailies.setPredictNewAttacks(true)
		drawMap(A0_591)
		initView()
		_ENV.x = screenX + screenWidth + _ENV.contentWidth
		L11_11 = true
		L12_12 = false
		local L4_601 = L4_601
		local L5_602 = L5_602
		;({}).time = 500
		;({}).transition = easing.outExpo
		local L8_605 = L8_605
		L8_605.x = screenX + screenWidth / 2
		function L8_605.onComplete()
			_ENV()
		end
		L4_601(L5_602, L8_605)
	end
	L2_593(L3_594, L5_596)
end
function initView()
	if _ENV ~= nil then
		_ENV:destroy()
	end
	_ENV = require("pinchViewController").View:new()
	_ENV:init(L16_16, L20_20, nil, true, true)
	local L6_612 = L6_612
	L6_612 = _ENV
	L6_612 = L6_612.setUseNewLimiting
	L6_612(L6_612, true)
	L6_612 = _ENV
	L6_612 = L6_612.setSingleTapScrollEnabled
	L6_612(L6_612, false)
	L6_612 = _ENV
	L6_612 = L6_612.setEnterFrameEnabled
	L6_612(L6_612, false)
	L6_612 = _ENV
	L6_612 = L6_612.setScrollBoundsPadding
	L6_612(L6_612, 150)
	L6_612 = _ENV
	L6_612 = L6_612.setScaleBounds
	L6_612(L6_612, 0.24, 1)
	L6_612 = _ENV
	L6_612 = L6_612.centerView
	L6_612(L6_612)
	L6_612 = _ENV
	L6_612 = L6_612.enable
	L6_612(L6_612)
	L6_612 = _ENV
	L6_612 = L6_612.limitScaleToBounds
	local L1_607 = L1_607
	L6_612 = L6_612(L1_607, L51_51)
	L51_51 = L6_612
	L6_612 = L16_16
	L1_607 = L16_16
	L6_612.xScale, L1_607.yScale = L51_51, L51_51
	L6_612 = L16_16
	L1_607 = L16_16
	local L2_608, L3_609 = L2_608, L3_609
	local L4_610 = L4_610
	local L2_608, L3_609, L5_611 = L2_608(L3_609, L4_610, L50_50)
	L1_607.y = L3_609
	L6_612.x = L2_608
end
function undrawMap()
	L8_621 = activeCampaign
	L8_621 = L8_621.countries
	L3_616, L8_621, L9_622 = L3_616(L8_621)
	for _FORV_3_, _FORV_4_ in L3_616, L8_621, L9_622 do
		if _FORV_4_ ~= nil then
			_FORV_4_.wheelImage = nil
			_FORV_4_.factoryImage = nil
			_FORV_4_.factoryProgressBar = nil
			_FORV_4_.factoryProgressBarFill = nil
			if _FORV_4_.factoryBonusTransition then
				transition.cancel(_FORV_4_.factoryBonusTransition)
				_FORV_4_.factoryBonusTransition = nil
			end
			_FORV_4_.moneyImage = nil
			_FORV_4_.moneyProgressBar = nil
			_FORV_4_.midland = nil
			_FORV_4_.moneyProgressBarFill = nil
			if _FORV_4_.moneyTransition then
				transition.cancel(_FORV_4_.moneyTransition)
				_FORV_4_.moneyTransition = nil
			end
			if _FORV_4_.moneyTextTransition then
				transition.cancel(_FORV_4_.moneyTextTransition)
				_FORV_4_.moneyTextTransition = nil
			end
		end
	end
	L3_616 = pairs
	L8_621 = activeCampaign
	L8_621 = L8_621.lands
	L3_616, L8_621, L9_622 = L3_616(L8_621)
	for _FORV_3_, _FORV_4_ in L3_616, L8_621, L9_622 do
		if _FORV_4_ ~= nil then
			if _FORV_4_.landGroup then
				_FORV_4_.landGroup.landImage = nil
			end
			_FORV_4_.landGroup = nil
			if _FORV_4_.drawFlair then
				_FOR_, _FOR_, _FOR_ = pairs(_FORV_4_.flair)
				for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
					_FORV_4_.drawFlair[_FORV_8_] = nil
				end
				_FORV_4_.drawFlair = nil
			end
			if _FORV_4_.drawnFills then
				_FOR_, _FOR_, _FOR_ = pairs(_FORV_4_.drawnFills)
				for _FORV_8_, _FORV_9_ in _FOR_, _FOR_, _FOR_ do
					_FORV_4_.drawnFills[_FORV_8_] = nil
				end
			end
		end
	end
	L3_616 = utils
	L3_616 = L3_616.removeDisplayObject
	L8_621 = _ENV
	L3_616(L8_621)
	L3_616 = nil
	_ENV = L3_616
	L3_616 = utils
	L3_616 = L3_616.removeDisplayObject
	L8_621 = L16_16
	L3_616(L8_621)
	L3_616 = nil
	L16_16 = L3_616
	L3_616 = nil
	L33_33 = L3_616
	L3_616 = nil
	L20_20 = L3_616
	L3_616 = nil
	L21_21 = L3_616
	L3_616 = nil
	L19_19 = L3_616
end
function L7_7.exitScene(A0_624, A1_625)
	system.deactivate("multitouch")
	if _ENV and _ENV.destroy then
		_ENV:destroy()
		_ENV = nil
	end
	Runtime:removeEventListener("enterFrame", mapEnterFrame)
	L5_629 = unloadMoneyActionCountries
	L5_629()
	L5_629 = unloadFactoryCountries
	L5_629()
	L5_629 = L41_41
	if L5_629 then
		L5_629 = timer
		L5_629 = L5_629.cancel
		L5_629(L41_41)
		L5_629 = nil
		L41_41 = L5_629
	end
	L5_629 = L0_0
	L5_629 = L5_629.hide
	L5_629()
	L5_629 = L42_42
	if L5_629 then
		L5_629 = timer
		L5_629 = L5_629.cancel
		L5_629(L42_42)
		L5_629 = nil
		L42_42 = L5_629
	end
	L5_629 = L43_43
	if L5_629 then
		L5_629 = pairs
		L5_629, _FOR_, _FOR_ = L5_629(L43_43)
		for _FORV_5_, _FORV_6_ in L5_629, _FOR_, _FOR_ do
			transition.cancel(_FORV_6_)
			L43_43[_FORV_5_] = nil
		end
	end
	L5_629 = nil
	L43_43 = L5_629
	L5_629 = L22_22
	if L5_629 ~= nil then
		L5_629 = L22_22
		L5_629 = L5_629.avatar
		L8_632 = L5_629
		L5_629 = L5_629.stopAnimation
		L5_629(L8_632)
		L5_629 = L22_22
		L5_629 = L5_629.avatar
		L8_632 = L5_629
		L5_629 = L5_629.dispose
		L5_629(L8_632)
		L5_629 = display
		L5_629 = L5_629.remove
		L8_632 = L22_22
		L8_632 = L8_632.avatar
		L5_629(L8_632)
		L5_629 = L22_22
		L5_629.avatar = nil
		L5_629 = utils
		L5_629 = L5_629.removeDisplayObject
		L8_632 = L22_22
		L5_629(L8_632)
		L5_629 = nil
		L22_22 = L5_629
	end
	L5_629 = L23_23
	if L5_629 ~= nil then
		L5_629 = L23_23
		L5_629 = L5_629.tank
		L8_632 = L5_629
		L5_629 = L5_629.destroy
		L5_629(L8_632)
		L5_629 = L23_23
		L8_632 = L5_629
		L5_629 = L5_629.removeSelf
		L5_629(L8_632)
		L5_629 = nil
		L23_23 = L5_629
	end
	L5_629 = L1_1
	L8_632 = L5_629
	L5_629 = L5_629.destroy
	L5_629(L8_632)
	L5_629 = undrawMap
	L5_629()
	L5_629 = nil
	L1_1 = L5_629
	L5_629 = 1
	L8_632 = L48_48
	L8_632 = L8_632.mapFrames
	L8_632 = #L8_632
	_FOR_ = 1
	for _FORV_5_ = L5_629, L8_632, _FOR_ do
		spritesheetmanager.disposeSpriteSet(L48_48.mapFrames[_FORV_5_].sheetFile)
	end
	L5_629 = spritesheetmanager
	L5_629 = L5_629.disposeSpriteSet
	L8_632 = "res/maps/fish_jump.png"
	L5_629(L8_632)
	L5_629 = spritesheetmanager
	L5_629 = L5_629.disposeSpriteSet
	L8_632 = "res/maps/factory.png"
	L5_629(L8_632)
end
function L7_7.destroyScene(A0_633, A1_634)
	local L2_635
	L2_635 = A0_633.view
	_ENV:destroy()
	_ENV = nil
	L24_24 = nil
	if L36_36 then
		L36_36.textOutput = nil
	end
	L38_38.textOutput = nil
	L48_48 = nil
	sound.stop()
	L34_34 = nil
	local L3_636 = L3_636
	L3_636(L57_57)
	L3_636 = tutorial
	L3_636 = L3_636.closeTutorials
	local L4_637 = tutorial.getMapTutorialIds()
	L3_636(L4_637)
end
function getBorderFillPrefix(A0_638, A1_639, A2_640)
	local L3_641, L4_642, L5_643, L6_644, L7_645, L8_646
	L3_641 = "green_"
	L4_642 = landType
	L4_642 = L4_642.WATER
	L5_643 = false
	L6_644 = nil
	L7_645 = nil
	if A0_638 ~= nil then
		L8_646 = activeCampaign
		L8_646 = L8_646.countries
		L8_646 = L8_646[A0_638.countryId]
		L4_642 = L8_646.landType
		L5_643 = L8_646.owned
		L6_644 = L8_646.underAttackDate
		if A2_640 then
			L3_641 = _ENV.mapFrames[A2_640].prefix
			L7_645 = _ENV.mapFrames[A2_640].sheetFile
		elseif not L5_643 then
			if L4_642 ~= landType.WATER and not A1_639 then
				L3_641 = _ENV.mapFrames.OUT_OF_RANGE.prefix
				L7_645 = _ENV.mapFrames.OUT_OF_RANGE.sheetFile
			else
				L3_641 = _ENV.mapFrames[landType[L4_642]].prefix
				local L10_648 = _ENV.mapFrames[landType[L4_642]]
				L7_645 = L10_648.sheetFile
				do break end -- pseudo-goto
				if L6_644 then
					L10_648 = os
					L10_648 = L10_648.time
					L10_648 = L10_648()
					repeat
						if L6_644 <= L10_648 then
							L10_648 = _ENV
							L10_648 = L10_648.mapFrames
							L10_648 = L10_648.UNDER_ATTACK
							L3_641 = L10_648.prefix
							L10_648 = _ENV
							L10_648 = L10_648.mapFrames
							L10_648 = L10_648.MAP_EDGE
							L7_645 = L10_648.sheetFile
						else
							L10_648 = _ENV
							L10_648 = L10_648.mapFrames
							L10_648 = L10_648.PLAYER_OWNED
							L3_641 = L10_648.prefix
							L10_648 = _ENV
							L10_648 = L10_648.mapFrames
							L10_648 = L10_648.PLAYER_OWNED
							L7_645 = L10_648.sheetFile
							do break end -- pseudo-goto
							L8_646 = _ENV
							L8_646 = L8_646.mapFrames
							L8_646 = L8_646.MAP_EDGE
							L3_641 = L8_646.prefix
							L8_646 = _ENV
							L8_646 = L8_646.mapFrames
							L8_646 = L8_646.MAP_EDGE
							L7_645 = L8_646.sheetFile
						end
					until true
				end
			end
		end
	end
	L8_646 = L3_641
	L10_648 = L7_645
	return L8_646, L10_648
end
function getBorderFill(A0_649, A1_650, A2_651, A3_652, A4_653, A5_654)
	local L6_655, L7_656
	L6_655 = Borders
	L6_655 = L6_655.borderTemplates
	if L6_655 ~= nil then
		L6_655 = nil
		L7_656 = nil
		if A1_650 ~= Borders.NS_line and A1_650 ~= Borders.EW_line then
			L6_655, L7_656 = getBorderFillPrefix(A0_649, A4_653, A5_654)
			L6_655 = L6_655 .. Borders.borderTemplates[A3_652 .. A1_650]
		else
			L6_655, L7_656 = Borders.borderTemplates.line, _ENV.mapFrames.LINE_BORDER.sheetFile
		end
		local L8_657 = L8_657
		local L8_657, L9_658 = L8_657(L7_656)
		local L10_659 = L10_659
		L10_659 = L10_659(L8_657, L9_658, L6_655)
		if A3_652 == "N" then
		elseif A3_652 == "E" then
			L10_659:scale(-1, 1)
		elseif A3_652 == "S" then
			L10_659:scale(-1, -1)
		elseif A3_652 == "W" then
			local L11_660, L12_661 = L11_660, L12_661
			local L13_662 = L13_662
			L11_660(L12_661, L13_662, -1)
			local L14_663 = L14_663
		end
		return L10_659
	end
	L6_655 = nil
	return L6_655
end
function drawJoinDot(A0_664, A1_665, A2_666)
	local L4_667, L5_668 = L4_667, L5_668
	local L6_669 = L6_669
	local L7_670 = L7_670
	L5_668(L6_669, L7_670, 0, 0)
	local L8_671 = L8_671
end
function drawCountryBorders(A0_672)
	local L1_673, L2_674, L3_675, L4_676
	L1_673 = A0_672.parentGroup
	L2_674 = A0_672.land
	L3_675 = A0_672.drawColourOverride
	if not L3_675 then
		L3_675 = nil
	end
	L4_676 = A0_672.drawAllBorders
	if not L4_676 then
		L4_676 = false
	end
	if L2_674.adjacent.N == 0 or L4_676 then
		_ENV(L1_673, L2_674, "N", L2_674.adjacent.N == 0, L3_675)
	end
	if L2_674.adjacent.E == 0 or L4_676 then
		_ENV(L1_673, L2_674, "E", L2_674.adjacent.E == 0, L3_675)
	end
	_ENV(L1_673, L2_674, "W", L2_674.adjacent.W == 0, L3_675)
	local L5_677 = L5_677
	local L6_678 = L6_678
	local L7_679 = L7_679
	local L8_680 = L8_680
	local L9_681 = L9_681
	L5_677(L6_678, L7_679, L8_680, L9_681, L3_675)
	local L10_682 = L10_682
end
function drawFlair(A0_683, A1_684, A2_685)
	if A1_684.flair then
		L5_688 = A1_684.drawFlair
		if not L5_688 then
			L5_688 = {}
			A1_684.drawFlair = L5_688
		end
		L5_688 = pairs
		L6_689 = A1_684.flair
		L5_688, L6_689, L7_690 = L5_688(L6_689)
		for L8_691, _FORV_7_ in L5_688, L6_689, L7_690 do
			local L10_693 = L10_693
			local L11_694 = L11_694
			L30_30 = L30_30 + 1
			A0_683:insert((utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(_ENV.flair[_FORV_7_.id].sheetFile))))
			utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(_ENV.flair[_FORV_7_.id].sheetFile)).xReference = L10_693.referencePixel.x
			utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(_ENV.flair[_FORV_7_.id].sheetFile)).yReference = L10_693.referencePixel.y
			utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(_ENV.flair[_FORV_7_.id].sheetFile)).x = A1_684.landGroup.x + _FORV_7_.x
			utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(_ENV.flair[_FORV_7_.id].sheetFile)).y = A1_684.landGroup.y + _FORV_7_.y
			A1_684.drawFlair[utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(_ENV.flair[_FORV_7_.id].sheetFile))] = utils.newImageFromSpriteSet(spritesheetmanager.getSpriteSet(_ENV.flair[_FORV_7_.id].sheetFile))
			if not activeCampaign.countries[A1_684.countryId].canAttack then
				local L12_695, L13_696 = L12_695, L13_696
				local L14_697 = L14_697
				local L15_698 = L15_698
				L14_697(L15_698, 175, 175, 175)
				local L16_699 = L16_699
			end
		end
	end
end
;({}).x = LandImageSteps.N.x
;({}).y = LandImageSteps.N.y
;({}).x = LandImageSteps.E.x
;({}).y = LandImageSteps.E.y
;({}).x = LandImageSteps.S.x
;({}).y = LandImageSteps.S.y
;({}).x = LandImageSteps.W.x
local ({}).y, L72_72 = LandImageSteps.W.y, L72_72
orthoPoly, ({})[1] = {}, {}
orthoPoly, ({})[2] = {}, {}
orthoPoly, ({})[3] = {}, {}
orthoPoly, ({})[4] = {}, {}
function getLandImage(A0_700, A1_701, A2_702)
	local L3_703, L4_704, L5_705
	L5_705 = activeCampaign
	L5_705 = L5_705.countries
	L5_705 = L5_705[A0_700.countryId]
	if A2_702 then
		L3_703 = _ENV.mapFrames[A2_702].frameName
		L4_704 = _ENV.mapFrames[A2_702].sheetFile
	elseif not L5_705.owned then
		if L5_705.landType ~= landType.WATER and not A1_701 then
			L3_703 = _ENV.mapFrames.OUT_OF_RANGE.frameName
			L4_704 = _ENV.mapFrames.OUT_OF_RANGE.sheetFile
		else
			L3_703 = _ENV.mapFrames[landType[L5_705.landType]].frameName
			L4_704 = _ENV.mapFrames[landType[L5_705.landType]].sheetFile
		end
	elseif L5_705.underAttackDate and L5_705.underAttackDate <= os.time() then
		L3_703 = _ENV.mapFrames.UNDER_ATTACK.frameName
		L4_704 = _ENV.mapFrames.UNDER_ATTACK.sheetFile
	else
		L3_703 = _ENV.mapFrames.PLAYER_OWNED.frameName
		L4_704 = _ENV.mapFrames.PLAYER_OWNED.sheetFile
	end
	local L6_706 = L6_706
	local L6_706, L7_707 = L6_706(L4_704)
	local L8_708 = L8_708
	local L9_709 = L9_709
	local L10_710 = L10_710
	local L8_708, L11_711 = L8_708(L9_709, L10_710, L3_703), L11_711
	L9_709 = L31_31
	L9_709 = L9_709 + 1
	L31_31 = L9_709
	return L8_708
end
function getLandGroup(A0_712, A1_713, A2_714)
	local L3_715 = L3_715
	L3_715 = L3_715(A0_712, A1_713, A2_714)
	if A2_714 then
		L3_715.x, L3_715.y = getSteppedImageCoords(A0_712.x, A0_712.y)
		return L3_715
	else
		A0_712.landGroup = display.newGroup()
		_ENV = _ENV + 1
		A0_712.landGroup:insert(L3_715)
		A0_712.landGroup.landImage = L3_715
		A0_712.landGroup.x, A0_712.landGroup.y = getSteppedImageCoords(A0_712.x, A0_712.y)
	end
	if false then
		if L33_33 == nil then
			L33_33 = display.newGroup()
		end
		L33_33:insert((display.newText(A0_712.id .. "(" .. A0_712.countryId .. ")", 0, 0, native.systemFontBold, 14)))
		display.newText(A0_712.id .. "(" .. A0_712.countryId .. ")", 0, 0, native.systemFontBold, 14):setTextColor(0, 255, 255)
		display.newText(A0_712.id .. "(" .. A0_712.countryId .. ")", 0, 0, native.systemFontBold, 14).x = A0_712.landGroup.x
		display.newText(A0_712.id .. "(" .. A0_712.countryId .. ")", 0, 0, native.systemFontBold, 14).y = A0_712.landGroup.y
	end
	if false then
		if L33_33 == nil then
			L33_33 = display.newGroup()
		end
		if A0_712.borders.N ~= 0 then
			idLabel = display.newText(A0_712.borders.N, 0, 0, native.systemFontBold, 10)
			L33_33:insert(idLabel)
			idLabel.x = A0_712.landGroup.x - 27 - idLabel.contentWidth / 2
			idLabel.y = A0_712.landGroup.y - 13 - idLabel.contentHeight / 2
		end
		if A0_712.borders.E ~= 0 then
			idLabel = display.newText(A0_712.borders.E, 0, 0, native.systemFontBold, 10)
			L33_33:insert(idLabel)
			idLabel.x = A0_712.landGroup.x + 27 - idLabel.contentWidth / 2
			idLabel.y = A0_712.landGroup.y - 13 - idLabel.contentHeight / 2
		end
		if A0_712.borders.S ~= 0 then
			idLabel = display.newText(A0_712.borders.S, 0, 0, native.systemFontBold, 10)
			L33_33:insert(idLabel)
			idLabel.x = A0_712.landGroup.x + 27 - idLabel.contentWidth / 2
			idLabel.y = A0_712.landGroup.y + 13 - idLabel.contentHeight / 2
		end
		if A0_712.borders.W ~= 0 then
			local L8_720 = L8_720
			local L8_720, L9_721 = L8_720(A0_712.borders.W, 0, 0, native.systemFontBold, 10), L9_721
			idLabel = L8_720
			L8_720 = L33_33
			L9_721 = L8_720
			L8_720 = L8_720.insert
			L8_720(L9_721, idLabel)
			L8_720 = idLabel
			L9_721 = A0_712.landGroup
			L9_721 = L9_721.x
			L9_721 = L9_721 - 27
			L9_721 = L9_721 - idLabel.contentWidth / 2
			L8_720.x = L9_721
			L8_720 = idLabel
			L9_721 = A0_712.landGroup
			L9_721 = L9_721.y
			L9_721 = L9_721 + 13
			L9_721 = L9_721 - idLabel.contentHeight / 2
			L8_720.y = L9_721
		end
	end
	L8_720 = activeCampaign
	L8_720 = L8_720.countries
	L9_721 = A0_712.countryId
	L8_720 = L8_720[L9_721]
	L9_721 = L63_63
	L9_721 = L9_721(L8_720)
	if not L9_721 then
		L9_721 = L8_720.owned
		if not L9_721 then
			goto lbl_249
		end
	end
	L9_721 = L66_66
	local L6_718 = L6_718
	L9_721(L6_718, A0_712)
	local L7_719 = L7_719
	::lbl_249::
	L9_721 = A0_712.landGroup
	return L9_721
end
function getMoneyImage(A0_722, A1_723, A2_724, A3_725, A4_726)
	if A1_723.moneyImage then
		display.remove(A1_723.moneyImage)
	end
	local L8_730 = utils.newImageFromSpriteSet(_ENV, L53_53, A2_724)
	A1_723.moneyImage = L8_730
	L8_730 = utils
	L8_730 = L8_730.parentWidget
	local L6_728 = L6_728
	L8_730(L6_728, L16_16)
	local L7_729 = L7_729
	L8_730 = A1_723.id
	L6_728 = HOMELAND_COUNTRY_ID
	if L8_730 == L6_728 then
		L8_730 = A1_723.moneyImage
		L6_728 = A1_723.midland
		L6_728 = L6_728.landGroup
		L6_728 = L6_728.x
		L6_728 = L6_728 + 90
		L8_730.x = L6_728
		L8_730 = A1_723.moneyImage
		L6_728 = A1_723.midland
		L6_728 = L6_728.landGroup
		L6_728 = L6_728.y
		L8_730.y = L6_728
	else
		L8_730 = A1_723.moneyImage
		L6_728 = A1_723.midland
		L6_728 = L6_728.landGroup
		L6_728 = L6_728.x
		L8_730.x = L6_728
		L8_730 = A1_723.moneyImage
		L6_728 = A1_723.midland
		L6_728 = L6_728.landGroup
		L6_728 = L6_728.y
		L7_729 = A1_723.moneyImage
		L7_729 = L7_729.contentHeight
		L7_729 = L7_729 / 2
		L6_728 = L6_728 - L7_729
		L8_730.y = L6_728
	end
end
function doMoneyCollectionWithAnimation(A0_731, A1_732, A2_733, A3_734)
	if A3_734 == nil then
		A3_734 = 1000
	end
	sound.playSound(_ENV.kaching)
	local L4_735 = L4_735
	L4_735 = L4_735(A1_732)
	local L5_736 = L5_736
	;({}).fontName = "gameplay"
	;({}).text = "+ " .. tostring(L4_735)
	;({}).originX = "CENTER"
	;({}).textFlow = "RIGHT"
	;({}).charBaseLine = "CENTER"
	;({}).showOrigin = false
	L5_736 = L5_736({})
	utils.parentWidget(L5_736, A0_731)
	L5_736.x, L5_736.y = A1_732.moneyImage:localToContent(0, 0)
	;({}).time = 100
	;({}).transition = easing.outInQuad
	;({}).xScale = 2
	;({}).yScale = 2
	;({}).onComplete = function()
		local L0_746
		L0_746 = _ENV
		local L1_747 = L1_747
		local L2_748 = L2_748
		;({}).time = 1250
		local ({}).transition, L4_750 = easing.outInQuad, L4_750
		L4_750.xScale = 0.3
		L4_750.yScale = 0.3
		L4_750.alpha = 0
		function L4_750.onComplete()
			local L0_751 = L0_751
			L0_751(_ENV)
			local L1_752 = L1_752
			L0_751 = _ENV
			L0_751.moneyTextTransition = nil
		end
		L1_747 = L1_747(L2_748, L4_750)
		L0_746.moneyTextTransition = L1_747
	end
	A1_732.moneyTextTransition = transition.to(L5_736, {})
	local L6_737 = L6_737
	L6_737 = L6_737(L52_52, L53_53, "warbux_icon.png")
	utils.parentWidget(L6_737, A0_731)
	local L7_738, L8_739 = L7_738, L8_739
	L7_738, L8_739 = L7_738(L8_739, 0, 0)
	L7_738, L8_739 = A0_731:contentToLocal(L7_738, L8_739)
	L6_737.x, L6_737.y = L7_738, L8_739
	local L9_740, L10_741 = L9_740, L10_741
	L9_740, L10_741 = L9_740(L10_741, 0, 0)
	L9_740, L10_741 = A0_731:contentToLocal(L9_740, L10_741)
	;({}).time = A3_734
	local ({}).transition, L14_745 = easing.outInQuad, L14_745
	;({}).alpha = 0
	;({}).x = L9_740
	;({}).y = L10_741
	;({}).onComplete = function()
		_ENV.moneyTransition = nil
		if 0 < L4_735 then
			warbux:credit(L4_735)
			updateWarbuxOutput()
			if _ENV.id ~= HOMELAND_COUNTRY_ID then
				L44_44[_ENV] = nil
				_ENV.midland = nil
				_ENV.moneyStartDate = nil
				_ENV.moneyAmount = 0
			else
				_ENV.moneyStartDate = os.time()
				local L2_755 = L2_755
				L2_755.moneyAmount = calculateDailyAmount(activeCampaign)
			end
			L2_755 = saveCampaignStates
			L2_755()
			L2_755 = campaignSettings
			L2_755 = L2_755.save
			L2_755(L2_755)
			L2_755 = settings
			L2_755 = L2_755.save
			L2_755(L2_755)
		end
		L2_755 = A2_733
		if L2_755 then
			L2_755 = A2_733
			L2_755()
		end
	end
	L14_745 = L14_745(L6_737, {})
	A1_732.moneyTransition = L14_745
	L14_745 = display
	L14_745 = L14_745.remove
	L14_745(A1_732.moneyProgressBar)
	L14_745 = display
	L14_745 = L14_745.remove
	L14_745(A1_732.moneyProgressBarFill)
	A1_732.moneyProgressBar = nil
	A1_732.moneyProgressBarFill = nil
	L14_745 = display
	L14_745 = L14_745.remove
	L14_745(A1_732.moneyImage)
	local L12_743 = L12_743
	A1_732.moneyImage = nil
end
function doFactoryCollectionWithAnimation(A0_756, A1_757, A2_758, A3_759)
	local L14_770 = sound.playSound
	L14_770(_ENV.kaching)
	L14_770 = countryHasFactory
	L14_770 = L14_770(A0_756)
	if not L14_770 then
		return
	end
	L14_770 = weaponFactories
	L14_770 = L14_770[tostring(A0_756.factoryType)]
	L14_770 = L14_770.output
	if not weaponTypes[A0_756.factoryType].namePlural then
		local L5_761 = L5_761
		L5_761 = L5_761 .. "s"
	end
	if A3_759 == nil then
		A3_759 = 1500
	end
	local L6_762 = L6_762
	;({}).fontName = "gameplay"
	;({}).text = string.upper("+   " .. tostring(L14_770) .. " " .. L5_761)
	;({}).originX = "CENTER"
	;({}).textFlow = "RIGHT"
	;({}).charBaseLine = "CENTER"
	;({}).showOrigin = false
	L6_762 = L6_762({})
	L6_762.x = A0_756.factoryImage.x
	L6_762.y = A0_756.factoryImage.y
	utils.parentWidget(L6_762, L16_16)
	;({}).time = 250
	;({}).transition = easing.outInQuad
	;({}).xScale = 2
	;({}).yScale = 2
	;({}).onComplete = function()
		local L0_772
		L0_772 = _ENV
		local L1_773 = L1_773
		local L2_774 = L2_774
		;({}).time = A3_759
		local ({}).transition, L4_776 = easing.outInQuad, L4_776
		L4_776.xScale = 0.3
		L4_776.yScale = 0.3
		L4_776.alpha = 0
		function L4_776.onComplete()
			display.remove(_ENV)
			local L1_778 = L1_778
			L1_778 = _ENV
			L1_778.factoryBonusTransition = nil
			L1_778 = A2_758
			if L1_778 then
				L1_778 = A2_758
				L1_778()
			end
		end
		L1_773 = L1_773(L2_774, L4_776)
		L0_772.factoryBonusTransition = L1_773
	end
	A0_756.factoryBonusTransition = transition.to(L6_762, {})
	weaponBalance[A0_756.factoryType].inventory:add(L14_770)
	if A1_757 then
		A0_756.factoryRuns = weaponFactories[tostring(A0_756.factoryType)].maxRuns
	else
		A0_756.factoryRuns = A0_756.factoryRuns + 1
	end
	if A0_756.factoryRuns < weaponFactories[tostring(A0_756.factoryType)].maxRuns then
		L45_45[A0_756] = A0_756
		A0_756.factoryStartDate = os.time()
	else
		getFactoryImage(A0_756)
		L45_45[A0_756] = nil
		if not L12_12 and tutorial.isTutorialComplete("firstFactoryDegrades") then
			local L9_765, L10_766 = L9_765, L10_766
			local L11_767 = L11_767
			local L12_768 = L12_768
			local L13_769 = L13_769
			L11_767(L12_768, L13_769, L10_766, L1_1.maxScale, function()
				showFirstFactoryDegradesTutorial(_ENV)
				local L1_779 = L1_779
			end, 250)
			local L15_771 = L15_771
		end
	end
	L9_765 = saveCampaignStates
	L9_765()
	L9_765 = campaignSettings
	L10_766 = L9_765
	L9_765 = L9_765.save
	L9_765(L10_766)
end
function getMoneyProgress(A0_780, A1_781)
	if A0_780.moneyProgressBar then
		display.remove(A0_780.moneyProgressBar)
	end
	if A0_780.moneyProgressBarFill then
		display.remove(A0_780.moneyProgressBarFill)
	end
	A0_780.moneyProgressBar = utils.newImageFromSpriteSet(_ENV, L53_53, "progressbar_back.png")
	utils.parentWidget(A0_780.moneyProgressBar, L16_16)
	A0_780.moneyProgressBar.x, A0_780.moneyProgressBar.y = A0_780.moneyImage.x, A0_780.moneyImage.y - 40
	if A1_781 then
		A0_780.moneyProgressBarFill = utils.newImageFromSpriteSet(_ENV, L53_53, "progressbar_fill_red.png")
	else
		local L5_785 = utils.newImageFromSpriteSet(_ENV, L53_53, "progressbar_fill_green.png")
		A0_780.moneyProgressBarFill = L5_785
	end
	L5_785 = utils
	L5_785 = L5_785.parentWidget
	L5_785(A0_780.moneyProgressBarFill, L16_16)
	L5_785 = A0_780.moneyProgressBarFill
	L5_785 = L5_785.setReferencePoint
	local L3_783 = L3_783
	L5_785(L3_783, display.CenterLeftReferencePoint)
	local L4_784 = L4_784
	L5_785 = A0_780.moneyProgressBarFill
	L3_783 = A0_780.moneyProgressBarFill
	L4_784 = A0_780.moneyProgressBar
	L4_784 = L4_784.x
	L4_784 = L4_784 - A0_780.moneyProgressBar.width / 2
	L4_784 = L4_784 + 3
	L3_783.y = A0_780.moneyProgressBar.y
	L5_785.x = L4_784
	L5_785 = A0_780.moneyProgressBar
	L5_785 = L5_785.width
	L5_785 = L5_785 - 6
	A0_780.moneyProgressBarFilledWidth = L5_785
end
function updateMoneyProgressBar(A0_786, A1_787, A2_788, A3_789)
	local L4_790
	L4_790 = A0_786.moneyProgressBar
	if L4_790 then
		L4_790 = 0.01
		if A3_789 == nil then
			A3_789 = "warbuxCollection"
		end
		if A2_788 then
			L4_790 = dailies.getMoneyExpiryTimeCompletedAsFraction(A0_786, A1_787, A3_789)
		else
			local L5_791 = L5_791
			local L6_792 = L6_792
			local L7_793 = L7_793
			local L5_791, L8_794 = L5_791(L6_792, L7_793, A3_789), L8_794
			L4_790 = L5_791
		end
		if 0 < L4_790 then
			L5_791 = A0_786.moneyProgressBarFilledWidth
			L6_792 = A0_786.moneyProgressBarFill
			L6_792 = L6_792.width
			L5_791 = L5_791 / L6_792
			L5_791 = L5_791 * L4_790
			L6_792 = A0_786.moneyProgressBarFill
			L6_792.xScale = L5_791
		end
	end
end
function getFactoryProgress(A0_795)
	if A0_795.factoryProgressBar then
		display.remove(A0_795.factoryProgressBar)
	end
	if A0_795.factoryProgressBarFill then
		display.remove(A0_795.factoryProgressBarFill)
	end
	A0_795.factoryProgressBar = utils.newImageFromSpriteSet(_ENV, L53_53, "progressbar_back.png")
	utils.parentWidget(A0_795.factoryProgressBar, L21_21)
	A0_795.factoryProgressBar.x, A0_795.factoryProgressBar.y = A0_795.factoryImage.x - 30, A0_795.factoryImage.y - 70
	local L4_799 = utils.newImageFromSpriteSet(_ENV, L53_53, "progressbar_fill_green.png")
	A0_795.factoryProgressBarFill = L4_799
	L4_799 = utils
	L4_799 = L4_799.parentWidget
	L4_799(A0_795.factoryProgressBarFill, L21_21)
	L4_799 = A0_795.factoryProgressBarFill
	L4_799 = L4_799.setReferencePoint
	local L2_797 = L2_797
	L4_799(L2_797, display.CenterLeftReferencePoint)
	local L3_798 = L3_798
	L4_799 = A0_795.factoryProgressBarFill
	L2_797 = A0_795.factoryProgressBarFill
	L3_798 = A0_795.factoryProgressBar
	L3_798 = L3_798.x
	L3_798 = L3_798 - A0_795.factoryProgressBar.width / 2
	L3_798 = L3_798 + 3
	L2_797.y = A0_795.factoryProgressBar.y
	L4_799.x = L3_798
	L4_799 = A0_795.factoryProgressBar
	L4_799 = L4_799.width
	L4_799 = L4_799 - 6
	A0_795.factoryProgressBarFilledWidth = L4_799
end
function updateFactoryProgressBar(A0_800, A1_801)
	if A0_800.factoryProgressBar and A0_800.factoryProgressBarFill then
		local L2_802 = L2_802
		local L3_803 = L3_803
		local L2_802, L4_804 = L2_802(L3_803, A1_801), L4_804
		if 0 < L2_802 then
			L3_803 = A0_800.factoryProgressBarFilledWidth
			L4_804 = A0_800.factoryProgressBarFill
			L4_804 = L4_804.width
			L3_803 = L3_803 / L4_804
			L3_803 = L3_803 * L2_802
			L4_804 = A0_800.factoryProgressBarFill
			L4_804.xScale = L3_803
		end
	end
end
function drawMonies()
	local L3_808 = os.time
	L3_808 = L3_808()
	L4_809 = pairs
	L5_810 = _ENV
	L4_809, L5_810, _FOR_ = L4_809(L5_810)
	for _FORV_4_, _FORV_5_ in L4_809, L5_810, _FOR_ do
		if not _FORV_5_.midland then
			_FORV_5_.midland = getCountryMidLand(_FORV_5_)
		end
		if _FORV_5_.id == HOMELAND_COUNTRY_ID then
			if dailies.isMoneyPending(_FORV_5_, L3_808, "dailyAllowance") then
				if not _FORV_5_.moneyPendingDrawn then
					getMoneyImage(L2_2.view, _FORV_5_, "money_collection_pending.png", true)
					getMoneyProgress(_FORV_5_, false)
					_FORV_5_.moneyPendingDrawn = true
					_FORV_5_.moneyReadyDrawn = false
					_FORV_5_.moneyExpiredDrawn = false
				end
				updateMoneyProgressBar(_FORV_5_, L3_808, false, "dailyAllowance")
			elseif not _FORV_5_.moneyReadyDrawn then
				getMoneyImage(L2_2.view, _FORV_5_, "money_collection.png", false)
				display.remove(_FORV_5_.moneyProgressBar)
				display.remove(_FORV_5_.moneyProgressBarFill)
				_FORV_5_.moneyProgressBar = nil
				_FORV_5_.moneyProgressBarFill = nil
				_FORV_5_.moneyPendingDrawn = false
				_FORV_5_.moneyReadyDrawn = true
				_FORV_5_.moneyExpiredDrawn = false
			end
		end
	end
end
function drawFactories()
	local L3_819 = os.time
	L3_819 = L3_819()
	L4_820 = pairs
	L5_821 = _ENV
	L4_820, L5_821, L13_829 = L4_820(L5_821)
	for _FORV_4_, _FORV_5_ in L4_820, L5_821, L13_829 do
		if dailies.isFactoryPending(_FORV_5_, L3_819) then
			if not _FORV_5_.factoryProgressBar then
				getFactoryProgress(_FORV_5_)
			end
			updateFactoryProgressBar(_FORV_5_, L3_819)
		elseif dailies.isFactoryReady(_FORV_5_, L3_819) then
			display.remove(_FORV_5_.factoryProgressBar)
			display.remove(_FORV_5_.factoryProgressBarFill)
			_FORV_5_.factoryProgressBar = nil
			_FORV_5_.factoryProgressBarFill = nil
			if L1_1 ~= nil then
				if not tutorial.isTutorialComplete("firstFactoryProduces") then
					local L9_825 = L9_825
					local L10_826 = L10_826
					local L11_827 = L11_827
					local L12_828 = L12_828
					L11_827(L12_828, _FORV_5_.factoryImage.x, _FORV_5_.factoryImage.y, L1_1.maxScale, function()
						showFirstFactoryProducesTutorial(_ENV)
						local L1_831 = L1_831
					end, 250)
					local L14_830 = L14_830
				end
				L9_825 = _ENV
				L9_825[_FORV_5_] = nil
			end
		end
	end
end
function mapEnterFrame()
	drawMonies()
	drawFactories()
end
L7_7:addEventListener("createScene", L7_7)
L7_7:addEventListener("enterScene", L7_7)
L7_7:addEventListener("exitScene", L7_7)
local L68_68 = L68_68
local L69_69 = L69_69
L7_7:addEventListener("destroyScene", L7_7)
local L70_70 = L70_70
return L7_7
