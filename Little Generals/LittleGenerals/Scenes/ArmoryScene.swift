import SpriteKit

public class ArmoryScene: SKScene {
    private enum ArmoryTab {
        case tanks
        case weapons
    }

    private var activeTab: ArmoryTab = .tanks
    private var currentIndex: Int = 0
    private var weaponIndex: Int = 0
    private var tankDisplayNode: SKNode?
    private var nameLabel: SKLabelNode!
    private var statsLabel: SKLabelNode!
    private var actionButton: SKSpriteNode!
    private var actionLabel: SKLabelNode!
    private var gasButton: SKSpriteNode!
    private var gasLabel: SKLabelNode!
    private var warbuxLabel: SKLabelNode!
    private var tabTanksBtn: SKShapeNode!
    private var tabWeaponsBtn: SKShapeNode!

    public override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.12, green: 0.14, blue: 0.18, alpha: 1.0)

        let currentId = GameState.shared.selectedTankId
        if let idx = GameState.shared.availableTanks.firstIndex(where: { $0.id == currentId }) {
            currentIndex = idx
        }
        if let wIdx = WeaponType.allCases.firstIndex(of: GameState.shared.selectedWeapon) {
            weaponIndex = wIdx
        }

        setupHeader()
        setupTabs()
        setupTankDisplayFrame()
        setupNavigationControls()
        updateCard()
    }

    private func setupHeader() {
        let brownDark = SKColor(red: 98.0 / 255.0, green: 65.0 / 255.0, blue: 24.0 / 255.0, alpha: 1.0)
        let offWhite = SKColor(red: 238.0 / 255.0, green: 234.0 / 255.0, blue: 222.0 / 255.0, alpha: 1.0)

        // Authentic Armory Title Banner (title_left.png 300x98 + title_right.png 305x98 at 0.62x scale, armoryScene.lua:1060)
        let titleLeft = TextureHelper.nativeSprite(named: "title_left.png", scale: 0.62)
        titleLeft.position = CGPoint(x: size.width / 2 - titleLeft.size.width / 2, y: size.height - 34)
        titleLeft.zPosition = 10
        addChild(titleLeft)

        let titleRight = TextureHelper.nativeSprite(named: "title_right.png", scale: 0.62)
        titleRight.position = CGPoint(x: size.width / 2 + titleRight.size.width / 2, y: size.height - 34)
        titleRight.zPosition = 10
        addChild(titleRight)

        let title = SKLabelNode(fontNamed: "SingleSleeve")
        title.text = "ARMORY & TANKS"
        title.fontSize = 30
        title.fontColor = brownDark
        title.verticalAlignmentMode = .center
        title.position = CGPoint(x: size.width / 2, y: size.height - 34)
        title.zPosition = 11
        addChild(title)

        // Warbux Pill with native 73x60 icon at 0.5x scale
        let wbPill = SKShapeNode(rectOf: CGSize(width: 150, height: 42), cornerRadius: 6)
        wbPill.fillColor = offWhite
        wbPill.strokeColor = brownDark
        wbPill.lineWidth = 2.0
        wbPill.position = CGPoint(x: size.width - 92, y: size.height - 34)
        wbPill.zPosition = 10
        addChild(wbPill)

        let warbuxIcon = TextureHelper.nativeSprite(named: "warbux_icon.png", scale: 0.50, fallbackColor: .yellow, fallbackSize: CGSize(width: 36, height: 30))
        warbuxIcon.position = CGPoint(x: -46, y: 0)
        warbuxIcon.zPosition = 11
        wbPill.addChild(warbuxIcon)

        warbuxLabel = SKLabelNode(fontNamed: "SingleSleeve")
        warbuxLabel.fontSize = 26
        warbuxLabel.fontColor = brownDark
        warbuxLabel.position = CGPoint(x: -20, y: -2)
        warbuxLabel.horizontalAlignmentMode = .left
        warbuxLabel.verticalAlignmentMode = .center
        warbuxLabel.zPosition = 11
        wbPill.addChild(warbuxLabel)

        // Authentic Exit button at native 84x90 aspect ratio (exit_normal_btn.png, armoryScene.lua:1100)
        let backBtn = TextureHelper.nativeSprite(named: "exit_normal_btn.png", scale: 0.68, fallbackColor: SKColor(white: 0.25, alpha: 1.0), fallbackSize: CGSize(width: 57, height: 61))
        backBtn.name = "back_btn"
        backBtn.position = CGPoint(x: 46, y: size.height - 36)
        backBtn.zPosition = 11
        addChild(backBtn)
    }

    private func setupTabs() {
        tabTanksBtn = SKShapeNode(rectOf: CGSize(width: 190, height: 32), cornerRadius: 8)
        tabTanksBtn.name = "tab_tanks"
        tabTanksBtn.position = CGPoint(x: size.width / 2 - 105, y: size.height * 0.82)
        tabTanksBtn.zPosition = 10
        addChild(tabTanksBtn)

        let tLbl = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        tLbl.name = "tab_tanks"
        tLbl.text = "TANK DEPOT (18)"
        tLbl.fontSize = 13
        tLbl.fontColor = .white
        tLbl.verticalAlignmentMode = .center
        tLbl.position = tabTanksBtn.position
        tLbl.zPosition = 11
        addChild(tLbl)

        tabWeaponsBtn = SKShapeNode(rectOf: CGSize(width: 190, height: 32), cornerRadius: 8)
        tabWeaponsBtn.name = "tab_weapons"
        tabWeaponsBtn.position = CGPoint(x: size.width / 2 + 105, y: size.height * 0.82)
        tabWeaponsBtn.zPosition = 10
        addChild(tabWeaponsBtn)

        let wLbl = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        wLbl.name = "tab_weapons"
        wLbl.text = "WEAPONS & GAS (19)"
        wLbl.fontSize = 13
        wLbl.fontColor = .white
        wLbl.verticalAlignmentMode = .center
        wLbl.position = tabWeaponsBtn.position
        wLbl.zPosition = 11
        addChild(wLbl)
    }

    private func setupTankDisplayFrame() {
        // Pedestal / frame backing
        let frame = SKShapeNode(rectOf: CGSize(width: 480, height: 260), cornerRadius: 16)
        frame.fillColor = SKColor(red: 0.16, green: 0.18, blue: 0.24, alpha: 0.95)
        frame.strokeColor = SKColor(red: 0.35, green: 0.4, blue: 0.5, alpha: 1.0)
        frame.lineWidth = 2.0
        frame.position = CGPoint(x: size.width / 2, y: size.height * 0.50)
        frame.zPosition = 5
        addChild(frame)

        // Garage floor platform
        let platform = SKShapeNode(ellipseOf: CGSize(width: 300, height: 54))
        platform.fillColor = SKColor(red: 0.1, green: 0.12, blue: 0.16, alpha: 1.0)
        platform.strokeColor = SKColor(red: 0.3, green: 0.6, blue: 0.8, alpha: 0.4)
        platform.lineWidth = 2.0
        platform.position = CGPoint(x: size.width / 2, y: size.height * 0.43)
        platform.zPosition = 6
        addChild(platform)

        nameLabel = SKLabelNode(fontNamed: "SingleSleeve")
        nameLabel.fontSize = 30
        nameLabel.fontColor = SKColor(red: 1.0, green: 0.9, blue: 0.3, alpha: 1.0)
        nameLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.64)
        nameLabel.zPosition = 10
        addChild(nameLabel)

        statsLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        statsLabel.fontSize = 14
        statsLabel.fontColor = .white
        statsLabel.position = CGPoint(x: size.width / 2, y: size.height * 0.34)
        statsLabel.zPosition = 10
        addChild(statsLabel)

        // Primary Action button
        let actionTex = TextureHelper.loadTexture(named: "weapon_normal_btn.png", fallbackColor: SKColor(red: 0.2, green: 0.65, blue: 0.25, alpha: 1.0), size: CGSize(width: 240, height: 46))
        actionButton = SKSpriteNode(texture: actionTex, size: CGSize(width: 240, height: 46))
        actionButton.name = "action_btn"
        actionButton.position = CGPoint(x: size.width / 2 - 125, y: size.height * 0.14)
        actionButton.zPosition = 10
        addChild(actionButton)

        actionLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        actionLabel.name = "action_btn"
        actionLabel.fontSize = 14
        actionLabel.fontColor = .white
        actionLabel.verticalAlignmentMode = .center
        actionLabel.position = actionButton.position
        actionLabel.zPosition = 11
        addChild(actionLabel)

        // Gas Refill button (+50% Gas for 200 Warbux, weapons.balance_sheet.lua:192-211)
        gasButton = SKSpriteNode(texture: actionTex, size: CGSize(width: 220, height: 46))
        gasButton.name = "gas_btn"
        gasButton.position = CGPoint(x: size.width / 2 + 135, y: size.height * 0.14)
        gasButton.zPosition = 10
        addChild(gasButton)

        gasLabel = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
        gasLabel.name = "gas_btn"
        gasLabel.fontSize = 13
        gasLabel.fontColor = .white
        gasLabel.verticalAlignmentMode = .center
        gasLabel.position = gasButton.position
        gasLabel.zPosition = 11
        addChild(gasLabel)
    }

    private func setupNavigationControls() {
        createNavButton(name: "prev_tank", label: "◀", pos: CGPoint(x: size.width / 2 - 270, y: size.height * 0.52))
        createNavButton(name: "next_tank", label: "▶", pos: CGPoint(x: size.width / 2 + 270, y: size.height * 0.52))
    }

    private func createNavButton(name: String, label: String, pos: CGPoint) {
        // Authentic arrow_normal.png (53x92 native at 0.72x scale, armoryScene.lua:450)
        let arrow = TextureHelper.nativeSprite(named: "arrow_normal.png", scale: 0.72, fallbackColor: .white, fallbackSize: CGSize(width: 38, height: 66))
        arrow.name = name
        arrow.xScale = (name == "prev_tank") ? -1.0 : 1.0
        arrow.position = pos
        arrow.zPosition = 10
        addChild(arrow)
    }

    private func updateCard() {
        warbuxLabel.text = "\(GameState.shared.warbux)"
        tabTanksBtn.fillColor = activeTab == .tanks ? SKColor(red: 0.2, green: 0.55, blue: 0.85, alpha: 1.0) : SKColor(white: 0.22, alpha: 1.0)
        tabWeaponsBtn.fillColor = activeTab == .weapons ? SKColor(red: 0.85, green: 0.45, blue: 0.15, alpha: 1.0) : SKColor(white: 0.22, alpha: 1.0)

        let gasPct = Int(round(GameState.shared.playerGas * 100))
        if gasPct >= 100 {
            gasLabel.text = "GAS FULL (100%)"
            gasButton.color = SKColor(white: 0.3, alpha: 1.0)
            gasButton.colorBlendFactor = 0.6
        } else {
            gasLabel.text = "+50% GAS (200 WB) [\(gasPct)%]"
            gasButton.color = GameState.shared.warbux >= 200 ? SKColor(red: 0.85, green: 0.35, blue: 0.15, alpha: 1.0) : SKColor(white: 0.3, alpha: 1.0)
            gasButton.colorBlendFactor = 0.5
        }

        tankDisplayNode?.removeFromParent()
        let container = SKNode()
        container.position = CGPoint(x: size.width / 2, y: size.height * 0.49)
        container.zPosition = 8

        if activeTab == .tanks {
            let tank = GameState.shared.availableTanks[currentIndex]
            nameLabel.text = tank.name
            statsLabel.text = "ARMOR: \(tank.armor) HP   |   FIREPOWER: +\(tank.firepower) DMG"

            let tankSprite = TextureHelper.aspectFitSprite(
                named: tank.textureName,
                maxSize: CGSize(width: 155, height: 95),
                fallbackColor: SKColor(red: 0.25, green: 0.55, blue: 0.3, alpha: 1.0)
            )
            container.addChild(tankSprite)

            let hover = SKAction.sequence([
                SKAction.moveBy(x: 0, y: 5, duration: 1.0),
                SKAction.moveBy(x: 0, y: -5, duration: 1.0)
            ])
            tankSprite.run(SKAction.repeatForever(hover))

            let isUnlocked = GameState.shared.unlockedTankIds.contains(tank.id)
            let isSelected = GameState.shared.selectedTankId == tank.id

            if isSelected {
                actionLabel.text = "EQUIPPED TANK"
                actionButton.color = SKColor(red: 0.2, green: 0.55, blue: 0.2, alpha: 1.0)
                actionButton.colorBlendFactor = 0.5
            } else if isUnlocked {
                actionLabel.text = "EQUIP TANK"
                actionButton.color = SKColor(red: 0.15, green: 0.45, blue: 0.8, alpha: 1.0)
                actionButton.colorBlendFactor = 0.5
            } else {
                actionLabel.text = "UNLOCK (\(tank.cost) WB)"
                let canAfford = GameState.shared.warbux >= tank.cost
                actionButton.color = canAfford ? SKColor(red: 0.85, green: 0.5, blue: 0.1, alpha: 1.0) : SKColor(white: 0.3, alpha: 1.0)
                actionButton.colorBlendFactor = 0.5
            }
        } else {
            let weapons = WeaponType.allCases
            let weapon = weapons[weaponIndex % weapons.count]
            let owned = GameState.shared.ammoCount(for: weapon)
            let ammoStr = weapon.isInfiniteDefault ? "INFINITE" : "\(owned) SHOTS"
            nameLabel.text = weapon.rawValue
            statsLabel.text = "DMG: \(Int(weapon.damage))  |  RADIUS: \(Int(weapon.blastRadius))  |  OWNED: \(ammoStr)"

            let wSprite = TextureHelper.aspectFitSprite(
                named: weapon.iconName,
                maxSize: CGSize(width: 84, height: 84),
                fallbackColor: .orange
            )
            container.addChild(wSprite)

            if weapon.isInfiniteDefault {
                actionLabel.text = GameState.shared.selectedWeapon == weapon ? "EQUIPPED (∞)" : "EQUIP WEAPON"
                actionButton.color = SKColor(red: 0.2, green: 0.55, blue: 0.2, alpha: 1.0)
                actionButton.colorBlendFactor = 0.5
            } else {
                actionLabel.text = "BUY +\(weapon.packQuantity) (\(weapon.packCost) WB)"
                let canAfford = GameState.shared.warbux >= weapon.packCost
                actionButton.color = canAfford ? SKColor(red: 0.85, green: 0.5, blue: 0.1, alpha: 1.0) : SKColor(white: 0.3, alpha: 1.0)
                actionButton.colorBlendFactor = 0.5
            }
        }

        addChild(container)
        self.tankDisplayNode = container
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let touchedNodes = nodes(at: location)

        for node in touchedNodes {
            if node.name == "back_btn" {
                SoundManager.shared.playSound("weapon_select.mp3")
                let map = CampaignMapScene(size: size)
                map.scaleMode = scaleMode
                view?.presentScene(map, transition: SKTransition.push(with: .right, duration: 0.3))
                return
            }

            if node.name == "tab_tanks" {
                SoundManager.shared.playSound("button1.mp3")
                activeTab = .tanks
                updateCard()
                return
            }

            if node.name == "tab_weapons" {
                SoundManager.shared.playSound("button1.mp3")
                activeTab = .weapons
                updateCard()
                return
            }

            if node.name == "prev_tank" {
                SoundManager.shared.playSound("bleep.mp3")
                if activeTab == .tanks {
                    currentIndex = (currentIndex - 1 + GameState.shared.availableTanks.count) % GameState.shared.availableTanks.count
                } else {
                    let count = WeaponType.allCases.count
                    weaponIndex = (weaponIndex - 1 + count) % count
                }
                updateCard()
                return
            }

            if node.name == "next_tank" {
                SoundManager.shared.playSound("bleep.mp3")
                if activeTab == .tanks {
                    currentIndex = (currentIndex + 1) % GameState.shared.availableTanks.count
                } else {
                    let count = WeaponType.allCases.count
                    weaponIndex = (weaponIndex + 1) % count
                }
                updateCard()
                return
            }

            if node.name == "gas_btn" {
                if GameState.shared.buyGasRefill() {
                    SoundManager.shared.playSound("kaching.mp3")
                    updateCard()
                } else {
                    SoundManager.shared.playSound("carNoStart.mp3")
                }
                return
            }

            if node.name == "action_btn" {
                if activeTab == .tanks {
                    let tank = GameState.shared.availableTanks[currentIndex]
                    let isUnlocked = GameState.shared.unlockedTankIds.contains(tank.id)

                    if isUnlocked {
                        GameState.shared.selectedTankId = tank.id
                        SoundManager.shared.playSound("kaching.mp3")
                        updateCard()
                    } else if GameState.shared.unlockTank(id: tank.id) {
                        SoundManager.shared.playSound("kaching.mp3")
                        updateCard()
                    } else {
                        SoundManager.shared.playSound("carNoStart.mp3")
                    }
                } else {
                    let weapons = WeaponType.allCases
                    let weapon = weapons[weaponIndex % weapons.count]
                    if weapon.isInfiniteDefault {
                        GameState.shared.selectedWeapon = weapon
                        SoundManager.shared.playSound("weapon_select.mp3")
                        updateCard()
                    } else if GameState.shared.buyWeaponPack(weapon) {
                        SoundManager.shared.playSound("kaching.mp3")
                        updateCard()
                    } else if GameState.shared.ammoCount(for: weapon) > 0 {
                        GameState.shared.selectedWeapon = weapon
                        SoundManager.shared.playSound("weapon_select.mp3")
                        updateCard()
                    } else {
                        SoundManager.shared.playSound("carNoStart.mp3")
                    }
                }
                return
            }
        }
    }
}
