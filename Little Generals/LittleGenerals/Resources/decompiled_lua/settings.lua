local L4_4 = L4_4
L4_4((...), package.seeall)
L4_4 = require
local L4_4, L1_1 = L4_4("json"), L1_1
L1_1 = "80z]SA7|&7H-Hiz=@9,GhFU-8No73S`0B,9ZkRLneOkLY3=%4sR.s!2=ts,u~vd"
local L2_2 = L2_2
local L2_2, L3_3 = L2_2("crypto"), L3_3
L3_3 = {}
L3_3.fileName = "settings.json"
L3_3.dirty = false
Settings = L3_3
L3_3 = {}
L3_3.__index = Settings
Settings_mt = L3_3
function L3_3(A0_5)
	local L1_6
	L1_6 = {}
	local L2_7 = L2_7
	local L3_8 = L3_8
	L2_7(L3_8, Settings_mt)
	local L4_9 = L4_9
	if A0_5 then
		L1_6.fileName = A0_5
	end
	return L1_6
end
new = L3_3
L3_3 = Settings
function L3_3.set(A0_10, A1_11, A2_12)
	local L3_13
	L3_13 = A0_10.settings
	L3_13[A1_11] = A2_12
	A0_10.dirty = true
end
L3_3 = Settings
function L3_3.clear(A0_14)
	A0_14.settings = {}
	A0_14.dirty = true
end
L3_3 = Settings
function L3_3.get(A0_15, A1_16, A2_17)
	local L3_18
	L3_18 = A0_15.settings
	if L3_18 then
		L3_18 = A0_15.settings
		L3_18 = L3_18[A1_16]
		if L3_18 ~= nil then
			L3_18 = A0_15.settings
			L3_18 = L3_18[A1_16]
			return L3_18
		end
	end
	return A2_17
end
L3_3 = Settings
function L3_3.save(A0_19)
	local L3_22 = L3_22
	if A0_19.dirty then
		L3_22 = system
		L3_22 = L3_22.getTimer
		L3_22 = L3_22()
		local L2_21 = L2_21
		L2_21 = L2_21(function()
			local L0_26 = L0_26
			L0_26 = L0_26(_ENV.fileName, system.DocumentsDirectory)
			local L1_27 = L1_27
			L1_27 = L1_27(L0_26, "w")
			local L2_28 = L2_28
			L2_28 = L2_28(_ENV.settings)
			local L3_29 = L3_29
			L3_29 = L3_29(L2_2.md5, L2_28, L1_1)
			L1_27:write(L2_28)
			L1_27:close()
			L0_26 = system.pathForFile(_ENV.fileName .. ".hmac", system.DocumentsDirectory)
			L1_27 = io.open(L0_26, "w")
			L1_27:write(L3_29)
			local L6_32 = L6_32
			L6_32 = L1_27.close
			L6_32(L1_27)
			local L5_31 = L5_31
			L6_32 = _ENV
			L6_32.dirty = false
		end)
		if not L2_21 then
			local L4_23 = L4_23
			local L5_24 = L5_24
			L5_24("FAILED TO WRITE FILE", L4_23)
			local L6_25 = L6_25
		end
	end
end
L3_3 = Settings
function L3_3.hasValidHmac(A0_33)
	return A0_33.validHmac
end
L3_3 = Settings
function L3_3.load(A0_34)
	repeat
		local L1_35 = L1_35
		L1_35 = L1_35(A0_34.fileName, system.DocumentsDirectory)
		local L2_36 = L2_36
		local L3_37 = L3_37
		L2_36, L3_37 = L2_36(L3_37, "r")
		if L2_36 then
			L2_36:close()
			if pcall(function()
				do return _ENV.decode(_UPVALUE1_) end
				local L1_46 = L1_46
			end) then
				if pcall(function()
					do return _ENV.decode(_UPVALUE1_) end
					local L1_47 = L1_47
				end) == nil then
					print("MISSING DATA")
				end
				if not pcall(function()
					do return _ENV.decode(_UPVALUE1_) end
					local L1_48 = L1_48
				end) then
				end
				A0_34.settings = {}
			else
				A0_34.settings = {}
			end
			A0_34.dirty = false
			L1_35 = system.pathForFile(A0_34.fileName .. ".hmac", system.DocumentsDirectory)
			L2_36, L3_37 = io.open(L1_35, "r")
			if L2_36 then
				local L7_41 = L7_41
				L2_36:close()
			end
			local L8_42 = L8_42
			A0_34.validHmac = L2_2.hmac(L2_2.md5, L7_41, L1_1) == L2_36:read("*a")
			local L10_44 = L10_44
			print("Loaded ", A0_34.fileName)
			local L11_45 = L11_45
			do return true end
			break -- pseudo-goto
		end
		L7_41 = print
		L8_42 = "Couldn't load settings: "
		L10_44 = L3_37
		L8_42 = L8_42 .. L10_44
		L10_44 = A0_34.fileName
		L7_41(L8_42, L10_44)
		L7_41 = {}
		A0_34.settings = L7_41
		L7_41 = false
		return L7_41
	until true
end
