import SpriteKit

public class BattlefieldScene: SKScene {
    public var levelNumber: Int = 1

    private var terrain: TerrainModel!
    private var terrainNode: SKShapeNode!

    // Player Tank
    private var playerTankNode: SKNode!
    private var playerBodySprite: SKSpriteNode!
    private var playerTurret: SKNode!
    private var playerHealth: Double = 100
    private var playerMaxHealth: Double = 100
    private var playerHealthBar: SKShapeNode!
    private var playerShieldNode: SKShapeNode?
    private var hasPlayerShield: Bool = false
    private var playerFuel: CGFloat = 100.0

    // AI Tank
    private var aiTankNode: SKNode!
    private var aiTurret: SKNode!
    private var aiHealth: Double = 100
    private var aiMaxHealth: Double = 100
    private var aiHealthBar: SKShapeNode!
    private var aiShieldNode: SKShapeNode?
    private var hasAiShield: Bool = false

    // Controls & State
    private var aimAngle: CGFloat = 45.0
    private var firePower: CGFloat = 65.0
    private var windSpeed: CGFloat = 0.0

    private var currentWeapon: WeaponType = .missile
    private var weaponLabel: SKLabelNode!
    private var angleLabel: SKLabelNode!
    private var powerLabel: SKLabelNode!
    private var windLabel: SKLabelNode!
    private var windsockNode: SKSpriteNode?
    private var speechBubble: SKLabelNode?

