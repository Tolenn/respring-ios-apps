(function(...)
	local L0_1, L1_2, L2_3, L3_4
	L0_1 = {}
	L1_2 = {}
	L1_2.width = 600
	L1_2.height = 800
	L1_2.scale = "letterbox"
	L1_2.xAlign = "center"
	L1_2.yAlign = "center"
	L2_3 = {}
	L2_3["@2x"] = 2
	L2_3["@4x"] = 4
	L1_2.imageSuffix = L2_3
	L0_1.content = L1_2
	L1_2 = {}
	L2_3 = {}
	L3_4 = {}
	local L4_5 = L4_5
	local L5_6 = L5_6
	L3_4[1] = L4_5
	L3_4[2] = L5_6
	local L3_4[3], L6_7 = "alert", L6_7
	L2_3.types = L3_4
	L1_2.iphone = L2_3
	L0_1.notification = L1_2
	application = L0_1
end)()
local L0_0 = L0_0
function L0_0(...)
	if application then
		local L0_8 = L0_8
		local L0_8, L1_9 = L0_8(application), L1_9
		if L0_8 == "table" then
			goto lbl_11
		end
	end
	L0_8 = {}
	application = L0_8
	::lbl_11::
	L0_8 = application
	L1_9 = {}
	L1_9.appName = "Little Generals"
	L1_9.appVersion = "2.5"
	L1_9.appPackageId = "com.smarterapps.littlegenerals"
	L1_9.appId = "1055994f1d87ec584222.78456273"
	L1_9.userId = "105599"
	L1_9.subscription = "pro"
	L1_9.mode = "distribution"
	L0_8.metadata = L1_9
end
L0_0()
