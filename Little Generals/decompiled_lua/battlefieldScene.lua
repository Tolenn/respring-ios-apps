local L2_2, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21 = L2_2, "objectTemplates", L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21
L2_2(L11_11)
L2_2 = require
L11_11 = "level"
L2_2(L11_11)
L2_2 = require
L11_11 = "tank"
L2_2(L11_11)
L2_2 = require
L11_11 = "battleControls"
L2_2(L11_11)
L2_2 = require
L11_11 = "ai"
L2_2(L11_11)
L2_2 = require
L11_11 = "battleAvatar"
L2_2(L11_11)
L2_2 = require
L11_11 = "currentBattle"
L2_2 = L2_2(L11_11)
L11_11 = nil
L12_12 = 75
L13_13 = require
L14_14 = "weapon"
L13_13 = L13_13(L14_14)
L14_14 = require
L15_15 = "lib_particle_candy"
L14_14 = L14_14(L15_15)
Particles = L14_14
L14_14 = require
L15_15 = "lib_particleEffects"
L14_14 = L14_14(L15_15)
FXLibrary = L14_14
L14_14 = {}
L15_15 = "res/sounds/earth_impact1.mp3"
L16_16 = "res/sounds/earth_impact2.mp3"
L17_17 = "res/sounds/earth_impact3.mp3"
L18_18 = "res/sounds/earth_impact4.mp3"
L19_19 = "res/sounds/earth_impact5.mp3"
L20_20 = "res/sounds/earth_impact6.mp3"
L14_14[1] = L15_15
L14_14[2] = L16_16
L14_14[3] = L17_17
L14_14[4] = L18_18
L14_14[5] = L19_19
L14_14[6] = L20_20
L15_15 = {}
L15_15.wind = "res/sounds/wind.mp3"
L16_16 = nil
L17_17 = storyboard
L17_17 = L17_17.newScene
L17_17 = L17_17()
L18_18 = 0
L19_19 = 1
DEFAULT_X_SCALE = L19_19
L19_19 = 1
DEFAULT_Y_SCALE = L19_19
L19_19 = 1
LEVEL_GROUP = L19_19
L19_19 = 2
TANK_GROUP = L19_19
L19_19 = false
ARCADE_MODE = L19_19
L19_19 = nil
L20_20 = {}
L20_20.width = 2048
L20_20.height = 3072
L20_20.groundLevel = 190
L21_21 = nil
wind = 0
player = {}
function setRockPointsPlayer(A0_26)
	local L1_27
	_ENV = A0_26
end
function getRockPointsPlayer()
	local L1_28
	L1_28 = _ENV
	return L1_28
end
function endGame(A0_29, A1_30)
	if _ENV.isOver then
		print("battle is over, second call to endGame disregarded.")
		return
	end
	print(A0_29.playerName .. " WINS ! ")
	setRockPointsPlayer(A0_29)
	_ENV.isOver = true
	BattleControls:disable()
	if not _UPVALUE1_ then
		storyboard.gotoScene("battlefieldScene")
	end
	local L2_31 = L2_31
	local L3_32 = L3_32
	L2_31(L3_32, A1_30)
	local L4_33 = L4_33
end
function setPERFORMANCE_THRESHOLD_NUM_ROCKS(A0_34)
	local L1_35
	PERFORMANCE_THRESHOLD_NUM_ROCKS = A0_34
end
function getPERFORMANCE_THRESHOLD_NUM_ROCKS()
	local L1_36
	L1_36 = PERFORMANCE_THRESHOLD_NUM_ROCKS
	return L1_36
end
function fixTankRotation(A0_37, A1_38)
	local L4_41 = L4_41
	if A0_37.rotation > 360 then
		L4_41 = A0_37.rotation
		L4_41 = L4_41 % 360
		A0_37.rotation = L4_41
	end
	L4_41 = A0_37.rotation
	if 180 < L4_41 then
		L4_41 = A0_37.rotation
		L4_41 = 360 - L4_41
		A0_37.rotation = L4_41
	end
	L4_41 = A0_37.rotation
	if L4_41 < -360 then
		L4_41 = A0_37.rotation
		L4_41 = L4_41 % -360
		A0_37.rotation = L4_41
	end
	L4_41 = A0_37.rotation
	if L4_41 < -180 then
		L4_41 = A0_37.rotation
		L4_41 = L4_41 + 360
		A0_37.rotation = L4_41
	end
	if A1_38 then
		return
	end
	L4_41 = A0_37.rotation
	if 90 < L4_41 then
		A0_37.bodyType = "kinematic"
		A0_37.rotation = 0
		L4_41 = timer
		L4_41 = L4_41.performWithDelay
		L4_41(10, function()
			local L0_42, L1_43
			L0_42 = _ENV
			L0_42.bodyType = "dynamic"
		end)
	else
		L4_41 = A0_37.rotation
		if L4_41 < -90 then
			A0_37.bodyType = "kinematic"
			A0_37.rotation = 0
			L4_41 = timer
			L4_41 = L4_41.performWithDelay
			local L3_40 = L3_40
			L4_41(L3_40, function()
				local L0_44, L1_45
				L0_44 = _ENV
				L0_44.bodyType = "dynamic"
			end)
		end
	end
end
function getBattlefieldView()
	local L1_46
	L1_46 = _ENV
	return L1_46
end
function playerTurnEnd()
	local L4_51 = L4_51
	if BattleControls then
		L4_51 = BattleControls
		L4_51 = L4_51.disableDriving
		L4_51(L4_51)
	end
	L4_51 = _ENV
	if L4_51 then
		L4_51 = _ENV
		L4_51 = L4_51.endTurn
		L4_51()
	end
	L4_51 = levelGroup
	if L4_51 then
		L4_51 = getScreenRocks
		L4_51 = L4_51()
		if L4_51 and 0 < #L4_51 then
			_FOR_, _FOR_, _FOR_ = pairs(L4_51)
			for _FORV_4_, _FORV_5_ in _FOR_, _FOR_, _FOR_ do
				_FORV_5_.rootWeapon = nil
			end
		end
		L3_50 = removeSmallAndOldRocks
		L5_52 = L4_51
		L3_50(L5_52)
	end
