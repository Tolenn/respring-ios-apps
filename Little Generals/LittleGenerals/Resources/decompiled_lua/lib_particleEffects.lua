local L3_3, L4_4 = L3_3, (...)
L3_3(L4_4, package.seeall)
L3_3 = require
L4_4 = "physicsGroups"
L3_3(L4_4)
L3_3 = "res/weapons/particles/"
L4_4 = 130
EXPLOSION_BASE_WIDTH = L4_4
L4_4 = {}
function Initialize()
	local L0_5
	L0_5 = _ENV
	L0_5[1] = display.newImageRect(L0_0 .. "electric_spark.png", 8, 32)
	L0_5 = _ENV
	L0_5[2] = display.newImageRect(L0_0 .. "red_spark.png", 8, 32)
	L0_5 = _ENV
	L0_5[3] = display.newImageRect(L0_0 .. "fire.png", 130, 126)
	L0_5 = _ENV
	L0_5[4] = display.newImageRect(L0_0 .. "smallsplosion.png", 131, 140)
	L0_5 = _ENV
	L0_5[5] = display.newImageRect(L0_0 .. "explospark.png", 19, 68)
	L0_5 = _ENV
	L0_5[6] = display.newImageRect(L0_0 .. "smoke.png", 130, 133)
	L0_5 = _ENV
	L0_5[7] = display.newImageRect(L0_0 .. "bigsplosion.png", 139, 140)
	L0_5 = _ENV
	L0_5[8] = display.newImageRect(L0_0 .. "splosion1c.png", 136, 150)
	L0_5 = _ENV
	L0_5[9] = display.newImageRect(L0_0 .. "baseparticle.png", 51, 52)
	L0_5 = _ENV
	L0_5[10] = display.newImageRect(L0_0 .. "cloudparticle.png", 97, 93)
	L0_5 = _ENV
	L0_5[11] = display.newImageRect(L0_0 .. "lightsmoke.png", 130, 131)
	L0_5 = _ENV
	L0_5[12] = display.newImageRect(L0_0 .. "treadbit.png", 9, 11)
	L0_5 = _ENV
	L0_5[13] = display.newImageRect(L0_0 .. "treads.png", 30, 22)
	L0_5 = _ENV
	L0_5[14] = display.newImageRect(L0_0 .. "wheel.png", 22, 22)
	L0_5 = _ENV
	L0_5[15] = display.newImageRect(L0_0 .. "toxicshrap1.png", 12, 14)
	L0_5 = _ENV
	L0_5[16] = display.newImageRect(L0_0 .. "toxicshrap2.png", 16, 13)
	L0_5 = _ENV
	L0_5[17] = display.newImageRect("res/ui/warbux.png", 75, 60)
	L0_5 = _ENV
	L0_5[18] = display.newImageRect("res/ui/fireparticle1.png", 16, 17)
	L0_5 = _UPVALUE2_
	L0_5[1] = nil
	L0_5 = _UPVALUE2_
	L0_5[2] = nil
	L0_5 = _UPVALUE2_
	L0_5[3] = nil
	L0_5 = _UPVALUE2_
	L0_5[4] = nil
	L0_5 = _UPVALUE2_
	L0_5[5] = nil
	L0_5 = _UPVALUE2_
	L0_5[6] = nil
	L0_5 = _UPVALUE2_
	L0_5[7] = nil
	L0_5 = 1
	while _ENV[L0_5] ~= nil do
		_ENV[L0_5].isVisible = false
		L0_5 = L0_5 + 1
	end
	;({}).imagePath = "res/ui/fireparticle1.png"
	;({}).imageWidth = 16
	;({}).imageHeight = 17
	;({}).weight = 0.8
	;({}).velocityStart = 100
	;({}).velocityVariation = 150
	;({}).directionVariation = 100
	;({}).useEmitterRotation = false
	;({}).alphaStart = 1
	;({}).emissionShape = 2
	;({}).emissionRadius = 20
	;({}).killOutsideScreen = true
	;({}).lifeTime = 2000
	;({}).rotationStart = 45
	;({}).fadeOutSpeed = -1
	;({}).fadeOutDelay = 0
	Particles.CreateParticleType("FireTongue", {})
	;({}).imagePath = "res/ui/warbux.png"
	;({}).imageWidth = 75
	;({}).imageHeight = 60
	;({}).weight = 0.8
	;({}).velocityStart = 200
	;({}).velocityVariation = 150
	;({}).directionVariation = 180
	;({}).useEmitterRotation = false
	;({}).alphaStart = 1
	;({}).emissionShape = 2
	;({}).emissionRadius = 20
	;({}).killOutsideScreen = true
	;({}).lifeTime = 4000
	;({}).rotationChange = 180
	Particles.CreateParticleType("Warbux", {})
	;({}).imagePath = "res/ui/warbux.png"
	;({}).imageWidth = 75
	;({}).imageHeight = 60
	;({}).weight = 0.8
	;({}).velocityStart = 800
	;({}).velocityVariation = 150
	;({}).directionVariation = 120
	;({}).useEmitterRotation = false
	;({}).alphaStart = 1
	;({}).emissionShape = 2
	;({}).emissionRadius = 20
	;({}).killOutsideScreen = true
	;({}).lifeTime = 4000
	;({}).rotationChange = -180
	Particles.CreateParticleType("Warbux2", {})
	;({}).imagePath = L0_0 .. "toxicshrap1.png"
	;({}).imageWidth = 12
	;({}).imageHeight = 14
	;({}).directionVariation = 180
	;({}).velocityVariation = 50
	;({}).killOutsideScreen = true
	;({}).lifeTime = 4000
	;({}).velocityStart = 25
	;({}).density = 0.75
	;({}).friction = 0.3
	;({}).bounce = 0.2
	;({}).PhysicsMaterial, ({}).filter = {}, GROUND_FILTER
	Particles.CreateParticleType("ToxicBits", {})
	;({}).imagePath = L0_0 .. "toxicshrap2.png"
	;({}).imageWidth = 16
	;({}).imageHeight = 13
	;({}).directionVariation = 180
	;({}).velocityVariation = 50
	;({}).killOutsideScreen = true
	;({}).lifeTime = 4000
	;({}).velocityStart = 25
	;({}).density = 0.75
	;({}).friction = 0.3
	;({}).bounce = 0.2
	;({}).PhysicsMaterial, ({}).filter = {}, GROUND_FILTER
	Particles.CreateParticleType("ToxicBits2", {})
	;({}).imagePath = L0_0 .. "coal.png"
	;({}).imageWidth = 50
	;({}).imageHeight = 42
	;({}).directionVariation = 360
	;({}).velocityVariation = 50
	;({}).killOutsideScreen = true
	;({}).lifeTime = 4000
	;({}).velocityStart = 25
	;({}).density = 0.75
	;({}).friction = 0.3
	;({}).bounce = 0.2
	;({}).PhysicsMaterial, ({}).filter = {}, GROUND_FILTER
	Particles.CreateParticleType("Coal", {})
	;({}).imagePath = L0_0 .. "coalsmoke.png"
	;({}).imageWidth = 130
	;({}).imageHeight = 131
	;({}).directionVariation = 360
	;({}).velocityVariation = 25
	;({}).rotationVariation = 360
	;({}).rotationChange = 60
	;({}).useEmitterRotation = false
	;({}).alphaStart = 0.3
	;({}).fadeInSpeed = 0.2
	;({}).fadeOutSpeed = -0.5
	;({}).fadeOutDelay = 500
	;({}).scaleStart = 0.1
	;({}).maxScale = 0.6
	;({}).scaleVariation = 0.2
	;({}).scaleInSpeed = 0.2
	;({}).scaleOutSpeed = 0.01
	;({}).scaleOutDelay = 1000
	;({}).killOutsideScreen = false
	;({}).lifeTime = 2000
	;({}).weight = -0.002
	;({}).velocityStart = 5
	;({}).emissionShape = 2
	;({}).emissionRadius = 20
	Particles.CreateParticleType("CoalExplosionSmoke", {})
	;({}).imagePath = L0_0 .. "wheel.png"
	;({}).imageWidth = 22
	;({}).imageHeight = 22
	;({}).directionVariation = 180
	;({}).velocityVariation = 100
	;({}).killOutsideScreen = true
	;({}).lifeTime = 4000
	;({}).velocityStart = 200
	;({}).density = 0.75
	;({}).friction = 0.3
	;({}).bounce = 0.2
	;({}).PhysicsMaterial, ({}).filter = {}, GROUND_FILTER
	Particles.CreateParticleType("TankBits", {})
	;({}).imagePath = L0_0 .. "treads.png"
	;({}).imageWidth = 30
	;({}).imageHeight = 22
	;({}).directionVariation = 180
	;({}).velocityVariation = 100
	;({}).killOutsideScreen = true
	;({}).lifeTime = 4000
	;({}).velocityStart = 200
	;({}).density = 0.75
	;({}).friction = 0.3
	;({}).bounce = 0.2
	;({}).PhysicsMaterial, ({}).filter = {}, GROUND_FILTER
	Particles.CreateParticleType("TankBits2", {})
	;({}).imagePath = L0_0 .. "treadbit.png"
	;({}).imageWidth = 9
	;({}).imageHeight = 11
	;({}).directionVariation = 180
	;({}).velocityVariation = 100
	;({}).killOutsideScreen = true
	;({}).lifeTime = 4000
	;({}).velocityStart = 200
	;({}).density = 0.75
	;({}).friction = 0.3
	;({}).bounce = 0.2
	;({}).PhysicsMaterial, ({}).filter = {}, GROUND_FILTER
	Particles.CreateParticleType("TankBits3", {})
	;({}).imagePath = L0_0 .. "smoke.png"
	;({}).imageWidth = 130
	;({}).imageHeight = 133
	;({}).directionVariation = 360
	;({}).velocityVariation = 50
	;({}).rotationVariation = 360
	;({}).rotationChange = 90
	;({}).useEmitterRotation = false
	;({}).alphaStart = 1
	;({}).fadeInSpeed = 0.2
	;({}).fadeOutSpeed = -0.5
	;({}).fadeOutDelay = 300
	;({}).scaleStart = 0.1
	;({}).maxScale = 0.25
	;({}).scaleVariation = 0.1
	;({}).scaleInSpeed = 0.2
	;({}).scaleOutSpeed = 0.01
	;({}).scaleOutDelay = 500
	;({}).killOutsideScreen = false
	;({}).lifeTime = 3000
	;({}).weight = -0.02
	;({}).velocityStart = 5
	;({}).emissionShape = 2
	;({}).emissionRadius = 75
	Particles.CreateParticleType("TankExplosionSmoke", {})
	;({}).imagePath = L0_0 .. "smoke.png"
	;({}).imageWidth = 130
	;({}).imageHeight = 133
	;({}).directionVariation = 360
	;({}).velocityVariation = 25
	;({}).rotationVariation = 360
	;({}).rotationChange = 60
	;({}).useEmitterRotation = false
	;({}).alphaStart = 0.3
	;({}).fadeInSpeed = 0.2
	;({}).fadeOutSpeed = -0.5
	;({}).fadeOutDelay = 500
	;({}).scaleStart = 0.1
	;({}).maxScale = 0.6
	;({}).scaleVariation = 0.2
	;({}).scaleInSpeed = 0.2
	;({}).scaleOutSpeed = 0.01
	;({}).scaleOutDelay = 1000
	;({}).killOutsideScreen = false
	;({}).lifeTime = 2000
	;({}).weight = -0.002
	;({}).velocityStart = 5
	;({}).emissionShape = 2
	;({}).emissionRadius = 20
	Particles.CreateParticleType("GenericBlackExplosionSmoke", {})
	;({}).imagePath = L0_0 .. "lightsmoke.png"
	;({}).imageWidth = 130
	;({}).imageHeight = 131
	;({}).directionVariation = 360
	;({}).velocityVariation = 25
	;({}).rotationVariation = 360
	;({}).rotationChange = 60
	;({}).useEmitterRotation = false
	;({}).alphaStart = 0.3
	;({}).fadeInSpeed = 0.2
	;({}).fadeOutSpeed = -0.5
	;({}).fadeOutDelay = 500
	;({}).scaleStart = 0.1
	;({}).maxScale = 0.6
	;({}).scaleVariation = 0.2
	;({}).scaleInSpeed = 0.2
	;({}).scaleOutSpeed = 0.01
	;({}).scaleOutDelay = 1000
	;({}).killOutsideScreen = false
	;({}).lifeTime = 2000
	;({}).weight = -0.002
	;({}).velocityStart = 5
	;({}).emissionShape = 2
	;({}).emissionRadius = 20
	Particles.CreateParticleType("GenericWhiteExplosionSmoke", {})
	;({}).imagePath = L0_0 .. "smoke.png"
	;({}).imageWidth = 130
	;({}).imageHeight = 133
	;({}).directionVariation = 360
	;({}).velocityVariation = 50
	;({}).rotationVariation = 360
	;({}).rotationChange = 30
	;({}).useEmitterRotation = false
	;({}).alphaStart = 1
	;({}).fadeInSpeed = 0.2
	;({}).fadeOutSpeed = -0.5
	;({}).fadeOutDelay = 300
	;({}).scaleStart = 0.1
	;({}).maxScale = 0.25
	;({}).scaleVariation = 0.1
	;({}).scaleInSpeed = 1
	;({}).scaleOutSpeed = 0.01
	;({}).scaleOutDelay = 500
	;({}).killOutsideScreen = false
	;({}).lifeTime = 3000
	;({}).weight = -0.01
	;({}).velocityStart = 5
	;({}).emissionShape = 2
	;({}).emissionRadius = 75
	Particles.CreateParticleType("ExplosionSmoke", {})
	;({}).imagePath = L0_0 .. "lightsmoke.png"
	;({}).imageWidth = 130
	;({}).imageHeight = 131
	;({}).directionVariation = 360
	;({}).velocityVariation = 50
	;({}).rotationVariation = 360
	;({}).rotationChange = 30
	;({}).useEmitterRotation = false
	;({}).alphaStart = 0
	;({}).fadeInSpeed = 0.2
	;({}).fadeOutSpeed = -0.5
	;({}).fadeOutDelay = 300
	;({}).scaleStart = 0.1
	;({}).maxScale = 0.25
	;({}).scaleVariation = 0.1
	;({}).scaleInSpeed = 1
	;({}).scaleOutSpeed = 0.01
	;({}).scaleOutDelay = 500
	;({}).killOutsideScreen = false
	;({}).lifeTime = 3000
	;({}).weight = -0.02
	;({}).velocityStart = 5
	;({}).emissionShape = 2
	;({}).emissionRadius = 75
	Particles.CreateParticleType("LightSmoke", {})
	;({}).imagePath = L0_0 .. "dirtcloud.png"
	;({}).imageWidth = 25
	;({}).imageHeight = 25
	;({}).rotationVariation = 360
	;({}).rotationChange = 90
	;({}).useEmitterRotation = true
	;({}).fadeInSpeed = 0.5
	;({}).fadeOutSpeed = -0.5
	;({}).fadeOutDelay = 500
	;({}).scaleStart = 0.75
	;({}).maxScale = 1.5
	;({}).scaleVariation = 0.25
	;({}).scaleInSpeed = 1
	;({}).emissionShape = 3
	;({}).emissionRadius = 20
	;({}).killOutsideScreen = true
	;({}).lifeTime = 1500
	;({}).weight = -0.02
	Particles.CreateParticleType("DirtCloud1", {})
	;({}).imagePath = L0_0 .. "dirtcloud.png"
	;({}).imageWidth = 25
	;({}).imageHeight = 25
	;({}).rotationVariation = 360
	;({}).rotationChange = -90
	;({}).useEmitterRotation = true
	;({}).fadeInSpeed = 0.5
	;({}).fadeOutSpeed = -0.5
	;({}).fadeOutDelay = 500
	;({}).scaleStart = 0.75
	;({}).maxScale = 1.5
	;({}).scaleVariation = 0.25
	;({}).scaleInSpeed = 1
	;({}).emissionShape = 3
	;({}).emissionRadius = 20
	;({}).killOutsideScreen = true
	;({}).lifeTime = 1500
	;({}).weight = -0.02
	Particles.CreateParticleType("DirtCloud2", {})
	;({}).imagePath = L0_0 .. "baseparticle.png"
	;({}).imageWidth = 51
	;({}).imageHeight = 52
	;({}).directionVariation = 10
	;({}).velocityVariation = 400
	;({}).velocityChange = -1.5
	;({}).rotationVariation = 360
	;({}).rotationChange = 180
	;({}).useEmitterRotation = true
	;({}).alphaStart = 0
	;({}).fadeInSpeed = 1
	;({}).fadeOutSpeed = -0.25
	;({}).fadeOutDelay = 500
	;({}).scaleStart = 0.25
	;({}).maxScale = 1
	;({}).scaleVariation = 0.25
	;({}).scaleInSpeed = 0.75
	;({}).emissionShape = 2
	;({}).emissionRadius = 40
	;({}).killOutsideScreen = true
	;({}).lifeTime = 4000
	;({}).weight = -0.01
	;({}).velocityStart = 10
	Particles.CreateParticleType("MushroomBaseLeft", {})
	;({}).imagePath = L0_0 .. "baseparticle.png"
	;({}).imageWidth = 51
	;({}).imageHeight = 52
	;({}).directionVariation = 10
	;({}).velocityVariation = 400
	;({}).velocityChange = -1.5
	;({}).rotationVariation = 360
	;({}).rotationChange = -180
	;({}).useEmitterRotation = true
	;({}).alphaStart = 0
	;({}).fadeInSpeed = 1
	;({}).fadeOutSpeed = -0.25
	;({}).fadeOutDelay = 500
	;({}).scaleStart = 0.25
	;({}).maxScale = 1
	;({}).scaleVariation = 0.25
	;({}).scaleInSpeed = 0.75
	;({}).emissionShape = 2
	;({}).emissionRadius = 40
	;({}).killOutsideScreen = true
	;({}).lifeTime = 4000
	;({}).weight = -0.01
	;({}).velocityStart = 10
	Particles.CreateParticleType("MushroomBaseRight", {})
	;({}).imagePath = L0_0 .. "cloudparticle.png"
	;({}).imageWidth = 97
	;({}).imageHeight = 93
	;({}).directionVariation = 0
	;({}).velocityVariation = 30
	;({}).rotationVariation = 360
	;({}).rotationChange = 180
	;({}).useEmitterRotation = true
	;({}).alphaStart = 0
	;({}).fadeInSpeed = 2
	;({}).fadeOutSpeed = -0.5
	;({}).fadeOutDelay = 200
	;({}).scaleStart = 0.5
	;({}).maxScale = 1
	;({}).scaleVariation = 0.1
	;({}).scaleInSpeed = 1
	;({}).scaleOutSpeed = 0.5
	;({}).scaleOutDelay = 500
	;({}).emissionShape = 2
	;({}).emissionRadius = 60
	;({}).killOutsideScreen = false
	;({}).lifeTime = 4000
	;({}).weight = -0.2
	;({}).velocityStart = 20
	Particles.CreateParticleType("MushroomCloud", {})
	;({}).imagePath = L0_0 .. "fire.png"
	;({}).imageWidth = 130
	;({}).imageHeight = 126
	;({}).directionVariation = 360
	;({}).velocityVariation = 50
	;({}).rotationVariation = 360
	;({}).rotationChange = 30
	;({}).useEmitterRotation = false
	;({}).alphaStart = 0.5
	;({}).fadeInSpeed = 3
	;({}).fadeOutSpeed = -3
	;({}).fadeOutDelay = 400
	;({}).scaleStart = 0.1
	;({}).maxScale = 0.5
	;({}).scaleVariation = 1
	;({}).scaleInSpeed = 1
	;({}).scaleOutSpeed = 0.01
	;({}).scaleOutDelay = 500
	;({}).emissionShape = 2
	;({}).emissionRadius = 0
	;({}).killOutsideScreen = false
	;({}).lifeTime = 750
	;({}).velocityStart = 100
	Particles.CreateParticleType("FireBall2", {})
	;({}).imagePath = L0_0 .. "bigsplosion.png"
	;({}).imageWidth = 139
	;({}).imageHeight = 140
	;({}).directionVariation = 360
	;({}).rotationVariation = 360
	;({}).rotationChange = 10
	;({}).useEmitterRotation = false
	;({}).alphaStart = 1
	;({}).fadeInSpeed = 1.5
	;({}).fadeOutSpeed = 0
	;({}).fadeOutDelay = 400
	;({}).scaleStart = 0.6
	;({}).scaleMax = 2
	;({}).scaleInSpeed = 20
	;({}).scaleOutSpeed = -1.5
	;({}).scaleOutDelay = 100
	;({}).killOutsideScreen = false
	;({}).lifeTime = 1000
	Particles.CreateParticleType("ExplosionFlash2", {})
	;({}).imagePath = L0_0 .. "splosion1c.png"
	;({}).imageWidth = 136
	;({}).imageHeight = 150
	;({}).directionVariation = 360
	;({}).rotationVariation = 360
	;({}).rotationChange = -5
	;({}).useEmitterRotation = false
	;({}).alphaStart = 1
	;({}).fadeInSpeed = 0.25
	;({}).fadeOutSpeed = -1.5
	;({}).fadeOutDelay = 1000
	;({}).scaleStart = 0.6
	;({}).scaleMax = 1.8
	;({}).scaleInSpeed = 20
	;({}).scaleOutSpeed = 0
	;({}).scaleOutDelay = 100
	;({}).killOutsideScreen = false
	;({}).lifeTime = 2000
	Particles.CreateParticleType("ExplosionFlash4", {})
	;({}).imagePath = L0_0 .. "smallsplosion.png"
	;({}).imageWidth = 131
	;({}).imageHeight = 140
	;({}).directionVariation = 360
	;({}).rotationVariation = 360
	;({}).rotationChange = -10
	;({}).useEmitterRotation = false
	;({}).alphaStart = 0
	;({}).fadeInSpeed = 10
	;({}).fadeOutSpeed = -3
	;({}).fadeOutDelay = 100
	;({}).scaleStart = 0.1
	;({}).scaleMax = 0.5
	;({}).scaleInSpeed = 1
	;({}).scaleOutDelay = 100
	;({}).killOutsideScreen = false
	;({}).lifeTime = 2000
	;({}).emissionShape = 2
	;({}).emissionRadius = 75
	Particles.CreateParticleType("ExplosionFlash3", {})
	;({}).imagePath = L0_0 .. "explospark.png"
	;({}).imageWidth = 19
	;({}).imageHeight = 68
	;({}).directionVariation = 180
	;({}).velocityStart = 600
	;({}).velocityVariation = 150
	;({}).velocityChange = -1
	;({}).rotationVariation = 360
	;({}).autoOrientation = true
	;({}).useEmitterRotation = false
	;({}).alphaStart = 0.5
	;({}).alphaVariation = 0.1
	;({}).fadeInSpeed = 1
	;({}).fadeOutSpeed = -0.5
	;({}).fadeOutDelay = 500
	;({}).scaleStart = 0.1
	;({}).scaleMax = 2.5
	;({}).scaleVariation = 0.5
	;({}).scaleInSpeed = 3
	;({}).scaleOutSpeed = -0.5
	;({}).scaleOutDelay = 0
	;({}).killOutsideScreen = false
	;({}).lifeTime = 3000
	;({}).weight = 0.5
	;({}).xReference = 0
	;({}).yReference = -20
	Particles.CreateParticleType("ExplosionSparks2", {})
	;({}).imagePath = L0_0 .. "spark.png"
	;({}).imageWidth = 62
	;({}).imageHeight = 130
	;({}).directionVariation = 360
	;({}).velocityStart = 400
	;({}).velocityVariation = 150
	;({}).velocityChange = -2
	;({}).rotationVariation = 360
	;({}).autoOrientation = true
	;({}).useEmitterRotation = false
	;({}).alphaStart = 0.5
	;({}).alphaVariation = 0.1
	;({}).fadeInSpeed = 1
	;({}).fadeOutSpeed = -0.1
	;({}).fadeOutDelay = 1000
	;({}).scaleStart = 0.2
	;({}).scaleMax = 0.2
	;({}).scaleInSpeed = 3
	;({}).scaleOutSpeed = -0.5
	;({}).scaleOutDelay = 1000
	;({}).killOutsideScreen = false
	;({}).lifeTime = 3000
	;({}).weight = 0
	Particles.CreateParticleType("ExplosionSparks3", {})
	;({}).imagePath = L0_0 .. "electric_spark.png"
	;({}).imageWidth = 8
	;({}).imageHeight = 32
	;({}).weight = 0.8
	;({}).xReference = 4
	;({}).yReference = 32
	;({}).velocityStart = 150
	;({}).velocityVariation = 100
	;({}).directionVariation = 360
	;({}).autoOrientation = true
	;({}).useEmitterRotation = false
	;({}).alphaStart = 1
	;({}).fadeOutSpeed = -1
	;({}).fadeOutDelay = 250
	;({}).scaleStart = 0.2
	;({}).scaleVariation = 0.3
	;({}).scaleChange = -1
	;({}).emissionShape = 0
	;({}).killOutsideScreen = true
	;({}).blendMode = "add"
	;({}).lifeTime = 1500
	Particles.CreateParticleType("ElectricSparks", {})
	;({}).imagePath = L0_0 .. "red_spark.png"
	;({}).imageWidth = 8
	;({}).imageHeight = 32
	;({}).weight = 0.8
	;({}).xReference = 4
	;({}).yReference = 32
	;({}).velocityStart = 150
	;({}).velocityVariation = 100
	;({}).directionVariation = 360
	;({}).autoOrientation = true
	;({}).useEmitterRotation = false
	;({}).alphaStart = 1
	;({}).fadeOutSpeed = -1
	;({}).fadeOutDelay = 250
	;({}).scaleStart = 0.2
	;({}).scaleVariation = 0.3
	;({}).scaleChange = -1
	;({}).emissionShape = 0
	;({}).killOutsideScreen = true
	;({}).blendMode = "add"
	;({}).lifeTime = 1500
	Particles.CreateParticleType("FireSparks", {})
	;({}).imagePath = L0_0 .. "lightsmoke.png"
	;({}).imageWidth = 130
	;({}).imageHeight = 131
	;({}).weight = -0.075
	;({}).directionVariation = 45
	;({}).velocityVariation = 25
	;({}).rotationVariation = 360
	;({}).rotationChange = 60
	;({}).useEmitterRotation = false
	;({}).alphaStart = 0
	;({}).fadeInSpeed = 1.5
	;({}).fadeOutSpeed = -0.5
	;({}).fadeOutDelay = 500
	;({}).scaleStart = 0.1
	;({}).scaleVariation = 0.2
	;({}).scaleInSpeed = 0.2
	;({}).emissionShape = 2
	;({}).emissionRadius = 10
	;({}).killOutsideScreen = true
	;({}).lifeTime = 3000
	Particles.CreateParticleType("RisingSmokeLight", {})
	local L1_6 = L1_6
	local L2_7 = L2_7
	local L5_10 = L5_10
	L5_10.imagePath = L0_0 .. "smoke.png"
	L5_10.imageWidth = 130
	L5_10.imageHeight = 133
	L5_10.weight = -0.075
	L5_10.directionVariation = 45
	L5_10.velocityVariation = 25
	L5_10.rotationVariation = 360
	L5_10.rotationChange = 60
	L5_10.useEmitterRotation = false
	L5_10.alphaStart = 0
	L5_10.fadeInSpeed = 1.5
	L5_10.fadeOutSpeed = -0.5
	L5_10.fadeOutDelay = 500
	L5_10.scaleStart = 0.1
	L5_10.maxScale = 0.5
	L5_10.scaleVariation = 0.2
	L5_10.scaleInSpeed = 0.2
	L5_10.emissionShape = 2
	L5_10.emissionRadius = 10
	L5_10.killOutsideScreen = true
	L5_10.lifeTime = 3000
	L1_6(L2_7, L5_10)
