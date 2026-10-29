WidgetTracker, ({})[1] = {}, widgets
WidgetTracker_mt, ({}).__index = {}, WidgetTracker
function WidgetTracker.new(A0_2)
	local L1_3
	L1_3 = {}
	L1_3.widgets = {}
	local L2_4 = L2_4
	local L3_5 = L3_5
	L2_4(L3_5, WidgetTracker_mt)
	local L4_6 = L4_6
	return L1_3
end
function WidgetTracker.track(A0_7, A1_8)
	local L3_9 = L3_9
	L3_9(A0_7.widgets, A1_8)
	local L4_10 = L4_10
end
function WidgetTracker.destroy(A0_11)
	local L1_12, L2_13, L3_14, L4_15
	L1_12 = 1
	L2_13 = A0_11.widgets
	L2_13 = #L2_13
	L3_14 = 1
	for L4_15 = L1_12, L2_13, L3_14 do
		A0_11.widgets[L4_15]:removeSelf()
		local L5_16, L6_17 = L5_16, L6_17
	end
	L1_12 = {}
	A0_11.widgets = L1_12
end
do return WidgetTracker:new() end
local L0_0, L1_1 = L0_0, L1_1
