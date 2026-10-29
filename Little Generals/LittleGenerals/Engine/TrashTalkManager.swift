import Foundation

public class TrashTalkManager {
    public static let shared = TrashTalkManager()

    public var preambles: [String] = []
    public var missedShots: [String] = []
    public var hitLow: [String] = []
    public var hitMid: [String] = []
    public var hitHigh: [String] = []
    public var winMessages: [String] = []
    public var loseMessages: [String] = []

    private init() {
        loadTrashTalk()
    }

    private func loadTrashTalk() {
        let candidates = [
            Bundle.main.url(forResource: "trashtalk", withExtension: "csv"),
            Bundle.main.url(forResource: "trashtalk", withExtension: "csv", subdirectory: "res"),
            Bundle.main.url(forResource: "trashtalk", withExtension: "csv", subdirectory: "Resources/res")
        ]

        guard let url = candidates.compactMap({ $0 }).first,
              let content = try? String(contentsOf: url, encoding: .utf8) else {
            loadDefaults()
            return
        }

        let lines = content.components(separatedBy: .newlines)
        guard lines.count > 1 else {
            loadDefaults()
            return
        }

        // CSV parsing ignoring headers
        for line in lines.dropFirst() {
            let row = parseCsvRow(line)
            if row.count >= 11 {
                if !row[0].isEmpty { preambles.append(row[0]) }
                if !row[1].isEmpty { missedShots.append(row[1]) }
                if !row[6].isEmpty { hitLow.append(row[6]) }
                if !row[7].isEmpty { hitMid.append(row[7]) }
                if !row[8].isEmpty { hitHigh.append(row[8]) }
                if !row[9].isEmpty { winMessages.append(row[9]) }
                if !row[10].isEmpty { loseMessages.append(row[10]) }
            }
        }

        if preambles.isEmpty { loadDefaults() }
    }

    private func parseCsvRow(_ line: String) -> [String] {
        var result: [String] = []
        var current = ""
        var inQuotes = false

        for char in line {
            if char == "\"" {
                inQuotes.toggle()
            } else if char == "," && !inQuotes {
                result.append(current.trimmingCharacters(in: .whitespacesAndNewlines))
                current = ""
            } else {
                current.append(char)
            }
        }
        result.append(current.trimmingCharacters(in: .whitespacesAndNewlines))
        return result
    }

    private func loadDefaults() {
        preambles = ["Do you want a piece of me?", "You are going down.", "You call that a tank?", "Tally Ho!"]
        missedShots = ["What are you shooting at?", "Is that all?", "Why do you hate grass?", "Lucky shot."]
        hitLow = ["I've had worse.", "It's only a scratch.", "Paint will fix that.", "Is that all you've got?"]
        hitMid = ["Thanks. I was cold.", "I'll bite your legs off!", "Is this tank fireproof?", "Now you've done it."]
        hitHigh = ["Medic!", "It's gettin' dark...", "My explosion damage insurance just expired!", "Mayday! Mayday!"]
        winMessages = ["Whoop whoop!", "Victory!", "That's going to leave a mark.", "I came, I saw, I conquered."]
        loseMessages = ["Auntie Em! Auntie Em!", "Those treads are rentals!", "Lets call it a draw?", "My bad."]
    }

    public func randomPreamble() -> String {
        return preambles.randomElement() ?? "Prepare for battle!"
    }

    public func randomTaunt() -> String {
        return randomPreamble()
    }

    public func randomCheer() -> String {
        return randomWin()
    }

    public func randomMiss() -> String {
        return missedShots.randomElement() ?? "Missed me!"
    }

    public func randomHit(currentHealth: Double, maxHealth: Double) -> String {
        let pct = currentHealth / maxHealth
        if pct < 0.3 {
            return hitHigh.randomElement() ?? "Medic!"
        } else if pct < 0.6 {
            return hitMid.randomElement() ?? "Now you've done it!"
        } else {
            return hitLow.randomElement() ?? "It's only a scratch."
        }
    }

    public func randomWin() -> String {
        return winMessages.randomElement() ?? "Victory!"
    }

    public func randomLose() -> String {
        return loseMessages.randomElement() ?? "Defeat!"
    }
}

