import Foundation
import SpriteKit

public final class AtlasLoader {
    public static let shared = AtlasLoader()
    private var cachedAtlases: [String: [String: SKTexture]] = [:]
    
    private init() {}
    
    public func loadAtlas(named name: String) -> [String: SKTexture] {
        if let cached = cachedAtlases[name] {
            return cached
        }
        
        let plistName = name.hasSuffix(".plist") ? name : "\(name).plist"
        let pngName = name.hasSuffix(".png") ? name : "\(name).png"
        
        guard let plistURL = Bundle.main.url(forResource: plistName.replacingOccurrences(of: ".plist", with: ""), withExtension: "plist"),
              let plistData = try? Data(contentsOf: plistURL),
              let dict = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any],
              let frames = dict["frames"] as? [String: [String: Any]] else {
            print("[AtlasLoader] Could not load plist for atlas: \(name)")
            return [:]
        }
        
        // Find matching image
        var imageURL = Bundle.main.url(forResource: pngName.replacingOccurrences(of: ".png", with: ""), withExtension: "png")
        if imageURL == nil {
            let baseName = plistName.replacingOccurrences(of: ".plist", with: "")
            imageURL = Bundle.main.url(forResource: baseName, withExtension: "png")
        }
        
        guard let validImageURL = imageURL,
              let uiImage = UIImage(contentsOfFile: validImageURL.path) else {
            print("[AtlasLoader] Could not load image for atlas: \(name)")
            return [:]
        }
        
        let imageSize = uiImage.size
        let baseTexture = SKTexture(image: uiImage)
        var result: [String: SKTexture] = [:]
        
        for (frameName, frameInfo) in frames {
            guard let rectStr = frameInfo["textureRect"] as? String else { continue }
            let rect = parseCGRect(from: rectStr)
            
            // Normalized coordinates for SpriteKit (origin at bottom-left)
            let normX = rect.origin.x / imageSize.width
            let normY = (imageSize.height - (rect.origin.y + rect.size.height)) / imageSize.height
            let normW = rect.size.width / imageSize.width
            let normH = rect.size.height / imageSize.height
            
            let normRect = CGRect(x: normX, y: normY, width: normW, height: normH)
            let subTexture = SKTexture(rect: normRect, in: baseTexture)
            result[frameName] = subTexture
        }
        
        cachedAtlases[name] = result
        return result
    }
    
    public func getAnimationSequence(atlasName: String, prefix: String) -> [SKTexture] {
        let atlas = loadAtlas(named: atlasName)
        let matchingKeys = atlas.keys.filter { $0.hasPrefix(prefix) }.sorted()
        return matchingKeys.compactMap { atlas[$0] }
    }
    
    private func parseCGRect(from str: String) -> CGRect {
        // Form: {{x, y}, {w, h}}
        let cleaned = str.replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: "")
        let parts = cleaned.components(separatedBy: ",").compactMap { Double($0.trimmingCharacters(in: .whitespaces)) }
        if parts.count >= 4 {
            return CGRect(x: parts[0], y: parts[1], width: parts[2], height: parts[3])
        }
        return .zero
    }
}

