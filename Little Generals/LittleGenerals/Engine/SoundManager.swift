import Foundation
import AVFoundation

public class SoundManager {
    public static let shared = SoundManager()
    
    private var players: [String: AVAudioPlayer] = [:]
    private var musicPlayer: AVAudioPlayer?
    public var soundEnabled: Bool = true
    public var musicEnabled: Bool = true

    private init() {
        configureAudioSession()
    }

    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to configure audio session: \(error)")
        }
    }

    public func playSound(_ filename: String) {
        guard soundEnabled else { return }

        let name = (filename as NSString).deletingPathExtension
        let ext = (filename as NSString).pathExtension.isEmpty ? "mp3" : (filename as NSString).pathExtension

        let candidates = [
            Bundle.main.url(forResource: name, withExtension: ext),
            Bundle.main.url(forResource: name, withExtension: ext, subdirectory: "res/sounds"),
            Bundle.main.url(forResource: name, withExtension: ext, subdirectory: "Resources/res/sounds")
        ]

        guard let soundURL = candidates.compactMap({ $0 }).first else {
            return
        }

        do {
            let player = try AVAudioPlayer(contentsOf: soundURL)
            player.prepareToPlay()
            player.play()
            players[filename] = player
        } catch {
            print("Error playing sound \(filename): \(error)")
        }
    }

    public func playMusic(_ filename: String, loop: Bool = true) {
        guard musicEnabled else { return }

        let name = (filename as NSString).deletingPathExtension
        let ext = (filename as NSString).pathExtension.isEmpty ? "mp3" : (filename as NSString).pathExtension

        let candidates = [
            Bundle.main.url(forResource: name, withExtension: ext),
            Bundle.main.url(forResource: name, withExtension: ext, subdirectory: "res/sounds"),
            Bundle.main.url(forResource: name, withExtension: ext, subdirectory: "Resources/res/sounds")
        ]

        guard let musicURL = candidates.compactMap({ $0 }).first else {
            return
        }

        do {
            musicPlayer?.stop()
            musicPlayer = try AVAudioPlayer(contentsOf: musicURL)
            musicPlayer?.numberOfLoops = loop ? -1 : 0
            musicPlayer?.volume = 0.65
            musicPlayer?.prepareToPlay()
            musicPlayer?.play()
        } catch {
            print("Error playing music \(filename): \(error)")
        }
    }

    public func stopMusic() {
        musicPlayer?.stop()
    }
}

