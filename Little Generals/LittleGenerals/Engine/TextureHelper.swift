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
                let fullPath = url.path
                let fileName = url.lastPathComponent.lowercased()
                let baseName = url.deletingPathExtension().lastPathComponent.lowercased()
                
                // 1. Filename with extension (e.g. "bedrock.png")
                index[fileName] = url
                
                // 2. Base name without extension (e.g. "bedrock")
                if index[baseName] == nil {
                    index[baseName] = url
                }
                
                // 3. Relative path inside bundle (e.g. "res/themes/bedrock.png")
                if fullPath.hasPrefix(bundlePath) {
                    var rel = String(fullPath.dropFirst(bundlePath.count))
                    if rel.hasPrefix("/") { rel = String(rel.dropFirst()) }
                    let relLower = rel.lowercased()
                    index[relLower] = url
                    let relNoExt = (relLower as NSString).deletingPathExtension
                    if index[relNoExt] == nil {
                        index[relNoExt] = url
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
}
