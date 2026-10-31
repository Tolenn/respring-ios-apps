import UIKit
import SpriteKit

public class TextureHelper {
    private static var cache: [String: SKTexture] = [:]
    
    // Comprehensive index mapping every variant of filename/path to its bundle URL
    private static var bundleFileIndex: [String: URL] = {
        var index: [String: URL] = [:]
        let bundleURL = Bundle.main.bundleURL
        let fileManager = FileManager.default
        let bundlePath = bundleURL.path
        
        if let enumerator = fileManager.enumerator(at: bundleURL, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]) {
            for case let url as URL in enumerator {
                let fullPath = url.path.replacingOccurrences(of: "\\", with: "/")
                let fileName = url.lastPathComponent.lowercased()
                let baseName = url.deletingPathExtension().lastPathComponent.lowercased()
                let isSlicedFrame = fullPath.lowercased().contains("_frames/")
                
                // 1. Filename with extension (e.g. "bedrock.png")
                // Prefer sliced frame over master sheet if both share the same basename (e.g. parachute.png)
                if index[fileName] == nil || isSlicedFrame {
                    index[fileName] = url
                }
                
                // 2. Base name without extension (e.g. "bedrock")
                if index[baseName] == nil || isSlicedFrame {
                    index[baseName] = url
                }
                
                // 3. Relative path & suffix paths inside bundle (e.g. "res/themes/volcano/sky.png", "volcano/sky.png")
                let normalizedBundlePath = bundlePath.replacingOccurrences(of: "\\", with: "/")
                if fullPath.hasPrefix(normalizedBundlePath) {
                    var rel = String(fullPath.dropFirst(normalizedBundlePath.count))
                    while rel.hasPrefix("/") { rel = String(rel.dropFirst()) }
                    let relLower = rel.lowercased()
                    index[relLower] = url
                    let relNoExt = (relLower as NSString).deletingPathExtension
                    if index[relNoExt] == nil {
                        index[relNoExt] = url
                    }
                    
                    // Also index trailing path suffixes (last 2 and 3 path components) for theme disambiguation
                    let parts = relLower.split(separator: "/").map(String.init)
                    if parts.count >= 2 {
                        let suffix2 = parts.suffix(2).joined(separator: "/")
                        if index[suffix2] == nil || isSlicedFrame {
                            index[suffix2] = url
                        }
                    }
                    if parts.count >= 3 {
                        let suffix3 = parts.suffix(3).joined(separator: "/")
                        if index[suffix3] == nil || isSlicedFrame {
                            index[suffix3] = url
                        }
                    }
                    if parts.count >= 4 {
                        let suffix4 = parts.suffix(4).joined(separator: "/")
                        if index[suffix4] == nil || isSlicedFrame {
                            index[suffix4] = url
                        }
                    }
                }
            }
        }
        return index
    }()

    public static func loadTexture(named name: String, fallbackColor: SKColor = .gray, size: CGSize = CGSize(width: 40, height: 40)) -> SKTexture {
        if let cached = cache[name] {
            return cached
        }

        let rawLower = name.lowercased()
        let lowerName = (name as NSString).lastPathComponent.lowercased()
        let baseName = (name as NSString).lastPathComponent.components(separatedBy: ".").first?.lowercased() ?? lowerName
        let cleanName = (name as NSString).deletingPathExtension.lowercased()

        // 1. Match from index (checks relative path, filename, or basename)
        if let url = bundleFileIndex[rawLower] ?? bundleFileIndex[lowerName] ?? bundleFileIndex[cleanName] ?? bundleFileIndex[baseName],
           let img = UIImage(contentsOfFile: url.path) {
            let tex = SKTexture(image: img)
            cache[name] = tex
            return tex
        }

        // 2. SKTexture(imageNamed:)
        let direct = SKTexture(imageNamed: name)
        if direct.size().width > 0 && direct.size().height > 0 {
            cache[name] = direct
            return direct
        }

        let directBase = SKTexture(imageNamed: baseName)
        if directBase.size().width > 0 && directBase.size().height > 0 {
            cache[name] = directBase
            return directBase
        }

        // 3. Bundle.main.url fallback
        let ext = (name as NSString).pathExtension.isEmpty ? "png" : (name as NSString).pathExtension
        let candidates = [
            Bundle.main.url(forResource: baseName, withExtension: ext),
            Bundle.main.url(forResource: name, withExtension: nil)
        ]

        for url in candidates.compactMap({ $0 }) {
            if let img = UIImage(contentsOfFile: url.path) {
                let tex = SKTexture(image: img)
                cache[name] = tex
                return tex
            }
        }

        // 4. Stylized Procedural Fallback Placeholder
        let renderer = UIGraphicsImageRenderer(size: size)
        let fallbackImage = renderer.image { ctx in
            fallbackColor.setFill()
            ctx.fill(CGRect(origin: .zero, size: size))
        }
        let fallbackTex = SKTexture(image: fallbackImage)
        cache[name] = fallbackTex
        return fallbackTex
    }

    /// Creates an `SKSpriteNode` sized to the texture's true pixel dimensions multiplied by `scale`.
    public static func nativeSprite(
        named name: String,
        scale: CGFloat = 1.0,
        fallbackColor: SKColor = .clear,
        fallbackSize: CGSize = CGSize(width: 40, height: 40)
    ) -> SKSpriteNode {
        let tex = loadTexture(named: name, fallbackColor: fallbackColor, size: fallbackSize)
        let rawSize = tex.size()
        let finalSize = (rawSize.width > 0 && rawSize.height > 0)
            ? CGSize(width: rawSize.width * scale, height: rawSize.height * scale)
            : CGSize(width: fallbackSize.width * scale, height: fallbackSize.height * scale)
        return SKSpriteNode(texture: tex, size: finalSize)
    }

    /// Creates an `SKSpriteNode` fitted proportionally inside `maxSize` while preserving the texture's native aspect ratio.
    public static func aspectFitSprite(
        named name: String,
        maxSize: CGSize,
        fallbackColor: SKColor = .clear
    ) -> SKSpriteNode {
        let tex = loadTexture(named: name, fallbackColor: fallbackColor, size: maxSize)
        let raw = tex.size()
        guard raw.width > 0 && raw.height > 0 else {
            return SKSpriteNode(texture: tex, size: maxSize)
        }
        let ratio = min(maxSize.width / raw.width, maxSize.height / raw.height)
        return SKSpriteNode(texture: tex, size: CGSize(width: raw.width * ratio, height: raw.height * ratio))
    }

    /// Builds the authentic multi-part General Avatar portrait (`battleAvatar.lua:780-1073` & `res.avatars.heads.head1.lua`).
    /// In battle and campaign HUD, `scale = 0.425` produces a crisp ~94x94 framed portrait matching the original game.
    public static func buildGeneralAvatar(isPlayer: Bool, scale: CGFloat = 0.425) -> SKNode {
        let root = SKNode()

        // 1. Backing frame card (`newui_frames/frame.png` 177x177 scaled by 1.25) at zPosition = 0
        // NOTE: In Corona battleAvatar.lua:791-819, frame.png serves as the back canvas (zPosition 0).
        // Facial parts are placed on top (zPosition 1..9), and a stroke border rectangle is drawn at zPosition 10.
        let frame = nativeSprite(named: "newui_frames/frame.png", scale: 1.25 * scale, fallbackColor: SKColor(red: 245.0/255.0, green: 168.0/255.0, blue: 89.0/255.0, alpha: 1.0), fallbackSize: CGSize(width: 177, height: 177))
        frame.zPosition = 0
        root.addChild(frame)

        // Corona head-local space to SpriteKit space conversion
        let partScale = 0.75 * scale
        func headPos(_ hx: CGFloat, _ hy: CGFloat) -> CGPoint {
            return CGPoint(
                x: (hx - 115.0) * partScale,
                y: (108.0 - hy) * partScale
            )
        }

        if isPlayer {
            // Player General (matches reference screenshots: dark skin, officer hat hat2 with gold insignia,
            // mustache, lit cigar, monocle/spectacle, dark uniform body2_dark)
            let body = nativeSprite(named: "res/avatars/bodies/dark/body2_dark.png", scale: partScale)
            body.position = CGPoint(x: 0, y: -56.0 * scale)
            body.zPosition = 1
            root.addChild(body)

            let head = nativeSprite(named: "res/avatars/heads/dark/head1_dark.png", scale: partScale)
            head.position = headPos(115, 115)
            head.zPosition = 2
            root.addChild(head)

            let eyes = nativeSprite(named: "eyes1_dark_frames/normal_eye.png", scale: partScale)
            eyes.position = headPos(98, 74)
            eyes.zPosition = 3
            root.addChild(eyes)

            let browL = nativeSprite(named: "res/avatars/eyebrows/eyebrow1_a.png", scale: partScale)
            browL.position = headPos(74, 44)
            browL.zPosition = 4
            root.addChild(browL)

            let browR = nativeSprite(named: "res/avatars/eyebrows/eyebrow1_b.png", scale: partScale)
            browR.position = headPos(144, 41)
            browR.zPosition = 4
            root.addChild(browR)

            let nose = nativeSprite(named: "res/avatars/noses/dark/nose1_dark.png", scale: partScale)
            nose.position = headPos(126, 94)
            nose.zPosition = 5
            root.addChild(nose)

            let mouth = nativeSprite(named: "normal_mouth1.png", scale: partScale)
            mouth.position = headPos(120, 160)
            mouth.zPosition = 5
            root.addChild(mouth)

            let spectacle = nativeSprite(named: "res/avatars/glasses/spectacle.png", scale: partScale)
            spectacle.position = headPos(148, 128)
            spectacle.zPosition = 6
            root.addChild(spectacle)

            let mustache = nativeSprite(named: "res/avatars/mustaches/mustache1.png", scale: partScale)
            mustache.position = headPos(122, 132)
            mustache.zPosition = 7
            root.addChild(mustache)

            let cigar = nativeSprite(named: "res/avatars/pipes/cigar1.png", scale: partScale)
            cigar.xScale = -partScale
            cigar.position = headPos(72, 158)
            cigar.zPosition = 8
            root.addChild(cigar)

            let hat = nativeSprite(named: "res/avatars/hats/hat2.png", scale: partScale)
            hat.position = headPos(110, 14)
            hat.zPosition = 9
            root.addChild(hat)

            // Red stroke outline border around player portrait (matching screenshot red frame)
            let borderW = 177 * 1.25 * scale
            let border = SKShapeNode(rectOf: CGSize(width: borderW - 2, height: borderW - 2))
            border.strokeColor = SKColor(red: 220.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
            border.lineWidth = 4.0
            border.fillColor = .clear
            border.zPosition = 10
            root.addChild(border)
        } else {
            // Enemy General (matches battlefield screenshot: dark skin, eyepatch, officer hat hat2, frown)
            let body = nativeSprite(named: "res/avatars/bodies/dark/body2_dark.png", scale: partScale)
            body.position = CGPoint(x: 0, y: -56.0 * scale)
            body.zPosition = 1
            root.addChild(body)

            let head = nativeSprite(named: "res/avatars/heads/dark/head1_dark.png", scale: partScale)
            head.position = headPos(115, 115)
            head.zPosition = 2
            root.addChild(head)

            let eyes = nativeSprite(named: "eyes1_dark_frames/normal_eye.png", scale: partScale)
            eyes.position = headPos(98, 74)
            eyes.zPosition = 3
            root.addChild(eyes)

            let browL = nativeSprite(named: "res/avatars/eyebrows/eyebrow1_a.png", scale: partScale)
            browL.position = headPos(74, 44)
            browL.zPosition = 4
            root.addChild(browL)

            let browR = nativeSprite(named: "res/avatars/eyebrows/eyebrow1_b.png", scale: partScale)
            browR.position = headPos(144, 41)
            browR.zPosition = 4
            root.addChild(browR)

            let nose = nativeSprite(named: "res/avatars/noses/dark/nose1_dark.png", scale: partScale)
            nose.position = headPos(126, 94)
            nose.zPosition = 5
            root.addChild(nose)

            let mouth = nativeSprite(named: "normal_mouth1.png", scale: partScale)
            mouth.position = headPos(120, 160)
            mouth.zPosition = 5
            root.addChild(mouth)

            let eyepatch = nativeSprite(named: "res/avatars/glasses/eyepatch.png", scale: partScale)
            eyepatch.position = headPos(144, 78)
            eyepatch.zPosition = 6
            root.addChild(eyepatch)

            let mustache = nativeSprite(named: "res/avatars/mustaches/mustache1.png", scale: partScale)
            mustache.position = headPos(122, 132)
            mustache.zPosition = 7
            root.addChild(mustache)

            let hat = nativeSprite(named: "res/avatars/hats/hat2.png", scale: partScale)
            hat.position = headPos(110, 14)
            hat.zPosition = 9
            root.addChild(hat)

            // Green stroke outline border around enemy portrait (matching screenshot green frame)
            let borderW = 177 * 1.25 * scale
            let border = SKShapeNode(rectOf: CGSize(width: borderW - 2, height: borderW - 2))
            border.strokeColor = SKColor(red: 40.0/255.0, green: 160.0/255.0, blue: 40.0/255.0, alpha: 1.0)
            border.lineWidth = 4.0
            border.fillColor = .clear
            border.zPosition = 10
            root.addChild(border)
        }

        return root
    }
}
