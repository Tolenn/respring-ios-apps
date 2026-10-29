local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32 = L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30, L31_31, L32_32
if sprite == nil then
	L3_3 = require
	L4_4 = "sprite"
	L3_3(L4_4)
end
L3_3 = string
if L3_3 == nil then
	L3_3 = require
	L4_4 = "string"
	L3_3(L4_4)
end
L3_3 = {}
L3_3.debug = true
L3_3.newLineChar = "|"
L4_4 = math
L4_4 = L4_4.random
L3_3.Rnd = L4_4
L4_4 = math
L4_4 = L4_4.ceil
L3_3.Ceil = L4_4
L4_4 = math
L4_4 = L4_4.floor
L3_3.Floor = L4_4
L4_4 = math
L4_4 = L4_4.sin
L3_3.Sin = L4_4
L4_4 = math
L4_4 = L4_4.cos
L3_3.Cos = L4_4
L4_4 = math
L4_4 = L4_4.rad
L3_3.Rad = L4_4
L4_4 = math
L4_4 = L4_4.mod
L3_3.Mod = L4_4
L4_4 = math
L4_4 = L4_4.atan
L5_5 = 1
L4_4 = L4_4(L5_5)
L4_4 = 4 * L4_4
L3_3.PI = L4_4
L4_4 = system
L4_4 = L4_4.getTimer
L3_3.GetTimer = L4_4
L4_4 = {}
L3_3.Charsets = L4_4
L4_4 = {}
L3_3.ObjectList = L4_4
L3_3.DEFORM_SHAKE = 0
L3_3.DEFORM_WAVE_Y = 1
L3_3.DEFORM_WAVE_SCALE = 2
L3_3.DEFORM_MIRROR = 3
L3_3.DEFORM_ZIGZAG = 4
L3_3.DEFORM_SQUEEZE = 5
L3_3.DEFORM_CIRCLE = 6
L4_4 = nil
L5_5 = nil
L6_6 = nil
L7_7 = nil
L8_8 = nil
L9_9 = nil
L10_10 = nil
L13_13 = nil
L14_14 = nil
L15_15 = nil
L16_16 = L3_3.debug
if L16_16 then
	L16_16 = print
	L16_16()
	L16_16 = print
	L16_16()
	L16_16 = print
	L17_17 = "--> TEXT FX SYSTEM READY."
	L16_16(L17_17)
end
function L16_16(A0_33)
	local L1_34, L2_35
	L1_34 = _ENV
	if A0_33 == true then
		L2_35 = true
		if L2_35 then
			goto lbl_8
		end
	end
	L2_35 = false
	::lbl_8::
	L1_34.debug = L2_35
end
L3_3.EnableDebug = L16_16
function L17_17(A0_36, A1_37, A2_38)
	local L3_39
	L3_39 = _ENV
	L3_39 = L3_39.Charsets
	L3_39 = L3_39[A0_36]
	if L3_39 == nil then
		local L4_40 = L4_40
		L4_40("!!! TextFX.SetCharOffset(): CHARSET '" .. A0_36 .. "' NOT FOUND.")
		return
	end
	L4_40 = L3_39.Chars
	L4_40 = L4_40[string.byte(A1_37)]
	if L4_40 == nil then
		local L5_41 = L5_41
		local L7_43 = L7_43
		local L8_44 = L8_44
		local L9_45 = L9_45
		local L7_43, L10_46 = L7_43 .. L8_44 .. L9_45 .. A0_36 .. "'!", L10_46
		L5_41(L7_43)
		return
	end
	if A2_38 ~= nil then
		L4_40.offY = A2_38
	end
end
L3_3.SetCharYOffset = L17_17
function L18_18(A0_47, A1_48, A2_49, A3_50, A4_51, A5_52, A6_53)
	local L7_54, L8_55
	L8_55 = false
	if type(A1_48) == "string" then
		if string.sub(A1_48, string.len(A1_48) - 3) == ".lua" then
			A1_48 = string.sub(A1_48, 1, string.len(A1_48) - 4)
		end
		L7_54 = require(A1_48).getSpriteSheetData()
		if L7_54 == nil then
			print("!!! TextFX.AddCharset(): Could not find data file " .. A1_48 .. ".lua")
			return
		end
	elseif type(A1_48) == "table" then
		L7_54 = A1_48
		L8_55 = true
	else
		print("!!! TextFX.AddCharset(): Could not load data file (" .. A1_48 .. ")")
		return
	end
	if A2_49 == "" then
		A2_49 = A1_48 .. ".png"
	end
	if string.sub(A2_49, string.len(A2_49) - 3) ~= ".png" then
		A2_49 = A2_49 .. ".png"
	end
	local L9_56 = L9_56
	L9_56 = L9_56(A2_49, L7_54)
	if L9_56 == nil then
		local L10_57 = L10_57
		L10_57("!!! TextFX.AddCharset(): Could not find image file " .. A2_49 .. ".")
		return
	end
	L10_57 = sprite
	L10_57 = L10_57.newSpriteSet
	L10_57 = L10_57(L9_56, 1, string.len(A3_50))
	local L11_58 = L11_58
	local L11_58, L14_61 = L11_58(A3_50, " ", ""), L14_61
	A3_50 = L11_58
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L14_61 = {}
	L11_58[A0_47] = L14_61
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.name = A0_47
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.isVector = false
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.dataFile = A1_48
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.imageFile = A2_49
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.Data = L7_54
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.Sheet = L9_56
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.Set = L10_57
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.charString = A3_50
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L14_61 = string
	L14_61 = L14_61.len
	local L14_61, L13_60 = L14_61(A3_50), L13_60
	L11_58.numChars = L14_61
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L14_61 = {}
	L11_58.Chars = L14_61
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.lineHeight = 0
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.spaceWidth = A4_51
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.charSpacing = A5_52
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.lineSpacing = A6_53
	L11_58 = _ENV
	L11_58 = L11_58.Charsets
	L11_58 = L11_58[A0_47]
	L11_58.scale = 1
	L11_58 = nil
	L14_61 = nil
	L13_60 = nil
	_FOR_ = 1
	for _FORV_18_ = _FOR_, _FOR_, _FOR_ do
		local L21_68 = L21_68
		L11_58 = string.sub(A3_50, _FORV_18_, _FORV_18_)
		L14_61 = string.byte(L11_58)
		_ENV.Charsets[A0_47].Chars[L14_61] = {}
		_ENV.Charsets[A0_47].Chars[L14_61].frame = _FORV_18_
		_ENV.Charsets[A0_47].Chars[L14_61].offY = 0
		_ENV.Charsets[A0_47].Chars[L14_61].width = _ENV.Charsets[A0_47].Data.frames[_FORV_18_].spriteSourceSize.width
		_ENV.Charsets[A0_47].Chars[L14_61].height = _ENV.Charsets[A0_47].Data.frames[_FORV_18_].spriteSourceSize.height
		_ENV.Charsets[A0_47].Chars[L14_61].imgName = _ENV.Charsets[A0_47].Data.frames[_FORV_18_].name
		if _ENV.Charsets[A0_47].Chars[L14_61].height > _ENV.Charsets[A0_47].lineHeight then
			_ENV.Charsets[A0_47].lineHeight = _ENV.Charsets[A0_47].Chars[L14_61].height
		end
	end
	L22_69 = _ENV
	L22_69 = L22_69.Charsets
	L22_69 = L22_69[A0_47]
	L22_69 = L22_69.Chars
	L22_69[32] = {}
	L22_69 = _ENV
	L22_69 = L22_69.Charsets
	L22_69 = L22_69[A0_47]
	L22_69 = L22_69.Chars
	L22_69 = L22_69[32]
	L22_69.frame = 0
	L22_69 = _ENV
	L22_69 = L22_69.Charsets
	L22_69 = L22_69[A0_47]
	L22_69 = L22_69.Chars
	L22_69 = L22_69[32]
	L22_69.offY = 0
	L22_69 = _ENV
	L22_69 = L22_69.Charsets
	L22_69 = L22_69[A0_47]
	L22_69 = L22_69.Chars
	L22_69 = L22_69[32]
	L22_69.width = A4_51
	L22_69 = _ENV
	L22_69 = L22_69.Charsets
	L22_69 = L22_69[A0_47]
	L22_69 = L22_69.Chars
	L22_69 = L22_69[32]
	L22_69.height = _ENV.Charsets[A0_47].lineHeight
	L22_69 = _ENV
	L22_69 = L22_69.Charsets
	L22_69 = L22_69[A0_47]
	L22_69 = L22_69.Chars
	L22_69[13] = {}
	L22_69 = _ENV
	L22_69 = L22_69.Charsets
	L22_69 = L22_69[A0_47]
	L22_69 = L22_69.Chars
	L22_69 = L22_69[13]
	L22_69.frame = 0
	L22_69 = _ENV
	L22_69 = L22_69.Charsets
	L22_69 = L22_69[A0_47]
	L22_69 = L22_69.Chars
	L22_69 = L22_69[13]
	L22_69.offY = 0
	L22_69 = _ENV
	L22_69 = L22_69.Charsets
	L22_69 = L22_69[A0_47]
	L22_69 = L22_69.Chars
	L22_69 = L22_69[13]
	L22_69.width = 0
	L22_69 = _ENV
	L22_69 = L22_69.Charsets
	L22_69 = L22_69[A0_47]
	L22_69 = L22_69.Chars
	L22_69 = L22_69[13]
	L22_69.height = 0
	L22_69 = _ENV
	L22_69 = L22_69.debug
	if L22_69 then
		L22_69 = print
		local L18_65 = L18_65
		local L19_66 = L19_66
		local L18_65, L20_67 = L18_65 .. L19_66 .. "' (" .. _ENV.Charsets[A0_47].numChars .. " CHARS)", L20_67
		L22_69(L18_65)
	end
end
L3_3.AddCharset = L18_18
function L19_19(A0_70, A1_71, A2_72, A3_73, A4_74)
	local L5_75, L6_76
	L6_76 = _ENV
	L6_76 = L6_76.Charsets
	L6_76[A0_70] = {}
	L6_76 = _ENV
	L6_76 = L6_76.Charsets
	L6_76 = L6_76[A0_70]
	L6_76.name = A0_70
	L6_76 = _ENV
	L6_76 = L6_76.Charsets
	L6_76 = L6_76[A0_70]
	L6_76.charString = A1_71
	L6_76 = _ENV
	L6_76 = L6_76.Charsets
	L6_76 = L6_76[A0_70]
	local L7_77 = L7_77
	local L7_77, L8_78 = L7_77(A1_71), L8_78
	L6_76.numChars = L7_77
	L6_76 = _ENV
	L6_76 = L6_76.Charsets
	L6_76 = L6_76[A0_70]
	L7_77 = {}
	L6_76.Chars = L7_77
	L6_76 = _ENV
	L6_76 = L6_76.Charsets
	L6_76 = L6_76[A0_70]
	L6_76.lineHeight = 0
	L6_76 = _ENV
	L6_76 = L6_76.Charsets
	L6_76 = L6_76[A0_70]
	L6_76.charSpacing = A3_73
	L6_76 = _ENV
	L6_76 = L6_76.Charsets
	L6_76 = L6_76[A0_70]
	L6_76.lineSpacing = A4_74
	L6_76 = _ENV
	L6_76 = L6_76.Charsets
	L6_76 = L6_76[A0_70]
	L6_76.scale = 1
	L6_76 = _ENV
	L6_76 = L6_76.Charsets
	L6_76 = L6_76[A0_70]
	L6_76.isVector = true
	L6_76 = _ENV
	L6_76 = L6_76.Charsets
	L6_76 = L6_76[A0_70]
	L6_76.fontSize = A2_72
	L6_76 = nil
	L7_77 = nil
	L8_78 = nil
	_FOR_ = 1
	for _FORV_12_ = _FOR_, _FOR_, _FOR_ do
		L6_76 = string.sub(A1_71, _FORV_12_, _FORV_12_)
		L7_77 = string.byte(L6_76)
		L5_75 = display.newText(L6_76, 0, 0, A0_70, A2_72)
		_ENV.Charsets[A0_70].Chars[L7_77] = {}
		_ENV.Charsets[A0_70].Chars[L7_77].frame = 0
		_ENV.Charsets[A0_70].Chars[L7_77].offY = 0
		_ENV.Charsets[A0_70].Chars[L7_77].width = L5_75.width
		_ENV.Charsets[A0_70].Chars[L7_77].height = L5_75.height
		_ENV.Charsets[A0_70].Chars[L7_77].imgName = ""
		L5_75:removeSelf()
		if _ENV.Charsets[A0_70].Chars[L7_77].height > _ENV.Charsets[A0_70].lineHeight then
			_ENV.Charsets[A0_70].lineHeight = _ENV.Charsets[A0_70].Chars[L7_77].height
		end
	end
	L15_85 = display
	L15_85 = L15_85.newText
	L16_86 = ".."
	L17_87 = 0
	L18_88 = 0
	L15_85 = L15_85(L16_86, L17_87, L18_88, A0_70, A2_72)
	L5_75 = L15_85
	L15_85 = _ENV
	L15_85 = L15_85.Charsets
	L15_85 = L15_85[A0_70]
	L15_85 = L15_85.Chars
	L16_86 = {}
	L15_85[32] = L16_86
	L15_85 = _ENV
	L15_85 = L15_85.Charsets
	L15_85 = L15_85[A0_70]
	L15_85 = L15_85.Chars
	L15_85 = L15_85[32]
	L15_85.frame = 0
	L15_85 = _ENV
	L15_85 = L15_85.Charsets
	L15_85 = L15_85[A0_70]
	L15_85 = L15_85.Chars
	L15_85 = L15_85[32]
	L15_85.offY = 0
	L15_85 = _ENV
	L15_85 = L15_85.Charsets
	L15_85 = L15_85[A0_70]
	L15_85 = L15_85.Chars
	L15_85 = L15_85[32]
	L16_86 = L5_75.width
	L15_85.width = L16_86
	L15_85 = _ENV
	L15_85 = L15_85.Charsets
	L15_85 = L15_85[A0_70]
	L15_85 = L15_85.Chars
	L15_85 = L15_85[32]
	L16_86 = _ENV
	L16_86 = L16_86.Charsets
	L16_86 = L16_86[A0_70]
	L16_86 = L16_86.lineHeight
	L15_85.height = L16_86
	L15_85 = _ENV
	L15_85 = L15_85.Charsets
	L15_85 = L15_85[A0_70]
	L16_86 = L5_75.width
	L15_85.spaceWidth = L16_86
	L16_86 = L5_75
	L15_85 = L5_75.removeSelf
	L15_85(L16_86)
	L15_85 = _ENV
	L15_85 = L15_85.Charsets
	L15_85 = L15_85[A0_70]
	L15_85 = L15_85.Chars
	L16_86 = {}
	L15_85[13] = L16_86
	L15_85 = _ENV
	L15_85 = L15_85.Charsets
	L15_85 = L15_85[A0_70]
	L15_85 = L15_85.Chars
	L15_85 = L15_85[13]
	L15_85.frame = 0
	L15_85 = _ENV
	L15_85 = L15_85.Charsets
	L15_85 = L15_85[A0_70]
	L15_85 = L15_85.Chars
	L15_85 = L15_85[13]
	L15_85.offY = 0
	L15_85 = _ENV
	L15_85 = L15_85.Charsets
	L15_85 = L15_85[A0_70]
	L15_85 = L15_85.Chars
	L15_85 = L15_85[13]
	L15_85.width = 0
	L15_85 = _ENV
	L15_85 = L15_85.Charsets
	L15_85 = L15_85[A0_70]
	L15_85 = L15_85.Chars
	L15_85 = L15_85[13]
	L15_85.height = 0
	L15_85 = _ENV
	L15_85 = L15_85.debug
	if L15_85 then
		L15_85 = print
		L16_86 = "--> TextFX.AddVectorFont(): ADDED VECTOR FONT '"
		L17_87 = A0_70
		L18_88 = "'"
		L16_86 = L16_86 .. L17_87 .. L18_88
		L15_85(L16_86)
	end
