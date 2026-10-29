local L0_0
L0_0 = (...)
local L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24 = "250", L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24
CURRENT_VERSION = L17_17
L17_17 = "2.5.0"
CURRENT_VERSION_FOR_DISPLAY = L17_17
L17_17 = "res/ui/newui.png"
UI_SPRITE_SHEET = L17_17
L17_17 = display
L17_17 = L17_17.screenOriginX
screenX = L17_17
L17_17 = display
L17_17 = L17_17.contentWidth
L18_18 = display
L18_18 = L18_18.screenOriginX
L18_18 = L18_18 * 2
L17_17 = L17_17 - L18_18
screenWidth = L17_17
L17_17 = screenX
L18_18 = screenWidth
L18_18 = L18_18 / 2
L17_17 = L17_17 + L18_18
screenCenterX = L17_17
L17_17 = display
L17_17 = L17_17.screenOriginY
screenY = L17_17
L17_17 = display
L17_17 = L17_17.contentHeight
L18_18 = display
L18_18 = L18_18.screenOriginY
L18_18 = L18_18 * 2
L17_17 = L17_17 - L18_18
screenHeight = L17_17
L17_17 = screenY
L18_18 = screenHeight
L18_18 = L18_18 / 2
L17_17 = L17_17 + L18_18
screenCenterY = L17_17
L17_17 = require
L18_18 = "storyboard"
L17_17 = L17_17(L18_18)
storyboard = L17_17
L17_17 = storyboard
L17_17.disableAutoPurge = true
L17_17 = storyboard
L17_17 = L17_17.gotoScene
L18_18 = storyboard
function L19_19(A0_25, A1_26)
	repeat
		if type(A1_26) == "table" then
			do return _ENV(A0_25, A1_26) end
			local L4_28 = L4_28
			break -- pseudo-goto
		end
		L4_28 = _ENV
		return L4_28(A0_25)
	until true
end
L18_18.gotoScene = L19_19
L18_18 = require
L19_19 = "utils"
L18_18(L19_19)
L18_18 = {}
CUSTOM_OVERRIDES = L18_18
L18_18 = pcall
L19_19 = require
L20_20 = "customOverrides"
L18_18(L19_19, L20_20)
L18_18 = require
L19_19 = "settings"
L18_18 = L18_18(L19_19)
L18_18 = L18_18.new
L19_19 = "settings.json"
L18_18 = L18_18(L19_19)
settings = L18_18
L18_18 = settings
L19_19 = L18_18
L18_18 = L18_18.load
L18_18(L19_19)
L18_18 = require
L19_19 = "push"
L18_18 = L18_18(L19_19)
L19_19 = L18_18.init
L19_19()
L19_19 = io
L19_19 = L19_19.output
L19_19 = L19_19()
L20_20 = L19_19
L19_19 = L19_19.setvbuf
L21_21 = "line"
L19_19(L20_20, L21_21)
L19_19 = display
L19_19 = L19_19.setStatusBar
L20_20 = display
L20_20 = L20_20.HiddenStatusBar
L19_19(L20_20)
L19_19 = require
L20_20 = "spritesheetmanager"
L19_19(L20_20)
L19_19 = require
L20_20 = "sprite"
L19_19(L20_20)
L19_19 = {}
L19_19.SINGLEPLAYER = false
L19_19.MULTIPLAYER = true
ALLOW_WIND = L19_19
L19_19 = CUSTOM_OVERRIDES
L19_19 = L19_19.MP_WIND
if L19_19 ~= nil then
	L19_19 = ALLOW_WIND
	L20_20 = CUSTOM_OVERRIDES
	L20_20 = L20_20.MP_WIND
	L19_19.MULTIPLAYER = L20_20
end
L19_19 = CUSTOM_OVERRIDES
L19_19 = L19_19.SP_WIND
if L19_19 ~= nil then
	L19_19 = ALLOW_WIND
	L20_20 = CUSTOM_OVERRIDES
	L20_20 = L20_20.SP_WIND
	L19_19.SINGLEPLAYER = L20_20
