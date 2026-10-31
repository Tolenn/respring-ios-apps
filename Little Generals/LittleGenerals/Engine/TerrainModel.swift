import Foundation
import CoreGraphics

public class TerrainModel {
    public var points: [CGPoint] = []
    public let width: CGFloat
    public let height: CGFloat
    private let stepCount: Int = 36

    public init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        generateTerrain()
    }

    public func generateTerrain() {
        points.removeAll()
        let stepWidth = width / CGFloat(stepCount)

        // Authentic stepped terrain profile matching original Little Generals (themes.lua & reference screenshot):
        // Left hill -> Player plateau (normX 0.20..0.38) -> Valley with Enemy plateau (normX 0.54..0.64) -> Right hill -> Right edge
        for i in 0...stepCount {
            let x = CGFloat(i) * stepWidth
            let normX = x / max(1.0, width)
            let rawY: CGFloat

            if normX < 0.11 {
                // Left edge steps up
                rawY = 230.0 + (normX / 0.11) * 145.0
            } else if normX < 0.20 {
                // Peak of left hill
                rawY = 385.0 - ((normX - 0.11) / 0.09) * 35.0
            } else if normX <= 0.39 {
                // Player flat plateau
                rawY = 348.0
            } else if normX < 0.54 {
                // Steps down into valley
                let t = (normX - 0.39) / 0.15
                rawY = 348.0 - t * 98.0
            } else if normX <= 0.65 {
                // Enemy valley plateau
                rawY = 250.0
            } else if normX < 0.78 {
                // Steps up right hill
                let t = (normX - 0.65) / 0.13
                rawY = 250.0 + t * 125.0
            } else if normX < 0.88 {
                // Steps down right slope
                let t = (normX - 0.78) / 0.10
                rawY = 375.0 - t * 115.0
            } else {
                // Far right step
                rawY = 265.0 + ((normX - 0.88) / 0.12) * 20.0
            }

            // Quantize to discrete 14px vertical step blocks like original tile grid
            let steppedY = round(rawY / 14.0) * 14.0
            points.append(CGPoint(x: x, y: max(135.0, steppedY)))
        }
    }

    public func valueAt(x: CGFloat) -> CGFloat {
        guard !points.isEmpty else { return 250 }
        if x <= points.first!.x { return points.first!.y }
        if x >= points.last!.x { return points.last!.y }

        for i in 0..<(points.count - 1) {
            let p1 = points[i]
            let p2 = points[i + 1]
            if x >= p1.x && x <= p2.x {
                // Return flat step height of column i
                return p1.y
            }
        }
        return points.last!.y
    }

    public func slopeAt(x: CGFloat) -> CGFloat {
        // Tanks sit flat on horizontal steps unless on a cratered slope
        let delta: CGFloat = (width / CGFloat(stepCount))
        let y1 = valueAt(x: max(0, x - delta))
        let y2 = valueAt(x: min(width, x + delta))
        let angle = atan2(y2 - y1, delta * 2.5) * 0.35
        return max(-0.35, min(0.35, angle))
    }

    public func applyCrater(center: CGPoint, radius: CGFloat) {
        guard radius > 0 else { return }
        for i in 0..<points.count {
            let p = points[i]
            let dx = abs(p.x - center.x)
            if dx < radius {
                let depth = sqrt(radius * radius - dx * dx) * 0.65
                let newY = min(p.y, center.y - depth)
                let quantized = round(newY / 7.0) * 7.0
                points[i].y = max(126, quantized)
            }
        }
    }

    public func applyDirtMound(center: CGPoint, radius: CGFloat) {
        guard radius > 0 else { return }
        for i in 0..<points.count {
            let p = points[i]
            let dx = abs(p.x - center.x)
            if dx < radius {
                let addHeight = sqrt(radius * radius - dx * dx) * 0.60
                let quantized = round((p.y + addHeight) / 7.0) * 7.0
                points[i].y = min(height - 130, quantized)
            }
        }
    }

    /// Creates the stepped dirt polygon from bedrock base (`y = 118`) up to the stepped surface.
    public func createPath() -> CGPath {
        let path = CGMutablePath()
        let baseY: CGFloat = 118.0
        path.move(to: CGPoint(x: 0, y: baseY))
        if let first = points.first {
            path.addLine(to: CGPoint(x: first.x, y: first.y))
        }
        for i in 0..<(points.count - 1) {
            let curr = points[i]
            let next = points[i + 1]
            // Horizontal step across column i, then vertical cliff to column i+1
            path.addLine(to: CGPoint(x: next.x, y: curr.y))
            path.addLine(to: CGPoint(x: next.x, y: next.y))
        }
        path.addLine(to: CGPoint(x: width, y: baseY))
        path.closeSubpath()
        return path
    }

    /// Creates a path tracing only the horizontal top surfaces of each terrain step for the grass/surface cap.
    public func createTopCapPath() -> CGPath {
        let path = CGMutablePath()
        for i in 0..<(points.count - 1) {
            let curr = points[i]
            let next = points[i + 1]
            path.move(to: CGPoint(x: curr.x, y: curr.y))
            path.addLine(to: CGPoint(x: next.x, y: curr.y))
        }
        return path
    }
}