end
L3_3.AddVectorFont = L19_19
function L20_20(A0_89, A1_90, A2_91)
	local L3_92, L4_93, L5_94
	function L3_92(A0_108, A1_109)
		local L2_110 = L2_110
		L2_110 = L2_110(A0_108, A1_109)
		local L3_111 = L3_111
		local L4_112 = L4_112
		local L5_113 = L5_113
		local L6_114 = L6_114
		local L3_111, L4_112, L5_113, L6_114, L7_115 = L3_111(L4_112, L5_113, L6_114, 1)
		return L2_110, L3_111, L4_112, L5_113, L6_114, L7_115
	end
	L4_93 = {}
	L5_94 = {}
	L4_93.Sheet = L5_94
	L5_94 = {}
	L4_93.info = L5_94
	L5_94 = {}
	L4_93.chars = L5_94
	L5_94 = {}
	L4_93.kernings = L5_94
	L5_94 = io
	L5_94 = L5_94.lines
	L6_95, L7_96, L8_97 = L6_95(L7_96, system.ResourceDirectory)
	L5_94 = L5_94(L6_95, L7_96, L8_97, L6_95(L7_96, system.ResourceDirectory))
	L6_95 = L5_94
	L7_96 = nil
	L8_97 = nil
	for _FORV_9_ in L6_95, L7_96, L8_97 do
		_FORV_9_ = L3_92(_FORV_9_, "^%s*([%a_]+)%s*")
		while "string" do
			_FORV_9_ = L3_92(_FORV_9_, "^([%a_]+)=")
			if not (string.len(_FORV_9_) > 0) or not L3_92(_FORV_9_, "^([%a_]+)=") then
				break
			end
			_FORV_9_ = L3_92(_FORV_9_, "^\"([^\"]*)\"%s*")
			if not L3_92(_FORV_9_, "^\"([^\"]*)\"%s*") then
				_FORV_9_ = L3_92(_FORV_9_, "^([^%s]*)%s*")
			end
			if not L3_92(_FORV_9_, "^([^%s]*)%s*") then
				break
			end
			;({})[L3_92(_FORV_9_, "^([%a_]+)=")] = L3_92(_FORV_9_, "^([^%s]*)%s*")
		end
		if L3_92(_FORV_9_, "^%s*([%a_]+)%s*") == "info" or L3_92(_FORV_9_, "^%s*([%a_]+)%s*") == "common" then
			_FOR_, _FOR_, _FOR_ = pairs({})
			for _FORV_15_, _FORV_16_ in _FOR_, _FOR_, _FOR_ do
				L4_93.info[_FORV_15_] = _FORV_16_
			end
		elseif L3_92(_FORV_9_, "^%s*([%a_]+)%s*") == "page" then
			({}).file = ({}).file
			L4_93.Sheet, ({}).frames = {}, {}
		elseif L3_92(_FORV_9_, "^%s*([%a_]+)%s*") == "char" then
			({}).letter = string.char(({}).id)
			L4_93.chars[({}).letter] = {}
			_FOR_, _FOR_, _FOR_ = pairs({})
			for _FORV_15_, _FORV_16_ in _FOR_, _FOR_, _FOR_ do
				L4_93.chars[({}).letter][_FORV_15_] = _FORV_16_
				repeat
					do break end -- pseudo-goto
					if L3_92(_FORV_9_, "^%s*([%a_]+)%s*") == "kerning" then
						L4_93.kernings[string.char(({}).first) .. string.char(({}).second)] = 0 + ({}).amount
					end
				until true
			end
		end
	end
	L6_95 = nil
	L7_96 = nil
	L8_97 = nil
	L18_107 = 1
	_FOR_ = 1
	for _FORV_12_ = L18_107, _FOR_, _FOR_ do
		L6_95 = string.sub(A2_91, _FORV_12_, _FORV_12_)
		L8_97 = L4_93.chars[L6_95]
		if 0 < 0 + L8_97.width and 0 < 0 + L8_97.height then
			({}).x = 0 + L8_97.x
			;({}).y = 0 + L8_97.y
			;({}).width = -1 + L8_97.width
			;({}).textureRect, ({}).height = {}, -1 + L8_97.height
			;({}).width = 0 + L8_97.width
			;({}).spriteSourceSize, ({}).height = {}, 0 + L8_97.height
			;({}).x = 0
			;({}).y = 0
			;({}).width = -1 + L8_97.width
			;({}).spriteColorRect, ({}).height = {}, -1 + L8_97.height
			L4_93.Sheet.frames[_FORV_12_], ({}).spriteTrimmed = {}, true
		end
	end
	L18_107 = _ENV
	L18_107(L12_101, L4_93.Sheet, L4_93.Sheet.file, A2_91, L4_93.chars[" "].xadvance, 0, L4_93.info.lineHeight)
	L18_107 = 1
	L12_101 = string
	L12_101 = L12_101.len
	L12_101 = L12_101(A2_91)
	L11_100 = 1
	for _FORV_12_ = L18_107, L12_101, L11_100 do
		L6_95 = string.sub(A2_91, _FORV_12_, _FORV_12_)
		local L14_103 = L14_103
		local L15_104 = L15_104
		L14_103(L15_104, L6_95, L4_93.chars[L6_95].yoffset)
		local L16_105 = L16_105
	end
end
L3_3.AddCharsetFromBMF = L20_20
function L21_21(A0_116, A1_117)
	local L2_118
	L2_118 = _ENV
	L2_118 = L2_118.Charsets
	L2_118 = L2_118[A0_116]
	if L2_118 == nil then
		local L3_119 = L3_119
		local L5_121 = L5_121
		L5_121 = L5_121 .. A0_116 .. "' NOT FOUND."
		L3_119(L5_121)
		return
	end
	L2_118.lineHeight = 0
	L2_118.scale = A1_117
	L3_119 = L2_118.Chars
	L3_119 = L3_119[32]
	L5_121 = L2_118.spaceWidth
	L5_121 = L5_121 * A1_117
	L3_119.width = L5_121
	L3_119 = nil
	L5_121 = nil
	if L2_118.isVector ~= true then
		_FOR_ = 1
		for _FORV_9_ = _FOR_, _FOR_, _FOR_ do
			L3_119 = string.sub(L2_118.charString, _FORV_9_, _FORV_9_)
			L5_121 = string.byte(L3_119)
			L2_118.Chars[L5_121].width = L2_118.Data.frames[_FORV_9_].spriteSourceSize.width * A1_117
			L2_118.Chars[L5_121].height = L2_118.Data.frames[_FORV_9_].spriteSourceSize.height * A1_117
			if L2_118.Chars[L5_121].height > L2_118.lineHeight then
				L2_118.lineHeight = L2_118.Chars[L5_121].height
			end
		end
	else
		_FOR_ = 1
		for _FORV_10_ = _FOR_, _FOR_, _FOR_ do
			L3_119 = string.sub(L2_118.charString, _FORV_10_, _FORV_10_)
			L5_121 = string.byte(L3_119)
			local L13_129 = L13_129
			L14_130 = display.newText(L3_119, 0, 0, L2_118.name, L2_118.fontSize * A1_117)
			L2_118.Chars[L5_121].width = L14_130.width
			L2_118.Chars[L5_121].height = L14_130.height
			L14_130:removeSelf()
			if L2_118.Chars[L5_121].height > L2_118.lineHeight then
				L2_118.lineHeight = L2_118.Chars[L5_121].height
			end
		end
	end
	L3_119 = 0
	L14_130 = 1
	L15_131 = _ENV
	L15_131 = L15_131.ObjectList
	L15_131 = #L15_131
	L16_132 = 1
	for _FORV_9_ = L14_130, L15_131, L16_132 do
		if _ENV.ObjectList[_FORV_9_].fontName == A0_116 then
			L3_119 = L3_119 + 1
			_ENV.PDrawChars(_ENV.ObjectList[_FORV_9_])
		end
	end
	L14_130 = _ENV
	L14_130 = L14_130.debug
	if L14_130 then
		L14_130 = print
		L15_131 = "--> TextFX.ScaleCharset(): CHARSET SCALED. "
		L16_132 = L3_119
		L15_131 = L15_131 .. L16_132 .. [[
 TEXT OBJECTS AFFECTED.

]]
		L14_130(L15_131)
	end
