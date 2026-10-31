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
    /// At `scale = 1.0`, the outer frame (`newui_frames/frame.png` 177x177 scaled by 1.25) is `221.25 x 221.25`.
    /// In battle (`battleControls.lu` Proto 25), `scale = 0.425` produces a `94 x 94` framed portrait.
    public static func buildGeneralAvatar(isPlayer: Bool, scale: CGFloat = 0.425) -> SKNode {
        let root = SKNode()

        // Inner backing inside frame (210x210 at 1.0x)
        let bgSize = CGSize(width: 196 * scale, height: 196 * scale)
        let bg = SKSpriteNode(color: SKColor(red: 238.0/255.0, green: 234.0/255.0, blue: 222.0/255.0, alpha: 1.0), size: bgSize)
        bg.zPosition = 0
        root.addChild(bg)

        // Helper to convert Corona head-local (hx, hy) (relative to head center (115, 115) in Y-down space,
        // scaled by 0.75 per battleAvatar.lua:1066, with head shifted down slightly in frame) into SpriteKit coordinates.
        let partScale = 0.75 * scale
        func headPos(_ hx: CGFloat, _ hy: CGFloat) -> CGPoint {
            return CGPoint(
                x: (hx - 115.0) * partScale,
                y: (108.0 - hy) * partScale
            )
        }

        // 1. Body (`body1.png` / `body2_dark.png`, 225x106 native) at bottom of frame
        let bodyName = isPlayer ? "bodies/light/body1_frames/body1.png" : "bodies/dark/body2_dark_frames/body2_dark.png"
        let body = nativeSprite(named: bodyName, scale: partScale)
        body.position = CGPoint(x: 0, y: -56.0 * scale)
        body.zPosition = 1
        root.addChild(body)

        // 2. Head (`head1.png` / `head1_dark.png`, 189x215 native)
        let headName = isPlayer ? "heads/light/head1_frames/head1.png" : "heads/dark/head1_dark_frames/head1_dark.png"
        let head = nativeSprite(named: headName, scale: partScale)
        head.position = headPos(115, 115)
        head.zPosition = 2
        root.addChild(head)

        // 3. Eyes (`normal_eye.png`, 114x60 native) at (98, 70)
        let eyesName = isPlayer ? "eyes/light/eyes1_frames/normal_eye.png" : "eyes/dark/eyes1_dark_frames/normal_eye.png"
        let eyes = nativeSprite(named: eyesName, scale: partScale)
        eyes.position = headPos(98, 74)
        eyes.zPosition = 3
        root.addChild(eyes)

        // 4. Left & Right Eyebrows (`eyebrow1_a.png` 80x39 at (74, 40), `eyebrow1_b.png` 52x40 at (144, 37))
        let browL = nativeSprite(named: "eyebrows/eyebrows1_frames/eyebrow1_a.png", scale: partScale)
        browL.position = headPos(74, 44)
        browL.zPosition = 4
        root.addChild(browL)

        let browR = nativeSprite(named: "eyebrows/eyebrows1_frames/eyebrow1_b.png", scale: partScale)
        browR.position = headPos(144, 41)
        browR.zPosition = 4
        root.addChild(browR)

        // 5. Nose (`nose1.png` / `nose1_dark.png`, 72x70 native) at (126, 90)
        let noseName = isPlayer ? "noses/light/noses_frames/nose1.png" : "noses/dark/noses_dark_frames/nose1_dark.png"
        let nose = nativeSprite(named: noseName, scale: partScale)
        nose.position = headPos(126, 94)
        nose.zPosition = 5
        root.addChild(nose)

        // 6. Mouth (`normal_mouth1.png`, 50x14 native) at (120, 160)
        let mouth = nativeSprite(named: "mouth1_frames/normal_mouth1.png", scale: partScale)
        mouth.position = headPos(120, 160)
        mouth.zPosition = 5
        root.addChild(mouth)

        if isPlayer {
            // Player General: Monocle (`spectacle.png` 46x178, TopRight at (175, 50) -> center (152, 139)),
            // Mustache (`mustache1.png` 202x63 at (122, 135)), Blue Beret (`hat1.png` 191x131 at (104, 18))
            let monocle = nativeSprite(named: "glasses/glasses_frames/spectacle.png", scale: partScale)
            monocle.position = headPos(148, 128)
            monocle.zPosition = 6
            root.addChild(monocle)

            let mustache = nativeSprite(named: "mustaches/mustaches_frames/mustache1.png", scale: partScale)
            mustache.position = headPos(122, 132)
            mustache.zPosition = 7
            root.addChild(mustache)

            let hat = nativeSprite(named: "hats/hats1_frames/hat1.png", scale: partScale)
            hat.position = headPos(106, 18)
            hat.zPosition = 8
            root.addChild(hat)
        } else {
            // Enemy General: Sunglasses (`sunglasses.png` 164x77, TopRight at (175, 50) -> center (93, 88)),
            // Cigar (`cigar1.png` 104x73 at (158, 168)), Officer Cap (`hat2.png` 189x139 at (110, 14))
            let shades = nativeSprite(named: "glasses/glasses_frames/sunglasses.png", scale: partScale)
            shades.position = headPos(102, 82)
            shades.zPosition = 6
            root.addChild(shades)

            let cigar = nativeSprite(named: "pipes/pipes_frames/cigar1.png", scale: partScale)
            cigar.xScale = -1.0
            cigar.position = headPos(155, 168)
            cigar.zPosition = 7
            root.addChild(cigar)

            let hat = nativeSprite(named: "hats/hats1_frames/hat2.png", scale: partScale)
            hat.position = headPos(112, 14)
            hat.zPosition = 8
            root.addChild(hat)
        }

        // 7. Outer Portrait Frame (`newui_frames/frame.png` 177x177 native, scaled by 1.25 per battleAvatar.lua:791)
        let frame = nativeSprite(named: "newui_frames/frame.png", scale: 1.25 * scale)
        frame.zPosition = 9
        if !isPlayer {
            // Tint enemy frame olive-green to match screenshot's green enemy border
            frame.color = SKColor(red: 0.35, green: 0.75, blue: 0.35, alpha: 1.0)
            frame.colorBlendFactor = 0.35
        }
        root.addChild(frame)

        return root
    }
}
