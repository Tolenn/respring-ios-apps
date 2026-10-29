local L0_0, L1_1, L2_2, L3_3
L0_0 = {}
local L1_1, L8_8, L9_9 = nil, L8_8, L9_9
L2_2 = {}
L2_2.STEEL_ARMOR = 1
L2_2.ALUMINIUM_ARMOR = 2
L2_2.IRON_ARMOR = 3
L2_2.TITANIUM_ARMOR = 4
L2_2.URANIUM_ARMOR = 5
L2_2.REACTIVE_ARMOR = 6
L2_2.HEAT_ARMOR = 7
L2_2.NUKE_SYNERGY = 8
L2_2.SCOPE = 9
L2_2.TESLA_COIL = 10
L2_2.SPEED_BOOST = 11
L2_2.FIRE_WEAPON_BOOST = 12
L0_0.tankUpgradeTypes = L2_2
L3_3 = {}
L8_8 = L2_2.STEEL_ARMOR
L9_9 = L2_2.TITANIUM_ARMOR
L3_3[1] = L8_8
L3_3[2] = L9_9
L3_3[3] = L2_2.SCOPE
L3_3[4] = L2_2.SPEED_BOOST
L0_0.availableTankUpgradesInOrder = L3_3
L8_8 = {}
L8_8.DEFENSIVE = 1
L8_8.OFFENSIVE = 2
L8_8.OTHER = 3
L2_2.classes = L8_8
L8_8 = {}
L9_9 = L2_2.classes
L9_9 = L9_9.OFFENSIVE
local L6_6 = L6_6
L8_8[1] = L9_9
L8_8[2] = L6_6
local L8_8[3], L7_7 = L2_2.classes.OTHER, L7_7
L2_2.orderedClasses = L8_8
L8_8 = L2_2.classes
L9_9 = L2_2.classes
L9_9 = L9_9.DEFENSIVE
L6_6 = {}
L6_6.name = "Defensive Upgrade"
L6_6.groupName = "Defensive Upgrades"
L6_6.filterImage = "defensive_filter.png"
L6_6.exclusive = true
L8_8[L9_9] = L6_6
L8_8 = L2_2.classes
L9_9 = L2_2.classes
L9_9 = L9_9.OFFENSIVE
L6_6 = {}
L6_6.name = "Offensive Upgrade"
L6_6.groupName = "Offensive Upgrades"
L6_6.filterImage = "offensive_filter.png"
L6_6.exclusive = false
L8_8[L9_9] = L6_6
L8_8 = L2_2.classes
L9_9 = L2_2.classes
L9_9 = L9_9.OTHER
L6_6 = {}
L6_6.name = "Other Upgrade"
L6_6.groupName = "Other Upgrades"
L6_6.filterImage = "special_filter.png"
L6_6.exclusive = false
L8_8[L9_9] = L6_6
L8_8 = {}
L9_9 = {}
L8_8.saveStateFor = L9_9
function L9_9(A0_15)
	local L1_16 = L1_16
	local L3_18 = tostring(A0_15)
	L1_16 = L1_16 .. L3_18
	return L1_16