end
function generateWorld(A0_53)
	local L1_54 = os.time()
	print("Seed", L1_54)
	math.randomseed(L1_54)
	screenGroup = display.newGroup()
	A0_53:insert(screenGroup)
	SCREEN_GROUP = screenGroup
	BACKGROUND = display.newGroup()
	BACKGROUND_FLAIR = display.newGroup()
	TERRAIN = display.newGroup()
	BEHIND_TANK = display.newGroup()
	TANKS = display.newGroup()
	FRONT_TANK = display.newGroup()
	TERRAIN_FLAIR = display.newGroup()
	EXPLOSIONS = display.newGroup()
	CONTROLS = display.newGroup()
	SCREEN_GROUP:insert(BACKGROUND)
	SCREEN_GROUP:insert(BACKGROUND_FLAIR)
	SCREEN_GROUP:insert(TERRAIN)
	SCREEN_GROUP:insert(BEHIND_TANK)
	SCREEN_GROUP:insert(TANKS)
	SCREEN_GROUP:insert(FRONT_TANK)
	SCREEN_GROUP:insert(TERRAIN_FLAIR)
	SCREEN_GROUP:insert(EXPLOSIONS)
	_ENV.rect = display.newRect(0, 0, _ENV.width, _ENV.height)
	_ENV.rect.alpha = 0
	_ENV.rect:setStrokeColor(0, 255, 0)
	_ENV.rect.strokeWidth = 5
	DEFAULT_X_SCALE = screenWidth / _ENV.width
	DEFAULT_X_SCALE = DEFAULT_X_SCALE + DEFAULT_X_SCALE / 100 * 2
	DEFAULT_Y_SCALE = DEFAULT_X_SCALE
	screenGroup:insert(_ENV.rect)
	_ENV.rect.x = 0
	_ENV.rect.y = 0
	local L2_55 = L2_55
	L2_55 = L2_55(0, 0, 2045, _ENV.height)
	L2_55:setStrokeColor(0, 255, 0, 0)
	L2_55.strokeWidth = 5
	L2_55.alpha = 0
	L2_55.x = 0
	L2_55.y = 0
	physics.start()
	if CUSTOM_OVERRIDES.PHYSICS_HYBRID_MODE then
		physics.setDrawMode("hybrid")
	end
	physics.setGravity(0, 10)
	buildPandoraBox(_ENV)
	levelGroup = display.newGroup()
	levelGroup.groupId = LEVEL_GROUP
	_UPVALUE1_ = display.newGroup()
	_UPVALUE1_.groupId = TANK_GROUP
	TERRAIN:insert(levelGroup)
	L21_21 = L0_0.getLevel(levelGroup, _UPVALUE1_, _ENV)
	_ENV.theme = L0_0.getTheme()
	players = L0_0.getPlayers()
	_FOR_ = 1
	for _FORV_6_ = _FOR_, _FOR_, _FOR_ do
		if players[_FORV_6_].onTankCreate then
			players[_FORV_6_]:onTankCreate()
		end
	end
	print("players", #players)
	TANKS:insert(_UPVALUE1_)
	L19_19 = require("pinchViewController").View:new()
	L19_19:init(screenGroup, L2_55, _ENV, true, true)
	L19_19:setScaleBounds(DEFAULT_X_SCALE, 1)
	local L3_56 = display.newGroup()
	local L4_57 = L4_57
	local L5_58 = L5_58
	L4_57 = L4_57(L5_58, "res/themes/bedrock.png")
	L5_58 = L19_19
	L5_58 = L5_58.scrollBoundingObject
	L5_58 = L5_58.contentBounds
	L5_58 = L5_58.xMin
	L5_58 = L5_58 - L4_57.contentWidth / 2
	L4_57.x = L5_58
	L5_58 = 0
	while L3_56.contentWidth < L19_19.scrollBoundingObject.contentWidth + L4_57.contentWidth do
		L4_57 = display.newImage(L3_56, "res/themes/bedrock.png")
		L4_57.x = L19_19.scrollBoundingObject.contentBounds.xMin - L4_57.contentWidth / 2 + L4_57.contentWidth * L5_58
		L5_58 = L5_58 + 1
	end
	L3_56.x = 0
	L3_56.y = L19_19.scrollBoundingObject.contentHeight / 2 - 320
	FRONT_TANK:insert(L3_56)
	L0_0.beginBattle()
	player = require("currentBattle").getActivePlayer()
	player.gas = settings:get("gas", 1)
	if not L0_0.isMultiplayer then
		players[2].gas = player.gas
	end
	player.hasParachute = settings:get("parachute", false)
	player.hasBattery = settings:get("battery", false)
	wind = L0_0.getWind()
	BattleControls:init(player, wind, L19_19)
	local L10_63 = L10_63
	L10_63 = updatePotMoney
	L10_63(L0_0.getPot())
	L10_63 = screenGroup
	L10_63.x = screenX
	L10_63 = screenGroup
	L10_63 = L10_63.insert
	L10_63(L10_63, L2_55)
	L10_63 = centerViewPort
	local L8_61 = L8_61
	L10_63(L8_61, true, true)
	local L9_62 = L9_62
	L10_63 = L0_0
	L10_63 = L10_63.beginTurn
	L10_63()
end
function getLevel()
	local L1_64
	L1_64 = _ENV
	return L1_64
end
function getCurrentBattle()
	local L1_65
	L1_65 = _ENV
	return L1_65
end
function L17_17.createScene(A0_66, A1_67)
	storyboard.removeScene("campaignMapScene")
	missions:resetPreBattleStats()
	BATTLES_THIS_SESSION = BATTLES_THIS_SESSION + 1
	ARCADE_MODE = false
	battlefieldFlair = require("battlefieldFlair")
	sound.loadSoundBatch(_ENV)
	sound.loadSoundBatch(L6_6)
	_UPVALUE2_ = {}
	print("create battlefield")
	L0_0.isOver = false
	Particles.EnableDebug(false)
	FXLibrary.Initialize()
	Particles.StartAutoUpdate()
	Weapon.init()
	battlefieldFlair.init()
	generateWorld(A0_66.view)
	Tank.loadAllSounds()
	TankExplosions.load()
	Runtime:addEventListener("enterFrame", weaponManualPhysics)
	_UPVALUE4_()
	if not L0_0.isMultiplayer then
		utils.logEvent("BattleStart")
		local L2_68 = require("achievementList").playerKills()
		if L2_68 and type(L2_68) == "number" then
			local L3_69 = L3_69
			L3_69 = L3_69(L2_68)
			if L3_69.AI_SHOT_FUDGE then
				ai_set_baseFudge(players[2], L3_69.AI_SHOT_FUDGE)
			end
			if L3_69.AI_SHOT_FUDGE_SUBTRACTION then
				local L4_70 = L4_70
				local L5_71 = L5_71
				L4_70(L5_71, L3_69.AI_SHOT_FUDGE_SUBTRACTION)
				local L6_72 = L6_72
			end
		end
	end
end
function buildPandoraBox(A0_73)
	local L1_74, L2_75, L3_76
	L1_74 = 40
	L2_75 = 0
	L3_76 = 100
	local L4_77 = L4_77
	L4_77 = L4_77(A0_73.rect.x - A0_73.rect.contentWidth * 2 - L1_74, A0_73.rect.y + A0_73.rect.contentHeight / 2 - A0_73.groundLevel - 118, A0_73.rect.contentWidth * 4 + L1_74 * 2, L3_76)
	L4_77.isVisible = false
	screenGroup:insert(L4_77)
	L4_77 = getWall(A0_73.rect.x - A0_73.rect.contentWidth * 2 - L1_74, A0_73.rect.y - A0_73.rect.contentHeight / 2 - L2_75 - L3_76, A0_73.rect.contentWidth * 4 + L1_74 * 2, L3_76)
	L4_77.isVisible = false
	screenGroup:insert(L4_77)
	L4_77 = getWall(A0_73.rect.x - A0_73.rect.contentWidth / 2 - L1_74 - L3_76, A0_73.rect.y - A0_73.rect.contentHeight / 2 - L2_75, L3_76, A0_73.rect.contentHeight + L2_75)
	screenGroup:insert(L4_77)
	L4_77.isVisible = false
	L4_77 = getWall(A0_73.rect.x - A0_73.rect.contentWidth / 2 - L3_76, A0_73.rect.y - A0_73.rect.contentHeight / 2, L3_76, A0_73.rect.contentHeight, true)
	screenGroup:insert(L4_77)
	L4_77.isVisible = false
	L4_77 = getWall(A0_73.rect.x + A0_73.rect.contentWidth / 2 + L1_74 + L3_76, A0_73.rect.y - A0_73.rect.contentHeight / 2 - L2_75, L3_76, A0_73.rect.contentHeight + L2_75)
	screenGroup:insert(L4_77)
	L4_77.isVisible = false
	local L8_81 = L8_81
	local L9_82 = L9_82
	local L8_81, L10_83 = L8_81(L9_82, A0_73.rect.y - A0_73.rect.contentHeight / 2, L3_76, A0_73.rect.contentHeight, true), L10_83
	L4_77 = L8_81
	L8_81 = screenGroup
	L9_82 = L8_81
	L8_81 = L8_81.insert
	L10_83 = L4_77
	L8_81(L9_82, L10_83)
	L4_77.isVisible = false
end
function getWorldScale()
	local L0_84, L1_85
	L0_84 = screenGroup
	L0_84 = L0_84.xScale
	return L0_84
end
function getWall(A0_86, A1_87, A2_88, A3_89, A4_90)
	local L5_91 = L5_91
	L5_91 = L5_91(A0_86, A1_87, A2_88, A3_89)
	L5_91.objType = "wall"
	L5_91:setFillColor(0, 100, 0, 255)
	local L11_97 = L11_97
	if A4_90 then
		L11_97 = physics
		L11_97 = L11_97.addBody
		;({}).density = 1
		;({}).friction = 0
		;({}).bounce = 0
		;({}).filter = ONLY_TANK
		L11_97(L5_91, "static", {})
		break -- pseudo-goto
	end
	L11_97 = physics
	L11_97 = L11_97.addBody
	local L7_93 = L7_93
	local L8_94 = L8_94
	;({}).density = 1
	;({}).friction = 20
	;({}).bounce = 0
	L11_97(L7_93, L8_94, {})
	local L9_95 = L9_95
	repeat
	until true
	return L5_91
end
function getScreenRocks(A0_98)
	local L2_99 = L2_99
	do return L2_99(_ENV, A0_98) end
	local L3_100 = L3_100
end
function getScreenTanks(A0_101)
	local L1_102, L2_103, L3_104, L4_105, L5_106
	L1_102 = {}
	L2_103 = 1
	L3_104 = players
	L3_104 = #L3_104
	L4_105 = 1
	for L5_106 = L2_103, L3_104, L4_105 do
		if A0_101 == nil or players[L5_106] ~= A0_101 then
			local L6_107 = L6_107
			local L7_108 = L7_108
			L6_107(L7_108, players[L5_106])
			local L8_109 = L8_109
		end
	end
	return L1_102
end
function objectNeighbours(A0_110)
	if A0_110.neighbours then
		local L2_112 = type(A0_110.neighbours)
		if L2_112 == "function" then
			L2_112 = A0_110.neighbours
			do return L2_112() end
			repeat
				do break end -- pseudo-goto
				L2_112 = A0_110.neighbours
				return L2_112
			until true
		end
	end
	L2_112 = {}
	return L2_112
end
function cleanUp(A0_113)
	local L5_118 = L5_118
	if A0_113.objType == "rock" then
		L5_118 = destabilizeNeighbours
		L5_118(math.random(), A0_113.player, A0_113)
		L5_118 = A0_113.destructionHandler
		if L5_118 then
			L5_118 = A0_113.destructionHandler
			L5_118(_ENV, A0_113)
		end
		L5_118 = A0_113.doExplosionEffect
		if L5_118 then
			L5_118 = A0_113.doExplosionEffect
			L5_118(A0_113, {})
		end
	end
	L5_118 = objectNeighbours
	L5_118 = L5_118(A0_113)
	if L5_118 then
		_FOR_ = 1
		for _FORV_5_ = _FOR_, _FOR_, _FOR_ do
			if table.indexOf(objectNeighbours(L5_118[_FORV_5_]), A0_113) then
				local L9_122 = L9_122
				table.remove(objectNeighbours(L5_118[_FORV_5_]), (table.indexOf(objectNeighbours(L5_118[_FORV_5_]), A0_113)))
				local L10_123 = L10_123
			end
		end
	end
	L4_117 = utils
	L4_117 = L4_117.removeDisplayObject
	L6_119 = A0_113
	L4_117(L6_119)
	A0_113.neighbours = nil
	A0_113 = nil
end
function destabilizeNeighbours(A0_124, A1_125, A2_126)
	local L3_127
	L3_127 = A2_126.destabilizationPass
	local L6_130 = L6_130
	if L3_127 ~= nil then
		L3_127 = A2_126.destabilizationPass
		if L3_127 == A0_124 then
			goto lbl_81
		end
	end
	A2_126.destabilizationPass = A0_124
	L3_127 = {}
	L6_130 = objectNeighbours
	L7_131 = A2_126
	L6_130 = L6_130(L7_131)
	if L6_130 then
		L7_131 = 1
		L8_132 = #L6_130
		_FOR_ = 1
		for _FORV_8_ = L7_131, L8_132, _FOR_ do
			if L6_130[_FORV_8_] and A2_126 and L6_130[_FORV_8_].y and A2_126.y and L6_130[_FORV_8_].y <= A2_126.y and table.indexOf(objectNeighbours(L6_130[_FORV_8_]), A2_126) then
				table.remove(objectNeighbours(L6_130[_FORV_8_]), (table.indexOf(objectNeighbours(L6_130[_FORV_8_]), A2_126)))
				L6_130[_FORV_8_].makeDynamic()
				L6_130[_FORV_8_]:setMask(nil)
				L6_130[_FORV_8_].player = A1_125
				L6_130[_FORV_8_].postCollision = onCollision
				_ENV.trackObject(L6_130[_FORV_8_])
				L6_130[_FORV_8_]:addEventListener("postCollision", L6_130[_FORV_8_])
				table.insert(L3_127, L6_130[_FORV_8_])
			end
		end
	end
	L7_131 = 1
	L8_132 = #L3_127
	L14_138 = 1
	for _FORV_8_ = L7_131, L8_132, L14_138 do
		local L11_135 = L11_135
		L11_135(A0_124, A1_125, L3_127[_FORV_8_])
		local L12_136 = L12_136
	end
	::lbl_81::
end
function hasNeighbourBelow(A0_139)
	local L1_140
	L1_140 = A0_139.y
	local L4_143 = objectNeighbours
	L5_144 = A0_139
	L4_143 = L4_143(L5_144)
	if L4_143 then
		L5_144 = 1
		L6_145 = #L4_143
		L7_146 = 1
		for _FORV_6_ = L5_144, L6_145, L7_146 do
			if L4_143[_FORV_6_].y and L1_140 < L4_143[_FORV_6_].y then
				return true
			end
		end
	end
	L5_144 = false
	return L5_144
end
function crackRock(A0_147, A1_148, A2_149, A3_150, A4_151)
	local L5_152, L6_153, L7_154
	L5_152 = MAXIMUM_ROCK_SIZE
	local L6_153, L13_160, L14_161, L15_162, L20_167, L21_168, L22_169, L23_170 = ROCKINFO, L13_160, L14_161, L15_162, L20_167, L21_168, L22_169, L23_170
	L6_153 = L6_153.MINIMUM_ROCK_SIZE
	L5_152 = L5_152 * L6_153
	L5_152 = L5_152 * 2
	L6_153 = A0_147 or L6_153
	if not A0_147 then
		L6_153 = A1_148.player
	end
	L7_154 = objectTemplates
	L7_154 = L7_154.rocks
	L13_160 = A1_148.index
	L7_154 = L7_154[L13_160]
	if L7_154 == nil then
		L13_160 = print
		L14_161 = "nil rocktpe"
		L15_162 = A1_148.index
		L13_160(L14_161, L15_162)
	end
	L13_160 = A1_148.rotation
	L14_161 = A1_148.rockScale
	if not L14_161 then
		L14_161 = 0
	end
	L15_162 = objectTemplates
	L15_162 = L15_162.rockChildrenForScale
	L20_167 = L7_154
	L21_168 = L14_161
	L15_162 = L15_162(L20_167, L21_168)
	L20_167 = L15_162.rocks
	L21_168 = A1_148.x
	L22_169 = A1_148.y
	L23_170 = {}
	A1_148.removed = true
	function highestRocks(A0_183)
		local L1_184, L2_185, L3_186, L4_187, L5_188, L6_189
		L1_184 = _ENV
		L1_184 = L1_184.height
		L2_185 = {}
		L3_186 = 1
		L4_187 = #A0_183
		L5_188 = 1
		for L6_189 = L3_186, L4_187, L5_188 do
			if A0_183[L6_189].y then
				if A0_183[L6_189].y == L1_184 then
					local L7_190 = L7_190
					L7_190(L2_185, A0_183[L6_189])
					local L9_192 = L9_192
					break -- pseudo-goto
				end
				L7_190 = A0_183[L6_189]
				L7_190 = L7_190.y
				if L1_184 > L7_190 then
					L7_190 = A0_183[L6_189]
					L1_184 = L7_190.y
					L7_190 = {}
					L9_192 = A0_183[L6_189]
					L7_190[1] = L9_192
					repeat
						L2_185 = L7_190
					until true
				end
			end
		end
		return L2_185
	end
	highestRockNeighbours = highestRocks(objectNeighbours(A1_148))
	cleanUp(A1_148)
	local L18_165 = L18_165
	A1_148 = nil
	_FOR_ = 1
	for _FORV_22_ = _FOR_, _FOR_, _FOR_ do
		if L20_167[_FORV_22_].scale * L14_161 >= L7_154.minScale then
			local L31_178 = L31_178
			local L32_179 = L32_179
			local L33_180 = L33_180
			if L5_152 >= math.max(L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169)).contentWidth, L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169)).contentHeight) then
				timer.performWithDelay(math.random(1000, 3000), function()
					cleanUp(_ENV)
					local L1_193 = L1_193
				end)
			end
			L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169)).rootWeapon = A4_151
			L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169)).postCollision = onCollision
			L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169)):addEventListener("postCollision", (L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169))))
			repeat
				L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169)).player = L6_153
				table.insert(L23_170, (L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169))))
				if L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169)).y == L32_179 then
					table.insert(L33_180, (L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169))))
				elseif L32_179 > L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169)).y then
					L32_179 = L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169)).y
					L33_180, ({})[1] = {}, L21_21:getRock(L20_167[_FORV_22_].rockNum, utils.getRotatedPoint(L20_167[_FORV_22_].point.x * (L20_167[_FORV_22_].scale * L14_161) + L21_168, L20_167[_FORV_22_].point.y * (L20_167[_FORV_22_].scale * L14_161) + L22_169, L13_160, L21_168, L22_169))
				end
				do break end -- pseudo-goto
				table.insert(L23_170, nil)
			until true
		end
	end
	L34_181 = 1
	L35_182 = highestRockNeighbours
	L35_182 = #L35_182
	_FOR_ = 1
	for _FORV_22_ = L34_181, L35_182, _FOR_ do
		if highestRockNeighbours[_FORV_22_] and highestRockNeighbours[_FORV_22_].neighbours then
			_FOR_ = 1
			for _FORV_26_ = _FOR_, _FOR_, _FOR_ do
				join(L33_180[_FORV_26_], highestRockNeighbours[_FORV_22_])
				table.insert(objectNeighbours(L33_180[_FORV_26_]), highestRockNeighbours[_FORV_22_])
				table.insert(objectNeighbours(highestRockNeighbours[_FORV_22_]), L33_180[_FORV_26_])
			end
		end
	end
	if A2_149 then
		L34_181 = ROCKINFO
		L34_181 = L34_181.MINIMUM_ROCK_SIZE
		L34_181 = L34_181 * 2.5
		if L14_161 > L34_181 then
			L34_181 = L15_162.joints
			if not L34_181 then
				L34_181 = {}
			end
			L35_182 = 1
			_FOR_ = 2
			for _FORV_23_ = L35_182, _FOR_, _FOR_ do
				rock1 = L23_170[L34_181[_FORV_23_]]
				rock2 = L23_170[L34_181[_FORV_23_ + 1]]
				if rock1 and rock2 then
					join(rock1, rock2, "weld")
					table.insert(objectNeighbours(rock1), rock2)
					table.insert(objectNeighbours(rock2), rock1)
				end
				repeat
					do break end -- pseudo-goto
					L34_181 = 1
					L35_182 = #L23_170
					_FOR_ = 1
					for _FORV_22_ = L34_181, L35_182, _FOR_ do
						L23_170[_FORV_22_].bodyType = "dynamic"
					end
				until true
			end
		end
	end
	return L23_170