end
function CleanUp()
	local L0_11
	L0_11 = 1
	while _ENV[L0_11] ~= nil do
		_ENV[L0_11]:removeSelf()
		_ENV[L0_11] = nil
		L0_11 = L0_11 + 1
	end
	L0_11 = 1
	while _UPVALUE1_[L0_11] ~= nil do
		local L1_12 = L1_12
		L1_12(_UPVALUE1_[L0_11])
		local L2_13 = L2_13
		L1_12 = _UPVALUE1_
		L1_12[L0_11] = nil
		L0_11 = L0_11 + 1
	end
end
function AttachWarbux(A0_14)
	Particles.DetachParticleTypes(A0_14)
	Particles.AttachParticleType(A0_14, "Warbux", 3, _ENV, 0)
	local L2_15 = L2_15
	local L3_16 = L3_16
	local L4_17 = L4_17
	local L5_18 = L5_18
	L2_15(L3_16, L4_17, L5_18, _ENV, 0)
	local L6_19 = L6_19
end
function AttachBlastDebris(A0_20)
	local L5_25, L6_26, L7_27 = Particles.DetachParticleTypes, L6_26, L7_27
	L6_26 = A0_20
	L5_25(L6_26)
	L5_25 = math
	L5_25 = L5_25.random
	L6_26 = 0
	L7_27 = 500
	L5_25 = L5_25(L6_26, L7_27)
	L6_26 = math
	L6_26 = L6_26.random
	L7_27 = 2
	local L6_26, L4_24 = L6_26(L7_27, 3), L4_24
	L7_27 = Particles
	L7_27 = L7_27.AttachParticleType
	L4_24 = A0_20
	local L8_28 = L8_28
	local L9_29 = L9_29
	local L10_30 = L10_30
	L7_27(L4_24, L8_28, L9_29, L10_30, math.random(0, 750))
