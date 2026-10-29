-- Decompiled & AI-Repaired from missionsScene.lu
-- Source disassembly preserved at: disasm/missionsScene.disasm

local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13 = storyboard.newScene, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13
L1_1 = L1_1()
L2_2 = 100
L3_3 = nil
L4_4 = nil
L5_5 = nil
L6_6 = nil
L7_7 = nil
L8_8 = nil
function L9_9(A0_18, A1_19, A2_20)
	local L3_21 = display.newGroup()
	local L4_22 = L4_22
	L4_22 = L4_22(L3_21, A1_19, 0, 0, "SingleSleeve", 30)
	L4_22:setReferencePoint(display.CenterLeftReferencePoint)
	L4_22:setTextColor(LITTLE_GENERALS_BROWN_DARK())
	L4_22.x = -300
	local L5_23 = L5_23
	local L9_27 = L9_27
	local L10_28 = L10_28
	local L5_23, L11_29 = L5_23(L9_27, L10_28, 0, 0, "SingleSleeve", 30), L11_29
	L10_28 = L5_23
	L9_27 = L5_23.setReferencePoint
	L11_29 = display
	L11_29 = L11_29.CenterLeftReferencePoint
	L9_27(L10_28, L11_29)
	L10_28 = L5_23
	L9_27 = L5_23.setTextColor
	L11_29 = LITTLE_GENERALS_BROWN_DARK
	L11_29 = L11_29()
	L9_27(L10_28, L11_29, L11_29())
	L5_23.x = 0
	L10_28 = L3_21
	L9_27 = L3_21.setReferencePoint
	L11_29 = display
	L11_29 = L11_29.TopLeftReferencePoint
	L9_27(L10_28, L11_29)
	L9_27 = 0
	L10_28 = A0_18.contentHeight
	L3_21.y = L10_28
	L3_21.x = L9_27
	L10_28 = A0_18
	L9_27 = A0_18.insert
	L11_29 = L3_21
	L9_27(L10_28, L11_29)
	return L3_21
end
function L10_10(A0_30, A1_31)
	local L2_32
	L2_32 = 250
	local L3_33 = display.newGroup()
	local L4_34 = L4_34
	local L8_38 = L8_38
	local L9_39 = L9_39
	local L4_34, L10_40 = L4_34(L8_38, L9_39, 0, 0, "SingleSleeve", 40), L10_40
	L9_39 = L4_34
	L8_38 = L4_34.setTextColor
	L10_40 = LITTLE_GENERALS_BROWN_DARK
	L10_40 = L10_40()
	L8_38(L9_39, L10_40, L10_40())
	L9_39 = L3_33
	L8_38 = L3_33.setReferencePoint
	L10_40 = display
	L10_40 = L10_40.TopCenterReferencePoint
	L8_38(L9_39, L10_40)
	L8_38 = L2_32
	L9_39 = A0_30.contentHeight
	L3_33.y = L9_39
	L3_33.x = L8_38
	L9_39 = A0_30
	L8_38 = A0_30.insert
	L10_40 = L3_33
	L8_38(L9_39, L10_40)
	return L3_33
