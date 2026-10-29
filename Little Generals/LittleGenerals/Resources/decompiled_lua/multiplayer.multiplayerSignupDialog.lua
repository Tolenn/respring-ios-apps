-- Decompiled & AI-Repaired from multiplayer.multiplayerSignupDialog.lu
-- Source disassembly preserved at: disasm/multiplayer.multiplayerSignupDialog.disasm

local L0_0
L0_0 = {}
local L4_4, L5_5, L6_6, L7_7 = require, L5_5, L6_6, L7_7
L5_5 = "spritesheetmanager"
L4_4(L5_5)
L4_4 = CUSTOM_OVERRIDES
L4_4 = L4_4.MULTIPLAYER_USERS_ENDPOINT
if not L4_4 then
	L4_4 = "http://users.little-generals.com/"
end
L5_5 = require
L6_6 = "notificationQueue"
L5_5 = L5_5(L6_6)
function L6_6(A0_8)
	local L3_11 = A0_8:match("^[_A-Za-z0-9-.\\+]+@[A-Za-z0-9-\\.]+$")
	if L3_11 then
		L3_11 = true
		return L3_11
	else
		L3_11 = _ENV
		L3_11 = L3_11.add
		;({}).text = "Please enter a valid email"
		;({}).direction = "right"
		;({}).yPos = 240
		L3_11({})
		local L2_10 = L2_10
		L3_11 = false
		return L3_11
	end
end
function L7_7(A0_12)
	local L3_15 = A0_12:match("^[A-Za-z0-9-]+$")
	if L3_15 then
		L3_15 = true
		return L3_15
	else
		L3_15 = _ENV
		L3_15 = L3_15.add
		;({}).text = "A-Z, 0-9, '-' only please"
		;({}).direction = "right"
		;({}).yPos = 240
		L3_15({})
		local L2_14 = L2_14
		L3_15 = false
		return L3_15
	end
end
function L0_0.getSignupDialog()
	local L2_18, L5_21, L6_22 = spritesheetmanager.getSpriteSet, L5_21, L6_22
	L5_21 = UI_SPRITE_SHEET
	L2_18, L5_21 = L2_18(L5_21)
	L6_22 = 500
	if not utils.isIOSDevice() then
		L6_22 = 370
	end
	;({}).title = "SIGN IN"
	;({}).height = L6_22
	

-- [End of decompiled block; see disassembly for inner stripped closures]
