-- Decompiled & AI-Repaired from multiplayer.dataServer.lu
-- Source disassembly preserved at: disasm/multiplayer.dataServer.disasm

local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8 = L3_3, (...), L5_5, L6_6, L7_7, L8_8
L5_5 = package
L5_5 = L5_5.seeall
L3_3(L4_4, L5_5)
L3_3 = require
L4_4 = "crypto"
L3_3 = L3_3(L4_4)
L4_4 = require
L5_5 = "socket.url"
L4_4 = L4_4(L5_5)
L5_5 = "smarterapps-gamedata.s3.amazonaws.com"
DATA_SERVER_HOST = L5_5
L5_5 = "littlegenerals.s3.amazonaws.com"
PING_SERVER_HOST = L5_5
L5_5 = {}
L6_6 = "eyJleHBpcmF0aW9uIjogIjIwMTYtMDEtMDFUMDA6MDA6MDBaIiwNCiAgImNvbmRpdGlvbnMiOiBbIA0KICAgIHsiYnVja2V0IjogInNtYXJ0ZXJhcHBzLWdhbWVkYXRhIn0sIA0KICAgIFsic3RhcnRzLXdpdGgiLCAiJGtleSIsICIiXSwNCiAgICB7ImFjbCI6ICJwdWJsaWMtcmVhZCJ9LA0KICAgIFsic3RhcnRzLXdpdGgiLCAiJENvbnRlbnQtVHlwZSIsICIiXSwNCiAgICBbImNvbnRlbnQtbGVuZ3RoLXJhbmdlIiwgMCwgMTA0ODU3Nl0NCiAgXQ0KfQ=="
L7_7 = "CMRhaXoWG8ywE5+AalKHYIs/XmA="
L8_8 = false
function L5_5.sendData(A0_9, A1_10, A2_11)
	local L3_12 = L3_12
	L3_12 = L3_12 .. _ENV(A0_9)
	if L8_8 then
		io.open(system.pathForFile(L3_12, system.DocumentsDirectory), "w"):write(A1_10)
		io.close((io.open(system.pathForFile(L3_12, system.DocumentsDirectory), "w")))
		A2_11({})
	else
		local L4_13 = L4_13
		local L5_14 = L5_14
		local L6_15 = L6_15
		local L7_16 = L7_16
		local L13_22 = L13_22
		local L14_23 = L14_23
		local L15_24 = L15_24
		local L16_25 = L16_25
		local L17_26 = L17_26
		local L18_27 = L18_27
		local L19_28 = L19_28
		local L20_29 = L20_29
		local L21_30 = L21_30
		local L22_31 = L22_31
		local L23_32 = L23_32
		local L24_33 = L24_33
		local L25_34 = L25_34
		local L26_35 = L26_35
		local L27_36 = L27_36
		local L28_37 = L28_37
		local L29_38 = L29_38
		local L30_39 = L30_39
		local L4_13, L31_40 = L4_13 .. L5_14 .. L6_15 .. L7_16 .. L13_22 .. L14_23 .. L15_24 .. L16_25 .. L17_26 .. L18_27 .. L19_28 .. L20_29 .. L21_30 .. L22_31 .. L23_32 .. L24_33 .. L25_34 .. L26_35 .. L27_36 .. L28_37 .. L29_38 .. L30_39 .. L3_12 .. "\"\r\n" .. "Content-Type: text/plain\r\n\r\n" .. A1_10 .. "\r\n" .. "-----------------------------10102754414578508781458777923--", L31_40
		L5_14 = {}
		L5_14["Content-Type"] = "multipart/form-data; boundary=---------------------------10102754414578508781458777923"
		L5_14["Content-Encoding"] = "gzip; deflate"
		L6_15 = DATA_SERVER_HOST
		L5_14.Host = L6_15
		L5_14["Accept-Language"] = "en-US"
		L6_15 = {}
		L6_15.headers = L5_14
		L6_15.body = L4_13


-- [End of decompiled block; see disassembly for inner stripped closures]