end
L6_6 = L2_2.STEEL_ARMOR
L7_7 = {}
L7_7.name = "Steel Plating"
L7_7.shortName = "Steel"
L7_7.desc = "Gives a tank the ability to withstand more damage before being being destroyed."
L7_7.image = "res/tanks/upgrades/steel.png"
L7_7.class = L2_2.classes.DEFENSIVE
L7_7.unlockable = nonConsumableContent.unlockables["com.smarterapps.littlegenerals.upgrades.steelplating"]
L2_2[L6_6] = L7_7
L6_6 = L2_2.TITANIUM_ARMOR
L7_7 = {}
L7_7.name = "Titanium Plating"
L7_7.shortName = "Titanium"
L7_7.desc = "Gives a tank the ability to withstand more damage before being being destroyed."
L7_7.image = "res/tanks/upgrades/titanium.png"
L7_7.class = L2_2.classes.DEFENSIVE
L7_7.unlockable = UnlockableContent:new(L9_9(L2_2.TITANIUM_ARMOR), "Aluminium Armor", WarbuxCost:new(UNLOCKABLE_COSTS.TANK_UPGRADES.TITANIUM_ARMOR))
L2_2[L6_6] = L7_7
L6_6 = L2_2.SCOPE
L7_7 = {}
L7_7.name = "Eagle-Eye Scope"
L7_7.shortName = "E.E. Scope"
L7_7.desc = "Extends the in-battle aimer a little further along the arc. "
L7_7.image = "res/tanks/upgrades/scope.png"
L7_7.isNew = true
L7_7.class = L2_2.classes.OFFENSIVE
L7_7.unlockable = UnlockableContent:new(L9_9(L2_2.SCOPE), "Scope", WarbuxCost:new(UNLOCKABLE_COSTS.TANK_UPGRADES.SCOPE))
L2_2[L6_6] = L7_7
L6_6 = L2_2.SPEED_BOOST
L7_7 = {}
L7_7.name = "Speed Boost"
L7_7.shortName = "Speed Boost"
L7_7.desc = "Gives your tank extra zip so you get where you're going more quickly. Plan war schedules accordingly."
L7_7.image = "res/tanks/upgrades/cleats.png"
L7_7.class = L2_2.classes.OTHER
local L10_10 = L10_10
local L11_11 = L11_11
local L12_12, L13_13 = L12_12, L13_13
local L14_14 = WarbuxCost:new(UNLOCKABLE_COSTS.TANK_UPGRADES.SPEED_BOOST)
L10_10 = L10_10(L11_11, L12_12, L13_13, L14_14, WarbuxCost:new(UNLOCKABLE_COSTS.TANK_UPGRADES.SPEED_BOOST))
L7_7.unlockable = L10_10
L2_2[L6_6] = L7_7
function L6_6(A0_19)
	local L1_20, L2_21, L3_22, L4_23, L5_24
	L1_20 = 1
	L2_21 = _ENV
	L2_21 = #L2_21
	L3_22 = 1
	for L4_23 = L1_20, L2_21, L3_22 do
		L5_24 = _ENV
		L5_24 = L5_24[L4_23]
		if A0_19 == L5_24 then
			L5_24 = true
			return L5_24
		end
	end
	L1_20 = false
	return L1_20
end
L0_0.upgradeTypeIsValid = L6_6
function L7_7(A0_25)
	local L1_26
	L1_26 = {}
	local L6_31 = utils
	L6_31 = L6_31.deepcopy
	L7_32 = _ENV
	L7_32 = L7_32[A0_25]
	L6_31 = L6_31(L7_32)
	L6_31.type = A0_25
	L7_32 = pairs
	L7_32, _FOR_, _FOR_ = L7_32(L4_4)
	for _FORV_6_, _FORV_7_ in L7_32, _FOR_, _FOR_ do
		if L1_26[_FORV_6_] == nil then
			L1_26[_FORV_6_] = _FORV_7_
		end
	end
	L7_32 = pairs
	L8_33 = L6_31
	L7_32, L8_33, _FOR_ = L7_32(L8_33)
	for _FORV_6_, _FORV_7_ in L7_32, L8_33, _FOR_ do
		if L1_26[_FORV_6_] == nil then
			L1_26[_FORV_6_] = _FORV_7_
		end
	end
	return L1_26
