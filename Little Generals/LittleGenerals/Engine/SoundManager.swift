import Foundation
import AVFoundation

public class SoundManager {
    public static let shared = SoundManager()
    
    private var players: [String: AVAudioPlayer] = [:]
    private var musicPlayer: AVAudioPlayer?
    public var soundEnabled: Bool = true
    public var musicEnabled: Bool = true

    // Bundle audio index
    private var audioIndex: [String: URL] = {
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

    private init() {
        configureAudioSession()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleAudioInterruption(_:)),
            name: AVAudioSession.interruptionNotification,
            object: nil
        )
    }

    @objc private func handleAudioInterruption(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue) else { return }
        if type == .began {
            pauseMusic()
        } else if type == .ended {
            try? AVAudioSession.sharedInstance().setActive(true)
            resumeMusic()
        }
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

        let lower = (filename as NSString).lastPathComponent.lowercased()
        let base = (filename as NSString).deletingPathExtension.lowercased()
        let soundURL = audioIndex[lower] ?? audioIndex[base] ?? Bundle.main.url(forResource: base, withExtension: (filename as NSString).pathExtension)

        guard let url = soundURL else { return }

        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = 0
            player.prepareToPlay()
            player.play()
            players[filename] = player
        } catch {
            print("Error playing sound \(filename): \(error)")
        }
    }

    public func playMusic(_ filename: String, loop: Bool = true) {
        guard musicEnabled else { return }

        let lower = (filename as NSString).lastPathComponent.lowercased()
        let base = (filename as NSString).deletingPathExtension.lowercased()
        let soundURL = audioIndex[lower] ?? audioIndex[base] ?? Bundle.main.url(forResource: base, withExtension: (filename as NSString).pathExtension)

        guard let url = soundURL else { return }

        do {
            musicPlayer?.stop()
            musicPlayer = try AVAudioPlayer(contentsOf: url)
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

    public func pauseMusic() {
        if musicPlayer?.isPlaying == true {
            musicPlayer?.pause()
        }
    }

    public func resumeMusic() {
        guard musicEnabled else { return }
        if let mp = musicPlayer, !mp.isPlaying {
            mp.play()
        }
    }
}
