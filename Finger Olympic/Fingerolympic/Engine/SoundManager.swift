import Foundation
import AVFoundation

public final class SoundManager {
    public static let shared = SoundManager()
    private var players: [String: AVAudioPlayer] = [:]
    public var soundEnabled: Bool = true
    
    private init() {
        configureAudioSession()
    }
    
    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("[SoundManager] Audio session error: \(error)")
        }
    }
    
    public func playSound(named name: String) {
        guard soundEnabled else { return }
        
        let extCandidates = ["caf", "mp3", "wav"]
        var soundURL: URL? = nil
        
        for ext in extCandidates {
            let baseName = name.replacingOccurrences(of: ".\(ext)", with: "")
            if let url = Bundle.main.url(forResource: baseName, withExtension: ext) {
                soundURL = url
                break
            }
        }
        
        guard let url = soundURL else {
            // Silently return if optional sound is missing
            return
        }
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
            players[name] = player
        } catch {
            print("[SoundManager] Error playing sound \(name): \(error)")
        }
    }
}

