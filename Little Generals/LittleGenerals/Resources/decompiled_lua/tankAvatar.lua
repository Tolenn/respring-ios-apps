local L0_0 = L0_0
L0_0((...), package.seeall)
local L2_1 = L2_1
function L0_0(A0_2)
	if A0_2.tankTransition then
		transition.cancel(A0_2.tankTransition)
		A0_2.tankTransition = nil
	end
	if A0_2.tankAnimationTimer then
		timer.cancel(A0_2.tankAnimationTimer)
		A0_2.tankAnimationTimer = nil
	end
	if A0_2.tankAvatar ~= nil then
		A0_2.tankAvatar.tank_body = nil
		A0_2.tankAvatar.cannon = nil
		A0_2.tankAvatar = nil
	end
	A0_2.rect = nil
	local L1_3 = L1_3
	L1_3(A0_2)
	local L2_4 = L2_4
end
destroy = L0_0
function L0_0(A0_5)
	repeat
		if A0_5.tankAvatar ~= nil then
			math.randomseed(os.time())
			local L1_6 = L1_6
			L1_6 = L1_6(1, 5)
			A0_5.tankAvatar.tank_body:pause()
			if L1_6 == 1 then
				({}).rotation, ({}).time = math.random(-180, -90), math.random(300, 600)
				;({}).onComplete = function()
					_ENV:tankAvatarAnimate()
					local L1_17 = L1_17
				end
				A0_5.tankTransition = transition.to(A0_5.tankAvatar.cannon, {})
			elseif L1_6 == 2 then
				A0_5.tankAvatar.tank_body:prepare("drive" .. A0_5.tankAvatar.tankType)
				A0_5.tankAvatar.tank_body:play()
				if A0_5.tankAvatar.spriteWheelGroup then
					A0_5.wheelTransitions = {}
					_FOR_ = 1
					for _FORV_5_ = _FOR_, _FOR_, _FOR_ do
						({}).time = 1000
						;({}).transition = easing.inOutQuad
						;({}).rotation = 360
						table.insert(A0_5.wheelTransitions, transition.to(A0_5.tankAvatar.spriteWheelGroup[_FORV_5_], {}))
					end
				end
				A0_5.tankAnimationTimer = timer.performWithDelay(1000, function()
					_ENV:tankAvatarAnimate()
					local L1_18 = L1_18
				end)
			else
				if L1_6 == 3 then
					L5_10(A0_5.tankAvatar.tank_body, "reverse" .. A0_5.tankAvatar.tankType)
					L5_10 = A0_5.tankAvatar
					L5_10 = L5_10.tank_body
					L5_10 = L5_10.play
					L5_10(L5_10)
					L5_10 = A0_5.tankAvatar
					L5_10 = L5_10.spriteWheelGroup
					if L5_10 then
						L5_10 = {}
						A0_5.wheelTransitions = L5_10
						L5_10 = 1
						_FOR_ = 1
						for _FORV_5_ = L5_10, _FOR_, _FOR_ do
							local L9_14 = L9_14
							;({}).time = 1000
							local ({}).transition, L11_16 = easing.inOutQuad, L11_16
							;({}).rotation = -360
							L9_14(L11_16, transition.to(A0_5.tankAvatar.spriteWheelGroup[_FORV_5_], {}))
						end
					end
					L5_10 = timer
					L5_10 = L5_10.performWithDelay
					L6_11 = 1000
					function L7_12()
						_ENV:tankAvatarAnimate()
						local L1_19 = L1_19
					end
					L5_10 = L5_10(L6_11, L7_12)
					A0_5.tankAnimationTimer = L5_10
					break -- pseudo-goto
				end
				if L1_6 == 4 then
					L5_10 = timer
					L5_10 = L5_10.performWithDelay
					L6_11 = 1000
					function L7_12()
						_ENV:tankAvatarAnimate()
						local L1_20 = L1_20
					end
					L5_10 = L5_10(L6_11, L7_12)
					A0_5.tankAnimationTimer = L5_10
				elseif L1_6 == 5 then
					L5_10 = A0_5.tankAvatar
					L5_10 = L5_10.cannon
					L6_11 = L5_10
					L5_10 = L5_10.play
					L5_10(L6_11)
					L5_10 = timer
					L5_10 = L5_10.performWithDelay
					L6_11 = 1000
					function L7_12()
						_ENV:tankAvatarAnimate()
						local L1_21 = L1_21
					end
					L5_10 = L5_10(L6_11, L7_12)
					A0_5.tankAnimationTimer = L5_10
				else
					L5_10 = timer
					L5_10 = L5_10.performWithDelay
					L6_11 = 1000
					function L7_12()
						_ENV:tankAvatarAnimate()
						local L1_22 = L1_22
					end
					L5_10 = L5_10(L6_11, L7_12)
					A0_5.tankAnimationTimer = L5_10
				end
			end
		end
	until true