end
function AttachTankAt80Percent(A0_31)
	Particles.DetachParticleTypes(A0_31)
	Particles.AttachParticleType(A0_31, "ElectricSparks", 10, _ENV, 0)
	local L2_32 = L2_32
	local L3_33 = L3_33
	local L4_34 = L4_34
	local L5_35 = L5_35
	L2_32(L3_33, L4_34, L5_35, _ENV, 0)
	local L6_36 = L6_36
end
function AttachTankAt60Percent(A0_37)
	Particles.DetachParticleTypes(A0_37)
	Particles.AttachParticleType(A0_37, "ElectricSparks", 15, _ENV, 0)
	Particles.AttachParticleType(A0_37, "RisingSmokeLight", 4, _ENV, 0)
	local L2_38 = L2_38
	local L3_39 = L3_39
	local L4_40 = L4_40
	local L5_41 = L5_41
	L2_38(L3_39, L4_40, L5_41, _ENV, 0)
	local L6_42 = L6_42
end
function AttachTankAt40Percent(A0_43)
	Particles.DetachParticleTypes(A0_43)
	Particles.AttachParticleType(A0_43, "RisingSmokeLight", 3, _ENV, 0)
	Particles.AttachParticleType(A0_43, "FireSparks", 7, _ENV, 0)
	local L2_44 = L2_44
	local L3_45 = L3_45
	local L4_46 = L4_46
	local L5_47 = L5_47
	L2_44(L3_45, L4_46, L5_47, _ENV, 0)
	local L6_48 = L6_48