end
function getWheelOfFortune()
	return _ENV.getWheelOfFortune()
end
function setWheelOfFortune(A0_194)
	_ENV.setWheelOfFortune(A0_194)
	if A0_194 then
		local L2_195 = L2_195
		local L2_195, L3_196 = L2_195(A0_194, "arcadeMode"), L3_196
		if L2_195 then
			L2_195 = true
			ARCADE_MODE = L2_195
		end
	end
end
function getScoreMultiplier(A0_197)
	local L1_198, L2_199
	L1_198 = 1
	if not A0_197 then
		L2_199 = {}
		A0_197 = L2_199
	end
	L2_199 = A0_197.scorePlayer
	if not L2_199 then
		L2_199 = nil
	end
	if L2_199 and L2_199.getScoreMultiplier then
		if not A0_197.objType then
		end
		if not A0_197.objSubType then
		end
		local L7_204 = L7_204
		L1_198 = L1_198 * L2_199.getScoreMultiplier(nil, nil)
	end
	L7_204 = getWheelOfFortune
	L7_204 = L7_204()
	if L7_204 then
		if L7_204:isActive("points2x") then
			L1_198 = L1_198 * 2
		else
			local L4_201, L5_202 = L4_201, L5_202
			local L4_201, L6_203 = L4_201(L5_202, "points4x"), L6_203
			if L4_201 then
				L1_198 = L1_198 * 4
			end
		end
	end
	return L1_198