end
tankAvatarAnimate = L0_0
function L0_0()
	local L2_25 = utils.deepcopy
	L3_26 = availableTankTypesInOrder
	L2_25 = L2_25(L3_26)
	L3_26 = #L2_25
	L4_27 = 1
	L5_28 = -1
	for _FORV_4_ = L3_26, L4_27, L5_28 do
		if not tankTypes[L2_25[_FORV_4_]] or tankTypes[L2_25[_FORV_4_]].unlockable and not tankTypes[L2_25[_FORV_4_]].unlockable.unlockState then
			local L7_30 = L7_30
			table.remove(L2_25, _FORV_4_)
			local L8_31 = L8_31
		end
	end
	return L2_25
end
getValidUnlockedTypes = L0_0
function L0_0(A0_32, A1_33)
	local L2_34 = L2_34
	L2_34 = L2_34(A0_32, A1_33)
	local L3_35 = L3_35
	do return L3_35(L2_34) end
	local L4_36 = L4_36
end
randomAvatar = L0_0
function L0_0(A0_37, A1_38)
	L5_42 = math.randomseed
	L5_42(system.getTimer())
	if not A1_38 then
		A1_38 = availableTankTypesInOrder
	end
	if A0_37 then
		L5_42 = utils
		L5_42 = L5_42.deepcopy
		L5_42 = L5_42(A1_38)
		A1_38 = L5_42
		L5_42 = #A1_38
		_FOR_ = -1
		for _FORV_5_ = L5_42, _FOR_, _FOR_ do
			if A1_38[_FORV_5_] == A0_37 then
				table.remove(A1_38, _FORV_5_)
			end
		end
		L5_42 = #A1_38
		if L5_42 == 0 then
			L5_42 = nil
			return L5_42
		end
	end
	L5_42 = math
	L5_42 = L5_42.random
	L6_43 = 1
	L7_44 = #A1_38
	L5_42 = L5_42(L6_43, L7_44)
	L6_43 = A1_38[L5_42]
	return L6_43
end
randomAvatarType = L0_0
function L0_0(A0_46)
	local L1_47 = L1_47
	local L1_47, L2_48 = L1_47(UI_SPRITE_SHEET)
	local L3_49 = display.newGroup()
	L3_49.destroy = destroy
	L3_49.tankAvatarAnimate = tankAvatarAnimate
	L3_49.tankType = A0_46
	local L4_50 = L4_50
	L4_50 = L4_50(L1_47, L2_48, "frame.png")
	L4_50.xScale, L4_50.yScale = -0.625, 0.625
	utils.parentWidget(L4_50, L3_49)
	L3_49.rect = L4_50
	L3_49.tankAvatar = getTankSpriteGroup(A0_46)
	L3_49.tankAvatar.adjustToAngle = Tank.adjustToAngle
	L3_49.tankAvatar:adjustToAngle(-45)
	L3_49.tankAvatar.y = L3_49.rect.contentHeight / 2 - 35
	local L5_51 = L5_51
	local L6_52 = L6_52
	L5_51(L6_52, L3_49)
	L5_51 = timer
	L5_51 = L5_51.performWithDelay
	L6_52 = 1500
	local L7_53, L8_54 = L3_49:tankAvatarAnimate()
	L5_51 = L5_51(L6_52, L7_53, L8_54)
	L3_49.tankAnimationTimer = L5_51
	return L3_49
end
getTankAvatar = L0_0
function L0_0()
	local L0_55 = L0_55
	L0_55 = L0_55(settings, "playerTankAvatar")
	local L1_56 = getValidUnlockedTypes()
	local L2_57 = L2_57
	L2_57 = L2_57(L0_55, L1_56)
	if L0_55 ~= L2_57 then
		local L5_60 = L5_60
		L5_60(settings, "playerTankAvatar", L2_57)
		local L6_61 = L6_61
		L5_60 = settings
		L6_61 = L5_60
		L5_60 = L5_60.save
		L5_60(L6_61)
	end
	return L2_57