end
function AttachTankAt20Percent(A0_49)
	Particles.DetachParticleTypes(A0_49)
	Particles.AttachParticleType(A0_49, "FireSparks", 15, _ENV, 0)
	local L2_50 = L2_50
	local L3_51 = L3_51
	local L4_52 = L4_52
	local L5_53 = L5_53
	L2_50(L3_51, L4_52, L5_53, _ENV, 0)
	local L6_54 = L6_54
end
function AttachTankExlpode(A0_55)
	Particles.DetachParticleTypes(A0_55)
	Particles.AttachParticleType(A0_55, "TankBits", 10, 300, 0)
	Particles.AttachParticleType(A0_55, "TankBits2", 10, 300, 0)
	Particles.AttachParticleType(A0_55, "TankBits3", 20, 300, 0)
	local L2_56 = L2_56
	local L3_57 = L3_57
	local L4_58 = L4_58
	local L5_59 = L5_59
	L2_56(L3_57, L4_58, L5_59, 250, 200)
	local L6_60 = L6_60
end
function AttachToxicExlpode(A0_61)
	Particles.DetachParticleTypes(A0_61)
	Particles.AttachParticleType(A0_61, "ToxicBits", 50, 300, 0)
	local L2_62 = L2_62
	local L3_63 = L3_63
	local L4_64 = L4_64
	local L5_65 = L5_65
	L2_62(L3_63, L4_64, L5_65, 300, 0)
	local L6_66 = L6_66