end
function L11_11()
	local L4_45 = display.newGroup
	L4_45 = L4_45()
	local L1_42 = L1_42
	local L2_43 = L2_43
	local L1_42, L3_44 = L1_42(L2_43, "Current Campaign"), L3_44
	L2_43 = 0
	L3_44 = activeCampaign
	L3_44 = L3_44.wins
	if L3_44 then
		L3_44 = activeCampaign
		L2_43 = L3_44.wins
	end
	L3_44 = 0
	if activeCampaign.losses then
		L3_44 = activeCampaign.losses
	end
	if 0 < L2_43 + L3_44 then
	end
	local L5_46 = L5_46
	local L6_47 = L6_47
	L6_47 = L6_47(L4_45, "Wins/Losses:", L2_43 .. " / " .. L3_44 .. " (" .. L5_46 .. "%)")
	if not activeCampaign.totalShots then
	end
	local L7_48 = L7_48
	local L8_49 = L8_49
	local L9_50 = L9_50
	L8_49 = L8_49(L9_50, "Total Shots:", L7_48)
	L9_50 = activeCampaign
	L9_50 = L9_50.totalHits
	if not L9_50 then
		L9_50 = 0
	end
	if 0 < L7_48 then
	end
	local L10_51 = L10_51
	local L11_52 = L11_52
	local L12_53 = L12_53
	L11_52 = L11_52(L12_53, "Total Hits:", L9_50 .. " (" .. L10_51 .. "%)")
	L12_53 = nil
	if activeCampaign.totalWeaponShots then
		_FOR_, _FOR_, _FOR_ = pairs(activeCampaign.totalWeaponShots)
		for _FORV_16_, _FORV_17_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_17_ > 0 then
				L12_53 = _FORV_16_:gsub("weaponType_", "")
			end
		end
	end
	if L12_53 then
		local L13_54 = L13_54
		local L14_55 = L14_55
		L14_55 = L14_55(L4_45, "Favourite Weapon:", weaponTypes[tonumber(L12_53)].name)
	end
	L14_55 = nil
	if activeCampaign.totalWeaponHits then
		_FOR_, _FOR_, _FOR_ = pairs(activeCampaign.totalWeaponHits)
		for _FORV_18_, _FORV_19_ in _FOR_, _FOR_, _FOR_ do
			if _FORV_19_ > 0 then
				L14_55 = _FORV_18_:gsub("weaponType_", "")
			end
		end
	end
	if L14_55 then
	end
	local L15_56 = L15_56
	local L16_57 = L16_57
	L16_57 = L16_57(L4_45, "Overall")
	if activeCampaign.previousCampaigns then
	end
	local L17_58 = L17_58
	local L18_59 = L18_59
	L18_59 = L18_59(L19_60, "Campaigns Completed:", L17_58)
	if 0 < L17_58 then
		L19_60 = 1
		_FOR_ = 1
		for _FORV_21_ = L19_60, _FOR_, _FOR_ do
			L2_43 = L2_43 + activeCampaign.previousCampaigns[_FORV_21_].wins
			L3_44 = L3_44 + activeCampaign.previousCampaigns[_FORV_21_].losses
			L9_50 = L9_50 + activeCampaign.previousCampaigns[_FORV_21_].totalHits
			L7_48 = L7_48 + activeCampaign.previousCampaigns[_FORV_21_].totalShots
		end
		L19_60 = 0
		if 0 < L2_43 + L3_44 then
			L19_60 = L2_43 / (L2_43 + L3_44)
		end
		if 0 < L7_48 then
		end
		local L20_61 = L20_61
		local L21_62 = L21_62
		local L22_63 = L22_63
		local L23_64 = L23_64
		local L24_65 = L24_65
		local L26_67 = L26_67
		local L27_68 = L27_68
		local L27_68, L28_69 = L27_68 .. " (" .. L20_61 .. "%)", L28_69
		L23_64 = L23_64(L24_65, L26_67, L27_68)
	end
	return L4_45
end
function L12_12(A0_70, A1_71)
	local L4_74 = spritesheetmanager.getSpriteSet
	local L4_74, L3_73 = L4_74(UI_SPRITE_SHEET)
	settings:set("missionsSeen", true)
	settings:save()
	local L5_75 = L5_75
	;({}).group = L5_75
	;({}).title = "MISSIONS"
	;({}).showBottomBar = false
	;({}).onClose = function()
		storyboard.gotoScene("campaignMapScene")
		storyboard.removeScene("missionsScene")
		local L1_99 = L1_99
	end
	local L6_76 = L6_76
	;({}).buttonText = "STATISTICS"
	

-- [End of decompiled block; see disassembly for inner stripped closures]