end
L19_19 = true
LOW_RES_PHYSICS_MODE = L19_19
L19_19 = {}
ROCKINFO = L19_19
L19_19 = 0.125
MULTIPLAYER_MINIMUM_ROCK_SIZE = L19_19
L19_19 = MULTIPLAYER_MINIMUM_ROCK_SIZE
MINIMUM_ROCK_SIZE = L19_19
L19_19 = utils
L19_19 = L19_19.highQuality
if L19_19 then
	L19_19 = 0.0625
	MINIMUM_ROCK_SIZE = L19_19
end
L19_19 = ROCKINFO
L20_20 = MINIMUM_ROCK_SIZE
L19_19.MINIMUM_ROCK_SIZE = L20_20
L19_19 = 320
MAXIMUM_ROCK_SIZE = L19_19
L19_19 = 395
MAXIMUM_ROCK_SIZE_IN_PIXELS = L19_19
L19_19 = false
DAILY_UPDATE_PER_MINUTE = L19_19
L19_19 = "29a423c87e995e2899ec9cc339d53f4908a6b8bc3af007ee698a21cfc6c7d238c5534ea1d468242e177030b4c271dc748a38da5ad915320dd68dd452f4a1ecc3"
REMOTE_SIGNING_KEY = L19_19
L19_19 = 0
BATTLES_THIS_SESSION = L19_19
function L19_19()
	local L0_29, L1_30, L2_31
	L0_29 = 160
	L1_30 = 109
	L2_31 = 65
	return L0_29, L1_30, L2_31
end
LITTLE_GENERALS_BROWN = L19_19
function L19_19()
	local L0_32, L1_33, L2_34
	L0_32 = 96
	L1_33 = 65
	L2_34 = 27
	return L0_32, L1_33, L2_34
end
LITTLE_GENERALS_BROWN_DARK = L19_19
function L19_19()
	local L0_35, L1_36, L2_37
	L0_35 = 249
	L1_36 = 237
	L2_37 = 219
	return L0_35, L1_36, L2_37
end
LITTLE_GENERALS_BACKGROUND_LIGHT = L19_19
function L19_19()
	local L0_38, L1_39, L2_40
	L0_38 = 253
	L1_39 = 208
	L2_40 = 152
	return L0_38, L1_39, L2_40
end
LITTLE_GENERALS_BACKGROUND_NORMAL = L19_19
function L19_19()
	local L0_41, L1_42, L2_43
	L0_41 = 212
	L1_42 = 199
	L2_43 = 180
	return L0_41, L1_42, L2_43
end
LITTLE_GENERALS_BACKGROUND_DARK = L19_19
function L19_19()
	local L0_44, L1_45, L2_46
	L0_44 = 174
	L1_45 = 175
	L2_46 = 170
	return L0_44, L1_45, L2_46
end
LITTLE_GENERALS_LIGHT_GREY = L19_19
function L19_19()
	local L0_47, L1_48, L2_49
	L0_47 = 146
	L1_48 = 147
	L2_49 = 142
	return L0_47, L1_48, L2_49
end
LITTLE_GENERALS_MED_GREY = L19_19
function L19_19()
	local L0_50, L1_51, L2_52
	L0_50 = 56
	L1_51 = 56
	L2_52 = 56
	return L0_50, L1_51, L2_52
end
LITTLE_GENERALS_DARK_GREY = L19_19
function L19_19()
	local L0_53, L1_54, L2_55
	L0_53 = 243
	L1_54 = 238
	L2_55 = 218
	return L0_53, L1_54, L2_55
end
LITTLE_GENERALS_OFF_WHITE = L19_19
function L19_19()
	local L0_56, L1_57, L2_58
	L0_56 = 33
	L1_57 = 52
	L2_58 = 104
	return L0_56, L1_57, L2_58
end
LITTLE_GENERALS_BLUE_DARK = L19_19
function L19_19()
	local L0_59, L1_60, L2_61
	L0_59 = 66
	L1_60 = 114
	L2_61 = 182
	return L0_59, L1_60, L2_61
