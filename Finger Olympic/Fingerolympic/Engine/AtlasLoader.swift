import Foundation
import SpriteKit
import UIKit

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
        let baseName = plistName.replacingOccurrences(of: ".plist", with: "")
        
        guard let plistURL = Bundle.main.url(forResource: baseName, withExtension: "plist"),
              let plistData = try? Data(contentsOf: plistURL),
              let dict = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any],
              let frames = dict["frames"] as? [String: [String: Any]] else {
            print("[AtlasLoader] Could not load plist for atlas: \(name)")
            return [:]
        }
        
        // Find matching image
        var imageURL = Bundle.main.url(forResource: pngName.replacingOccurrences(of: ".png", with: ""), withExtension: "png")
        if imageURL == nil {
            imageURL = Bundle.main.url(forResource: baseName, withExtension: "png")
        }
        
        guard let validImageURL = imageURL,
              let uiImage = UIImage(contentsOfFile: validImageURL.path) else {
            print("[AtlasLoader] Could not load image for atlas: \(name)")
            return [:]
        }
        
        let baseTexture = SKTexture(image: uiImage)
        var result: [String: SKTexture] = [:]
        let imageSize = uiImage.size
        
        for (frameName, frameInfo) in frames {
            var rect: CGRect = .zero
            if let rectStr = frameInfo["textureRect"] as? String {
                rect = parseCGRect(from: rectStr)
            } else if let x = frameInfo["x"] as? Double,
                      let y = frameInfo["y"] as? Double,
                      let w = frameInfo["width"] as? Double,
                      let h = frameInfo["height"] as? Double {
                rect = CGRect(x: x, y: y, width: w, height: h)
            }
            
            guard rect.width > 0 && rect.height > 0 else { continue }
            
            // Try high-fidelity CGImage crop first (exact pixel coordinates)
            if let cgImage = uiImage.cgImage,
               let cropped = cgImage.cropping(to: rect) {
                result[frameName] = SKTexture(cgImage: cropped)
            } else {
                // Fallback to SpriteKit unit coordinate rect
                let normX = rect.origin.x / imageSize.width
                let normY = (imageSize.height - (rect.origin.y + rect.size.height)) / imageSize.height
                let normW = rect.size.width / imageSize.width
                let normH = rect.size.height / imageSize.height
                let normRect = CGRect(x: normX, y: normY, width: normW, height: normH)
                result[frameName] = SKTexture(rect: normRect, in: baseTexture)
            }
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
        let cleaned = str.replacingOccurrences(of: "{", with: "").replacingOccurrences(of: "}", with: "")
        let parts = cleaned.components(separatedBy: ",").compactMap { Double($0.trimmingCharacters(in: .whitespaces)) }
        if parts.count >= 4 {
            return CGRect(x: parts[0], y: parts[1], width: parts[2], height: parts[3])
        }
        return .zero
    }
}