end
function AttachBigNukeCloud(A0_67)
	Particles.DetachParticleTypes(A0_67)
	local L2_68 = L2_68
	local L3_69 = L3_69
	local L4_70 = L4_70
	local L5_71 = L5_71
	L2_68(L3_69, L4_70, L5_71, 250, 0)
	local L6_72 = L6_72
end
function AttachBigNukeCloudLeft(A0_73)
	Particles.DetachParticleTypes(A0_73)
	local L2_74 = L2_74
	local L3_75 = L3_75
	local L4_76 = L4_76
	local L5_77 = L5_77
	L2_74(L3_75, L4_76, L5_77, 250, 10)
	local L6_78 = L6_78
end
function AttachBigNukeCloudRight(A0_79)
	Particles.DetachParticleTypes(A0_79)
	local L2_80 = L2_80
	local L3_81 = L3_81
	local L4_82 = L4_82
	local L5_83 = L5_83
	L2_80(L3_81, L4_82, L5_83, 250, 10)
	local L6_84 = L6_84
end
function AttachSantaEffect(A0_85)
	Particles.AttachParticleType(A0_85, "Coal", 10, 300, 0)
	local L2_86 = L2_86
	local L3_87 = L3_87
	local L4_88 = L4_88
	local L5_89 = L5_89
	L2_86(L3_87, L4_88, L5_89, 250, 0)
	local L6_90 = L6_90
