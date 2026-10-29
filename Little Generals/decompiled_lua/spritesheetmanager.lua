local L0_0 = L0_0
L0_0((...), package.seeall)
local L2_1 = L2_1
L0_0 = {}
L2_1 = {}
L0_0.sets = L2_1
L2_1 = {}
L0_0.sheets = L2_1
L2_1 = {}
L0_0.data = L2_1
L2_1 = {}
L0_0.sequences = L2_1
SpriteSets = L0_0
function L0_0(A0_2, A1_3, A2_4)
	if not SpriteSets.sets[A0_2] then
		if A1_3 == nil then
			A1_3 = A0_2:gsub("/", ".")
			L3_5 = L3_5(A1_3, ".png", "")
			A1_3 = L3_5
		end
		L3_5 = SpriteSets
		L3_5 = L3_5.data
		L3_5[A0_2] = require(A1_3).getSpriteSheetData()
		L3_5 = SpriteSets
		L3_5 = L3_5.sheets
		L3_5[A0_2] = sprite.newSpriteSheetFromData(A0_2, SpriteSets.data[A0_2])
		L3_5 = SpriteSets
		L3_5 = L3_5.sets
		L4_6 = L4_6(L5_7, L6_8, #SpriteSets.data[A0_2].frames)
		L3_5[A0_2] = L4_6
		L3_5 = SpriteSets
		L3_5 = L3_5.sequences
		L4_6 = {}
		L3_5[A0_2] = L4_6
		if not A2_4 then
			L3_5 = 1
			L4_6 = SpriteSets
			L4_6 = L4_6.data
			L4_6 = L4_6[A0_2]
			L4_6 = L4_6.frames
			L4_6 = #L4_6
			L5_7 = 1
			for L6_8 = L3_5, L4_6, L5_7 do
				local L7_9 = L7_9
				local L8_10 = L8_10
				local L9_11 = L9_11
				local L10_12 = L10_12
				local L11_13 = L11_13
				L7_9(L8_10, L9_11, L10_12, L11_13, 1)
				local L12_14 = L12_14
			end
		end
	end
	L3_5 = SpriteSets
	L3_5 = L3_5.sets
	L3_5 = L3_5[A0_2]
	L4_6 = SpriteSets
	L4_6 = L4_6.data
	L4_6 = L4_6[A0_2]
	L4_6 = L4_6.frames
	return L3_5, L4_6
end
getSpriteSet = L0_0
function L0_0(A0_15)
	local L1_16
	L1_16 = SpriteSets
	local L1_16, L4_19 = L1_16.sheets, L4_19
	L1_16 = L1_16[A0_15]
	if L1_16 then
		L1_16 = SpriteSets
		L1_16 = L1_16.sheets
		L1_16 = L1_16[A0_15]
		L1_16 = L1_16.dispose
		if L1_16 then
			L1_16 = SpriteSets
			L1_16 = L1_16.sheets
			L1_16 = L1_16[A0_15]
			L4_19 = timer
			L4_19 = L4_19.performWithDelay
			local L3_18 = L3_18
			L4_19(L3_18, function()
				_ENV:dispose()
				local L1_20 = L1_20
			end)
			L4_19 = SpriteSets
			L4_19 = L4_19.sheets
			L4_19[A0_15] = nil
			L4_19 = SpriteSets
			L4_19 = L4_19.sets
			L4_19[A0_15] = nil
			L4_19 = SpriteSets
			L4_19 = L4_19.data
			L4_19[A0_15] = nil
			L4_19 = SpriteSets
			L4_19 = L4_19.sequences
			L4_19[A0_15] = nil
		end
	end
end
disposeSpriteSet = L0_0
function L0_0(A0_21)
	local L1_22, L2_23
	L1_22 = {}
	L1_22.count = 0
	function L2_23(A0_24, A1_25)
		local L2_26 = L2_26
		local L3_27 = L3_27
		local L4_28 = L4_28
		local L2_26, L3_27, L5_29 = L2_26(L3_27, L4_28, A1_25)
		if L2_26 then
			L4_28 = L1_22
			L5_29 = L1_22
			L5_29 = L5_29.count
			L5_29 = L5_29 + 1
			L4_28.count = L5_29
		end
		L4_28 = L2_26
		L5_29 = L3_27
		return L4_28, L5_29
	end
	L1_22.getSpriteSet = L2_23
	function L2_23()
		local L2_32 = L2_32
		local L3_33 = math.max(0, _ENV.count - 1)
		L2_32.count = L3_33
		L2_32 = _ENV
		L2_32 = L2_32.count
		if L2_32 == 0 then
			L2_32 = spritesheetmanager
			L2_32 = L2_32.disposeSpriteSet
			L3_33 = A0_21
			L2_32(L3_33)
		end
	end
	L1_22.disposeSpriteSet = L2_23
	return L1_22
end
ReferenceTracker = L0_0