end
getPlayerAvatarType = L0_0
function L0_0()
	local L0_62 = getPlayerAvatarType()
	local L1_63 = L1_63
	do return L1_63(L0_62) end
	local L2_64 = L2_64
end
playerAvatar = L0_0
function L0_0(A0_65, A1_66)
	if not A1_66 then
		A1_66 = availableTankTypesInOrder
	end
	L5_70 = 1
	_FOR_ = 1
	for _FORV_5_ = L5_70, _FOR_, _FOR_ do
		if A0_65 == A1_66[_FORV_5_] then
			return A0_65
		end
	end
	L5_70 = randomAvatarType
	L6_71 = nil
	do return L5_70(L6_71, A1_66) end
	local L4_69 = L4_69
end
validateAvatarType = L0_0
function L0_0(A0_72)
	local L1_73, L2_74, L3_75, L4_76, L5_77
	L1_73 = {}
	L2_74 = 1
	L3_75 = availableTankTypesInOrder
	L3_75 = #L3_75
	L4_76 = 1
	for L5_77 = L2_74, L3_75, L4_76 do
		if tankTypes[availableTankTypesInOrder[L5_77]].tankModel == A0_72 then
			local L6_78 = L6_78
			local L7_79 = L7_79
			L6_78(L7_79, availableTankTypesInOrder[L5_77])
			local L8_80 = L8_80
		end
	end
	return L1_73
end
getTanksForModel = L0_0
function L0_0(A0_81, A1_82)
	if A0_81 then
		local L2_83 = L2_83
		local L2_83, L3_84 = L2_83(A0_81), L3_84
		if L2_83 == "number" then
			L2_83 = nil
			L3_84 = tankTypes
			L3_84 = L3_84[A1_82]
			L3_84 = L3_84.tankModel
			if L3_84 and #getTanksForModel(L3_84) <= 1 then
				L2_83 = L3_84
			end
			local L4_85 = L4_85
			L4_85 = L4_85(A0_81)
			local L5_86 = L5_86
			local L5_86, L6_87 = L5_86(L4_85.AI_TANK_MODEL_FREQUENCIES), L6_87
			L6_87 = L4_85.AI_TANK_MODEL_FREQUENCIES
			if L6_87 then
				L6_87 = 0
				_FOR_, _FOR_, _FOR_ = pairs(L5_86)
				for _FORV_10_, _FORV_11_ in _FOR_, _FOR_, _FOR_ do
					if not L2_83 or tankModels[_FORV_10_] ~= L2_83 then
						L6_87 = L6_87 + _FORV_11_
					else
						print(_FORV_10_, "is not permitted...player is using only tanktype using that model")
						L5_86[_FORV_10_] = nil
					end
				end
				if 0 < L6_87 then
					local L7_88 = L7_88
					local L8_89 = L8_89
					local L7_88, L9_90 = L7_88(L8_89, L6_87), L9_90
					L8_89 = 0
					L9_90 = nil
					L10_91, _FOR_, _FOR_ = L10_91(L5_86)
					for _FORV_13_, _FORV_14_ in L10_91, _FOR_, _FOR_ do
						L8_89 = L8_89 + _FORV_14_
						if L7_88 <= L8_89 then
							L9_90 = _FORV_13_
							break
						end
					end
					if L9_90 ~= nil then
						L10_91 = tankModels
						L10_91 = L10_91[L9_90]
						if L10_91 and tankModels[L10_91] then
							local L11_92 = L11_92
							L11_92 = L11_92(L10_91)
							if L11_92 and 0 < #L11_92 then
								local L12_93 = L12_93
								local L13_94 = L13_94
								do return L12_93(L13_94, L11_92) end
								local L14_95 = L14_95
							end
						end
					end
				end
			end
		end
	end
	L2_83 = nil
	return L2_83
end
getARandomOpponentBasedOnPlayerKills = L0_0
function L0_0(A0_96)
	local L3_98 = L3_98
	L3_98(settings, "playerTankAvatar", A0_96)
	local L4_99 = L4_99
	L3_98 = settings
	L4_99 = L3_98
	L3_98 = L3_98.save
	L3_98(L4_99)
end
setPlayerTankType = L0_0