    private var isPlayerTurn: Bool = true
    private var isProjectileActive: Bool = false

    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.45, green: 0.72, blue: 0.95, alpha: 1.0)
        terrain = TerrainModel(width: size.width, height: size.height)

        setupEnvironment()
        setupTerrainNode()
        setupTanks()
        setupHUD()
        startTurn()
    }

    private func setupEnvironment() {
        // Authentic backdrop texture from Arizona theme
        let bgTex = TextureHelper.loadTexture(named: "arizona_bkg.png", fallbackColor: SKColor(red: 0.85, green: 0.7, blue: 0.5, alpha: 1.0), size: size)
        let bgNode = SKSpriteNode(texture: bgTex)
        bgNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        bgNode.size = CGSize(width: size.width, height: size.height)
        bgNode.zPosition = -30
        addChild(bgNode)

        // Sun / atmosphere
        let sun = SKShapeNode(circleOfRadius: 36)
        sun.fillColor = SKColor(red: 1.0, green: 0.95, blue: 0.45, alpha: 0.85)
        sun.strokeColor = .clear
        sun.position = CGPoint(x: size.width * 0.82, y: size.height * 0.84)
        sun.zPosition = -25
        addChild(sun)
    }

    private func setupTerrainNode() {
        let ground = SKShapeNode(path: terrain.createPath())
        ground.fillColor = SKColor(red: 0.55, green: 0.42, blue: 0.28, alpha: 1.0)
        ground.strokeColor = SKColor(red: 0.35, green: 0.65, blue: 0.22, alpha: 1.0)
        ground.lineWidth = 5.0
        ground.zPosition = 1
        addChild(ground)
        self.terrainNode = ground
    }

    private func updateTerrainMesh() {
        terrainNode.path = terrain.createPath()
    }

    private func setupTanks() {
        let selectedTank = GameState.shared.selectedTank
        playerMaxHealth = Double(selectedTank.armor)
        playerHealth = playerMaxHealth

        // Player Tank Setup
        let playerX: CGFloat = 140
        let playerY = terrain.valueAt(x: playerX)
        playerTankNode = SKNode()
        playerTankNode.position = CGPoint(x: playerX, y: playerY + 14)
        playerTankNode.zRotation = terrain.slopeAt(x: playerX)
        playerTankNode.zPosition = 5
        addChild(playerTankNode)

        let tankTex = TextureHelper.loadTexture(named: selectedTank.textureName, fallbackColor: SKColor(red: 0.25, green: 0.6, blue: 0.25, alpha: 1.0), size: CGSize(width: 55, height: 30))
        playerBodySprite = SKSpriteNode(texture: tankTex, size: CGSize(width: 52, height: 26))
        playerTankNode.addChild(playerBodySprite)

        playerTurret = SKNode()
        playerTurret.position = CGPoint(x: 4, y: 6)
        let playerBarrel = SKShapeNode(rectOf: CGSize(width: 26, height: 5), cornerRadius: 2)
        playerBarrel.fillColor = SKColor(white: 0.2, alpha: 1.0)
        playerBarrel.strokeColor = .clear
        playerBarrel.position = CGPoint(x: 13, y: 0)
        playerTurret.addChild(playerBarrel)
        playerTankNode.addChild(playerTurret)
        updatePlayerTurretAngle()

        playerHealthBar = SKShapeNode(rectOf: CGSize(width: 52, height: 6), cornerRadius: 2)
        playerHealthBar.fillColor = .green
        playerHealthBar.strokeColor = .black
        playerHealthBar.position = CGPoint(x: 0, y: 28)
        playerTankNode.addChild(playerHealthBar)

        // AI Enemy Tank Setup
        let aiX: CGFloat = size.width - 140
        let aiY = terrain.valueAt(x: aiX)
        aiTankNode = SKNode()
        aiTankNode.position = CGPoint(x: aiX, y: aiY + 14)
        aiTankNode.zRotation = terrain.slopeAt(x: aiX)
        aiTankNode.zPosition = 5
        addChild(aiTankNode)

        aiMaxHealth = 95.0 + Double(levelNumber) * 15.0
        aiHealth = aiMaxHealth

        let aiTex = TextureHelper.loadTexture(named: "hummera.png", fallbackColor: SKColor(red: 0.8, green: 0.25, blue: 0.2, alpha: 1.0), size: CGSize(width: 52, height: 26))
        let aiBody = SKSpriteNode(texture: aiTex, size: CGSize(width: 52, height: 26))
        aiTankNode.addChild(aiBody)

        aiTurret = SKNode()
        aiTurret.position = CGPoint(x: -4, y: 6)
        let aiBarrel = SKShapeNode(rectOf: CGSize(width: 26, height: 5), cornerRadius: 2)
        aiBarrel.fillColor = SKColor(white: 0.2, alpha: 1.0)
        aiBarrel.strokeColor = .clear
        aiBarrel.position = CGPoint(x: -13, y: 0)
        aiTurret.addChild(aiBarrel)
        aiTankNode.addChild(aiTurret)

        aiHealthBar = SKShapeNode(rectOf: CGSize(width: 52, height: 6), cornerRadius: 2)
        aiHealthBar.fillColor = .red
        aiHealthBar.strokeColor = .black
        aiHealthBar.position = CGPoint(x: 0, y: 28)
        aiTankNode.addChild(aiHealthBar)

        showSpeech(TrashTalkManager.shared.randomPreamble(), at: aiTankNode.position)
    }

    private func setupHUD() {
        let controlBar = SKShapeNode(rectOf: CGSize(width: size.width, height: 75))
        controlBar.fillColor = SKColor(white: 0.1, alpha: 0.82)
        controlBar.strokeColor = .clear
        controlBar.position = CGPoint(x: size.width / 2, y: 37)
        controlBar.zPosition = 20
        addChild(controlBar)

        // Tank Drive Buttons (Move Left / Right)
        createSmallButton(name: "drive_left", label: "◀◀", pos: CGPoint(x: 35, y: 37))
        createSmallButton(name: "drive_right", label: "▶▶", pos: CGPoint(x: 85, y: 37))

        // Angle controls
        createSmallButton(name: "angle_down", label: "▼", pos: CGPoint(x: 135, y: 37))
        createSmallButton(name: "angle_up", label: "▲", pos: CGPoint(x: 215, y: 37))
        angleLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        angleLabel.fontSize = 15
        angleLabel.fontColor = .white
        angleLabel.position = CGPoint(x: 175, y: 30)
        angleLabel.zPosition = 21
        addChild(angleLabel)

        // Power controls
        createSmallButton(name: "power_down", label: "-", pos: CGPoint(x: 265, y: 37))
        createSmallButton(name: "power_up", label: "+", pos: CGPoint(x: 345, y: 37))
        powerLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        powerLabel.fontSize = 15
        powerLabel.fontColor = .white
        powerLabel.position = CGPoint(x: 305, y: 30)
        powerLabel.zPosition = 21
        addChild(powerLabel)

        // Weapon Selector Button
        let weaponBtn = SKShapeNode(rectOf: CGSize(width: 140, height: 38), cornerRadius: 8)
        weaponBtn.name = "weapon_cycle"
        weaponBtn.fillColor = SKColor(red: 0.25, green: 0.45, blue: 0.75, alpha: 1.0)
        weaponBtn.strokeColor = .white
        weaponBtn.lineWidth = 1.5
        weaponBtn.position = CGPoint(x: 450, y: 37)
        weaponBtn.zPosition = 21
        addChild(weaponBtn)

        weaponLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        weaponLabel.name = "weapon_cycle"
        weaponLabel.fontSize = 13
        weaponLabel.fontColor = .white
        weaponLabel.verticalAlignmentMode = .center
        weaponLabel.position = weaponBtn.position
        weaponLabel.zPosition = 22
        addChild(weaponLabel)

        // Wind indicator with authentic windsock
        let windsockTex = TextureHelper.loadTexture(named: "windsock.png", fallbackColor: .orange, size: CGSize(width: 24, height: 18))
        let sock = SKSpriteNode(texture: windsockTex, size: CGSize(width: 24, height: 18))
        sock.position = CGPoint(x: 550, y: 37)
        sock.zPosition = 21
        addChild(sock)
        self.windsockNode = sock

        windLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        windLabel.fontSize = 14
        windLabel.fontColor = SKColor(red: 0.95, green: 0.95, blue: 0.3, alpha: 1.0)
        windLabel.position = CGPoint(x: 605, y: 31)
        windLabel.zPosition = 21
        addChild(windLabel)

        // Fire Button using authentic tutorial_fire_btn.png
        let fireTex = TextureHelper.loadTexture(named: "tutorial_fire_btn.png", fallbackColor: SKColor(red: 0.92, green: 0.22, blue: 0.15, alpha: 1.0), size: CGSize(width: 54, height: 54))
        let fireBtn = SKSpriteNode(texture: fireTex, size: CGSize(width: 52, height: 52))
        fireBtn.name = "fire_btn"
        fireBtn.position = CGPoint(x: size.width - 60, y: 37)
        fireBtn.zPosition = 21
        addChild(fireBtn)

        updateHUD()
    }

    private func createSmallButton(name: String, label: String, pos: CGPoint) {
        let btn = SKShapeNode(circleOfRadius: 18)
        btn.name = name
        btn.fillColor = SKColor(white: 0.25, alpha: 1.0)
        btn.strokeColor = .white
        btn.lineWidth = 1.5
        btn.position = pos
        btn.zPosition = 21
        addChild(btn)

        let text = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        text.name = name
        text.text = label
        text.fontSize = 14
        text.fontColor = .white
        text.verticalAlignmentMode = .center
        text.position = pos
        text.zPosition = 22
        addChild(text)
    }

    private func updateHUD() {
        angleLabel.text = "\(Int(aimAngle))°"
        powerLabel.text = "\(Int(firePower))%"
        weaponLabel.text = currentWeapon.rawValue
        let dir = windSpeed >= 0 ? "▶" : "◀"
        windLabel.text = "\(dir) \(String(format: "%.1f", abs(windSpeed)))"

        windsockNode?.xScale = windSpeed >= 0 ? 1.0 : -1.0
    }

    private func updatePlayerTurretAngle() {
        let rad = aimAngle * .pi / 180.0
        playerTurret.zRotation = rad
    }

    private func startTurn() {
        isProjectileActive = false
        windSpeed = CGFloat.random(in: -4.5...4.5)
        updateHUD()

        if !isPlayerTurn {
            runAITurn()
        }
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, isPlayerTurn, !isProjectileActive else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)

        for node in touchedNodes {
            switch node.name {
            case "drive_left":
                drivePlayerTank(dx: -14)
            case "drive_right":
                drivePlayerTank(dx: 14)
            case "angle_up":
                aimAngle = min(85, aimAngle + 3)
                updatePlayerTurretAngle()
                updateHUD()
                SoundManager.shared.playSound("bleep.mp3")
            case "angle_down":
                aimAngle = max(10, aimAngle - 3)
                updatePlayerTurretAngle()
                updateHUD()
                SoundManager.shared.playSound("bleep.mp3")
            case "power_up":
                firePower = min(100, firePower + 5)
                updateHUD()
                SoundManager.shared.playSound("bleep.mp3")
            case "power_down":
                firePower = max(15, firePower - 5)
                updateHUD()
                SoundManager.shared.playSound("bleep.mp3")
            case "weapon_cycle":
                cycleWeapon()
            case "fire_btn":
                firePlayerWeapon()
            default:
                break
            }
        }
    }

    private func drivePlayerTank(dx: CGFloat) {
        guard playerFuel > 0 else {
            SoundManager.shared.playSound("carNoStart.mp3")
            return
        }
        let newX = max(30, min(size.width * 0.45, playerTankNode.position.x + dx))
        let newY = terrain.valueAt(x: newX)
        let newRot = terrain.slopeAt(x: newX)

        playerFuel -= 5.0
        SoundManager.shared.playSound("treads.wav")

        playerTankNode.run(SKAction.group([
            SKAction.move(to: CGPoint(x: newX, y: newY + 14), duration: 0.15),
            SKAction.rotate(toAngle: newRot, duration: 0.15)
        ]))
    }

    private func cycleWeapon() {
        SoundManager.shared.playSound("weapon_select.mp3")
        let all = WeaponType.allCases
        if let idx = all.firstIndex(of: currentWeapon) {
            currentWeapon = all[(idx + 1) % all.count]
            updateHUD()
        }
    }

    private func firePlayerWeapon() {
        guard !isProjectileActive else { return }
        isProjectileActive = true

        if currentWeapon == .shield {
            activateShield(forPlayer: true)
            run(SKAction.wait(forDuration: 1.0)) { [weak self] in
                self?.isPlayerTurn = false
                self?.startTurn()
            }
            return
        }

        SoundManager.shared.playSound(currentWeapon.launchSound)
        let rad = aimAngle * .pi / 180.0
        let speed = firePower * 10.5
        let vx = cos(rad) * speed
        let vy = sin(rad) * speed

        let spawnPos = CGPoint(x: playerTankNode.position.x + 22, y: playerTankNode.position.y + 12)
        spawnProjectile(weapon: currentWeapon, from: spawnPos, velocity: CGVector(dx: vx, dy: vy), isPlayer: true)
    }

    private func activateShield(forPlayer: Bool) {
        SoundManager.shared.playSound("shield.mp3")
        let targetNode = forPlayer ? playerTankNode : aiTankNode
        let shield = SKShapeNode(circleOfRadius: 32)
        shield.fillColor = SKColor(red: 0.2, green: 0.6, blue: 1.0, alpha: 0.35)
        shield.strokeColor = SKColor(red: 0.4, green: 0.8, blue: 1.0, alpha: 0.85)
        shield.lineWidth = 3.0
        shield.zPosition = 10
        targetNode?.addChild(shield)

        let pulse = SKAction.sequence([
            SKAction.scale(to: 1.08, duration: 0.5),
            SKAction.scale(to: 1.0, duration: 0.5)
        ])
        shield.run(SKAction.repeatForever(pulse))

        if forPlayer {
            playerShieldNode = shield
            hasPlayerShield = true
        } else {
            aiShieldNode = shield
            hasAiShield = true
        }
    }

    private func runAITurn() {
        let distance = aiTankNode.position.x - playerTankNode.position.x
        let estimatedAngle: CGFloat = CGFloat.random(in: 40...52)
        let rad = estimatedAngle * .pi / 180.0
        let targetSpeed = sqrt((distance * 980) / sin(2 * rad))
        let inaccuracy = CGFloat.random(in: -25...25) / CGFloat(levelNumber)
        let aiPower = max(20, min(100, (targetSpeed / 10.5) + inaccuracy))

        aiTurret.zRotation = -rad

        run(SKAction.wait(forDuration: 1.2)) { [weak self] in
            guard let self = self else { return }
            let aiWeapon = WeaponType.missile
            SoundManager.shared.playSound(aiWeapon.launchSound)

            let vx = -cos(rad) * (aiPower * 10.5)
            let vy = sin(rad) * (aiPower * 10.5)
            let spawnPos = CGPoint(x: self.aiTankNode.position.x - 22, y: self.aiTankNode.position.y + 12)
            self.spawnProjectile(weapon: aiWeapon, from: spawnPos, velocity: CGVector(dx: vx, dy: vy), isPlayer: false)
        }
    }

    private func spawnProjectile(weapon: WeaponType, from start: CGPoint, velocity: CGVector, isPlayer: Bool) {
        let missile = SKShapeNode(circleOfRadius: weapon == .nuke ? 7.0 : 4.5)
        missile.fillColor = isPlayer ? .yellow : .orange
        missile.strokeColor = .white
        missile.position = start
        missile.zPosition = 12
        addChild(missile)

        var currentPos = start
        var curVx = velocity.dx
        var curVy = velocity.dy
        let dt: CGFloat = 1.0 / 60.0
        let gravity: CGFloat = -480.0
        var mirvSplit = false
        var bouncesRemaining = weapon == .grenade ? 2 : 0

        let flyAction = SKAction.customAction(withDuration: 4.5) { [weak self] _, _ in
            guard let self = self else { return }
            curVx += self.windSpeed * 12.0 * dt
            curVy += gravity * dt
            currentPos.x += curVx * dt
            currentPos.y += curVy * dt
            missile.position = currentPos

            // Smoke particle trail
            let smoke = SKShapeNode(circleOfRadius: weapon == .nuke ? 3.5 : 2.0)
            smoke.fillColor = SKColor(white: 0.85, alpha: 0.6)
            smoke.strokeColor = .clear
            smoke.position = currentPos
            smoke.zPosition = 11
            self.addChild(smoke)
            smoke.run(SKAction.sequence([
                SKAction.fadeAlpha(to: 0.0, duration: 0.35),
                SKAction.removeFromParent()
            ]))

            // MIRV Cluster Split at apogee
            if weapon == .mirv && !mirvSplit && curVy < 50 && isPlayer {
                mirvSplit = true
                SoundManager.shared.playSound("mirv_spawn.mp3")
                self.spawnClusterSubmunitions(from: currentPos, baseVelocity: CGVector(dx: curVx, dy: curVy))
            }

            // Terrain Collision check
            let groundY = self.terrain.valueAt(x: currentPos.x)
            let targetNode = isPlayer ? self.aiTankNode : self.playerTankNode
            let hitTarget = targetNode != nil && targetNode!.position.distance(to: currentPos) < 28

            if hitTarget {
                missile.removeAllActions()
                missile.removeFromParent()
                self.handleImpact(weapon: weapon, at: currentPos, hitTank: true, isPlayerAttacker: isPlayer)
            } else if currentPos.y <= groundY || currentPos.x < 0 || currentPos.x > self.size.width {
                if bouncesRemaining > 0 {
                    bouncesRemaining -= 1
                    curVy = -curVy * 0.55
                    curVx = curVx * 0.75
                    currentPos.y = groundY + 2
                    SoundManager.shared.playSound("grenade_tick.mp3")
                } else {
                    missile.removeAllActions()
                    missile.removeFromParent()
                    self.handleImpact(weapon: weapon, at: currentPos, hitTank: false, isPlayerAttacker: isPlayer)
                }
            }
        }

        missile.run(flyAction)
    }

    private func spawnClusterSubmunitions(from pos: CGPoint, baseVelocity: CGVector) {
        for spread in [-120.0, 0.0, 120.0] {
            let sub = SKShapeNode(circleOfRadius: 3.5)
            sub.fillColor = .cyan
            sub.strokeColor = .white
            sub.position = pos
            sub.zPosition = 12
            addChild(sub)

            var cPos = pos
            var vx = baseVelocity.dx + CGFloat(spread)
            var vy = baseVelocity.dy - 30.0
            let dt: CGFloat = 1.0 / 60.0

            sub.run(SKAction.customAction(withDuration: 3.0) { [weak self] _, _ in
                guard let self = self else { return }
                vy -= 480.0 * dt
                cPos.x += vx * dt
                cPos.y += vy * dt
                sub.position = cPos

                let gY = self.terrain.valueAt(x: cPos.x)
                if cPos.y <= gY || self.aiTankNode.position.distance(to: cPos) < 26 {
                    sub.removeAllActions()
                    sub.removeFromParent()
                    self.handleImpact(weapon: .babyMissile, at: cPos, hitTank: self.aiTankNode.position.distance(to: cPos) < 26, isPlayerAttacker: true)
                }
            })
        }
    }

    private func handleImpact(weapon: WeaponType, at pos: CGPoint, hitTank: Bool, isPlayerAttacker: Bool) {
        SoundManager.shared.playSound(weapon.impactSound)

        // Terrain cratering deformation
        let craterRadius = weapon.blastRadius
        terrain.applyCrater(center: pos, radius: craterRadius)
        updateTerrainMesh()

        // Authentic explosion visual effect
        let explosion = SKShapeNode(circleOfRadius: craterRadius > 0 ? craterRadius : 20)
        explosion.fillColor = weapon == .nuke ? SKColor(red: 1.0, green: 0.9, blue: 0.2, alpha: 0.95) : SKColor(red: 1.0, green: 0.4, blue: 0.1, alpha: 0.9)
        explosion.strokeColor = .white
        explosion.lineWidth = 3.0
        explosion.position = pos
        explosion.zPosition = 15
        addChild(explosion)

        explosion.run(SKAction.sequence([
            SKAction.scale(to: 1.6, duration: 0.18),
            SKAction.fadeAlpha(to: 0.0, duration: 0.25),
            SKAction.removeFromParent()
        ]))

        // Screen Shake on heavy explosions
        if weapon == .nuke || weapon == .mirv {
            let shake = SKAction.sequence([
                SKAction.moveBy(x: -6, y: 4, duration: 0.04),
                SKAction.moveBy(x: 6, y: -4, duration: 0.04),
                SKAction.moveBy(x: -3, y: 2, duration: 0.04),
                SKAction.moveBy(x: 3, y: -2, duration: 0.04)
            ])
            self.run(shake)
        }

        if hitTank {
            var rawDamage = weapon.damage + Double.random(in: -4...6)

            // Shield absorption check
            if isPlayerAttacker && hasAiShield {
                hasAiShield = false
                aiShieldNode?.removeFromParent()
                showDamageText("BLOCKED!", at: aiTankNode.position, color: .cyan)
                SoundManager.shared.playSound("shield_collision.mp3")
                rawDamage = 0
            } else if !isPlayerAttacker && hasPlayerShield {
                hasPlayerShield = false
                playerShieldNode?.removeFromParent()
                showDamageText("BLOCKED!", at: playerTankNode.position, color: .cyan)
                SoundManager.shared.playSound("shield_collision.mp3")
                rawDamage = 0
            }

            if rawDamage > 0 {
                if isPlayerAttacker {
                    aiHealth = max(0, aiHealth - rawDamage)
                    aiHealthBar.xScale = CGFloat(aiHealth / aiMaxHealth)
                    showDamageText("-\(Int(rawDamage))", at: aiTankNode.position, color: .red)
                    let talk = TrashTalkManager.shared.randomHit(currentHealth: aiHealth, maxHealth: aiMaxHealth)
                    showSpeech(talk, at: aiTankNode.position)
                } else {
                    playerHealth = max(0, playerHealth - rawDamage)
                    playerHealthBar.xScale = CGFloat(playerHealth / playerMaxHealth)
                    showDamageText("-\(Int(rawDamage))", at: playerTankNode.position, color: .red)
                }
            }
        } else {
            if isPlayerAttacker {
                showSpeech(TrashTalkManager.shared.randomMiss(), at: aiTankNode.position)
            }
        }

        // Adjust tanks to new cratered terrain elevations
        let pY = terrain.valueAt(x: playerTankNode.position.x)
        playerTankNode.position.y = pY + 14
        playerTankNode.zRotation = terrain.slopeAt(x: playerTankNode.position.x)

        let aY = terrain.valueAt(x: aiTankNode.position.x)
        aiTankNode.position.y = aY + 14
        aiTankNode.zRotation = terrain.slopeAt(x: aiTankNode.position.x)

        // Check Victory / Defeat
        run(SKAction.wait(forDuration: 1.5)) { [weak self] in
            guard let self = self else { return }
            if self.aiHealth <= 0 {
                self.endBattle(victory: true)
            } else if self.playerHealth <= 0 {
                self.endBattle(victory: false)
            } else {
                self.isPlayerTurn.toggle()
                self.startTurn()
            }
        }
    }

    private func showDamageText(_ text: String, at pos: CGPoint, color: SKColor = .red) {
        let label = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        label.text = text
        label.fontSize = 24
        label.fontColor = color
        label.position = CGPoint(x: pos.x, y: pos.y + 36)
        label.zPosition = 25
        addChild(label)

        label.run(SKAction.sequence([
            SKAction.group([
                SKAction.moveBy(x: 0, y: 32, duration: 0.8),
                SKAction.fadeAlpha(to: 0.0, duration: 0.8)
            ]),
            SKAction.removeFromParent()
        ]))
    }

    private func showSpeech(_ text: String, at pos: CGPoint) {
        speechBubble?.removeFromParent()
        let bubble = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        bubble.text = "\"\(text)\""
        bubble.fontSize = 15
        bubble.fontColor = .white
        bubble.position = CGPoint(x: pos.x, y: pos.y + 45)
        bubble.zPosition = 30
        addChild(bubble)
        self.speechBubble = bubble

        bubble.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.2),
            SKAction.fadeAlpha(to: 0.0, duration: 0.5),
            SKAction.removeFromParent()
        ]))
    }

    private func endBattle(victory: Bool) {
        GameState.shared.lastBattleWon = victory
        if victory {
            GameState.shared.warbux += 150 * levelNumber
            GameState.shared.currentLevel = max(GameState.shared.currentLevel, levelNumber + 1)
        }
        let overScene = BattleOverScene(size: size)
        overScene.scaleMode = scaleMode
        view?.presentScene(overScene, transition: SKTransition.doorsCloseHorizontal(withDuration: 0.6))
    }
}

private extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return hypot(x - point.x, y - point.y)
    }
}
