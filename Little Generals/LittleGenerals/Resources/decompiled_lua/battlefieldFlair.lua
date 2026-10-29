-- Decompiled & AI-Repaired from battlefieldFlair.lu
-- Source disassembly preserved at: disasm/battlefieldFlair.disasm

local L0_0, L1_1, L3_3, L4_4 = L0_0, (...), L3_3, L4_4
L3_3 = package
L3_3 = L3_3.seeall
L0_0(L1_1, L3_3)
L0_0 = {}
activeAirTraffic = L0_0
L0_0 = {}
L0_0.balloonPop = "res/sounds/balloon_pop.mp3"
L0_0.balloonAirOut = "res/sounds/balloon_airout.mp3"
L1_1 = {}
AirFlairTypes = L1_1
L1_1 = {}
L1_1.objType = "flair"
L1_1.bodyType = "kinematic"
L1_1.isSensor = true
L1_1.triggerWeaponContinues = false
L1_1.warbux = nil
L1_1.image = "res/flair/a10.png"
L1_1.imageDirection = "left"
L3_3 = {}
L3_3.min = -200
L3_3.max = 300
L1_1.yStart = L3_3
L3_3 = {}
L3_3.min = -200
L3_3.max = -100
L1_1.yOscillation = L3_3
L3_3 = {}
L3_3.min = 2000
L3_3.max = 5000
L1_1.yDuration = L3_3
L3_3 = {}
L3_3.min = 0
L3_3.max = 2000
L1_1.yDelay = L3_3
L3_3 = {}
L3_3.min = 5000
L3_3.max = 10000
L1_1.xDuration = L3_3
L3_3 = {}
L3_3.min = 5000
L3_3.max = 30000
L1_1.xDelay = L3_3


-- [End of decompiled block; see disassembly for inner stripped closures]
