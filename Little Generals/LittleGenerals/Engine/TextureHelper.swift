import UIKit
import SpriteKit

public class TextureHelper {
    private static var cache: [String: SKTexture] = [:]
    
    // Lazy index mapping lowercase filename (and filename without extension) to file URL in bundle
    private static var bundleFileIndex: [String: URL] = {
        var index: [String: URL] = [:]
        let bundleURL = Bundle.main.bundleURL
        let fileManager = FileManager.default
        if let enumerator = fileManager.enumerator(at: bundleURL, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]) {
            for case let url as URL in enumerator {
                let lowerName = url.lastPathComponent.lowercased()
                index[lowerName] = url
                let baseName = url.deletingPathExtension().lastPathComponent.lowercased()
                if index[baseName] == nil {
                    index[baseName] = url
                }
            }
        }
        return index
    }()

    public static func loadTexture(named name: String, fallbackColor: SKColor = .gray, size: CGSize = CGSize(width: 40, height: 40)) -> SKTexture {
        if let cached = cache[name] {
            return cached
        }

        let lowerName = (name as NSString).lastPathComponent.lowercased()
        let cleanName = (name as NSString).deletingPathExtension.lowercased()

        // 1. Direct index lookup in bundle
        if let url = bundleFileIndex[lowerName] ?? bundleFileIndex[cleanName],
           let img = UIImage(contentsOfFile: url.path) {
            let tex = SKTexture(image: img)
            cache[name] = tex
            return tex
        }

        // 2. Standard Bundle.main lookup
        let ext = (name as NSString).pathExtension.isEmpty ? "png" : (name as NSString).pathExtension
        let candidates = [
            Bundle.main.url(forResource: cleanName, withExtension: ext),
            Bundle.main.url(forResource: name, withExtension: nil)
        ]

        for url in candidates.compactMap({ $0 }) {
            if let img = UIImage(contentsOfFile: url.path) {
                let tex = SKTexture(image: img)
                cache[name] = tex
                return tex
            }
        }

        // 3. SKTexture(imageNamed:)
        let direct = SKTexture(imageNamed: name)
        if direct.size().width > 0 && direct.size().height > 0 {
            cache[name] = direct
            return direct
        }

        // 4. Stylized fallback placeholder
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