end
function displayScore(A0_205, A1_206, A2_207, A3_208)
	local L4_209
	if not A3_208 then
		L4_209 = {}
		A3_208 = L4_209
	end
	L4_209 = A3_208.multiplier
	if not L4_209 then
		L4_209 = 1
	end
	if type(A0_205) == "number" then
		if 0 < A0_205 then
			A0_205 = " + " .. tostring(A0_205)
		elseif A0_205 < 0 then
			A0_205 = " - " .. tostring(A0_205)
		else
			return
		end
		if L4_209 and L4_209 ~= 1 then
			if A1_206 < 0 then
			end
			local L12_217 = L12_217
			local L13_218 = L13_218
			local L14_219 = L14_219
			;({}).color, ({})[1] = {}, 255
			;({}).color, ({})[2] = {}, 255
			;({}).color, ({})[3] = {}, 0
			local ({}).color, ({})[4], L15_220 = {}, 255, L15_220
			L13_218(L14_219, L15_220, A2_207 - 70, {})
		end
	end
	L12_217 = TextCandy
	L12_217 = L12_217.CreateText
	L13_218 = {}
	L13_218.fontName = "gameplay"
	L13_218.text = A0_205
	L13_218.originX = "CENTER"
	L13_218.textFlow = "RIGHT"
	L13_218.charBaseLine = "CENTER"
	L13_218.showOrigin = false
	L12_217 = L12_217(L13_218)
	L13_218 = A3_208.color
	if L13_218 then
		L14_219 = L12_217
		L13_218 = L12_217.setColor
		L15_220 = A3_208.color
		L15_220 = L15_220[1]
		L13_218(L14_219, L15_220, A3_208.color[2], A3_208.color[3], A3_208.color[4])
	end
	L13_218 = A3_208.scale
	if L13_218 then
		L13_218 = A3_208.scale
		L12_217.xScale = L13_218
		L13_218 = A3_208.scale
		L12_217.yScale = L13_218
	end
	L13_218 = screenGroup
	L14_219 = L13_218
	L13_218 = L13_218.insert
	L15_220 = L12_217
	L13_218(L14_219, L15_220)
	L12_217.x = A1_206
	L12_217.y = A2_207
	L13_218 = transition
	L13_218 = L13_218.to
	L14_219 = L12_217
	L15_220 = {}
	L15_220.time = 3000
	L15_220.alpha = 0
	L15_220.y = L12_217.y - 200
	function L15_220.onComplete()
		if _ENV.delete then
			_ENV:delete()
			local L1_221 = L1_221
		end
	end
	L13_218 = L13_218(L14_219, L15_220)
	L14_219 = _ENV
	L14_219[L13_218] = L13_218