end
L0_0.createTankUpgrade = L7_7
function L10_10(A0_34)
	local L1_35
	L1_35 = {}
	local L6_40, L7_41 = _ENV, L7_41
	if not L6_40 then
		L6_40 = require
		L7_41 = "settings"
		L6_40 = L6_40(L7_41)
		L6_40 = L6_40.new
		L7_41 = "upgrades.json"
		L6_40 = L6_40(L7_41)
		_ENV = L6_40
		L6_40 = _ENV
		L7_41 = L6_40
		L6_40 = L6_40.load
		L6_40(L7_41)
	end
	L6_40 = _ENV
	L7_41 = L6_40
	L6_40 = L6_40.get
	L8_42 = "tankTypeUpgrades"
	L13_47 = {}
	L6_40 = L6_40(L7_41, L8_42, L13_47)
	L7_41 = "tankType"
	L8_42 = tostring
	L13_47 = A0_34
	L8_42 = L8_42(L13_47)
	L7_41 = L7_41 .. L8_42
	L7_41 = L6_40[L7_41]
	if L7_41 then
		L7_41 = "tankType"
		L8_42 = tostring
		L13_47 = A0_34
		L8_42 = L8_42(L13_47)
		L7_41 = L7_41 .. L8_42
		L7_41 = L6_40[L7_41]
		L8_42 = 1
		L13_47 = #L7_41
		L14_48 = 1
		for L15_49 = L8_42, L13_47, L14_48 do
			if L7_41[L15_49].type and L6_6(L7_41[L15_49].type) then
				table.insert(L1_35, (L7_7(L7_41[L15_49].type)))
				if L7_7(L7_41[L15_49].type).saveStateFor then
					_FOR_, _FOR_, _FOR_ = pairs(L7_7(L7_41[L15_49].type).saveStateFor)
					for _FORV_13_, _FORV_14_ in _FOR_, _FOR_, _FOR_ do
						L7_7(L7_41[L15_49].type)[_FORV_14_] = L7_41[_FORV_14_]
					end
				end
			end
		end
	end
	return L1_35
end
L0_0.getUpgradesForTankType = L10_10
function L11_11(A0_50)
	local L2_51 = _ENV(A0_50.tankType)
	A0_50.upgrades = L2_51
end
L0_0.loadTankUpgrades = L11_11
function L12_12(A0_52, A1_53)
	local L13_65, L14_66 = L13_65, L14_66
	if not _ENV then
		L13_65 = require
		L14_66 = "settings"
		L13_65 = L13_65(L14_66)
		L13_65 = L13_65.new
		L14_66 = "upgrades.json"
		L13_65 = L13_65(L14_66)
		_ENV = L13_65
		L13_65 = _ENV
		L14_66 = L13_65
		L13_65 = L13_65.load
		L13_65(L14_66)
	end
	L13_65 = _ENV
	L14_66 = L13_65
	L13_65 = L13_65.get
	L13_65 = L13_65(L14_66, "tankTypeUpgrades", {})
	L14_66 = {}
	_FOR_ = 1
	for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
		if L6_6(A1_53[_FORV_7_].type) then
			({}).type = A1_53[_FORV_7_].type
			if L2_2[A1_53[_FORV_7_].type].saveStateFor then
				_FOR_, _FOR_, _FOR_ = pairs(L2_2[A1_53[_FORV_7_].type].saveStateFor)
				for _FORV_13_, _FORV_14_ in _FOR_, _FOR_, _FOR_ do
					({})[_FORV_14_] = A1_53[_FORV_7_][_FORV_14_]
				end
			end
			table.insert(L14_66, {})
			local L12_64 = L12_64
		end
	end
	L8_60 = "tankType"
	L15_67 = tostring
	L10_62 = A0_52
	L15_67 = L15_67(L10_62)
	L8_60 = L8_60 .. L15_67
	L13_65[L8_60] = L14_66
	L8_60 = _ENV
	L15_67 = L8_60
	L8_60 = L8_60.set
	L10_62 = "tankTypeUpgrades"
	L11_63 = L13_65
	L8_60(L15_67, L10_62, L11_63)
	L8_60 = _ENV
	L15_67 = L8_60
	L8_60 = L8_60.save
	L8_60(L15_67)
end
L0_0.saveUpgradesForTankType = L12_12
function L13_13(A0_68)
	local L2_69 = L2_69
	L2_69(A0_68.type, A0_68.upgrades)
	local L3_70 = L3_70
end
L0_0.saveTankUpgrades = L13_13
return L0_0
