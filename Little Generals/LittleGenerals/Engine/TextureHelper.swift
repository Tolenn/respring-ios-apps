import UIKit
import SpriteKit

public class TextureHelper {
    private static var cache: [String: SKTexture] = [:]

    public static func loadTexture(named name: String, fallbackColor: SKColor = .gray, size: CGSize = CGSize(width: 40, height: 40)) -> SKTexture {
        if let cached = cache[name] {
            return cached
        }

        let cleanName = (name as NSString).deletingPathExtension
        let ext = (name as NSString).pathExtension.isEmpty ? "png" : (name as NSString).pathExtension

        let candidates = [
            Bundle.main.url(forResource: cleanName, withExtension: ext),
            Bundle.main.url(forResource: cleanName, withExtension: ext, subdirectory: "res"),
            Bundle.main.url(forResource: cleanName, withExtension: ext, subdirectory: "res/tanks"),
            Bundle.main.url(forResource: cleanName, withExtension: ext, subdirectory: "res/themes/arizonatheme"),
            Bundle.main.url(forResource: cleanName, withExtension: ext, subdirectory: "res/weapons"),
            Bundle.main.url(forResource: cleanName, withExtension: ext, subdirectory: "res/ui"),
            Bundle.main.url(forResource: cleanName, withExtension: ext, subdirectory: "res/maps"),
            Bundle.main.url(forResource: cleanName, withExtension: ext, subdirectory: "res/splash"),
            Bundle.main.url(forResource: name, withExtension: nil)
        ]

        for url in candidates.compactMap({ $0 }) {
            if let img = UIImage(contentsOfFile: url.path) {
                let tex = SKTexture(image: img)
                cache[name] = tex
                return tex
            }
        }

        // Direct imageNamed check
        let direct = SKTexture(imageNamed: name)
        if direct.size().width > 0 && direct.size().height > 0 {
            cache[name] = direct
            return direct
        }

        // Stylized procedural fallback
        let renderer = UIGraphicsImageRenderer(size: size)
        let fallbackImage = renderer.image { ctx in
            fallbackColor.setFill()
            ctx.fill(CGRect(origin: .zero, size: size))
        }
        let fallbackTex = SKTexture(image: fallbackImage)
        cache[name] = fallbackTex
        return fallbackTex
    }
}