end
LITTLE_GENERALS_BLUE_MED = L19_19
function L19_19()
	local L0_62, L1_63, L2_64
	L0_62 = 139
	L1_63 = 175
	L2_64 = 220
	return L0_62, L1_63, L2_64
end
LITTLE_GENERALS_BLUE_LIGHT = L19_19
L19_19 = "http://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=494401069"
ITUNES_RATE_URL = L19_19
L19_19 = "https://play.google.com/store/apps/details?id=com.smarterapps.littlegenerals"
GPLAY_RATE_URL = L19_19
L19_19 = "http://www.little-generals.com/app.html"
EXTERNAL_STORE_URL = L19_19
L19_19 = {}
activeCampaign = L19_19
L19_19 = {}
activeCountry = L19_19
function L19_19()
	local L0_65
	L0_65 = {}
	local L7_72 = "inventory.json"
	L0_65[1] = L7_72
	L0_65[2] = "campaignData.json"
	L0_65[3] = "missionData.json"
	L0_65[4] = "tombstone.json"
	L0_65[5] = "mp.json"
	L7_72 = tonumber
	local L2_67, L3_68 = L2_67, L3_68
	L2_67, L3_68 = L2_67(L3_68, "dataVersion", "100")
	L7_72 = L7_72(L2_67, L3_68, L2_67(L3_68, "dataVersion", "100"))
	function L2_67(A0_76)
		print(string.format("Invalid save file %s. Resetting: ", settings.fileName), A0_76)
		local L3_78 = L3_78
		L3_78(settings, "isCheater", true)
		local L4_79 = L4_79
		L3_78 = settings
		L4_79 = L3_78
		L3_78 = L3_78.save
		L3_78(L4_79)
	end
	function L3_68(A0_80)
		local L1_81
		L1_81 = system
		L1_81 = L1_81.DocumentsDirectory
		local L2_82 = L2_82
		local L3_83 = L3_83
		L2_82 = L2_82(L3_83, L1_81)
		L3_83 = false
		local L4_84 = L4_84
		L4_84 = L4_84(L2_82, "r")
		if L4_84 then
			local L5_85 = L5_85
			L5_85(L4_84)
			local L6_86 = L6_86
			L3_83 = true
		end
		return L3_83
	end
	if not L7_72 then
		L2_67(1)
		return
	end
	if 200 <= L7_72 then
		if not settings:hasValidHmac() then
			L2_67(2)
			return
		end
		_FOR_ = 1
		for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
			if require("settings").new(L0_65[_FORV_7_]):load() and not require("settings").new(L0_65[_FORV_7_]):hasValidHmac() then
				L2_67(L0_65[_FORV_7_])
				return
			end
		end
	end
	if L7_72 < 200 then
		_FOR_ = 1
		for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
			if L3_68(L0_65[_FORV_7_] .. ".hmac") then
				L2_67(L0_65[_FORV_7_] .. ".hmac")
				return
			end
		end
		L6_71 = print
		L6_71("Migrating data files.")
		L6_71 = 1
		L5_70 = #L0_65
		_FOR_ = 1
		for _FORV_7_ = L6_71, L5_70, _FOR_ do
			if require("settings").new(L0_65[_FORV_7_]):load() then
				require("settings").new(L0_65[_FORV_7_]).dirty = true
				require("settings").new(L0_65[_FORV_7_]):save()
				local L10_75 = L10_75
			end
		end
	end
end
validateSettings = L19_19
L19_19 = {}
L20_20 = false
L21_21 = {}
function L22_22()
	settings = require("settings").new("settings.json")
	if settings:load() then
		validateSettings()
		settings:set("dataVersion", CURRENT_VERSION)
		if not settings:get("lastVersionAcknowledged") then
			settings:set("lastVersionAcknowledged", "100")
		end
		settings:save()
	else
		settings:set("lastVersionAcknowledged", CURRENT_VERSION)
		settings:set("dataVersion", CURRENT_VERSION)
		settings:save()
	end
	SCREENFLOW_RECORDING = settings:get("screenflow_recording", false)
	local L1_87, L2_88 = L1_87, L2_88
	local L3_89 = L3_89
	local L2_88, L4_90 = L2_88(L3_89, "allow_reminders", true), L4_90
	REMINDERS_ENABLED = L2_88
