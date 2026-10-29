import Foundation
import CoreGraphics

public class TerrainModel {
    public var points: [CGPoint] = []
    public let width: CGFloat
    public let height: CGFloat
    private let stepCount: Int = 80

    public init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        generateTerrain()
    }

    public func generateTerrain() {
        points.removeAll()
        let stepWidth = width / CGFloat(stepCount)

        // Generate terrain with plateaus at player (100-180) and AI (620-700)
        let playerPlateauY: CGFloat = CGFloat.random(in: 120...160)
        let aiPlateauY: CGFloat = CGFloat.random(in: 130...170)
        let hillScale: CGFloat = CGFloat.random(in: 45...85)
        let freq: CGFloat = CGFloat.random(in: 1.8...2.6)

        for i in 0...stepCount {
            let x = CGFloat(i) * stepWidth
            var y: CGFloat

            if x >= 100 && x <= 180 {
                // Player plateau
                y = playerPlateauY
            } else if x >= 620 && x <= 700 {
                // Enemy plateau
                y = aiPlateauY
            } else {
                let normX = x / width
                let wave1 = sin(normX * .pi * freq) * hillScale
                let wave2 = cos(normX * .pi * 3.5) * (hillScale * 0.35)
                let base = 120.0 + (aiPlateauY - playerPlateauY) * normX
                y = max(50, base + wave1 + wave2)
            }
            points.append(CGPoint(x: x, y: y))
        }
    }

    public func valueAt(x: CGFloat) -> CGFloat {
        guard !points.isEmpty else { return 120 }
        if x <= points.first!.x { return points.first!.y }
        if x >= points.last!.x { return points.last!.y }

        for i in 0..<(points.count - 1) {
            let p1 = points[i]
            let p2 = points[i + 1]
            if x >= p1.x && x <= p2.x {
                let t = (x - p1.x) / (p2.x - p1.x)
                return p1.y + t * (p2.y - p1.y)
            }
        }
        return points.last!.y
    }

    public func slopeAt(x: CGFloat) -> CGFloat {
        let delta: CGFloat = 6.0
        let y1 = valueAt(x: max(0, x - delta))
        let y2 = valueAt(x: min(width, x + delta))
        let angle = atan2(y2 - y1, delta * 2.0)
        return max(-0.65, min(0.65, angle))
    }

    public func applyCrater(center: CGPoint, radius: CGFloat) {
        guard radius > 0 else { return }
        for i in 0..<points.count {
            let p = points[i]
            let dx = abs(p.x - center.x)
            if dx < radius {
                let depth = sqrt(radius * radius - dx * dx) * 0.65
                let newY = min(p.y, center.y - depth)
                points[i].y = max(35, newY)
            }
        }
    }

    public func createPath() -> CGPath {
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        for p in points {
            path.addLine(to: p)
        }
        path.addLine(to: CGPoint(x: width, y: 0))
        path.closeSubpath()
        return path
    }
}