end
function crackRockInPolygon(A0_222, A1_223, A2_224, A3_225, A4_226, A5_227, A6_228)
	local L14_236 = L14_236
	if not A0_222 then
	end
	L14_236(math.random(), A1_223.player, A1_223)
	L14_236 = A1_223.removed
	if L14_236 then
		return
	end
	L14_236 = physics
	L14_236 = L14_236.pause
	L14_236()
	if not A6_228 then
		A6_228 = A1_223.rootWeapon
	end
	if not A5_227 then
		L14_236 = objectTemplates
		L14_236 = L14_236.rocks
		L14_236 = L14_236[A1_223.index]
		if L14_236 == nil then
			print("nil rocktpe", parentRock.index)
			physics.start()
			return
		end
		if not A1_223.rockScale then
		end
		_FOR_ = 1
		for _FORV_14_ = _FOR_, _FOR_, _FOR_ do
			local L15_237 = L15_237
			if objectTemplates.rockChildrenForScale(L14_236, 0).rocks[_FORV_14_].scale * 0 < L14_236.minScale then
				physics.start()
				local L16_238 = L16_238
				return
			end
		end
	end
	L14_236 = crackRock
	L15_237 = A0_222
	L16_238 = A1_223
	L14_236 = L14_236(L15_237, L16_238, A2_224, A4_226, A6_228)
	L15_237 = destructionSphere
	if L15_237 ~= nil then
		L15_237 = timer
		L15_237 = L15_237.performWithDelay
		L16_238 = 1
		L15_237 = L15_237(L16_238, function(A0_239)
			local L1_240
			L1_240 = A0_239.source
			L1_240 = L1_240.params
			local L2_241 = L2_241
			local L3_242 = L3_242
			local L4_243 = L4_243
			local L5_244 = L5_244
			local L6_245 = L6_245
			local L7_246 = L7_246
			local L8_247 = L8_247
			local L9_248 = L9_248
			L2_241(L3_242, L4_243, L5_244, L6_245, L7_246, L8_247, L9_248, L1_240.weaponType)
			local L10_249 = L10_249
		end)
		L16_238 = {}
		L16_238.rootWeapon = A6_228
		L16_238.weaponType = weaponType
		L16_238.player = A0_222
		L16_238.destructionSphere = destructionSphere
		L16_238.newRockSpawn = L14_236
		L16_238.scale = A4_226
		L16_238.removeEngulfees = A5_227
		L15_237.params = L16_238
	end
	L15_237 = physics
	L15_237 = L15_237.start
	L15_237()
	L15_237 = sound
	L15_237 = L15_237.playSound
	L16_238 = _ENV
	local L12_234 = L12_234
	L12_234 = L12_234(1, #_ENV)
	L16_238 = L16_238[L12_234]
	L15_237(L16_238)
end
function crackRockInSphere(A0_250, A1_251, A2_252, A3_253, A4_254, A5_255, A6_256)
	local L14_264 = L14_264
	if not A0_250 then
	end
	L14_264(math.random(), A1_251.player, A1_251)
	L14_264 = A1_251.removed
	if L14_264 then
		return
	end
	L14_264 = physics
	L14_264 = L14_264.pause
	L14_264()
	if not A6_256 then
		A6_256 = A1_251.rootWeapon
	end
	if not A5_255 then
		L14_264 = objectTemplates
		L14_264 = L14_264.rocks
		L14_264 = L14_264[A1_251.index]
		if L14_264 == nil then
			print("nil rocktpe", parentRock.index)
			physics.start()
			return
		end
		if not A1_251.rockScale then
		end
		_FOR_ = 1
		for _FORV_14_ = _FOR_, _FOR_, _FOR_ do
			local L15_265 = L15_265
			if objectTemplates.rockChildrenForScale(L14_264, 0).rocks[_FORV_14_].scale * 0 < L14_264.minScale then
				physics.start()
				local L16_266 = L16_266
				return
			end
		end
	end
	L14_264 = crackRock
	L15_265 = A0_250
	L16_266 = A1_251
	L14_264 = L14_264(L15_265, L16_266, A2_252, A4_254, A6_256)
	if A3_253 ~= nil then
		L15_265 = timer
		L15_265 = L15_265.performWithDelay
		L16_266 = 1
		L15_265 = L15_265(L16_266, function(A0_267)
			local L1_268
			L1_268 = A0_267.source
			L1_268 = L1_268.params
			local L2_269 = L2_269
			local L3_270 = L3_270
			local L4_271 = L4_271
			local L5_272 = L5_272
			local L6_273 = L6_273
			local L7_274 = L7_274
			local L8_275 = L8_275
			local L9_276 = L9_276
			L2_269(L3_270, L4_271, L5_272, L6_273, L7_274, L8_275, L9_276, L1_268.weaponType)
			local L10_277 = L10_277
		end)
		L16_266 = {}
		L16_266.rootWeapon = A6_256
		L16_266.weaponType = weaponType
		L16_266.player = A0_250
		L16_266.destructionSphere = A3_253
		L16_266.newRockSpawn = L14_264
		L16_266.scale = A4_254
		L16_266.removeEngulfees = A5_255
		L15_265.params = L16_266
	end
	L15_265 = physics
	L15_265 = L15_265.start
	L15_265()
	L15_265 = sound
	L15_265 = L15_265.playSound
	L16_266 = _ENV
	local L12_262 = L12_262
	L12_262 = L12_262(1, #_ENV)
	L16_266 = L16_266[L12_262]
	L15_265(L16_266)
end
function L17_17.enterScene(A0_278, A1_279)
	_ENV = true
	storyboard.removeScene("armoryScene")
	storyboard.removeScene("storeScene")
	L19_19:enable()
	local L2_280 = L2_280
	L2_280(L19_19, true)
	L2_280 = A0_278.view
	screenGroup.xScale = DEFAULT_X_SCALE
	screenGroup.yScale = DEFAULT_Y_SCALE
	L9_9.view:insert(screenGroup)
	BattleControls:show()
	if PRE_BATTLE_LOADING then
		PRE_BATTLE_LOADING:destroy()
		PRE_BATTLE_LOADING = nil
	end
	local L3_281 = L3_281
	L3_281 = L3_281(L2_280, screenX, 0, screenWidth, display.contentHeight)
	L3_281:setFillColor(0, 0, 0)
	local L8_286 = L8_286
	L8_286 = transition
	L8_286 = L8_286.to
	;({}).alpha = 0
	;({}).time = 1000
	;({}).transition = easing.inOutQuad
	;({}).onComplete = function()
		_ENV:removeSelf()
		local L1_287 = L1_287
	end
	L8_286(L3_281, {})
	L8_286 = L0_0
	L8_286 = L8_286.enterScene
	L8_286()
	L8_286 = system
	L8_286 = L8_286.activate
	L8_286("multitouch")
	L8_286 = L0_0
	L8_286 = L8_286.isMultiplayer
	if not L8_286 then
		L8_286 = CUSTOM_OVERRIDES
		L8_286 = L8_286.WHEEL_OF_FORTUNE
		if not L8_286 then
			L8_286 = activeCountry
			L8_286 = L8_286.wheelOfFortune
			if not L8_286 then
				goto lbl_105
			end
		end
		L8_286 = getWheelOfFortune
		L8_286 = L8_286()
		if L8_286 == nil then
			L8_286 = storyboard
			L8_286 = L8_286.gotoScene
			L8_286("wheelScene")
		else
			L8_286 = getWheelOfFortune
			L8_286 = L8_286()
			L8_286 = L8_286.applied
			if not L8_286 then
				L8_286 = getWheelOfFortune
				L8_286 = L8_286()
				L8_286 = L8_286.apply
				L8_286(L8_286)
			end
		end
	end
	::lbl_105::
	L8_286 = player
	if L8_286 then
		L8_286 = player
		L8_286 = L8_286.tankType
		if L8_286 ~= tankTypes.BASIC_GREEN_TANK then
			L8_286 = player
			L8_286 = L8_286.tankType
			if L8_286 ~= tankTypes.BASIC_ORANGE_TANK then
				L8_286 = missions
				L8_286 = L8_286.setStat
				local L5_283 = L5_283
				local L6_284 = L6_284
				L8_286(L5_283, L6_284, true)
				local L7_285 = L7_285
			end
		end
	end
end
function L17_17.exitScene(A0_288, A1_289)
	system.deactivate("multitouch")
	display.getCurrentStage():setFocus(nil)
	_ENV = false
	L19_19:disable()
	local L2_290 = L2_290
	L2_290(L19_19, false)
	L2_290 = A0_288.view
	BattleControls:hide()
	local L3_291, L4_292 = L3_291, L4_292
end
function L17_17.destroyScene(A0_293, A1_294)
	Runtime:removeEventListener("enterFrame", weaponManualPhysics)
	spritesheetmanager.disposeSpriteSet("res/ui/windsock.png")
	spritesheetmanager.disposeSpriteSet("res/controls/gears.png")
	local L2_295 = tutorial.getBattleTutorialIds()
	_FOR_ = 1
	for _FORV_6_ = _FOR_, _FOR_, _FOR_ do
		if weaponTypes[_FORV_6_].tutorial then
			table.insert(L2_295, weaponTypes[_FORV_6_].tutorial.id)
		end
	end
	tutorial.closeTutorials(L2_295)
	FXLibrary.CleanUp()
	FXLibrary = nil
	Particles.CleanUp()
	Particles = nil
	cancelJigglyWorld()
	battlefieldFlair.destroy()
	battlefieldFlair = nil
	Weapon.destroy()
	Tank.disposeAllSounds()
	TankExplosions.destroy()
	if _ENV then
		_ENV:destroy()
	end
	_ENV = nil
	if _UPVALUE1_ then
		_FOR_, _FOR_, _FOR_ = pairs(_UPVALUE1_)
		for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
			transition.cancel(_FORV_7_)
			_UPVALUE1_[_FORV_6_] = nil
		end
	end
	_UPVALUE1_ = nil
	BattleControls:destroy()
	L19_19:destroy()
	_FOR_, _FOR_, _FOR_ = pairs(players)
	for _FORV_6_, _FORV_7_ in _FOR_, _FOR_, _FOR_ do
		_FORV_7_:destroy()
		players[_FORV_6_] = nil
	end
	player = nil
	_UPVALUE3_ = nil
	players = nil
	_UPVALUE4_ = nil
	L0_0 = nil
	L4_4 = nil
	local L3_296 = getScreenRocks()
	if L3_296 and 0 < #L3_296 then
		_FOR_, _FOR_, _FOR_ = pairs(L3_296)
		for _FORV_7_, _FORV_8_ in _FOR_, _FOR_, _FOR_ do
			display.remove(_FORV_8_)
			_FORV_8_.neighbours = nil
			_FORV_8_.rockBelow = nil
		end
	end
	L3_296 = nil
	L9_302 = nil
	levelGroup = L9_302
	L9_302 = sound
	L9_302 = L9_302.disposeSoundBatch
	L9_302(L5_5)
	L9_302 = nil
	L5_5 = L9_302
	L9_302 = sound
	L9_302 = L9_302.stop
	L9_302(_UPVALUE8_)
	L9_302 = sound
	L9_302 = L9_302.disposeSoundBatch
	L9_302(L6_6)
	L9_302 = nil
	L6_6 = L9_302
	L9_302 = nil
	L9_9 = L9_302
	L9_302 = nil
	L19_19 = L9_302
	L9_302 = nil
	L20_20 = L9_302
	L9_302 = L21_21
	L9_302 = L9_302.counter
	local L5_298 = L9_302:objects()
	L21_21:destroy()
	L9_302:destroy()
	L21_21 = nil
	wind = nil
	_UPVALUE8_ = nil
	_UPVALUE13_ = nil
	if TERRAIN_FLAIR then
		TERRAIN_FLAIR:removeSelf()
		TERRAIN_FLAIR = nil
	end
	if FRONT_TANK then
		FRONT_TANK:removeSelf()
		FRONT_TANK = nil
	end
	if TANKS then
		TANKS:removeSelf()
		TANKS = nil
	end
	if BEHIND_TANK then
		BEHIND_TANK:removeSelf()
		BEHIND_TANK = nil
	end
	if TERRAIN then
		TERRAIN:removeSelf()
		TERRAIN = nil
	end
	if BACKGROUND_FLAIR then
		BACKGROUND_FLAIR:removeSelf()
		BACKGROUND_FLAIR = nil
	end
	if BACKGROUND then
		BACKGROUND:removeSelf()
		BACKGROUND = nil
	end
	if CONTROLS then
		CONTROLS:removeSelf()
		CONTROLS = nil
	end
	if EXPLOSIONS then
		EXPLOSIONS:removeSelf()
		EXPLOSIONS = nil
	end
	if SCREEN_GROUP then
		SCREEN_GROUP:removeSelf()
		L7_300 = nil
		SCREEN_GROUP = L7_300
		L7_300 = nil
		screenGroup = L7_300
	end
	L7_300 = collectgarbage
	L7_300()
	L7_300 = 1
	_FOR_ = 1
	for _FORV_9_ = L7_300, _FOR_, _FOR_ do
		print("leaked object", L5_298[_FORV_9_].objectId, L5_298[_FORV_9_].objType)
		local L13_306 = L13_306
	end
	L5_298 = nil
end
function onCollision(A0_307, A1_308)
	repeat
		if A0_307.suspendRockCollisions or A1_308.other.suspendRockCollisions then
			A0_307:updateRockPosition()
			local L3_310 = L3_310
			return
		end
		L3_310 = A0_307.removeFlair
		if L3_310 then
			L3_310 = A0_307.removeFlair
			L3_310()
		end
		L3_310 = A1_308.other
		if not L3_310.rockScale then
		end
		if A0_307.rockScale <= A1_308.other.xScale and A1_308.force >= _ENV.ROCK_COLLISION_THRESHOLD then
			collide(A0_307)
			local L7_314 = L7_314
			local L8_315 = L8_315
			L8_315(L5_5[math.random(1, #L5_5)])
			break -- pseudo-goto
		end
		L8_315 = A0_307.updateRockPosition
		L8_315(A0_307)
	until true
end
function removeSmallAndOldRocks(A0_316)
	local L1_317, L2_318
	if A0_316 then
		L1_317 = #A0_316
		if L1_317 then
			L1_317 = {}
			L2_318 = 0
			L6_322 = 1
			_FOR_ = 1
			for _FORV_6_ = L6_322, _FOR_, _FOR_ do
				if A0_316[_FORV_6_].bodyType == "dynamic" then
					L2_318 = L2_318 + 1
					if (objectNeighbours(A0_316[_FORV_6_]) == nil or #objectNeighbours(A0_316[_FORV_6_]) == 0) and A0_316[_FORV_6_].rockScale < MINIMUM_ROCK_SIZE * 2 then
						table.insert(L1_317, A0_316[_FORV_6_])
					end
				end
			end
			L6_322 = #L1_317
			if 0 < L6_322 then
				L6_322 = #L1_317
				L7_323 = _ENV
				if L6_322 > L7_323 then
					L6_322 = table
					L6_322 = L6_322.sort
					L7_323 = L1_317
					function L8_324(A0_328, A1_329)
						local L2_330, L3_331
						L2_330 = A0_328.created
						L3_331 = A1_329.created
						L2_330 = L2_330 > L3_331
						return L2_330
					end
					L6_322(L7_323, L8_324)
					L6_322 = _ENV
					L6_322 = L2_318 - L6_322
					L7_323 = 0
					L8_324 = #L1_317
					L9_325 = 1
					_FOR_ = -1
					for _FORV_8_ = L8_324, L9_325, _FOR_ do
						cleanUp(L1_317[_FORV_8_])
						L7_323 = L7_323 + 1
						L1_317[_FORV_8_] = nil
						if L6_322 < L7_323 then
							break
						end
					end
				end
			end
		end
	end
end
function collide(A0_332)
	if A0_332.removed or A0_332.objType ~= "rock" then
		return
	end
	function f(A0_336)
		local L1_337
		L1_337 = _ENV
		local L2_338 = L2_338
		local L3_339 = L3_339
		local L4_340 = L4_340
		local L5_341 = L5_341
		local L6_342, L7_343 = L6_342, L7_343
		local L8_344 = L8_344
		L2_338(L3_339, L4_340, L5_341, L6_342, L7_343, L8_344, L1_337.rootWeapon)
		local L9_345 = L9_345
	end
	local L1_333 = L1_333
	local L2_334 = L2_334
	L1_333(L2_334, f)
	local L3_335 = L3_335
end
function centerViewPort(A0_346, A1_347, A2_348)
	local L3_349, L4_350
	if A0_346 == nil then
		return
	end
	L3_349 = A0_346.x
	L4_350 = A0_346.y
	if _ENV.lastDisplay then
		L3_349 = _ENV.lastDisplay.x
		L4_350 = _ENV.lastDisplay.y
	else
		L3_349 = screenX - (L3_349 - screenWidth / 2)
		L4_350 = -(L4_350 - display.contentHeight / 2)
		;({}).x = L3_349
		_ENV.lastDisplay, ({}).y = {}, L4_350
	end
	if not SCREENFLOW_RECORDING then
		local L5_351, L6_352 = L5_351, L6_352
		local L7_353 = L7_353
		local L8_354 = L8_354
		local L9_355 = L9_355
		local L10_356 = L10_356
		local L11_357 = L11_357
		L5_351(L6_352, L7_353, L8_354, L9_355, L10_356, L11_357, A2_348)
		local L12_358 = L12_358
	end
end
function trackWeaponStart(A0_359)
	if not A0_359.ignoreViewWeaponTracking then
		trackWeaponStop()
	end
	_ENV.lastDisplay.x = screenGroup.x
	_ENV.lastDisplay.y = screenGroup.y
	if A0_359 == nil or A0_359.getLinearVelocity == nil then
		return
	end
	if A0_359.weaponType == weaponTypes.BABY_SHIELD or A0_359.weaponType == weaponTypes.BIG_SHIELD then
		return
	end
	A0_359.isTracked = true
	if not A0_359.ignoreViewWeaponTracking then
		local L1_360, L2_361 = L1_360, L2_361
		L1_360(L2_361, A0_359)
		local L3_362 = L3_362
	end
end
function trackWeaponStop(A0_363)
	local L2_364 = L2_364
	L2_364(_ENV, nil)
	local L3_365 = L3_365
end
function cancelJigglyWorld()
	if SCREEN_GROUP.jiggleTrans then
		local L0_366 = L0_366
		L0_366(SCREEN_GROUP.jiggleTrans)
		local L1_367 = L1_367
	end
	L0_366 = SCREEN_GROUP
	L0_366.jiggleTrans = nil
	L0_366 = SCREEN_GROUP
	L1_367 = SCREEN_GROUP
	L1_367 = L1_367.homeX
	L0_366.x = L1_367
	L0_366 = SCREEN_GROUP
	L1_367 = SCREEN_GROUP
	L1_367 = L1_367.homeY
	L0_366.y = L1_367
	L0_366 = SCREEN_GROUP
	L0_366.rotation = 0
	L0_366 = SCREEN_GROUP
	L0_366.startTime = nil
end
function jigglyWorld(A0_368, A1_369)
	local L2_370
	L2_370 = SCREEN_GROUP
	L2_370 = L2_370.homeX
	if not L2_370 then
		L2_370 = SCREEN_GROUP
		L2_370.homeX = SCREEN_GROUP.x
		L2_370 = SCREEN_GROUP
		L2_370.homeY = SCREEN_GROUP.y
	end
	L2_370 = SCREEN_GROUP
	L2_370 = L2_370.startTime
	if not L2_370 then
		L2_370 = SCREEN_GROUP
		L2_370.startTime = system.getTimer()
	end
	L2_370 = {}
	L2_370[1] = -1
	L2_370[2] = 1
	local L3_371 = L3_371
	L3_371 = L3_371(1, #L2_370)
	L3_371 = L2_370[L3_371]
	L3_371 = L3_371 * A0_368
	local L4_372 = L4_372
	L4_372 = L4_372(1, #L2_370)
	L4_372 = L2_370[L4_372]
	L4_372 = L4_372 * A0_368
	local L5_373 = L5_373
	local L6_374 = L6_374
	L5_373 = L5_373(L6_374, #L2_370)
	L5_373 = L2_370[L5_373]
	L5_373 = L5_373 * 0.5
	L6_374 = SCREEN_GROUP
	local L7_375 = L7_375
	local L8_376 = L8_376
	;({}).time = 30
	;({}).x = SCREEN_GROUP.homeX + L3_371
	local ({}).y, L10_378 = SCREEN_GROUP.homeY + L4_372, L10_378
	L10_378.rotation = L5_373
	function L10_378.onComplete()
		repeat
			if SCREEN_GROUP.startTime and system.getTimer() - SCREEN_GROUP.startTime < _ENV then
				local L1_379 = L1_379
				L1_379(A0_368, _ENV)
				local L2_380 = L2_380
				break -- pseudo-goto
			end
			L1_379 = cancelJigglyWorld
			L1_379()
		until true
	end
	L7_375 = L7_375(L8_376, L10_378)
	L6_374.jiggleTrans = L7_375
end
L17_17:addEventListener("createScene", L17_17)
L17_17:addEventListener("enterScene", L17_17)
L17_17:addEventListener("exitScene", L17_17)
local L22_22, L23_23 = L22_22, L23_23
local L24_24 = L24_24
L17_17:addEventListener("destroyScene", L17_17)
local L25_25 = L25_25
return L17_17