end
function L23_23()
	local L0_91 = L0_91
	L0_91 = L0_91("push")
	print("launch args", _ENV)
	if _ENV then
		if _ENV.notification then
			if L0_91.parseActionString(_ENV.notification.action) then
				table.insert(L3_3, (L0_91.parseActionString(_ENV.notification.action)))
			end
		elseif _ENV.url and string.len(_ENV.url) > 0 then
			print("URL", _ENV.url)
			local L1_92 = L1_92
			L1_92 = L1_92("socket.url")
			local L2_93 = L2_93
			L2_93 = L2_93(_ENV.url)
			local L3_94 = L3_94
			L3_94(L2_93)
			L3_94 = print
			local L4_95 = L4_95
			local L4_95, L5_96 = L4_95(L2_93.fragment)
			L3_94(L4_95, L5_96)
			L3_94 = true
			L4_4 = L3_94
		end
	end
end
function L24_24()
	local L1_97 = require("sound")
	sound = L1_97
	L1_97 = sound
	L1_97 = L1_97.initialize
	L1_97()
end
L21_21[1] = L22_22
L21_21[2] = L23_23
L21_21[3] = L24_24
L21_21[4] = function()
	campaignSettings = require("settings").new("campaignData.json")
	campaignSettings:load()
	local L1_98 = L1_98