end
L3_3.ScaleCharset = L21_21
function L22_22(A0_133)
	local L6_139 = _ENV.Charsets
	L6_139 = L6_139[A0_133]
	if L6_139 == nil then
		L6_139 = print
		L6_139("!!! TextFX.RemoveCharset(): CHARSET '" .. A0_133 .. "' NOT FOUND.")
		return
	end
	L6_139 = _ENV
	L6_139 = L6_139.debug
	if L6_139 then
		L6_139 = print
		L6_139([[


--> TextFX.RemoveCharset(): REMOVING CHARSET ']] .. A0_133 .. "'...")
		local L2_135 = L2_135
	end
	L6_139 = nil
	L2_135 = nil
	_FOR_ = -1
	for _FORV_6_ = _FOR_, _FOR_, _FOR_ do
		if A0_133 == _ENV.ObjectList[_FORV_6_].fontName then
			_ENV.DeleteText(_ENV.ObjectList[_FORV_6_])
		end
	end
	L5_138 = _ENV
	L5_138 = L5_138.Charsets
	L5_138 = L5_138[A0_133]
	L5_138.Chars = nil
	L5_138 = _ENV
	L5_138 = L5_138.Charsets
	L5_138 = L5_138[A0_133]
	L5_138.Data = nil
	L5_138 = _ENV
	L5_138 = L5_138.Charsets
	L5_138 = L5_138[A0_133]
	L5_138.Set = nil
	L5_138 = _ENV
	L5_138 = L5_138.Charsets
	L5_138 = L5_138[A0_133]
	L5_138 = L5_138.Sheet
	if L5_138 then
		L5_138 = _ENV
		L5_138 = L5_138.Charsets
		L5_138 = L5_138[A0_133]
		L5_138 = L5_138.Sheet
		L7_140 = L5_138
		L5_138 = L5_138.dispose
		L5_138(L7_140)
	end
	L5_138 = _ENV
	L5_138 = L5_138.Charsets
	L5_138 = L5_138[A0_133]
	L5_138.dataFile = nil
	L5_138 = _ENV
	L5_138 = L5_138.Charsets
	L5_138 = L5_138[A0_133]
	L5_138.imageFile = nil
	L5_138 = _ENV
	L5_138 = L5_138.Charsets
	L5_138[A0_133] = nil
	L5_138 = _ENV
	L5_138 = L5_138.debug
	if L5_138 then
		L5_138 = print
		L7_140 = [[
--> TextFX.RemoveCharset(): CHARSET DELETED.

]]
		L5_138(L7_140)
	end
end
L3_3.RemoveCharset = L22_22
function L23_23()
	local L0_142, L1_143
	L5_147, _FOR_, _FOR_ = L5_147(_ENV.Charsets)
	for _FORV_5_, _FORV_6_ in L5_147, _FOR_, _FOR_ do
		_ENV.RemoveCharset(_FORV_5_)
	end
	L5_147 = collectgarbage
	L7_148 = "collect"
	L5_147(L7_148)
end
L3_3.CleanUp = L23_23
function L24_24(A0_150)
	local L1_151
	L1_151 = _ENV
	L1_151 = L1_151.Charsets
	L1_151 = L1_151[A0_150.fontName]
	if L1_151 == nil then
		local L2_152 = L2_152
		local L4_154 = L4_154
		L4_154 = L4_154 .. A0_150.fontName .. " NOT FOUND."
		L2_152(L4_154)
		return
	end
	L2_152 = nil
	L4_154 = nil
	local L5_155 = L5_155
	display.newGroup().name = "FXText"
	table.insert(_ENV.ObjectList, (display.newGroup()))
	local L6_156 = L6_156
	L6_156:insert(1, (display.newGroup()))
	local L7_157 = L7_157
	L6_156:insert(2, (display.newGroup()))
	local L8_158 = L8_158
	display.newCircle(0, 0, 8):setFillColor(255, 255, 0)
	local L13_163 = L13_163
	L13_163.name = "Origin"
	L6_156:insert(3, L13_163)
	function L6_156.setText(A0_164, A1_165, A2_166)
		A0_164:stopMarquee()
		if A2_166 ~= nil then
			A0_164.wrapWidth = A2_166
		end
		if A1_165 == A0_164.text then
			return
		end
		A0_164.text = A1_165
		_ENV.PDrawChars(A0_164)
	end
	function L6_156.getText(A0_167)
		return A0_167.text
	end
	function L6_156.updateChars(A0_168, A1_169)
		local L5_173 = string.len
		L5_173 = L5_173(A1_169)
		if L5_173 ~= A0_168[2].numChildren then
			L5_173 = A0_168.setText
			local L3_171 = L3_171
			L5_173(L3_171, A1_169)
			local L4_172 = L4_172
		end
		L5_173 = nil
		L3_171 = nil
		L4_172 = nil
		if _ENV.Charsets[L6_156.fontName] == nil then
			local L6_174 = L6_174
			L9_177 = "!!! Text:updateChars(): CHARSET " .. A0_168.fontName .. " NOT FOUND."
			L8_176(L9_177)
			return
		end
		L8_176 = 1
		L9_177 = A0_168[2]
		L9_177 = L9_177.numChildren
		_FOR_ = 1
		for _FORV_9_ = L8_176, L9_177, _FOR_ do
			L3_171 = string.sub(A1_169, _FORV_9_, _FORV_9_)
			if L6_174.isVector then
				if L6_156.shadowOffX ~= 0 or L6_156.shadowOffY ~= 0 then
					A0_168[2][_FORV_9_][1].text = L3_171
					A0_168[2][_FORV_9_][2].text = L3_171
				else
					A0_168[2][_FORV_9_].text = L3_171
				end
			else
				local L12_180 = L12_180
				L4_172 = L12_180[L3_171:byte()]
				L12_180 = A0_168[2]
				L12_180 = L12_180[_FORV_9_]
				L12_180.currentFrame = L4_172.frame
			end
		end
	end
	function L6_156.getNumLines(A0_182)
		local L1_183
		L1_183 = A0_182.wrappedLines
		L1_183 = #L1_183
		return L1_183
	end
	function L6_156.getLine(A0_184, A1_185)
		local L2_186
		L2_186 = A0_184.wrappedLines
		L2_186 = L2_186[A1_185]
		return L2_186
	end
	function L6_156.getLineWidth(A0_187, A1_188)
		local L2_189
		L2_189 = A0_187.lineWidths
		L2_189 = L2_189[A1_188]
		return L2_189
	end
	function L6_156.getScroll(A0_190)
		return A0_190.startLine
	end
	function L6_156.changeFont(A0_191, A1_192)
		local L2_193
		L2_193 = _ENV
		L2_193 = L2_193.Charsets
		L2_193 = L2_193[A1_192]
		if L2_193 == nil then
			local L5_196 = L5_196
			local L6_197 = "!!! TextFX:setCharset(): CHARSET " .. A1_192 .. " NOT FOUND."
			L5_196(L6_197)
			return
		end
		A0_191.fontName = A1_192
		L5_196 = L2_193.charSpacing
		if L5_196 ~= nil then
			L5_196 = L2_193.charSpacing
			A0_191.charSpacing = L5_196
		end
		L5_196 = L2_193.lineSpacing
		if L5_196 ~= nil then
			L5_196 = L2_193.lineSpacing
			A0_191.lineSpacing = L5_196
		end
		L5_196 = L2_193.fontSize
		if L5_196 ~= nil then
			L5_196 = L2_193.fontSize
			A0_191.fontSize = L5_196
		end
		L5_196 = _ENV
		L5_196 = L5_196.PDrawChars
		L6_197 = A0_191
		L5_196(L6_197)
	end
	function L6_156.setScroll(A0_198, A1_199)
		local L4_202, L5_203 = _ENV.Ceil, L5_203
		L5_203 = A1_199
		L4_202 = L4_202(L5_203)
		A0_198.startLine = L4_202
		L4_202 = _ENV
		L4_202 = L4_202.PDrawChars
		L5_203 = A0_198
		L4_202(L5_203)
		L4_202 = L6_156
		L4_202 = L4_202.Scrollbar
		if L4_202 ~= nil then
			L4_202 = A0_198.ScrollButton
			L5_203 = A0_198.startLine
			L5_203 = L5_203 / A0_198.maxScroll
			L5_203 = L5_203 * (A0_198.Scrollbar.height - A0_198.ScrollButton.height)
			L4_202.y = L5_203
			L4_202 = A0_198.startLine
			if L4_202 == 1 then
				L4_202 = A0_198.ScrollButton
				L4_202.y = 0
			end
		end
	end
	function L6_156.scroll(A0_204, A1_205)
		local L5_209 = L5_209
		L5_209 = L5_209 + _ENV.Ceil(A1_205)
		A0_204.startLine = L5_209
		L5_209 = _ENV
		L5_209 = L5_209.PDrawChars
		L5_209(A0_204)
		local L3_207 = L3_207
		L5_209 = L6_156
		L5_209 = L5_209.Scrollbar
		if L5_209 ~= nil then
			L5_209 = A0_204.ScrollButton
			L3_207 = A0_204.startLine
			L3_207 = L3_207 / A0_204.maxScroll
			L3_207 = L3_207 * (A0_204.Scrollbar.height - A0_204.ScrollButton.height)
			L5_209.y = L3_207
			L5_209 = A0_204.startLine
			if L5_209 == 1 then
				L5_209 = A0_204.ScrollButton
				L5_209.y = 0
			end
		end
	end
	function L6_156.getMaxScroll(A0_210)
		return A0_210.maxScroll
	end
	function L6_156.getLineWidth(A0_211, A1_212)
		local L2_213
		L2_213 = A0_211.lineWidths
		L2_213 = L2_213[A1_212]
		return L2_213
	end
	function L6_156.setOrigin(A0_214, A1_215, A2_216)
		A0_214.originX = string.upper(A1_215)
		A0_214.originY = string.upper(A2_216)
		_ENV.PDrawChars(A0_214)
		local L4_217 = L4_217
	end
	function L6_156.setTextFlow(A0_218, A1_219)
		A0_218.textFlow = string.upper(A1_219)
		_ENV.PDrawChars(A0_218)
		local L3_220 = L3_220
	end
	function L6_156.setProperties(A0_221, A1_222)
		_ENV.PApplyProperties(A0_221, A1_222)
		local L4_224 = L4_224
		L4_224 = _ENV
		L4_224 = L4_224.PDrawChars
		L4_224(A0_221)
	end
	function L6_156.setProperty(A0_225, A1_226, A2_227)
		A0_225[A1_226] = A2_227
		local L3_228 = L3_228
		L3_228(A0_225)
		local L4_229 = L4_229
	end
	function L6_156.getProperty(A0_230, A1_231)
		return A0_230[A1_231]
	end
	function L6_156.setColor(A0_232, A1_233, A2_234, A3_235, A4_236)
		local L5_237, L6_238
		L5_237 = A0_232.Color
		if L5_237 == nil then
			L5_237 = {}
			A0_232.Color = L5_237
		end
		L5_237 = A0_232.Color
		L6_238 = A1_233 or L6_238
		if A1_233 == nil or not A1_233 then
			L6_238 = 255
		end
		L5_237[1] = L6_238
		L5_237 = A0_232.Color
		L6_238 = A2_234 or L6_238
		if A2_234 == nil or not A2_234 then
			L6_238 = 255
		end
		L5_237[2] = L6_238
		L5_237 = A0_232.Color
		L6_238 = A3_235 or L6_238
		if A3_235 == nil or not A3_235 then
			L6_238 = 255
		end
		L5_237[3] = L6_238
		L5_237 = A0_232.Color
		L6_238 = A4_236 or L6_238
		if A4_236 == nil or not A4_236 then
			L6_238 = 255
		end
		L5_237[4] = L6_238
		L5_237 = nil
		L6_238 = A0_232[2]
		L6_238 = L6_238.numChildren
		L10_242 = 1
		_FOR_ = 1
		for _FORV_10_ = L10_242, _FOR_, _FOR_ do
			if _ENV.shadowOffX ~= 0 or _ENV.shadowOffY ~= 0 then
				if _ENV.Charsets[A0_232.fontName].isVector == true then
					A0_232[2][_FORV_10_][2]:setTextColor(A0_232.Color[1], A0_232.Color[2], A0_232.Color[3], A0_232.Color[4])
				elseif A0_232[2][_FORV_10_][2].isEmptyLine ~= true then
					A0_232[2][_FORV_10_][2]:setFillColor(A0_232.Color[1], A0_232.Color[2], A0_232.Color[3], A0_232.Color[4])
				end
			elseif _ENV.Charsets[A0_232.fontName].isVector == true then
				A0_232[2][_FORV_10_]:setTextColor(A0_232.Color[1], A0_232.Color[2], A0_232.Color[3], A0_232.Color[4])
			elseif A0_232[2][_FORV_10_].isEmptyLine ~= true then
				local L14_246 = L14_246
				local L15_247 = L15_247
				L14_246(L15_247, A0_232.Color[1], A0_232.Color[2], A0_232.Color[3], A0_232.Color[4])
				local L16_248 = L16_248
			end
		end
		L10_242 = _ENV
		L10_242 = L10_242.debug
		if L10_242 then
			L10_242 = print
			L11_243 = "--> FXText:setColor(): CHANGED COLOR."
			L10_242(L11_243)
		end
	end
	function L6_156.setFontSize(A0_249, A1_250)
		A0_249.fontSize = A1_250
		if _ENV.Charsets[A0_249.fontName].isVector == true then
			local L4_253 = L4_253
			local L5_254 = L5_254
			local L6_255 = L6_255
			local L4_253, L7_256 = L4_253(L5_254, L6_255, 0, A0_249.fontName, A1_250), L7_256
			Temp = L4_253
			L4_253 = _ENV
			L4_253 = L4_253.Charsets
			L5_254 = A0_249.fontName
			L4_253 = L4_253[L5_254]
			L4_253 = L4_253.Chars
			L4_253 = L4_253[32]
			L5_254 = Temp
			L5_254 = L5_254.width
			L4_253.width = L5_254
			L4_253 = _ENV
			L4_253 = L4_253.Charsets
			L5_254 = A0_249.fontName
			L4_253 = L4_253[L5_254]
			L5_254 = Temp
			L5_254 = L5_254.width
			L4_253.spaceWidth = L5_254
			L4_253 = Temp
			L5_254 = L4_253
			L4_253 = L4_253.removeSelf
			L4_253(L5_254)
		end
		L4_253 = _ENV
		L4_253 = L4_253.PDrawChars
		L5_254 = A0_249
		L4_253(L5_254)
	end
	function L6_156.addDropShadow(A0_257, A1_258, A2_259, A3_260)
		if A1_258 ~= A0_257.shadowOffX or A2_259 ~= A0_257.shadowOffY or A3_260 ~= A0_257.shadowAlpha then
			if A1_258 == nil or not A1_258 then
			end
			A0_257.shadowOffX = 0
			if A2_259 == nil or not A2_259 then
			end
			A0_257.shadowOffY = 0
			if A3_260 == nil or not A3_260 then
			end
			A0_257.shadowAlpha = 0
			_ENV.PDrawChars(A0_257)
			if _ENV.debug then
				local L4_261 = L4_261
				L4_261("--> FXText:addDropShadow(): SHADOW ADDED.")
				local L5_262 = L5_262
			end
		end
	end
	function L6_156.startMarquee(A0_263, A1_264, A2_265, A3_266)
		A0_263:stopMarquee()
		A0_263.originX = "LEFT"
		A0_263.startLine = 1
		A0_263.linesToShow = 1
		A0_263.wrapWidth = 0
		A0_263.marqueeSpeed = A2_265
		A0_263.marqueeText = ""
		_FOR_ = 1
		for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
			if string.sub(A0_263.text, _FORV_7_, _FORV_7_) ~= _ENV.newLineChar then
				A0_263.marqueeText = A0_263.marqueeText .. string.sub(A0_263.text, _FORV_7_, _FORV_7_)
			end
		end
		L10_273 = string
		L10_273 = L10_273.sub
		L11_274 = A0_263.marqueeText
		L12_275 = 1
		L10_273 = L10_273(L11_274, L12_275, A1_264)
		A0_263.text = L10_273
		L11_274 = A0_263
		L10_273 = A0_263.removeDeform
		L10_273(L11_274)
		L11_274 = A0_263
		L10_273 = A0_263.removeAnimation
		L10_273(L11_274)
		L11_274 = A0_263
		L10_273 = A0_263.removeInOutTransition
		L10_273(L11_274)
		L10_273 = A1_264 + 1
		A0_263.nextCharPos = L10_273
		L10_273 = A0_263.nextCharPos
		L11_274 = string
		L11_274 = L11_274.len
		L12_275 = A0_263.marqueeText
		L11_274 = L11_274(L12_275)
		if L10_273 > L11_274 then
			A0_263.nextCharPos = 1
		end
		if A3_266 ~= nil then
			L10_273 = A0_263[2]
			L10_273.x = A3_266
		end
		L10_273 = string
		L10_273 = L10_273.sub
		L11_274 = A0_263.text
		L12_275 = 1
		L10_273 = L10_273(L11_274, L12_275, 1)
		if L10_273 == " " then
			L10_273 = _ENV
			L10_273 = L10_273.Charsets
			L11_274 = A0_263.fontName
			L10_273 = L10_273[L11_274]
			L10_273 = L10_273.spaceWidth
			A0_263.charW = L10_273
		else
			L10_273 = A0_263.shadowOffX
			if L10_273 == 0 then
				L10_273 = A0_263.shadowOffY
				if L10_273 == 0 then
					goto lbl_90
				end
			end
			L10_273 = A0_263[2]
			L10_273 = L10_273[1]
			L10_273 = L10_273[1]
			L10_273 = L10_273.width
			A0_263.charW = L10_273
			goto lbl_94
			::lbl_90::
			L10_273 = A0_263[2]
			L10_273 = L10_273[1]
			L10_273 = L10_273.width
			A0_263.charW = L10_273
		end
		::lbl_94::
		L10_273 = A0_263.charW
		L11_274 = A0_263.charSpacing
		L10_273 = L10_273 + L11_274
		L10_273 = -L10_273
		L11_274 = _ENV
		L11_274 = L11_274.Charsets
		L12_275 = A0_263.fontName
		L11_274 = L11_274[L12_275]
		L11_274 = L11_274.scale
		L10_273 = L10_273 * L11_274
		A0_263.endX = L10_273
		L10_273 = timer
		L10_273 = L10_273.performWithDelay
		L11_274 = 1
		L12_275 = _ENV
		L12_275 = L12_275.PMarquee
		L10_273 = L10_273(L11_274, L12_275, 0)
		A0_263.MarqueeTimer = L10_273
		L10_273 = A0_263.MarqueeTimer
		L10_273.Target = A0_263
		L10_273 = _ENV
		L10_273 = L10_273.debug
		if L10_273 then
			L10_273 = print
			L11_274 = "--> FXText:startMarquee(): MARQUEE STARTED."
			L10_273(L11_274)
		end
	end
	function L6_156.stopMarquee(A0_276)
		if A0_276.MarqueeTimer ~= nil then
			A0_276[2].x = 0
			A0_276[2].y = 0
			local L1_277 = L1_277
			L1_277(A0_276.MarqueeTimer)
			local L2_278 = L2_278
			L1_277 = A0_276.MarqueeTimer
			L1_277.Target = nil
			A0_276.MarqueeTimer = nil
		end
	end
	function L6_156.setVisibleLines(A0_279, A1_280, A2_281)
		if A1_280 < 1 then
			A1_280 = 1
		end
		A0_279.startLine = A1_280
		A0_279.linesToShow = A2_281
		local L3_282 = L3_282
		L3_282(A0_279)
		local L4_283 = L4_283
	end
	function L6_156.addBackground(A0_284, A1_285, A2_286, A3_287, A4_288, A5_289, A6_290)
		A0_284:removeBackground()
		A0_284[1]:insert(A1_285)
		local L9_292 = L9_292
		A1_285.isBackground = true
		L9_292 = A1_285.width
		L9_292 = -L9_292
		L9_292 = L9_292 / 2
		A1_285.xReference = L9_292
		L9_292 = A1_285.height
		L9_292 = -L9_292
		L9_292 = L9_292 / 2
		A1_285.yReference = L9_292
		L9_292 = A4_288 or L9_292
		if A4_288 == nil or not A4_288 then
			L9_292 = 1
		end
		A1_285.alpha = L9_292
		L9_292 = A2_286 or L9_292
		if A2_286 == nil or not A2_286 then
			L9_292 = 0
		end
		A1_285.marginX = L9_292
		L9_292 = A3_287 or L9_292
		if A3_287 == nil or not A3_287 then
			L9_292 = 0
		end
		A1_285.marginY = L9_292
		L9_292 = A5_289 or L9_292
		if A5_289 == nil or not A5_289 then
			L9_292 = 0
		end
		A1_285.offX = L9_292
		L9_292 = A6_290 or L9_292
		if A6_290 == nil or not A6_290 then
			L9_292 = 0
		end
		A1_285.offY = L9_292
		L9_292 = _ENV
		L9_292 = L9_292.PDrawChars
		L9_292(A0_284)
		L9_292 = _ENV
		L9_292 = L9_292.debug
		if L9_292 then
			L9_292 = print
			L9_292("--> FXText:addBackground(): BACKGROUND ADDED.")
		end
	end
	function L6_156.removeBackground(A0_293)
		if A0_293[1] then
			while A0_293[1].numChildren > 0 do
				A0_293[1][1]:removeSelf()
				local L2_294 = L2_294
			end
		end
	end
	function L6_156.applyDeform(A0_295, A1_296)
		if A1_296.type == nil then
			L6_301 = print
			L6_301("!!! FXText:applyDeform(): INVALID TYPE (nil).")
			return
		end
		A0_295.DeformEffect = nil
		L6_301 = {}
		A0_295.DeformEffect = L6_301
		L6_301 = pairs
		L6_301, _FOR_, _FOR_ = L6_301(A1_296)
		for _FORV_5_, _FORV_6_ in L6_301, _FOR_, _FOR_ do
			A0_295.DeformEffect[_FORV_5_] = _FORV_6_
		end
		L6_301 = _ENV
		L6_301 = L6_301.PDrawChars
		L7_302 = A0_295
		L6_301(L7_302)
		L6_301 = _ENV
		L6_301 = L6_301.debug
		if L6_301 then
			L6_301 = print
			L7_302 = "--> FXText:applyDeform(): APPLIED DEFORMATION (TYPE: "
			local L7_302, L5_300 = L7_302 .. A1_296.type .. ").", L5_300
			L6_301(L7_302)
		end
	end
	function L6_156.removeDeform(A0_303)
		A0_303.DeformEffect = nil
		_ENV.PDrawChars(A0_303)
		if _ENV.debug then
			local L1_304 = L1_304
			L1_304("--> FXText:removeDeform(): REMOVED DEFORMATION.")
			local L2_305 = L2_305
		end
	end
	function L6_156.applyInOutTransition(A0_306, A1_307)
		if A1_307 == nil then
			L6_312 = print
			L6_312("!!! FXText:applyInOutTransition(): INVALID TYPE (nil).")
			return
		end
		L6_312 = _ENV
		L6_312 = L6_312.PRemoveInOutTransition
		L6_312(A0_306)
		L6_312 = {}
		A0_306.InOutEffect = L6_312
		L6_312 = pairs
		L6_312, _FOR_, _FOR_ = L6_312(A1_307)
		for _FORV_5_, _FORV_6_ in L6_312, _FOR_, _FOR_ do
			A0_306.InOutEffect[_FORV_5_] = _FORV_6_
		end
		L6_312 = A0_306.InOutEffect
		L6_312 = L6_312.CompleteListener
		if L6_312 ~= nil then
			L6_312 = Runtime
			L7_313 = L6_312
			L6_312 = L6_312.addEventListener
			L6_312(L7_313, "transitionComplete", A0_306.InOutEffect.CompleteListener)
		end
		L6_312 = A0_306.InOutEffect
		L6_312 = L6_312.startNow
		if L6_312 then
			L6_312 = _ENV
			L6_312 = L6_312.PStartInOutTransition
			L7_313 = A0_306
			L6_312(L7_313)
		end
		L6_312 = _ENV
		L6_312 = L6_312.debug
		if L6_312 then
			L6_312 = print
			L7_313 = "--> FXText:applyTransition(): APPLIED IN-OUT TRANSITION."
			L6_312(L7_313)
		end
	end
	function L6_156.startInOutTransition(A0_314)
		_ENV.PStartInOutTransition(A0_314)
		if _ENV.debug then
			print("--> FXText:startInOutTransition(): STARTED IN-OUT TRANSITION.")
			local L2_315 = L2_315
		end
	end
	function L6_156.stopInOutTransition(A0_316)
		_ENV.PStopInOutTransition(A0_316)
		if _ENV.debug then
			print("--> FXText:stopInOutTransition(): STOPPED IN-OUT TRANSITION.")
			local L2_317 = L2_317
		end
	end
	function L6_156.removeInOutTransition(A0_318)
		_ENV.PRemoveInOutTransition(A0_318)
		if _ENV.debug then
			print("--> FXText:removeInOutTransition(): REMOVED IN-OUT TRANSITION.")
			local L2_319 = L2_319
		end
	end
	function L6_156.transitionActive(A0_320)
		local L1_321, L2_322
		L1_321 = A0_320[2]
		if L1_321 == nil then
			L1_321 = false
			return L1_321
		end
		L1_321 = A0_320.TransIn
		if not L1_321 then
			L1_321 = A0_320.TransOut
			if not L1_321 then
				L1_321 = A0_320[2]
				L2_322 = A0_320[2]
				L2_322 = L2_322.numChildren
				L1_321 = L1_321[L2_322]
				L1_321 = L1_321.TransIn
				if not L1_321 then
					L1_321 = A0_320[2]
					L2_322 = A0_320[2]
					L2_322 = L2_322.numChildren
					L1_321 = L1_321[L2_322]
					L1_321 = L1_321.TransOut
					if not L1_321 then
						L1_321 = A0_320[2]
						L1_321 = L1_321[1]
						L1_321 = L1_321.TransIn
						if not L1_321 then
							L1_321 = A0_320[2]
							L1_321 = L1_321[1]
							L1_321 = L1_321.TransOut
							if not L1_321 then
								goto lbl_39
							end
						end
					end
				end
			end
		end
		L1_321 = true
		do return L1_321 end
		goto lbl_41
		::lbl_39::
		L1_321 = false
		do return L1_321 end
		::lbl_41::
	end
	function L6_156.applyAnimation(A0_323, A1_324)
		if A1_324.interval == nil then
			A1_324.interval = 1
		end
		L6_329 = A0_323
		L5_328 = A0_323.stopAnimation
		L5_328(L6_329)
		L5_328 = {}
		A0_323.AnimEffect = L5_328
		L5_328 = pairs
		L6_329 = A1_324
		L5_328, L6_329, _FOR_ = L5_328(L6_329)
		for _FORV_5_, _FORV_6_ in L5_328, L6_329, _FOR_ do
			A0_323.AnimEffect[_FORV_5_] = _FORV_6_
		end
		L5_328 = A0_323.AnimEffect
		L5_328 = L5_328.startNow
		if L5_328 then
			L6_329 = A0_323
			L5_328 = A0_323.startAnimation
			L5_328(L6_329)
		end
		L5_328 = _ENV
		L5_328 = L5_328.debug
		if L5_328 then
			L5_328 = print
			L6_329 = "--> FXText:applyAnimation(): STARTED ANIMATION."
			L5_328(L6_329)
		end
	end
	function L6_156.startAnimation(A0_331)
		if A0_331.AnimEffect == nil then
			print("!!! FXText:startAnimation(): NO ANIMATION DEFINED. USE applyAnimation() FIRST.")
			return
		end
		A0_331:stopAnimation()
		if A0_331.AnimEffect.charWise == true then
			_FOR_ = 1
			for _FORV_4_ = _FOR_, _FOR_, _FOR_ do
				if A0_331.AnimEffect.startAlpha ~= nil then
					_ENV[2][_FORV_4_].alpha = A0_331.AnimEffect.startAlpha
				end
				A0_331[2][_FORV_4_].origAlpha = A0_331[2][_FORV_4_].alpha
				A0_331[2][_FORV_4_].origXScale = A0_331[2][_FORV_4_].xScale
				A0_331[2][_FORV_4_].origYScale = A0_331[2][_FORV_4_].yScale
				A0_331[2][_FORV_4_].origRot = A0_331[2][_FORV_4_].rotation
				A0_331[2][_FORV_4_].origX = A0_331[2][_FORV_4_].x
				A0_331[2][_FORV_4_].origY = A0_331[2][_FORV_4_].y
			end
			repeat
				do break end -- pseudo-goto
				L6_337 = A0_331.alpha
				A0_331.origAlpha1 = L6_337
				L6_337 = A0_331.AnimEffect
				L6_337 = L6_337.startAlpha
				if L6_337 ~= nil then
					L6_337 = A0_331.AnimEffect
					L6_337 = L6_337.startAlpha
					A0_331.alpha = L6_337
				end
				L6_337 = A0_331.alpha
				A0_331.origAlpha = L6_337
				L6_337 = A0_331.xScale
				A0_331.origXScale = L6_337
				L6_337 = A0_331.yScale
				A0_331.origYScale = L6_337
				L6_337 = A0_331.rotation
				A0_331.origRot = L6_337
				L6_337 = A0_331.x
				A0_331.origX = L6_337
				L6_337 = A0_331.y
				A0_331.origY = L6_337
			until true
		end
		L6_337 = timer
		L6_337 = L6_337.performWithDelay
		local L6_337, L4_335 = L6_337(1, _ENV.PAnimate, 0), L4_335
		A0_331.AnimTimer = L6_337
		L6_337 = A0_331.AnimTimer
		L6_337.Target = A0_331
		L6_337 = _ENV
		L6_337 = L6_337.debug
		if L6_337 then
			L6_337 = print
			L4_335 = "--> FXText:startAnimation(): STARTED ANIMATION."
			L6_337(L4_335)
		end
	end
	function L6_156.stopAnimation(A0_338)
		if A0_338.AnimTimer ~= nil then
			L4_342 = timer
			L4_342 = L4_342.cancel
			L4_342(A0_338.AnimTimer)
			L4_342 = A0_338.AnimTimer
			L4_342.Target = nil
			A0_338.AnimTimer = nil
			L4_342 = A0_338.AnimEffect
			L4_342 = L4_342.charWise
			if L4_342 == true then
				L4_342 = 1
				_FOR_ = 1
				for _FORV_4_ = L4_342, _FOR_, _FOR_ do
					A0_338[2][_FORV_4_].alpha = A0_338[2][_FORV_4_].origAlpha
					A0_338[2][_FORV_4_].xScale = A0_338[2][_FORV_4_].origXScale
					A0_338[2][_FORV_4_].yScale = A0_338[2][_FORV_4_].origYScale
					A0_338[2][_FORV_4_].rotation = A0_338[2][_FORV_4_].origRot
					A0_338[2][_FORV_4_].x = A0_338[2][_FORV_4_].origX
					A0_338[2][_FORV_4_].y = A0_338[2][_FORV_4_].origY
				end
				repeat
					do break end -- pseudo-goto
					L4_342 = A0_338.origAlpha1
					A0_338.alpha = L4_342
					L4_342 = A0_338.origXScale
					A0_338.xScale = L4_342
					L4_342 = A0_338.origYScale
					A0_338.yScale = L4_342
					L4_342 = A0_338.origRot
					A0_338.rotation = L4_342
					L4_342 = A0_338.origX
					A0_338.x = L4_342
					L4_342 = A0_338.origY
					A0_338.y = L4_342
				until true
			end
			L4_342 = _ENV
			L4_342 = L4_342.debug
			if L4_342 then
				L4_342 = print
				L6_344 = "--> FXText:stopAnimation(): STOPPED ANIMATION."
				L4_342(L6_344)
			end
		end
	end
	function L6_156.removeAnimation(A0_345)
		A0_345:stopAnimation()
		L4_349 = A0_345.AnimEffect
		if L4_349 ~= nil then
			L4_349 = pairs
			L5_350 = A0_345.AnimEffect
			L4_349, L5_350, _FOR_ = L4_349(L5_350)
			for _FORV_4_, _FORV_5_ in L4_349, L5_350, _FOR_ do
				A0_345.AnimEffect[_FORV_4_] = nil
			end
			A0_345.AnimEffect = nil
			L4_349 = _ENV
			L4_349 = L4_349.debug
			if L4_349 then
				L4_349 = print
				L5_350 = "--> FXText:removeAnimation(): REMOVED ANIMATION."
				L4_349(L5_350)
			end
		end
	end
	function L6_156.addScrollbar(A0_352, A1_353)
		local L7_359 = L7_359
		if A1_353.Button == nil then
			L7_359 = print
			L7_359("!!! FXText:addScrollbar(): NO SCROLLBUTTON IMAGE SPECIFIED.")
			return
		end
		L7_359 = A1_353.autoHide
		if L7_359 == nil then
			A1_353.autoHide = true
		end
		L7_359 = A1_353.scaleButton
		if L7_359 == nil then
			A1_353.scaleButton = true
		end
		L7_359 = A1_353.xOffset
		if L7_359 == nil then
			A1_353.xOffset = 20
		end
		L7_359 = A1_353.startLine
		if L7_359 ~= nil then
			L7_359 = A1_353.startLine
			A0_352.startLine = L7_359
		end
		L7_359 = A1_353.linesToShow
		if L7_359 ~= nil then
			L7_359 = A1_353.linesToShow
			A0_352.linesToShow = L7_359
		end
		L7_359 = A0_352.removeScrollbar
		L7_359(A0_352)
		L7_359 = display
		L7_359 = L7_359.newGroup
		L7_359 = L7_359()
		L7_359.name = "Scrollbar"
		A0_352:insert(4, L7_359)
		if A1_353.FrameTop then
			L7_359:insert(A1_353.FrameTop)
			A1_353.FrameTop.yReference = -A1_353.FrameTop.height / 2
			A1_353.FrameTop.x = 0
			A1_353.FrameTop.y = 0
		end
		if A1_353.Frame then
			L7_359:insert(A1_353.Frame)
			A1_353.Frame.yReference = -A1_353.Frame.height / 2
		end
		if A1_353.FrameBottom then
			L7_359:insert(A1_353.FrameBottom)
			A1_353.FrameBottom.yReference = A1_353.FrameBottom.height / 2
		end
		ButtonGroup = display.newGroup()
		ButtonGroup.name = "Scrollbutton"
		L7_359:insert(ButtonGroup)
		if A1_353.ButtonTop then
			ButtonGroup:insert(A1_353.ButtonTop)
			A1_353.ButtonTop.yReference = -A1_353.ButtonTop.height / 2
			A1_353.ButtonTop.x = 0
			A1_353.ButtonTop.y = 0
		end
		ButtonGroup:insert(A1_353.Button)
		A1_353.Button.oHeight = A1_353.Button.height
		A1_353.Button.yReference = -A1_353.Button.height / 2
		if A1_353.ButtonBottom then
			ButtonGroup:insert(A1_353.ButtonBottom)
			A1_353.ButtonBottom.yReference = -A1_353.ButtonBottom.height / 2
		end
		ButtonGroup:addEventListener("touch", _ENV.PScrollbarTouched)
		A0_352.Scrollbar = L7_359
		L6_358 = ButtonGroup
		A0_352.ScrollButton = L6_358
		L6_358 = pairs
		L6_358, _FOR_, _FOR_ = L6_358(A1_353)
		for _FORV_6_, _FORV_7_ in L6_358, _FOR_, _FOR_ do
			A0_352.Scrollbar[_FORV_6_] = _FORV_7_
		end
		L6_358 = _ENV
		L6_358 = L6_358.PDrawChars
		L8_360 = A0_352
		L6_358(L8_360)
		L6_358 = _ENV
		L6_358 = L6_358.debug
		if L6_358 then
			L6_358 = print
			L8_360 = "--> TextFX.addScrollbar(): SCROLLBAR ADDED."
			L6_358(L8_360)
		end
	end
	function L6_156.removeScrollbar(A0_361)
		if A0_361.Scrollbar ~= nil then
			L5_366 = A0_361.ScrollButton
			L5_366 = L5_366.removeEventListener
			L5_366(L5_366, "touch", _ENV.PScrollbarTouched)
			L5_366 = pairs
			L5_366, _FOR_, _FOR_ = L5_366(A0_150)
			for _FORV_4_, _FORV_5_ in L5_366, _FOR_, _FOR_ do
				A0_361.Scrollbar[_FORV_4_] = nil
			end
			L5_366 = A0_361.Scrollbar
			L6_367 = L5_366
			L5_366 = L5_366.removeSelf
			L5_366(L6_367)
			A0_361.Scrollbar = nil
			A0_361.ScrollButton = nil
			L5_366 = _ENV
			L5_366 = L5_366.PDrawChars
			L6_367 = A0_361
			L5_366(L6_367)
			L5_366 = _ENV
			L5_366 = L5_366.debug
			if L5_366 then
				L5_366 = print
				L6_367 = "--> TextFX.removeScrollbar(): SCROLLBAR REMOVED."
				L5_366(L6_367)
			end
		end
	end
	function L6_156.hideScrollbar(A0_368)
		local L1_369
		L1_369 = A0_368.Scrollbar
		if L1_369 ~= nil then
			L1_369 = A0_368.Scrollbar
			L1_369.isVisible = false
		end
	end
	function L6_156.showScrollbar(A0_370)
		local L1_371
		L1_371 = A0_370.Scrollbar
		if L1_371 ~= nil then
			L1_371 = A0_370.Scrollbar
			L1_371.isVisible = true
		end
	end
	function L6_156.delete(A0_372)
		_ENV.DeleteText(A0_372)
		local L2_373 = L2_373
	end
	_ENV.PApplyProperties(L6_156, A0_150)
	_ENV.PDrawChars(L6_156)
	if A0_150.parentGroup ~= nil then
		A0_150.parentGroup:insert(L6_156)
	end
	if _ENV.debug then
		print("--> TextFX.CreateText(): TEXT CREATED.")
		local L10_160 = L10_160
	end
	return L6_156
end
L3_3.CreateText = L24_24
function L25_25(A0_374)
	local L1_375, L2_376, L3_377, L4_378, L5_379, L6_380
	L1_375 = A0_374.target
	L2_376 = L1_375.parent
	L2_376 = L2_376.parent
	L3_377 = L2_376.linesToShow
	if L3_377 ~= 0 then
		L3_377 = L2_376.linesToShow
		if L3_377 then
			goto lbl_12
		end
	end
	L3_377 = L2_376.wrappedLines
	L3_377 = #L3_377
	::lbl_12::
	L4_378 = nil
	L5_379 = nil
	L6_380 = nil
	if #L2_376.wrappedLines <= L2_376.linesToShow or L2_376.linesToShow == 0 then
		return true
	end
	if A0_374.phase == "began" then
		L1_375.offY = A0_374.y - L1_375.y
		L1_375.drag = true
		display.getCurrentStage():setFocus(L1_375)
	elseif L1_375.drag == true then
		if A0_374.phase == "moved" then
			y = A0_374.y - L1_375.offY
			if 0 > y then
				y = 0
			elseif y > L1_375.parent.height - L1_375.height then
				y = L1_375.parent.height - L1_375.height
			end
			L1_375.y = y
			L6_380 = L2_376.startLine
			L4_378 = L1_375.y / (L1_375.parent.height - L1_375.height)
			L5_379 = _ENV.Floor(L4_378 * L2_376.maxScroll)
			if L5_379 < 1 then
				L5_379 = 1
			elseif L5_379 > L2_376.maxScroll then
				L5_379 = L2_376.maxScroll
			end
			if L5_379 == L6_380 then
				goto lbl_109
			end
			L2_376:setVisibleLines(L5_379, L3_377)
			local L10_384 = L10_384
			break -- pseudo-goto
		end
		L10_384 = A0_374.phase
		if L10_384 ~= "ended" then
			L10_384 = A0_374.phase
			if L10_384 ~= "cancelled" then
				goto lbl_109
			end
		end
		L10_384 = display
		L10_384 = L10_384.getCurrentStage
		L10_384 = L10_384()
		L10_384 = L10_384.setFocus
		local L8_382 = L8_382
		L10_384(L8_382, nil)
		local L9_383 = L9_383
		repeat
			L1_375.drag = false
		until true
	end
	::lbl_109::
	L10_384 = true
	return L10_384
end
L3_3.PScrollbarTouched = L25_25
function L26_26(A0_385)
	local L5_390 = L5_390
	if A0_385.name ~= "FXText" then
		L5_390 = print
		L5_390("!!! TextFX.DeleteText(): THIS IS NOT A TEXT FX OBJECT.")
		return
	end
	L5_390 = nil
	A0_385:stopMarquee()
	A0_385:removeScrollbar()
	A0_385:removeAnimation()
	A0_385:removeBackground()
	_ENV.PRemoveInOutTransition(A0_385)
	while A0_385[2].numChildren > 0 do
		A0_385[2][1]:removeSelf()
	end
	_FOR_, _FOR_, _FOR_ = ipairs(_ENV.ObjectList)
	for _FORV_5_, _FORV_6_ in _FOR_, _FOR_, _FOR_ do
		if _FORV_6_ == A0_385 then
			table.remove(_ENV.ObjectList, _FORV_5_)
			break
		end
	end
	A0_385.wrappedLines = nil
	A0_385.lineWidths = nil
	A0_385.DeformEffect = nil
	A0_385.setText = nil
	A0_385.getText = nil
	A0_385.getNumLines = nil
	A0_385.getLine = nil
	A0_385.getLineWidth = nil
	A0_385.setOrigin = nil
	A0_385.setTexFlow = nil
	A0_385.setProperties = nil
	A0_385.setProperty = nil
	A0_385.applyDeform = nil
	A0_385.removeDeform = nil
	A0_385.stopInOutTransition = nil
	A0_385.startInOutTransition = nil
	A0_385.applyInOutTransition = nil
	A0_385.removeInOutTransition = nil
	A0_385.startAnimation = nil
	A0_385.stopAnimation = nil
	A0_385.startMarquee = nil
	A0_385.stopMarquee = nil
	A0_385.setScroll = nil
	A0_385.getScroll = nil
	A0_385.scroll = nil
	A0_385.addBackground = nil
	A0_385.removeBackground = nil
	A0_385.setColor = nil
	A0_385.delete = nil
	L8_392 = A0_385
	L7_391 = A0_385.removeSelf
	L7_391(L8_392)
	A0_385 = nil
	L7_391 = _ENV
	L7_391 = L7_391.debug
	if L7_391 then
		L7_391 = print
		L8_392 = "--> TextFX.DeleteText(): TEXT DELETED. REMAINING TEXTS: "
		L9_393 = _ENV
		L9_393 = L9_393.ObjectList
		L9_393 = #L9_393
		L8_392 = L8_392 .. L9_393
		L7_391(L8_392)
	end
end
L3_3.DeleteText = L26_26
function L27_27()
	if _ENV.debug then
		print([[


--> TextFX.DeleteTexts(): DELETING ALL TEXTS...]])
	end
	while #_ENV.ObjectList > 0 do
		_ENV.DeleteText(_ENV.ObjectList[1])
	end
	if _ENV.debug then
		local L0_394 = L0_394
		L0_394([[
--> TextFX.DeleteTexts(): DONE.

]])
		local L1_395 = L1_395
	end
end
L3_3.DeleteTexts = L27_27
function L28_28(A0_396, A1_397, A2_398)
	local L3_399
	L3_399 = _ENV
	local L3_399, L9_405, L10_406, L11_407, L12_408 = L3_399.Charsets, L9_405, L10_406, L11_407, L12_408
	L3_399 = L3_399[A0_396]
	if L3_399 == nil then
		L9_405 = print
		L10_406 = "!!! TextFX.GetLineWidth(): CHARSET "
		L11_407 = A0_396
		L12_408 = " NOT FOUND."
		L10_406 = L10_406 .. L11_407 .. L12_408
		L9_405(L10_406)
		return
	end
	L9_405 = nil
	L10_406 = nil
	L11_407 = nil
	L12_408 = string
	L12_408 = L12_408.len
	L12_408 = L12_408(A1_397)
	if A2_398 == nil then
		A2_398 = 0
	end
	_FOR_ = 1
	for _FORV_12_ = _FOR_, _FOR_, _FOR_ do
		L10_406 = string.sub(A1_397, _FORV_12_, _FORV_12_)
		L11_407 = L3_399.Chars[string.byte(L10_406)]
		if L11_407 == nil then
			local L15_411 = L15_411
			print("!!! TextFX.GetLineWidth(): CHAR '" .. L10_406 .. "' NOT INCLUDED IN CHARSET '" .. A0_396 .. "'!")
		end
		else
			if L10_406 == _ENV.newLineChar then
				break
			end
			L15_411 = L15_411 + L11_407.width
			if true then
			if _FORV_12_ < string.len(A1_397) then
				L15_411 = L15_411 + A2_398
				goto lbl_65
				break
			end
		end
		::lbl_65::
	end
	return L15_411
end
L3_3.GetLineWidth = L28_28
function L29_29(A0_415)
	local L1_416, L2_417, L3_418, L4_419
	L4_419 = 0
	if A0_415.InOutEffect ~= nil and A0_415.InOutEffect.restoreOnComplete == true then
		A0_415.origVisible = A0_415.isVisible
		A0_415.origAlpha = A0_415.alpha
		A0_415.origXScale = A0_415.xScale
		A0_415.origYScale = A0_415.yScale
		A0_415.origRot = A0_415.rotation
		A0_415.origX = A0_415.x
		A0_415.origY = A0_415.y
	end
	_ENV.PStopInOutTransition(A0_415)
	if A0_415.InOutEffect.AnimateFrom ~= nil then
		L1_416 = A0_415.InOutEffect.AnimateFrom
		if A0_415.InOutEffect.inMode == "RANDOM" then
			repeat
				L8_423 = L8_423 + _ENV.Ceil(_ENV.Rnd() * (A0_415[2].numChildren * A0_415.InOutEffect.inCharDelay) - A0_415.InOutEffect.inCharDelay)
				L1_416.delay = L8_423
				L3_418 = 0
				do break end -- pseudo-goto
				L8_423 = A0_415.InOutEffect
				L8_423 = L8_423.inMode
				if L8_423 == "LEFT_RIGHT" then
					L8_423 = A0_415.InOutEffect
					L8_423 = L8_423.inDelay
					L1_416.delay = L8_423
					L8_423 = A0_415.InOutEffect
					L3_418 = L8_423.inCharDelay
				else
					L8_423 = A0_415.InOutEffect
					L8_423 = L8_423.inMode
					if L8_423 == "RIGHT_LEFT" then
						L8_423 = A0_415.InOutEffect
						L8_423 = L8_423.inDelay
						L8_423 = L8_423 + A0_415[2].numChildren * A0_415.InOutEffect.inCharDelay
						L8_423 = L8_423 - A0_415.InOutEffect.inCharDelay
						L1_416.delay = L8_423
						L8_423 = A0_415.InOutEffect
						L8_423 = L8_423.inCharDelay
						L3_418 = -L8_423
					else
						L8_423 = A0_415.InOutEffect
						L8_423 = L8_423.inDelay
						L1_416.delay = L8_423
					end
				end
			until true
		end
		L8_423 = A0_415.InOutEffect
		L8_423 = L8_423.inMode
		if L8_423 == "ALL" then
			L8_423 = A0_415.InOutEffect
			L8_423 = L8_423.hideCharsBefore
			L8_423 = not L8_423
			A0_415.isVisible = L8_423
			function L8_423()
				_ENV.isVisible = true
				if _ENV.InOutEffect.InSound ~= nil then
					local L0_429 = L0_429
					local L1_430 = L1_430
					;({}).channel = 0
					;({}).loop = 0
					L0_429(L1_430, {})
					local L2_431 = L2_431
				end
			end
			L1_416.onStart = L8_423
			function L8_423()
				local L0_432, L1_433
				L0_432 = _ENV
				L0_432.TransIn = nil
			end
			L1_416.onComplete = L8_423
			L8_423 = transition
			L8_423 = L8_423.from
			L8_423 = L8_423(A0_415, L1_416)
			A0_415.TransIn = L8_423
			L8_423 = A0_415.InOutEffect
			L8_423 = L8_423.inDelay
			L4_419 = L8_423 + L1_416.time
		else
			L8_423 = 1
			_FOR_ = 1
			for _FORV_8_ = L8_423, _FOR_, _FOR_ do
				A0_415[2][_FORV_8_].isVisible = not A0_415.InOutEffect.hideCharsBefore
				function L1_416.onStart()
					_ENV[2][_UPVALUE1_].isVisible = true
					if _ENV.InOutEffect.InSound ~= nil then
						local L0_434 = L0_434
						local L1_435 = L1_435
						;({}).channel = 0
						;({}).loop = 0
						L0_434(L1_435, {})
						local L2_436 = L2_436
					end
				end
				function L1_416.onComplete()
					local L0_437, L1_438
					L0_437 = _ENV
					L0_437 = L0_437[2]
					L1_438 = _UPVALUE1_
					L0_437 = L0_437[L1_438]
					L0_437.TransIn = nil
				end
				A0_415[2][_FORV_8_].TransIn = transition.from(A0_415[2][_FORV_8_], L1_416)
				if A0_415.InOutEffect.inMode == "RANDOM" then
					L1_416.delay = A0_415.InOutEffect.inDelay + _ENV.Ceil(_ENV.Rnd() * (A0_415[2].numChildren * A0_415.InOutEffect.inCharDelay) - A0_415.InOutEffect.inCharDelay)
				else
					L1_416.delay = L1_416.delay + L3_418
				end
			end
			L8_423 = A0_415.InOutEffect
			L8_423 = L8_423.inDelay
			L8_423 = L8_423 + A0_415[2].numChildren * A0_415.InOutEffect.inCharDelay
			L4_419 = L8_423 + L1_416.time
		end
	end
	L8_423 = A0_415.InOutEffect
	L8_423 = L8_423.AnimateTo
	if L8_423 ~= nil then
		L8_423 = A0_415.InOutEffect
		L1_416 = L8_423.AnimateTo
		L8_423 = A0_415.InOutEffect
		L8_423 = L8_423.outMode
		if L8_423 == "RANDOM" then
			L8_423 = A0_415.InOutEffect
			L8_423 = L8_423.outDelay
			L8_423 = L4_419 + L8_423
			L8_423 = L8_423 + (A0_415[2].numChildren * A0_415.InOutEffect.outCharDelay + L1_416.time)
			L1_416.delay = L8_423
			L3_418 = 0
		else
			L8_423 = A0_415.InOutEffect
			L8_423 = L8_423.outMode
			if L8_423 == "LEFT_RIGHT" then
				L8_423 = A0_415.InOutEffect
				L8_423 = L8_423.outDelay
				L8_423 = L4_419 + L8_423
				L1_416.delay = L8_423
				L8_423 = A0_415.InOutEffect
				L3_418 = L8_423.outCharDelay
			else
				L8_423 = A0_415.InOutEffect
				L8_423 = L8_423.outMode
				if L8_423 == "RIGHT_LEFT" then
					L8_423 = A0_415.InOutEffect
					L8_423 = L8_423.outDelay
					L8_423 = L4_419 + L8_423
					L8_423 = L8_423 + A0_415[2].numChildren * A0_415.InOutEffect.outCharDelay
					L8_423 = L8_423 - A0_415.InOutEffect.outCharDelay
					L1_416.delay = L8_423
					L8_423 = A0_415.InOutEffect
					L8_423 = L8_423.outCharDelay
					L3_418 = -L8_423
				else
					L8_423 = A0_415.InOutEffect
					L8_423 = L8_423.outDelay
					L8_423 = L4_419 + L8_423
					L1_416.delay = L8_423
				end
			end
		end
		L8_423 = A0_415.InOutEffect
		L8_423 = L8_423.outMode
		if L8_423 == "ALL" then
			function L8_423()
				if _ENV.InOutEffect.OutSound ~= nil then
					local L0_439 = L0_439
					local L1_440 = L1_440
					;({}).channel = 0
					;({}).loop = 0
					L0_439(L1_440, {})
					local L2_441 = L2_441
				end
			end
			L1_416.onStart = L8_423
			function L8_423()
				local L0_442, L1_443
				L0_442 = _ENV
				L0_442.TransOut = nil
				L0_442 = _ENV
				L1_443 = _ENV
				L1_443 = L1_443.InOutEffect
				L1_443 = L1_443.hideCharsAfter
				L1_443 = not L1_443
				L0_442.isVisible = L1_443
			end
			L1_416.onComplete = L8_423
			L8_423 = transition
			L8_423 = L8_423.to
			L8_423 = L8_423(A0_415, L1_416)
			A0_415.TransOut = L8_423
			L8_423 = L1_416.delay
			L4_419 = L8_423 + L1_416.time
		else
			L8_423 = 1
			_FOR_ = 1
			for _FORV_8_ = L8_423, _FOR_, _FOR_ do
				function L1_416.onStart()
					if _ENV.InOutEffect.OutSound ~= nil then
						local L0_444 = L0_444
						local L1_445 = L1_445
						;({}).channel = 0
						;({}).loop = 0
						L0_444(L1_445, {})
						local L2_446 = L2_446
					end
				end
				function L1_416.onComplete()
					local L0_447, L1_448
					L0_447 = _ENV
					L0_447 = L0_447[2]
					L1_448 = _UPVALUE1_
					L0_447 = L0_447[L1_448]
					L0_447.TransOut = nil
					L0_447 = _ENV
					L0_447 = L0_447[2]
					L1_448 = _UPVALUE1_
					L0_447 = L0_447[L1_448]
					L1_448 = _ENV
					L1_448 = L1_448.InOutEffect
					L1_448 = L1_448.hideCharsAfter
					L1_448 = not L1_448
					L0_447.isVisible = L1_448
				end
				A0_415[2][_FORV_8_].TransOut = transition.to(A0_415[2][_FORV_8_], L1_416)
				if A0_415.InOutEffect.outMode == "RANDOM" then
					L1_416.delay = L4_419 + A0_415.InOutEffect.outDelay + _ENV.Ceil(_ENV.Rnd() * (A0_415[2].numChildren * A0_415.InOutEffect.outCharDelay) - A0_415.InOutEffect.outCharDelay)
					break -- pseudo-goto
				end
				L1_416.delay = L1_416.delay + L3_418
				repeat
				until true
			end
			L8_423 = A0_415.InOutEffect
			L8_423 = L8_423.outDelay
			L8_423 = L4_419 + L8_423
			L13_428 = A0_415[2]
			L13_428 = L13_428.numChildren
			L13_428 = L13_428 * A0_415.InOutEffect.outCharDelay
			L8_423 = L8_423 + L13_428
			L13_428 = L1_416.time
			L4_419 = L8_423 + L13_428
		end
	end
	L8_423 = A0_415.InOutEffect
	L8_423 = L8_423.autoRemoveText
	if L8_423 == true then
		L8_423 = timer
		L8_423 = L8_423.performWithDelay
		L13_428 = L4_419
		L8_423 = L8_423(L13_428, function()
			if _ENV.InOutEffect.CompleteListener ~= nil then
				({}).name = "transitionComplete"
				;({}).target = _ENV
				local L2_451 = L2_451
				Runtime:dispatchEvent({})
				local L3_452 = L3_452
			end
			L2_451 = _ENV
			L3_452 = L2_451
			L2_451 = L2_451.delete
			L2_451(L3_452)
		end)
		A0_415.InOutTimer = L8_423
	else
		L8_423 = A0_415.InOutEffect
		L8_423 = L8_423.loop
		if L8_423 == true then
			L8_423 = timer
			L8_423 = L8_423.performWithDelay
			L13_428 = L4_419
			L8_423 = L8_423(L13_428, function()
				if _ENV.InOutEffect.CompleteListener ~= nil then
					({}).name = "transitionComplete"
					;({}).target = _ENV
					local L2_455 = L2_455
					Runtime:dispatchEvent({})
					local L3_456 = L3_456
				end
				L2_455 = _ENV
				L2_455 = L2_455.PDrawChars
				L3_456 = _ENV
				L2_455(L3_456)
				L2_455 = _ENV
				L2_455 = L2_455.InOutEffect
				L2_455 = L2_455.restartOnChange
				if L2_455 == false then
					L2_455 = _ENV
					L2_455 = L2_455.PStartInOutTransition
					L3_456 = _ENV
					L2_455(L3_456)
				end
			end)
			A0_415.InOutTimer = L8_423
		else
			L8_423 = timer
			L8_423 = L8_423.performWithDelay
			L13_428 = L4_419
			L8_423 = L8_423(L13_428, function()
				local L0_457
				L0_457 = _ENV
				L0_457 = L0_457.InOutEffect
				L0_457 = L0_457.CompleteListener
				if L0_457 ~= nil then
					L0_457 = {}
					L0_457.name = "transitionComplete"
					L0_457.target = _ENV
					local L1_458, L2_459 = L1_458, L2_459
					L1_458(L2_459, L0_457)
					local L3_460 = L3_460
				end
			end)
			A0_415.InOutTimer = L8_423
		end
	end
end
L3_3.PStartInOutTransition = L29_29
function L30_30(A0_461)
	local L1_462, L2_463
	if A0_461.TransIn ~= nil then
		L7_468 = transition
		L7_468 = L7_468.cancel
		L7_468(A0_461.TransIn)
		L7_468 = A0_461.TransIn
		L7_468 = L7_468._keysFinish
		if L7_468 ~= nil then
			L7_468 = pairs
			L7_468, _FOR_, _FOR_ = L7_468(A0_461.TransIn._keysFinish)
			for _FORV_6_, _FORV_7_ in L7_468, _FOR_, _FOR_ do
				A0_461[_FORV_6_] = _FORV_7_
			end
		end
		A0_461.TransIn = nil
	end
	L7_468 = A0_461.TransOut
	if L7_468 ~= nil then
		L7_468 = transition
		L7_468 = L7_468.cancel
		L7_468(A0_461.TransOut)
		L7_468 = A0_461.TransOut
		L7_468 = L7_468._keysFinish
		if L7_468 ~= nil then
			L7_468 = pairs
			L7_468, _FOR_, _FOR_ = L7_468(A0_461.TransOut._keysFinish)
			for _FORV_6_, _FORV_7_ in L7_468, _FOR_, _FOR_ do
				A0_461[_FORV_6_] = _FORV_7_
			end
		end
		A0_461.TransOut = nil
	end
	L7_468 = A0_461.InOutEffect
	if L7_468 ~= nil then
		L7_468 = A0_461.InOutEffect
		L7_468 = L7_468.restoreOnComplete
		if L7_468 == true then
			L7_468 = A0_461.origVisible
			if L7_468 ~= nil then
				L7_468 = A0_461.origVisible
				A0_461.isVisible = L7_468
			end
			L7_468 = A0_461.origAlpha
			if L7_468 ~= nil then
				L7_468 = A0_461.origAlpha
				A0_461.alpha = L7_468
			end
			L7_468 = A0_461.origXScale
			if L7_468 ~= nil then
				L7_468 = A0_461.origXScale
				A0_461.xScale = L7_468
			end
			L7_468 = A0_461.origYScale
			if L7_468 ~= nil then
				L7_468 = A0_461.origYScale
				A0_461.yScale = L7_468
			end
			L7_468 = A0_461.origRot
			if L7_468 ~= nil then
				L7_468 = A0_461.origRot
				A0_461.rotation = L7_468
			end
			L7_468 = A0_461.origX
			if L7_468 ~= nil then
				L7_468 = A0_461.origX
				A0_461.x = L7_468
			end
			L7_468 = A0_461.origY
			if L7_468 ~= nil then
				L7_468 = A0_461.origY
				A0_461.y = L7_468
			end
		end
	end
	L7_468 = nil
	_FOR_ = 1
	for _FORV_7_ = _FOR_, _FOR_, _FOR_ do
		if A0_461[2][_FORV_7_].TransIn ~= nil then
			transition.cancel(A0_461[2][_FORV_7_].TransIn)
			A0_461[2][_FORV_7_].TransIn = nil
		end
		if A0_461[2][_FORV_7_].TransOut ~= nil then
			transition.cancel(A0_461[2][_FORV_7_].TransOut)
			A0_461[2][_FORV_7_].TransOut = nil
		end
	end
	L6_467 = A0_461.InOutTimer
	if L6_467 ~= nil then
		L6_467 = timer
		L6_467 = L6_467.cancel
		L9_470 = A0_461.InOutTimer
		L6_467(L9_470)
		A0_461.InOutTimer = nil
	end
end
L3_3.PStopInOutTransition = L30_30
function L31_31(A0_471)
	local L7_478, L8_479 = _ENV.PStopInOutTransition, L8_479
	L8_479 = A0_471
	L7_478(L8_479)
	L7_478 = nil
	L8_479 = nil
	if A0_471.InOutEffect ~= nil then
		if A0_471.InOutEffect.CompleteListener ~= nil then
			L5_476(Runtime, "transitionComplete", A0_471.InOutEffect.CompleteListener)
		end
		L5_476 = pairs
		L6_477 = A0_471.InOutEffect
		L5_476, L6_477, _FOR_ = L5_476(L6_477)
		for _FORV_6_, _FORV_7_ in L5_476, L6_477, _FOR_ do
			A0_471.InOutEffect[_FORV_6_] = nil
		end
		A0_471.InOutEffect = nil
	end
end
L3_3.PRemoveInOutTransition = L31_31
function L32_32(A0_480, A1_481)
	local L2_482, L3_483
	L2_482 = A0_480.text
	L3_483 = _ENV
	L3_483 = L3_483.Charsets
	L3_483 = L3_483[A1_481.fontName]
	if L3_483.charSpacing ~= nil then
		A0_480.charSpacing = L3_483.charSpacing
	end
	if L3_483.lineSpacing ~= nil then
		A0_480.lineSpacing = L3_483.lineSpacing
	end
	if A1_481.fontName ~= nil then
		A0_480.fontName = A1_481.fontName
	end
	if A1_481.text ~= nil then
		A0_480.text = A1_481.text
	end
	if A1_481.originX ~= nil then
		A0_480.originX = string.upper(A1_481.originX)
	end
	if A1_481.originY ~= nil then
		A0_480.originY = string.upper(A1_481.originY)
	end
	if A1_481.textFlow ~= nil then
		local L4_484 = L4_484
		local L4_484, L5_485 = L4_484(A1_481.textFlow), L5_485
		A0_480.textFlow = L4_484
	end
	L4_484 = A1_481.wrapWidth
	if L4_484 ~= nil then
		L4_484 = A1_481.wrapWidth
		A0_480.wrapWidth = L4_484
	end
	L4_484 = A1_481.charSpacing
	if L4_484 ~= nil then
		L4_484 = A1_481.charSpacing
		A0_480.charSpacing = L4_484
	end
	L4_484 = A1_481.lineSpacing
	if L4_484 ~= nil then
		L4_484 = A1_481.lineSpacing
		A0_480.lineSpacing = L4_484
	end
	L4_484 = A1_481.showOrigin
	if L4_484 ~= nil then
		L4_484 = A1_481.showOrigin
		A0_480.showOrigin = L4_484
	end
	L4_484 = A1_481.x
	if L4_484 ~= nil then
		L4_484 = A1_481.x
		A0_480.x = L4_484
	end
	L4_484 = A1_481.y
	if L4_484 ~= nil then
		L4_484 = A1_481.y
		A0_480.y = L4_484
	end
	L4_484 = A1_481.startLine
	if L4_484 ~= nil then
		L4_484 = A1_481.startLine
		A0_480.startLine = L4_484
	end
	L4_484 = A1_481.linesToShow
	if L4_484 ~= nil then
		L4_484 = A1_481.linesToShow
		A0_480.linesToShow = L4_484
	end
	L4_484 = A1_481.Color
	if L4_484 ~= nil then
		L4_484 = A1_481.Color
		A0_480.Color = L4_484
	end
	L4_484 = A1_481.fontSize
	if L4_484 ~= nil then
		L4_484 = A1_481.fontSize
		A0_480.fontSize = L4_484
	end
	L4_484 = A1_481.shadowOffX
	if L4_484 ~= nil then
		L4_484 = A1_481.shadowOffX
		A0_480.shadowOffX = L4_484
	end
	L4_484 = A1_481.shadowOffY
	if L4_484 ~= nil then
		L4_484 = A1_481.shadowOffY
		A0_480.shadowOffY = L4_484
	end
	L4_484 = A1_481.shadowAlpha
	if L4_484 ~= nil then
		L4_484 = A1_481.shadowAlpha
		A0_480.shadowAlpha = L4_484
	end
	L4_484 = A1_481.fixedWidth
	if L4_484 ~= nil then
		L4_484 = A1_481.fixedWidth
		A0_480.fixedWidth = L4_484
	end
	L4_484 = A1_481.fixedHeight
	if L4_484 ~= nil then
		L4_484 = A1_481.fixedHeight
		A0_480.fixedHeight = L4_484
	end
	L4_484 = A1_481.charBaseLine
	if L4_484 ~= nil then
		L4_484 = A1_481.charBaseLine
		if L4_484 == "TOP" then
			A0_480.charBaseLine = 1
		else
			L4_484 = A1_481.charBaseLine
			if L4_484 == "BOTTOM" then
				A0_480.charBaseLine = -1
			else
				A0_480.charBaseLine = 0
			end
		end
	end
	L4_484 = A0_480.text
	if L4_484 == nil then
		A0_480.text = ""
	end
	L4_484 = A0_480.originX
	if L4_484 == nil then
		A0_480.originX = "CENTER"
	end
	L4_484 = A0_480.originY
	if L4_484 == nil then
		A0_480.originY = "CENTER"
	end
	L4_484 = A0_480.textFlow
	if L4_484 == nil then
		A0_480.textFlow = "LEFT"
	end
	L4_484 = A0_480.wrapWidth
	if L4_484 == nil then
		A0_480.wrapWidth = 0
	end
	L4_484 = A0_480.showOrigin
	if L4_484 == nil then
		A0_480.showOrigin = false
	end
	L4_484 = A0_480.startLine
	if L4_484 == nil then
		A0_480.startLine = 1
	end
	L4_484 = A0_480.linesToShow
	if L4_484 == nil then
		A0_480.linesToShow = 0
	end
	L4_484 = A0_480.fontSize
	if L4_484 == nil then
		L4_484 = _ENV
		L4_484 = L4_484.Charsets
		L5_485 = A0_480.fontName
		L4_484 = L4_484[L5_485]
		L4_484 = L4_484.fontSize
		A0_480.fontSize = L4_484
	end
	L4_484 = A0_480.shadowOffX
	if L4_484 == nil then
		A0_480.shadowOffX = 0
	end
	L4_484 = A0_480.shadowOffY
	if L4_484 == nil then
		A0_480.shadowOffY = 0
	end
	L4_484 = A0_480.shadowAlpha
	if L4_484 == nil then
		A0_480.shadowAlpha = 128
	end
	L4_484 = A0_480.charSpacing
	if L4_484 == nil then
		A0_480.charSpacing = 0
	end
	L4_484 = A0_480.lineSpacing
	if L4_484 == nil then
		A0_480.lineSpacing = 0
	end
	L4_484 = A0_480.charBaseLine
	if L4_484 == nil then
		A0_480.charBaseLine = 0
	end
	L4_484 = A0_480.fixedWidth
	if L4_484 == nil then
		A0_480.fixedWidth = 0
	end
	L4_484 = A0_480.fixedHeight
	if L4_484 == nil then
		A0_480.fixedHeight = 0
	end
	L4_484 = A0_480.Color
	if L4_484 ~= nil then
		L4_484 = A0_480.Color
		L4_484 = L4_484[4]
		if L4_484 == nil then
			L4_484 = A0_480.Color
			L4_484[4] = 255
		end
	end
end
L3_3.PApplyProperties = L32_32
function L3_3.PDrawChars(A0_486)
	local L6_492, L7_493, L8_494, L9_495, L10_496, L11_497, L12_498, L13_499, L14_500, L15_501, L16_502, L17_503 = L6_492, L7_493, L8_494, L9_495, L10_496, L11_497, L12_498, L13_499, L14_500, L15_501, L16_502, L17_503
	if A0_486.name ~= "FXText" then
		L6_492 = print
		L7_493 = "!!! TextFX._DrawChars(): THIS IS NOT A TEXT FX OBJECT."
		L6_492(L7_493)
		return
	end
	L6_492 = _ENV
	L6_492 = L6_492.Charsets
	L7_493 = A0_486.fontName
	L6_492 = L6_492[L7_493]
	if L6_492 == nil then
		L7_493 = print
		L8_494 = "!!! TextFX._DrawChars(): CHARSET "
		L9_495 = A0_486.fontName
		L10_496 = " NOT FOUND."
		L8_494 = L8_494 .. L9_495 .. L10_496
		L7_493(L8_494)
		return
	end
	L7_493 = nil
	L8_494 = nil
	L9_495 = nil
	L10_496 = nil
	L11_497 = nil
	L12_498 = nil
	L13_499 = nil
	L14_500 = nil
	L15_501 = nil
	L16_502 = nil
	L17_503 = nil
	A0_486:stopAnimation()
	_ENV.PStopInOutTransition(A0_486)
	while 0 < A0_486[2].numChildren do
		A0_486[2][1]:removeSelf()
	end
	local L18_504 = L18_504
	_ENV.PSetWrappedTextData(A0_486)
	if A0_486.originX == "CENTER" then
	elseif A0_486.originX == "RIGHT" then
	end
	if A0_486.originY == "CENTER" then
	elseif A0_486.originY == "BOTTOM" then
	end
	_FOR_ = 1
	for _FORV_22_ = _FOR_, _FOR_, _FOR_ do
		L12_498 = string.len(A0_486.wrappedLines[_FORV_22_])
		L13_499, L14_500 = -A0_486.maxLineWidth, -A0_486.totalHeight + (0 + 1 - 1) * (L6_492.lineHeight + A0_486.lineSpacing)
		if A0_486.textFlow == "CENTER" then
			L13_499 = L13_499 + (A0_486.maxLineWidth - A0_486.lineWidths[_FORV_22_]) * 0.5
		elseif A0_486.textFlow == "RIGHT" then
			L13_499 = L13_499 + (A0_486.maxLineWidth - A0_486.lineWidths[_FORV_22_])
		end
		if A0_486.wrappedLines[_FORV_22_] == "" then
			L11_497 = display.newRect(0, 0, 4, L6_492.Chars[32].height)
			L11_497:setFillColor(0, 0, 0, 0)
			local L26_512 = L26_512
			L11_497:setStrokeColor(0, 0, 0, 0)
			L11_497.yReference = -L6_492.Chars[32].offY
			L11_497.xScale = L6_492.scale
			L11_497.yScale = L6_492.scale
			L11_497.x = L13_499 + 2
			L11_497.y = L14_500 + A0_486.charBaseLine * L6_492.Chars[32].height * 0.5
			L11_497.isEmptyLine = true
			if A0_486.charBaseLine == 0 then
				L11_497.y = L11_497.y + L6_492.lineHeight * 0.5
			elseif A0_486.charBaseLine == -1 then
				L11_497.y = L11_497.y + L6_492.lineHeight * 1
			end
			A0_486[2]:insert(L11_497)
		end
		_FOR_ = 1
		for _FORV_26_ = _FOR_, _FOR_, _FOR_ do
			L7_493 = string.sub(A0_486.wrappedLines[_FORV_22_], _FORV_26_, _FORV_26_)
			L8_494 = string.byte(L7_493)
			L18_504 = L6_492.Chars[L8_494]
			if L18_504 == nil then
				print("!!! TextFX._DrawChars(): CHAR '" .. L7_493 .. "' NOT INCLUDED IN CHARSET '" .. A0_486.fontName .. "'!")
			else
				if L8_494 ~= 32 then
					if L6_492.isVector then
						if A0_486.shadowOffX ~= 0 or A0_486.shadowOffY ~= 0 then
							L17_503 = -L18_504.height * 0.5
							L11_497 = display.newGroup()
							L26_512 = display.newText(L7_493, A0_486.shadowOffX, L17_503 + A0_486.shadowOffY, L6_492.name, A0_486.fontSize * L6_492.scale)
							L26_512:setTextColor(0, 0, 0, A0_486.shadowAlpha)
							L11_497:insert(L26_512)
							L26_512 = display.newText(L7_493, 0, L17_503, L6_492.name, A0_486.fontSize * L6_492.scale)
							if A0_486.Color ~= nil then
								L26_512:setTextColor(A0_486.Color[1], A0_486.Color[2], A0_486.Color[3], A0_486.Color[4])
							end
							L11_497:insert(L26_512)
						else
							local L33_519 = L33_519
							L11_497 = display.newText(L7_493, 0, 0, L6_492.name, A0_486.fontSize * L6_492.scale)
							if A0_486.Color == nil then
								goto lbl_313
							end
							L11_497:setTextColor(A0_486.Color[1], A0_486.Color[2], A0_486.Color[3], A0_486.Color[4])
							do break end -- pseudo-goto
							L11_497 = sprite.newSprite(L6_492.Set)
							L11_497.currentFrame = L18_504.frame
							if A0_486.Color ~= nil then
								local L31_517 = L31_517
								L11_497:setFillColor(A0_486.Color[1], A0_486.Color[2], A0_486.Color[3], A0_486.Color[4])
								local L32_518 = L32_518
							end
						end
					end
					::lbl_313::
					repeat
					until true
					L11_497.name = "FXChar"
					L11_497.index = _FORV_26_
					L11_497.char = L7_493
					L11_497.charNum = L8_494
					L11_497.spaceBefore = L33_519
					L11_497.yReference = -L18_504.offY
					L11_497.xScale = L6_492.scale
					L11_497.yScale = L6_492.scale
					L11_497.x = L13_499 + L18_504.width * 0.5
					L11_497.y = L14_500 + A0_486.charBaseLine * L18_504.height * 0.5
					if A0_486.charBaseLine == 0 then
						L11_497.y = L11_497.y + L6_492.lineHeight * 0.5
					elseif A0_486.charBaseLine == -1 then
						L11_497.y = L11_497.y + L6_492.lineHeight * 1
					end
					A0_486[2]:insert(L11_497)
					repeat
						L33_519 = false
						do break end -- pseudo-goto
						L33_519 = true
					until true
				end
				L13_499 = L13_499 + L18_504.width + A0_486.charSpacing
			end
		end
	end
	if A0_486.showOrigin ~= true or not true then
	end
	A0_486[3].isVisible = false
	if A0_486[1][1] ~= nil then
		L13_499, L14_500 = A0_486[2]:contentToLocal(A0_486[2].contentBounds.xMin - A0_486[1][1].marginX, A0_486[2].contentBounds.yMin - A0_486[1][1].marginY)
		A0_486[1][1].x = L13_499 + A0_486[1][1].offX
		A0_486[1][1].y = L14_500 + A0_486[1][1].offY
		if 0 < A0_486.fixedHeight then
			A0_486[1][1].yScale = (A0_486.fixedHeight + A0_486[1][1].marginY * 2) / A0_486[1][1].height
		else
			A0_486[1][1].yScale = (A0_486[2].height + A0_486[1][1].marginY * 2) / A0_486[1][1].height
		end
		if 0 < A0_486.fixedWidth then
			A0_486[1][1].xScale = (A0_486.fixedWidth + A0_486[1][1].marginX * 2) / A0_486[1][1].width
		elseif A0_486.Scrollbar ~= nil then
			A0_486[1][1].xScale = (A0_486.maxLineWidth + A0_486[1][1].marginX + A0_486.Scrollbar.width + A0_486.Scrollbar.xOffset) / A0_486[1][1].width
		else
			A0_486[1][1].xScale = (A0_486.maxLineWidth + A0_486[1][1].marginX * 2) / A0_486[1][1].width
		end
	end
	if A0_486.Scrollbar ~= nil then
		if 0 < A0_486.fixedHeight then
		end
		if A0_486.Scrollbar.autoHide == true and #A0_486.wrappedLines <= A0_486.linesToShow or A0_486.linesToShow == 0 then
			A0_486.Scrollbar.isVisible = false
		else
			A0_486.Scrollbar.isVisible = true
		end
		if 0 < A0_486.fixedWidth then
			L13_499 = A0_486[2].contentBounds.xMin + (A0_486.fixedWidth - A0_486.Scrollbar.Frame.width * 0.5) * A0_486.xScale
		else
			L13_499 = A0_486[2].contentBounds.xMin + (A0_486.maxLineWidth + A0_486.Scrollbar.xOffset) * A0_486.xScale
		end
		A0_486.Scrollbar.x, A0_486.Scrollbar.y = A0_486[2]:contentToLocal(L13_499, A0_486[2].contentBounds.yMin)
		if A0_486.Scrollbar.Frame then
			A0_486.Scrollbar.Frame.x = 0
			A0_486.Scrollbar.Frame.y = 0
			if A0_486.Scrollbar.FrameBottom then
			end
			if A0_486.Scrollbar.FrameTop then
				A0_486.Scrollbar.Frame.y = A0_486.Scrollbar.FrameTop.height
			end
			A0_486.Scrollbar.Frame.yScale = (A0_486.fixedHeight - A0_486.Scrollbar.FrameBottom.height - A0_486.Scrollbar.FrameTop.height) / A0_486.Scrollbar.Frame.height
		end
		if A0_486.Scrollbar.FrameBottom then
			A0_486.Scrollbar.FrameBottom.x = 0
			A0_486.Scrollbar.FrameBottom.y = A0_486.fixedHeight
		end
		A0_486.Scrollbar.Button.x = 0
		A0_486.Scrollbar.Button.y = 0
		if A0_486.Scrollbar.ButtonTop then
			A0_486.Scrollbar.Button.y = A0_486.Scrollbar.ButtonTop.height
		end
		if A0_486.Scrollbar.scaleButton == true then
			if A0_486.Scrollbar.ButtonBottom then
			end
			if A0_486.Scrollbar.ButtonTop then
				A0_486.Scrollbar.Button.y = A0_486.Scrollbar.ButtonTop.height
			end
			A0_486.Scrollbar.Button.yScale = (A0_486.fixedHeight * (A0_486.linesToShow / #A0_486.wrappedLines) - A0_486.Scrollbar.ButtonBottom.height - A0_486.Scrollbar.ButtonTop.height) / A0_486.Scrollbar.Button.oHeight
		end
		if A0_486.Scrollbar.ButtonBottom then
			A0_486.Scrollbar.ButtonBottom.x = 0
			A0_486.Scrollbar.ButtonBottom.y = A0_486.Scrollbar.Button.y + (A0_486.fixedHeight * (A0_486.linesToShow / #A0_486.wrappedLines) - A0_486.Scrollbar.ButtonBottom.height - A0_486.Scrollbar.ButtonTop.height)
		end
	end
	if A0_486.DeformEffect ~= nil then
		_ENV.PDoDeform(A0_486)
	end
	if A0_486.InOutEffect ~= nil and A0_486.InOutEffect.restartOnChange == true then
		_ENV.PStartInOutTransition(A0_486)
	end
	if A0_486.AnimEffect ~= nil and A0_486.AnimEffect.restartOnChange == true then
		A0_486:startAnimation()
	end
end
function L3_3.PDoDeform(A0_520)
	local L1_521, L2_522, L3_523, L4_524, L5_525, L6_526, L7_527
	repeat
		L7_527 = A0_520.DeformEffect
		L10_530 = L7_527.type
		L11_531 = _ENV
		L11_531 = L11_531.DEFORM_SHAKE
		if L10_530 == L11_531 then
			L10_530 = math
			L10_530 = L10_530.randomseed
			L11_531 = 1
			L10_530(L11_531)
			L10_530 = 1
			L11_531 = A0_520[2]
			L11_531 = L11_531.numChildren
			_FOR_ = 1
			for _FORV_11_ = L10_530, L11_531, _FOR_ do
				L4_524 = -(L7_527.scaleVariation * 0.5) + _ENV.Rnd() * L7_527.scaleVariation
				A0_520[2][_FORV_11_].rotation = A0_520[2][_FORV_11_].rotation - L7_527.angleVariation * 0.5 + _ENV.Rnd() * L7_527.angleVariation
				A0_520[2][_FORV_11_].xScale = A0_520[2][_FORV_11_].xScale + L4_524
				A0_520[2][_FORV_11_].yScale = A0_520[2][_FORV_11_].yScale + L4_524
				A0_520[2][_FORV_11_].x = A0_520[2][_FORV_11_].x - L7_527.xVariation * 0.5 + _ENV.Rnd() * L7_527.xVariation
				A0_520[2][_FORV_11_].y = A0_520[2][_FORV_11_].y - L7_527.yVariation * 0.5 + _ENV.Rnd() * L7_527.yVariation
			end
			break -- pseudo-goto
		end
		L10_530 = L7_527.type
		L11_531 = _ENV
		L11_531 = L11_531.DEFORM_WAVE_Y
		if L10_530 == L11_531 then
			L10_530 = 1
			L11_531 = A0_520[2]
			L11_531 = L11_531.numChildren
			_FOR_ = 1
			for _FORV_11_ = L10_530, L11_531, _FOR_ do
				A0_520[2][_FORV_11_].y = A0_520[2][_FORV_11_].y + _ENV.Sin(A0_520[2][_FORV_11_].x / L7_527.frequency) * L7_527.amplitude
			end
			break -- pseudo-goto
		end
		L10_530 = L7_527.type
		L11_531 = _ENV
		L11_531 = L11_531.DEFORM_WAVE_SCALE
		if L10_530 == L11_531 then
			L10_530 = 1
			L11_531 = A0_520[2]
			L11_531 = L11_531.numChildren
			L16_536 = 1
			for _FORV_11_ = L10_530, L11_531, L16_536 do
				L4_524 = L7_527.minScale + _ENV.Sin(A0_520[2][_FORV_11_].x / L7_527.frequency) * L7_527.amplitude
				if L7_527.scaleX then
					A0_520[2][_FORV_11_].xScale = A0_520[2][_FORV_11_].xScale + L4_524
				end
				if L7_527.scaleY then
					A0_520[2][_FORV_11_].yScale = A0_520[2][_FORV_11_].yScale + L4_524
				end
			end
			break -- pseudo-goto
		end
		L10_530 = L7_527.type
		L11_531 = _ENV
		L11_531 = L11_531.DEFORM_MIRROR
		if L10_530 == L11_531 then
			L10_530 = 1
			L11_531 = A0_520[2]
			L11_531 = L11_531.numChildren
			L16_536 = 1
			for _FORV_11_ = L10_530, L11_531, L16_536 do
				if L7_527.mirrorX then
					A0_520[2][_FORV_11_].xScale = A0_520[2][_FORV_11_].xScale * -1
				end
				if L7_527.mirrorY then
					A0_520[2][_FORV_11_].yScale = A0_520[2][_FORV_11_].yScale * -1
				end
			end
		else
			L10_530 = L7_527.type
			L11_531 = _ENV
			L11_531 = L11_531.DEFORM_ZIGZAG
			if L10_530 == L11_531 then
				L10_530 = 1
				L11_531 = A0_520[2]
				L11_531 = L11_531.numChildren
				L16_536 = 1
				for _FORV_11_ = L10_530, L11_531, L16_536 do
					local L14_534 = _ENV.Mod(_FORV_11_, 2)
					if L14_534 == 0 then
						L14_534 = A0_520[2]
						L14_534 = L14_534[_FORV_11_]
						L14_534.y = A0_520[2][_FORV_11_].y - L7_527.toggleY
						L14_534 = A0_520[2]
						L14_534 = L14_534[_FORV_11_]
						L14_534.rotation = A0_520[2][_FORV_11_].rotation - L7_527.toggleAngle
						L14_534 = A0_520[2]
						L14_534 = L14_534[_FORV_11_]
						L14_534.xScale = A0_520[2][_FORV_11_].xScale - L7_527.toggleScale
						L14_534 = A0_520[2]
						L14_534 = L14_534[_FORV_11_]
						L14_534.yScale = A0_520[2][_FORV_11_].yScale - L7_527.toggleScale
					else
						L14_534 = A0_520[2]
						L14_534 = L14_534[_FORV_11_]
						L14_534.y = A0_520[2][_FORV_11_].y + L7_527.toggleY
						L14_534 = A0_520[2]
						L14_534 = L14_534[_FORV_11_]
						L14_534.rotation = A0_520[2][_FORV_11_].rotation + L7_527.toggleAngle
						L14_534 = A0_520[2]
						L14_534 = L14_534[_FORV_11_]
						L14_534.xScale = A0_520[2][_FORV_11_].xScale + L7_527.toggleScale
						L14_534 = A0_520[2]
						L14_534 = L14_534[_FORV_11_]
						L14_534.yScale = A0_520[2][_FORV_11_].yScale + L7_527.toggleScale
					end
					L14_534 = L7_527.minScale
					if L14_534 ~= nil then
						L14_534 = A0_520[2]
						L14_534 = L14_534[_FORV_11_]
						L14_534 = L14_534.xScale
						if L14_534 < L7_527.minScale then
							L14_534 = A0_520[2]
							L14_534 = L14_534[_FORV_11_]
							L14_534.xScale = L7_527.minScale
						end
						L14_534 = A0_520[2]
						L14_534 = L14_534[_FORV_11_]
						L14_534 = L14_534.yScale
						if L14_534 < L7_527.minScale then
							L14_534 = A0_520[2]
							L14_534 = L14_534[_FORV_11_]
							L14_534.yScale = L7_527.minScale
						end
					end
				end
				break -- pseudo-goto
			end
			L10_530 = L7_527.type
			L11_531 = _ENV
			L11_531 = L11_531.DEFORM_SQUEEZE
			if L10_530 == L11_531 then
				L10_530 = _ENV
				L10_530 = L10_530.Charsets
				L11_531 = A0_520.fontName
				L10_530 = L10_530[L11_531]
				L11_531 = nil
				L16_536 = nil
				L13_533 = nil
				L14_534 = 0
				_FOR_ = 1
				for _FORV_17_ = _FOR_, _FOR_, _FOR_ do
					if L14_534 > A0_520[2][_FORV_17_].x then
						L14_534 = A0_520[2][_FORV_17_].x
					end
					if 0 < A0_520[2][_FORV_17_].x then
					end
				end
				if L14_534 < 0 then
				end
				_FOR_ = 1
				for _FORV_18_ = _FOR_, _FOR_, _FOR_ do
					L16_536 = A0_520[2][_FORV_18_].x
					if L14_534 < 0 then
						L16_536 = L16_536 - L14_534
					end
					L13_533 = L16_536 / (A0_520[2][_FORV_17_].x - L14_534)
					L11_531 = L10_530.Chars[A0_520[2][_FORV_18_].charNum]
					if L7_527.mode == "INNER" then
						if L13_533 <= 0.5 then
							L4_524 = L7_527.min + _ENV.Cos(2 * L13_533 ^ 0.3) * L7_527.max
						else
							L4_524 = L7_527.min + _ENV.Cos(2 * (1 - L13_533) ^ 0.3) * L7_527.max
						end
						if L7_527.scaleX then
							A0_520[2][_FORV_18_].xScale = A0_520[2][_FORV_18_].xScale + L4_524
						end
						if L7_527.scaleY then
							A0_520[2][_FORV_18_].yScale = A0_520[2][_FORV_18_].yScale + L4_524
						end
					elseif L7_527.mode == "OUTER" then
						if L13_533 <= 0.5 then
							L4_524 = L7_527.min + _ENV.Sin(2 * L13_533 ^ 0.65) * L7_527.max
						else
							L4_524 = L7_527.min + _ENV.Sin(2 * (1 - L13_533) ^ 0.65) * L7_527.max
						end
						if L7_527.scaleX then
							A0_520[2][_FORV_18_].xScale = A0_520[2][_FORV_18_].xScale + L4_524
						end
						if L7_527.scaleY then
							A0_520[2][_FORV_18_].yScale = A0_520[2][_FORV_18_].yScale + L4_524
						end
					elseif L7_527.mode == "LEFT" then
						if L7_527.scaleX then
							A0_520[2][_FORV_18_].xScale = A0_520[2][_FORV_18_].xScale + (L7_527.min + L13_533 * L7_527.max)
						end
						if L7_527.scaleY then
							A0_520[2][_FORV_18_].yScale = A0_520[2][_FORV_18_].yScale + (L7_527.min + L13_533 * L7_527.max)
						end
					elseif L7_527.mode == "RIGHT" then
						if L7_527.scaleX then
							A0_520[2][_FORV_18_].xScale = A0_520[2][_FORV_18_].xScale + (L7_527.min + (1 - L13_533) * L7_527.max)
						end
						if L7_527.scaleY then
							A0_520[2][_FORV_18_].yScale = A0_520[2][_FORV_18_].yScale + (L7_527.min + (1 - L13_533) * L7_527.max)
						end
					end
				end
			else
				L10_530 = L7_527.type
				L11_531 = _ENV
				L11_531 = L11_531.DEFORM_CIRCLE
				if L10_530 == L11_531 then
					L10_530 = A0_520[2]
					L10_530 = L10_530.numChildren
					if L10_530 == 0 then
						return
					end
					L10_530 = nil
					L11_531 = nil
					L16_536 = nil
					L13_533 = nil
					L14_534 = nil
					if L7_527.autoStep == true then
						L13_533 = 360 / string.len(A0_520.text)
					else
						L13_533 = L7_527.angleStep
					end
					_FOR_ = 1
					for _FORV_20_ = _FOR_, _FOR_, _FOR_ do
						if A0_520[2][_FORV_20_].spaceBefore == true and L7_527.ignoreSpaces ~= true then
						end
						L11_531 = _ENV.Rad(0 + L13_533 - 90)
						if A0_520[2][_FORV_20_].char ~= " " and A0_520[2][_FORV_20_].char ~= _ENV.newLineChar then
							L14_534 = 0
							L10_530 = _ENV.Charsets[A0_520.fontName].Chars[A0_520[2][_FORV_20_].charNum]
							if L10_530 ~= nil then
								L14_534 = L10_530.offY
							end
							if 0 < L14_534 then
								A0_520[2][_FORV_20_].x = _ENV.Cos(L11_531) * (L7_527.radius - L14_534 * -0.5)
								A0_520[2][_FORV_20_].y = _ENV.Sin(L11_531) * (L7_527.radius - L14_534 * -0.5)
							else
								A0_520[2][_FORV_20_].x = _ENV.Cos(L11_531) * (L7_527.radius - L14_534 * 2)
								local L23_543 = L23_543
								A0_520[2][_FORV_20_].y = _ENV.Sin(L11_531) * (L7_527.radius - L14_534 * 2)
							end
							A0_520[2][_FORV_20_].rotation = 0 + L13_533
						end
						if L7_527.radiusChange ~= nil then
						end
						if L7_527.stepChange ~= nil then
							L13_533 = L13_533 + L7_527.stepChange
						end
					end
					if _ENV.debug then
						local L19_539 = L19_539
						local L20_540 = L20_540
						print("--> TextFX: PROCESSED DEFORMATION (TYPE: " .. L7_527.type .. ")")
					end
				end
			end
		end
	until true
end
function L3_3.PSetWrappedTextData(A0_544)
	local L1_545, L2_546, L3_547, L4_548, L5_549
	L1_545 = A0_544.fontName
	local L2_546, L10_554, L11_555, L12_556, L13_557, L14_558, L15_559 = A0_544.wrapWidth, L10_554, L11_555, L12_556, L13_557, L14_558, L15_559
	L3_547 = A0_544.charSpacing
	L4_548 = A0_544.text
	L5_549 = _ENV
	L5_549 = L5_549.Charsets
	L5_549 = L5_549[L1_545]
	if L5_549 == nil then
		L10_554 = print
		L11_555 = "!!! TextFX: CHARSET "
		L12_556 = L1_545
		L13_557 = " NOT FOUND."
		L11_555 = L11_555 .. L12_556 .. L13_557
		L10_554(L11_555)
		L10_554 = 0
		return L10_554
	end
	L10_554 = 1
	L11_555 = ""
	L12_556 = nil
	L13_557 = nil
	L14_558 = nil
	L15_559 = nil
	A0_544.wrappedLines = nil
	A0_544.wrappedLines = {}
	A0_544.lineWidths = nil
	A0_544.lineWidths = {}
	A0_544.maxLineWidth = 0
	while string.sub(L4_548, 1, 1) == _ENV.newLineChar do
	end
	L4_548 = string.sub(L4_548, 1 + 1)
	local L16_560 = L16_560
	_FOR_ = 1
	for _FORV_19_ = _FOR_, _FOR_, _FOR_ do
		L12_556 = string.sub(L4_548, _FORV_19_, _FORV_19_)
		local L23_567 = L23_567
		L15_559 = _ENV.GetLineWidth(L1_545, L11_555, L3_547)
		if L12_556 == _ENV.newLineChar then
			A0_544.wrappedLines[L10_554] = L11_555
			A0_544.lineWidths[L10_554] = L15_559
			L11_555 = ""
			L10_554 = L10_554 + 1
		else
			L11_555 = L11_555 .. L12_556
		end
		if 0 < L2_546 and L2_546 < L15_559 then
			_FOR_ = -1
			local L22_566 = L22_566
			for _FORV_23_ = _FOR_, _FOR_, _FOR_ do
				L14_558 = string.sub(L11_555, _FORV_23_, _FORV_23_)
				L13_557 = string.byte(L14_558)
				if L13_557 == 32 then
					A0_544.wrappedLines[L10_554] = string.sub(L11_555, 1, _FORV_23_ - 1)
					A0_544.lineWidths[L10_554] = _ENV.GetLineWidth(L1_545, A0_544.wrappedLines[L10_554], L3_547)
					L11_555 = string.sub(L11_555, _FORV_23_ + 1)
					L10_554 = L10_554 + 1
				elseif L14_558 == "-" then
					A0_544.wrappedLines[L10_554] = string.sub(L11_555, 1, _FORV_23_)
					local L27_571 = L27_571
					A0_544.lineWidths[L10_554] = _ENV.GetLineWidth(L1_545, A0_544.wrappedLines[L10_554], L3_547)
					L11_555 = string.sub(L11_555, _FORV_23_ + 1)
					L10_554 = L10_554 + 1
				end
			end
		end
	end
	L28_572 = A0_544.wrappedLines
	L28_572[L10_554] = L11_555
	L28_572 = A0_544.lineWidths
	L28_572[L10_554] = _ENV.GetLineWidth(L1_545, A0_544.wrappedLines[L10_554], L3_547)
	L28_572 = 1
	_FOR_ = 1
	for _FORV_19_ = L28_572, _FOR_, _FOR_ do
		if A0_544.lineWidths[_FORV_19_] > A0_544.maxLineWidth then
			A0_544.maxLineWidth = A0_544.lineWidths[_FORV_19_]
		end
	end
	L28_572 = A0_544.linesToShow
	if L28_572 == 0 then
		A0_544.maxScroll = 1
		L28_572 = A0_544.startLine
		if L28_572 > #A0_544.wrappedLines then
			L28_572 = A0_544.wrappedLines
			L28_572 = #L28_572
			A0_544.startLine = L28_572
		end
		L28_572 = A0_544.wrappedLines
		L28_572 = #L28_572
		A0_544.endLine = L28_572
	else
		L28_572 = A0_544.wrappedLines
		L28_572 = #L28_572
		L28_572 = L28_572 - (A0_544.linesToShow - 1)
		A0_544.maxScroll = L28_572
		L28_572 = A0_544.maxScroll
		if L28_572 < 1 then
			A0_544.maxScroll = 1
		end
		L28_572 = A0_544.startLine
		if L28_572 > A0_544.maxScroll then
			L28_572 = A0_544.maxScroll
			A0_544.startLine = L28_572
		end
		L28_572 = A0_544.startLine
		if L28_572 < 1 then
			A0_544.startLine = 1
		end
		L28_572 = A0_544.startLine
		L28_572 = L28_572 + (A0_544.linesToShow - 1)
		A0_544.endLine = L28_572
		L28_572 = A0_544.endLine
		if L28_572 > #A0_544.wrappedLines then
			L28_572 = A0_544.wrappedLines
			L28_572 = #L28_572
			A0_544.endLine = L28_572
		end
	end
	L28_572 = A0_544.endLine
	L28_572 = L28_572 - A0_544.startLine
	L28_572 = L28_572 + 1
	A0_544.totalHeight = L28_572 * L5_549.lineHeight + (L28_572 - 1) * A0_544.lineSpacing
end
function L3_3.PAnimate(A0_573)
	local L1_574, L2_575, L3_576, L4_577
	L1_574 = A0_573.source
	local L2_575, L6_579, L7_580, L8_581, L9_582, L13_586 = L1_574.Target, L6_579, L7_580, L8_581, L9_582, L13_586
	L3_576 = L2_575.AnimEffect
	L4_577 = L2_575[2]
	L4_577 = L4_577.numChildren
	L6_579 = _ENV
	L6_579 = L6_579.GetTimer
	L6_579 = L6_579()
	L7_580 = nil
	L8_581 = nil
	L9_582 = nil
	L13_586 = nil
	if L1_574._count < 3 then
		if L3_576.duration == nil then
			L3_576.duration = 0
		end
		if L3_576.delay == nil then
			L3_576.delay = 0
		end
		if L3_576.charWise == nil then
			L3_576.charWise = true
		end
		L1_574.startTime = L6_579
		L1_574.endTime = L6_579 + L3_576.delay + L3_576.duration
	elseif L6_579 - L1_574.startTime >= L3_576.delay then
		if L3_576.charWise == true then
			_FOR_ = 1
			for _FORV_13_ = _FOR_, _FOR_, _FOR_ do
				L8_581 = _ENV.Sin(L6_579 / L3_576.frequency + _FORV_13_)
				L9_582 = _ENV.Cos(L6_579 / L3_576.frequency + _FORV_13_)
				if L3_576.alphaRange ~= nil then
					L13_586 = L2_575[2][_FORV_13_].origAlpha + L8_581 * L3_576.alphaRange
					if 1 < L13_586 then
						L13_586 = 1
					elseif L13_586 < 0 then
						L13_586 = 0
					end
					L2_575[2][_FORV_13_].alpha = L13_586
				end
				if L3_576.xScaleRange ~= nil then
					L2_575[2][_FORV_13_].xScale = L2_575[2][_FORV_13_].origXScale + L8_581 * L3_576.xScaleRange
				end
				if L3_576.yScaleRange ~= nil then
					L2_575[2][_FORV_13_].yScale = L2_575[2][_FORV_13_].origYScale + L8_581 * L3_576.yScaleRange
				end
				if L3_576.rotationRange ~= nil then
					L2_575[2][_FORV_13_].rotation = L2_575[2][_FORV_13_].origRot + L8_581 * L3_576.rotationRange
				end
				if L3_576.xRange ~= nil then
					L2_575[2][_FORV_13_].x = L2_575[2][_FORV_13_].origX + L8_581 * L3_576.xRange
				end
				if L3_576.yRange ~= nil then
					L2_575[2][_FORV_13_].y = L2_575[2][_FORV_13_].origY + L9_582 * L3_576.yRange
				end
			end
			repeat
				do break end -- pseudo-goto
				L16_589 = _ENV
				L16_589 = L16_589.Sin
				L16_589 = L16_589(L6_579 / L3_576.frequency)
				L8_581 = L16_589
				L16_589 = _ENV
				L16_589 = L16_589.Cos
				L16_589 = L16_589(L6_579 / L3_576.frequency)
				L9_582 = L16_589
				L16_589 = L3_576.alphaRange
				if L16_589 ~= nil then
					L16_589 = L2_575.origAlpha
					L13_586 = L16_589 + L8_581 * L3_576.alphaRange
					if 1 < L13_586 then
						L13_586 = 1
					elseif L13_586 < 0 then
						L13_586 = 0
					end
					L2_575.alpha = L13_586
				end
				L16_589 = L3_576.xScaleRange
				if L16_589 ~= nil then
					L16_589 = L2_575.origXScale
					L16_589 = L16_589 + L8_581 * L3_576.xScaleRange
					L2_575.xScale = L16_589
				end
				L16_589 = L3_576.yScaleRange
				if L16_589 ~= nil then
					L16_589 = L2_575.origYScale
					L16_589 = L16_589 + L8_581 * L3_576.yScaleRange
					L2_575.yScale = L16_589
				end
				L16_589 = L3_576.rotationRange
				if L16_589 ~= nil then
					L16_589 = L2_575.origRot
					L16_589 = L16_589 + L8_581 * L3_576.rotationRange
					L2_575.rotation = L16_589
				end
				L16_589 = L3_576.xRange
				if L16_589 ~= nil then
					L16_589 = L2_575.origX
					L16_589 = L16_589 + L8_581 * L3_576.xRange
					L2_575.x = L16_589
				end
				L16_589 = L3_576.yRange
				if L16_589 ~= nil then
					L16_589 = L2_575.origY
					L16_589 = L16_589 + L9_582 * L3_576.yRange
					L2_575.y = L16_589
				end
			until true
		end
		L16_589 = L3_576.duration
		if 0 < L16_589 then
			L16_589 = L1_574.endTime
			if L6_579 > L16_589 then
				L16_589 = L2_575.stopAnimation
				L16_589(L2_575)
				L16_589 = L3_576.autoRemoveText
				if L16_589 then
					L16_589 = _ENV
					L16_589 = L16_589.DeleteText
					L16_589(L2_575)
				end
			end
		end
	end
end
function L3_3.PMarquee(A0_590)
	local L1_591
	L1_591 = A0_590.source
	L1_591 = L1_591.Target
	L1_591[2].x = L1_591[2].x - L1_591.marqueeSpeed
	if L1_591[2].x < L1_591.endX then
		L1_591[2].x = L1_591[2].x - L1_591.endX
		local L6_596 = L6_596
		L6_596 = L6_596 .. string.sub(L1_591.marqueeText, L1_591.nextCharPos, L1_591.nextCharPos)
		L1_591.text = L6_596
		L6_596 = L1_591.nextCharPos
		L6_596 = L6_596 + 1
		L1_591.nextCharPos = L6_596
		L6_596 = L1_591.nextCharPos
		if L6_596 > string.len(L1_591.marqueeText) then
			L1_591.nextCharPos = 1
		end
		L6_596 = _ENV
		L6_596 = L6_596.PDrawChars
		L6_596(L1_591)
		L6_596 = string
		L6_596 = L6_596.sub
		local L3_593 = L3_593
		local L4_594 = L4_594
		local L6_596, L5_595 = L6_596(L3_593, L4_594, 1), L5_595
		if L6_596 == " " then
			L6_596 = _ENV
			L6_596 = L6_596.Charsets
			L3_593 = L1_591.fontName
			L6_596 = L6_596[L3_593]
			L6_596 = L6_596.spaceWidth
			L1_591.charW = L6_596
		else
			L6_596 = L1_591.shadowOffX
			if L6_596 == 0 then
				L6_596 = L1_591.shadowOffY
				if L6_596 == 0 then
					goto lbl_75
				end
			end
			L6_596 = L1_591[2]
			L6_596 = L6_596[1]
			L6_596 = L6_596[1]
			L6_596 = L6_596.width
			L1_591.charW = L6_596
			goto lbl_79
			::lbl_75::
			L6_596 = L1_591[2]
			L6_596 = L6_596[1]
			L6_596 = L6_596.width
			L1_591.charW = L6_596
		end
		::lbl_79::
		L6_596 = L1_591.charW
		L3_593 = L1_591.charSpacing
		L6_596 = L6_596 + L3_593
		L6_596 = -L6_596
		L3_593 = _ENV
		L3_593 = L3_593.Charsets
		L4_594 = L1_591.fontName
		L3_593 = L3_593[L4_594]
		L3_593 = L3_593.scale
		L6_596 = L6_596 * L3_593
		L1_591.endX = L6_596
	end
end
return L3_3