end
function AttachGenericExplosionSmoke(A0_91)
	Particles.AttachParticleType(A0_91, "GenericBlackExplosionSmoke", 30, 250, 0)
	local L2_92 = L2_92
	local L3_93 = L3_93
	local L4_94 = L4_94
	local L5_95 = L5_95
	L2_92(L3_93, L4_94, L5_95, 250, 0)
	local L6_96 = L6_96
end
function AttachSuperLightExplosionSmoke(A0_97)
	Particles.AttachParticleType(A0_97, "GenericBlackExplosionSmoke", 10, 250, 0)
	local L2_98 = L2_98
	local L3_99 = L3_99
	local L4_100 = L4_100
	local L5_101 = L5_101
	L2_98(L3_99, L4_100, L5_101, 250, 0)
	local L6_102 = L6_102
end
function AttachWeaponExlpode(A0_103)
	Particles.DetachParticleTypes(A0_103)
	Particles.AttachParticleType(A0_103, "ExplosionSmoke", 50, 250, 200)
	Particles.AttachParticleType(A0_103, "ExplosionFlash3", 10, 500, 200)
	Particles.AttachParticleType(A0_103, "ExplosionFlash4", 10, 100, 0)
	Particles.AttachParticleType(A0_103, "ExplosionFlash2", 10, 100, 50)
	local L2_104 = L2_104
	local L3_105 = L3_105
	local L4_106 = L4_106
	local L5_107 = L5_107
	L2_104(L3_105, L4_106, L5_107, 50, 0)
	local L6_108 = L6_108
end
function AttachDirtRemoval(A0_109)
	Particles.DetachParticleTypes(A0_109)
	Particles.AttachParticleType(A0_109, "DirtCloud1", 1, 1000, 0)
	local L2_110 = L2_110
	local L3_111 = L3_111
	local L4_112 = L4_112
	local L5_113 = L5_113
	L2_110(L3_111, L4_112, L5_113, 1000, 0)
	local L6_114 = L6_114
end