end
L21_21[5] = function()
	TextCandy = require("lib_text_candy")
	FONT_NAME = "SingleSleeve"
	TextCandy.AddVectorFont(FONT_NAME, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'*@():,$.!-%+?;#/_=", 54)
	TextCandy:EnableDebug(false)
	TextCandy.AddCharset("header", "res.fonts.font_large", "res/fonts/font_large.png", "!#$&'()+0123456789=ABCDEFGHIJKLMNOPQRSTUVWXYZ_:,-*./", 10, 0, 0)
	TextCandy.AddCharset("normal", "res.fonts.font_large", "res/fonts/font_large.png", "!#$&'()+0123456789=ABCDEFGHIJKLMNOPQRSTUVWXYZ_:,-*./", 10, 0, 0)
	TextCandy.AddCharset("button-regular", "res.fonts.font_brown", "res/fonts/font_brown.png", "!$ABCDEFGHIJKLMNOPQRSTUVWXYZ", 6, 0, 0)
	TextCandy.AddCharset("button-pressed", "res.fonts.font_blue", "res/fonts/font_blue.png", "!$ABCDEFGHIJKLMNOPQRSTUVWXYZ", 6, 0, 0)
	local L1_99 = L1_99
	local L2_100 = L2_100
	local L3_101 = L3_101
	local L4_102 = L4_102
	local L5_103 = L5_103
	local L6_104 = L6_104
	L1_99(L2_100, L3_101, L4_102, L5_103, L6_104, 0, 0)
	local L7_105 = L7_105
end
L21_21[6] = function()
	require("physics")
	physics.setTimeStep(0)
	physics.setVelocityIterations(2)
	physics.setPositionIterations(4)
	if LOW_RES_PHYSICS_MODE then
		physics.setScale(120)
		local L1_106 = L1_106
	end
end
L21_21[7] = function()
	require("campaigns")
	local L1_107 = L1_107
end
L21_21[8] = function()
	require("tutorial")
	local L1_108 = L1_108
end
L21_21[9] = function()
	require("unlockable")
	local L1_109 = L1_109
end
L21_21[10] = function()
	require("iapSetup")
	local L1_110 = L1_110
end
L21_21[11] = function()
	require("weapon")
	local L1_111 = L1_111
end
L21_21[12] = function()
	require("dailies")
	local L1_112 = L1_112
end
L21_21[13] = function()
	loadCampaignStates()
	activeCampaign = campaigns[1]
end
L21_21[14] = function()
	analytics = require("analytics")
	if not analytics then
		print("ANALYTICS NOT ENABLED!")
		return
	end
	analytics.init("T575IFRNW973LA8UGQ7R")
	local L1_113 = L1_113
end
L21_21[15] = function()
	require("achievementList")
	local L1_114 = L1_114
end
L21_21[16] = function()
	require("gamecenterSupport")
	local L1_116 = L1_116
	L1_116 = gamecenterSupport
	L1_116 = L1_116.init
	L1_116(function()
		local L2_119 = L2_119
		local L2_119, L3_120 = L2_119(settings, "isCheater", false), L3_120
		if L2_119 then
			L2_119 = achievementList
			L2_119 = L2_119.updateStatistics
			L3_120 = {}
			L3_120.kills = 0
			L2_119(L3_120)
		end
		L2_119 = require
		L3_120 = "facebookSupport"
		L2_119 = L2_119(L3_120)
		L3_120 = _ENV
		if L3_120 then
			L3_120 = L2_119.init
			L3_120(function()
				local L0_121 = L0_121
				local L1_122 = L1_122
				;({}).force = true
				L0_121(L1_122, {})
				local L2_123 = L2_123
			end)
		end
	end)
end
L21_21[17] = function()
	missions = require("missions")
	missions:loadAllMissionData()
	local L1_124 = L1_124
end
L21_21[18] = function()
	tombstone = require("tombstone")
	tombstone:load()
	local L1_125 = L1_125
end
L21_21[19] = function()
	L3_129 = "push"
	L2_128 = L2_128(L3_129)
	L2_128 = L2_128.register
	L2_128()
	L2_128 = 1
	L3_129 = _ENV
	L3_129 = #L3_129
	L4_130 = 1
	for _FORV_3_ = L2_128, L3_129, L4_130 do
		local L6_132 = L6_132
		require("push").handleNotification(_ENV[_FORV_3_], true)
		local L7_133 = L7_133
	end
end
loadActions = L21_21
L21_21 = storyboard
L21_21 = L21_21.gotoScene
L22_22 = "splashScene"
L21_21(L22_22)
function L21_21(A0_134)
	print("memory warning received!")
	local L2_135 = L2_135
	L2_135 = collectgarbage
	L2_135()
end
L22_22 = Runtime
L23_23 = L22_22
L22_22 = L22_22.addEventListener
L24_24 = "memoryWarning"
L22_22(L23_23, L24_24, L21_21)
function L22_22(A0_136)
	if A0_136.type == "applicationStart" then
		native.setProperty("applicationIconBadgeNumber", 0)
		require("rateUs").popRateDialogIfAppropriate()
		utils.logEvent("AppStart")
	elseif A0_136.type == "applicationExit" then
		utils.logEvent("AppExit")
	elseif A0_136.type == "applicationSuspend" then
	elseif A0_136.type == "applicationResume" then
		native.setProperty("applicationIconBadgeNumber", 0)
		local L3_138 = L3_138
		L3_138 = require
		L3_138 = L3_138("rateUs")
		L3_138 = L3_138.popRateDialogIfAppropriate
		L3_138()
	end
end
L23_23 = Runtime
L24_24 = L23_23
L23_23 = L23_23.addEventListener
L23_23(L24_24, "system", L22_22)
L23_23 = CUSTOM_OVERRIDES
L23_23 = L23_23.IAP_RESTORE_HACK_HACK
if L23_23 then
	L23_23 = display
	L23_23 = L23_23.newRect
	L24_24 = 0
	L23_23 = L23_23(L24_24, 0, 50, 50)
	L24_24 = L23_23.setFillColor
	L24_24(L23_23, 0, 255, 0)
	L24_24 = screenX
	L23_23.y = display.contentHeight
	L23_23.x = L24_24
	L24_24 = L23_23.addEventListener
	L24_24(L23_23, "touch", function(A0_139)
		if A0_139.phase == "ended" then
			nonConsumableContent:restore()
			local L2_140 = L2_140
		end
	end)
end
L23_23 = CUSTOM_OVERRIDES
L23_23 = L23_23.MULTIPLAYER_NOTIFICATION_HACK
if L23_23 then
	L23_23 = display
	L23_23 = L23_23.newRect
	L24_24 = 0
	L23_23 = L23_23(L24_24, 0, 50, 50)
	L24_24 = L23_23.setFillColor
	L24_24(L23_23, 255, 0, 0)
	L24_24 = screenX
	L23_23.y = display.contentHeight
	L23_23.x = L24_24
	L24_24 = L23_23.addEventListener
	local L9_9 = L9_9
	local L10_10 = L10_10
	L24_24(L9_9, L10_10, function(A0_141)
		if A0_141.phase == "ended" then
			local L1_142 = L1_142
			L1_142 = L1_142(screenX, 0, screenWidth, display.contentHeight)
			L1_142:setFillColor(0, 0, 0)
			L1_142.alpha = 0.75
			local L2_143 = L2_143
			L2_143 = L2_143(15, 70, 600, 30)
			if not CUSTOM_OVERRIDES.MULTIPLAYER_TEST_PREFIX then
			end
			L2_143.text = tostring("a" .. "1")
			L2_143.size = 20
			L2_143.isEditable = true
			local L3_144 = L3_144
			L3_144 = L3_144(15, 110, 600, 30)
			local L4_145 = L4_145
			if not CUSTOM_OVERRIDES.MULTIPLAYER_TEST_PREFIX then
			end
			L4_145 = L4_145("a" .. "2")
			L3_144.text = L4_145
			L3_144.size = 20
			L3_144.isEditable = true
			L4_145 = nil
			local L5_146 = L5_146
			L5_146 = L5_146("NOTIFY", L3_144.contentBounds.xMax + 30, L3_144.contentBounds.yMax - 30)
			L5_146:addEventListener("touch", function(A0_152)
				if A0_152.phase == "ended" then
					_ENV:removeSelf()
					print("setting MP id", L2_143.text)
					local L1_153 = L1_153
					local L1_153, L2_154 = L1_153("multiplayer.match"), L2_154
					L2_154 = L2_143
					L2_154 = L2_154.text
					L1_153.id = L2_154
					L1_153 = nil
					L2_154 = nil
					if L2_143.text > L3_144.text then
						L1_153 = L2_143.text
						L2_154 = L3_144.text
					else
						L1_153 = L3_144.text
						L2_154 = L2_143.text
					end
					local L3_155 = L3_155
					L3_155 = L3_155("json")
					L3_155 = L3_155.decode
					local L6_158 = L6_158
					local L7_159 = L7_159
					local L8_160 = L8_160
					L6_158, L7_159, L8_160 = L6_158(L7_159, L8_160, utils.sanitizeId(L2_154))
					L3_155 = L3_155(L6_158, L7_159, L8_160, L6_158(L7_159, L8_160, utils.sanitizeId(L2_154)))
					L6_158 = L2_143
					L7_159 = L6_158
					L6_158 = L6_158.removeSelf
					L6_158(L7_159)
					L6_158 = L3_144
					L7_159 = L6_158
					L6_158 = L6_158.removeSelf
					L6_158(L7_159)
					L6_158 = L5_146
					L7_159 = L6_158
					L6_158 = L6_158.removeSelf
					L6_158(L7_159)
					L6_158 = L4_145
					L7_159 = L6_158
					L6_158 = L6_158.removeSelf
					L6_158(L7_159)
					if L3_155 then
						L6_158 = require
						L7_159 = "push"
						L6_158 = L6_158(L7_159)
						L6_158 = L6_158.handleNotification
						L7_159 = L3_155
						L6_158(L7_159)
					end
					L6_158 = true
					return L6_158
				end
			end)
			L5_146:setTextColor(255, 255, 255)
			L4_145 = display.newText("SWITCH", L3_144.contentBounds.xMax + 30, L3_144.contentBounds.yMax)
			L4_145:addEventListener("touch", function(A0_161)
				local L1_162, L2_163, L3_164
				L1_162 = A0_161.phase
				if L1_162 == "ended" then
					L1_162 = _ENV
					L1_162 = L1_162.text
					L2_163 = _ENV
					L3_164 = L3_144
					L3_164 = L3_164.text
					L2_163.text = L3_164
					L2_163 = L3_144
					L2_163.text = L1_162
					L2_163 = true
					return L2_163
				end
			end)
			local L6_147, L7_148 = L6_147, L7_148
			local L8_149 = L8_149
			local L9_150 = L9_150
			L6_147(L7_148, L8_149, L9_150, 255)
			local L10_151 = L10_151
		end
	end)
end
L23_23 = CUSTOM_OVERRIDES
L23_23 = L23_23.MEM_MONITOR
if L23_23 then
	L23_23 = true
	L24_24 = nil
	memory_text = L24_24
	L24_24 = nil
	memory_text2 = L24_24
	L24_24 = nil
	memory_text3 = L24_24
	function L24_24()
		local L0_165 = L0_165
		local L2_167 = collectgarbage("count")
		L0_165 = L0_165 .. L2_167
		return L0_165
	end
	function L9_9()
		local L0_168 = L0_168
		local L2_170 = system.getInfo("textureMemoryUsed")
		L2_170 = L2_170 / 1000000
		L0_168 = L0_168 .. L2_170
		return L0_168
	end
	function L10_10()
		local L0_171, L1_172
		L0_171 = 0
		L1_172 = 0
		if levelGroup and getScreenRocks and getScreenRocks() and #getScreenRocks() then
			L0_171 = #getScreenRocks()
			_FOR_ = 1
			for _FORV_6_ = _FOR_, _FOR_, _FOR_ do
				local L7_178 = L7_178
				if getScreenRocks()[_FORV_6_] and getScreenRocks()[_FORV_6_].bodyType == "dynamic" then
					L1_172 = L1_172 + 1
				end
			end
		end
		L7_178 = "Rocks:   "
		local L3_174 = L3_174
		local L4_175 = L4_175
		local L5_176 = L5_176
		local L7_178, L6_177 = L7_178 .. L3_174 .. L4_175 .. L5_176 .. ")", L6_177
		return L7_178
	end
	function monitorMemFunc()
		collectgarbage()
		memory_text.text = _ENV()
		memory_text:setReferencePoint(display.CenterLeftReferencePoint)
		memory_text2.text = L9_9()
		memory_text2:setReferencePoint(display.CenterLeftReferencePoint)
		memory_text.x = screenX + 10
		memory_text.y = display.contentHeight / 2 - 100
		memory_text2.x = memory_text.x
		memory_text2.y = memory_text.y + 30
		if L7_7 then
			memory_text3.text = L10_10()
			memory_text3:setReferencePoint(display.CenterLeftReferencePoint)
			memory_text3.x = memory_text.x
			memory_text3.y = memory_text2.y + 30
		end
		local L0_179 = L0_179
		local L1_180 = L1_180
		L0_179(L1_180, monitorMemFunc)
		local L2_181 = L2_181
	end
	memory_text = display.newText("", 0, 0, "SingleSleeve", 26)
	memory_text2 = display.newText("", 0, 0, "SingleSleeve", 26)
	if L23_23 then
		local L14_14 = L14_14
		local L15_15 = L15_15
		local L14_14, L16_16 = L14_14(L15_15, 0, 0, "SingleSleeve", 26), L16_16
		memory_text3 = L14_14
	end
	L14_14 = timer
	L14_14 = L14_14.performWithDelay
	L15_15 = 1000
	L16_16 = monitorMemFunc
	L14_14(L15_15, L16_16)
end
