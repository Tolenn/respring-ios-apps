local L1_1, L2_2 = storyboard.newScene, L2_2
L1_1 = L1_1()
L2_2 = {}
L2_2.select = "res/sounds/weapon_select.mp3"
function L1_1.createScene(A0_7, A1_8)
	local L2_9 = L2_9
	L2_9 = L2_9("tankAvatar")
	tankAvatar = L2_9
	L2_9 = A0_7.view
	local L3_10 = L3_10
	;({}).group = L2_9
	;({}).title = "TANK DEPOT"
	;({}).showBottomBar = false
	;({}).onClose = function()
		sound.playSound(sound.globalSounds.button)
		storyboard.gotoScene("campaignMapScene")
		storyboard.removeScene("tanks.tankDepot")
		local L1_19 = L1_19
	end
	L3_10 = L3_10({})
	local L4_11 = display.newGroup()
	L2_9:insert(L4_11)
	L4_11.x, L4_11.y = screenX + screenWidth / 2, display.contentHeight / 2
	local L5_12 = L5_12
	;({}).image = "res/ui/tankshop/mygarage_img.png"
	;({}).imageWidth = 207
	;({}).imageHeight = 313
	;({}).text = "MY GARAGE"
	;({}).onClick = function()
		sound.playSound(sound.globalSounds.button)
		storyboard.gotoScene("tanks.tankGarage")
		storyboard.removeScene("tanks.tankDepot")
		local L1_20 = L1_20
	end
	L5_12 = L5_12({})
	L4_11:insert(L5_12)
	L5_12.x, L5_12.y = -250, 30
	local L6_13 = L6_13
	;({}).image = "res/ui/tankshop/tankshop_img.png"
	;({}).imageWidth = 195
	;({}).imageHeight = 297
	;({}).text = "TANK SHOP"
	;({}).onClick = function()
		sound.playSound(sound.globalSounds.button)
		storyboard.gotoScene("tanks.tankShop")
		storyboard.removeScene("tanks.tankDepot")
		local L1_21 = L1_21
	end
	L6_13 = L6_13({})
	L4_11:insert(L6_13)
	L6_13.x, L6_13.y = 0, L5_12.y
	if CUSTOM_OVERRIDES.ALLOW_TANK_UPGRADES then
		({}).image = "res/ui/tankshop/upgrades_img.png"
		;({}).imageWidth = 195
		;({}).imageHeight = 297
		;({}).text = "UPGRADES"
		;({}).onClick = function()
			sound.playSound(sound.globalSounds.button)
			storyboard.gotoScene("tanks.tankUpgradeShop")
			storyboard.removeScene("tanks.tankDepot")
			local L1_22 = L1_22
		end
		L4_11:insert((_ENV({})))
		_ENV({}).x, _ENV({}).y = 250, L5_12.y
	else
		local L7_14 = L7_14
		;({}).image = "res/ui/tankshop/upgrades_img.png"
		;({}).imageWidth = 195
		;({}).imageHeight = 297
		;({}).text = "UPGRADES"
		;({}).normalTopColor = utils.pack(LITTLE_GENERALS_LIGHT_GREY())
		;({}).normalBottomColor = utils.pack(LITTLE_GENERALS_MED_GREY())
		;({}).normalBorderColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		;({}).normalTextShadowColor = utils.pack(LITTLE_GENERALS_DARK_GREY())
		L7_14 = L7_14({})
		L4_11:insert(L7_14)
		L7_14.x, L7_14.y = 250, L5_12.y
		local L8_15 = L8_15
		L8_15 = L8_15("res/ui/comingsoon.png")
		local L9_16, L10_17 = L9_16, L10_17
		L9_16(L10_17, L8_15)
		local L11_18 = L11_18
		L9_16 = 0
		L8_15.y = 0
		L8_15.x = L9_16
		L9_16 = 1.5
		L8_15.yScale = 1.5
		L8_15.xScale = L9_16
	end
end
function L1_1.enterScene(A0_23, A1_24)
	local L2_25
	L2_25 = A0_23.view
end
function L1_1.exitScene(A0_26, A1_27)
	local L2_28
	L2_28 = A0_26.view
end
function L1_1.destroyScene(A0_29, A1_30)
	local L2_31
	L2_31 = A0_29.view
end
L1_1:addEventListener("createScene", L1_1)
L1_1:addEventListener("enterScene", L1_1)
L1_1:addEventListener("exitScene", L1_1)
local L3_3, L4_4 = L3_3, L4_4
local L5_5 = L5_5
L4_4(L5_5, "destroyScene", L1_1)
local L6_6 = L6_6
return L1_1
