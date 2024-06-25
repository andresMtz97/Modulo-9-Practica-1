//
//  ViewModel.swift
//  Modulo 9 Practica 1
//
//  Created by Desarrollo on 24/06/24.
//

import Foundation
import AVFoundation
import AVKit

class AudioViewModel: ObservableObject {
    var avPlayer: AVAudioPlayer!
    @Published var loading: Bool = false
    @Published var error: Bool = false
    
//    var fileUrl: URL!
    
    init() {
        self.loading = true
        if let url = URL(string: "http://janzelaznog.com/DDAM/iOS/imperial-march.mp3"){
            let request = URLRequest(url: url)
            let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
            let task = session.dataTask(with: request) { data, response, error in
                if error == nil {
                    let fileUrl = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
                        .appendingPathComponent(url.lastPathComponent, conformingTo: .audio)
                    do {
                        try data?.write(to: fileUrl)
                        DispatchQueue.global(qos: .utility).async {
                            DispatchQueue.main.async {
                                do {
                                    self.avPlayer = try AVAudioPlayer(contentsOf: fileUrl)
                                    self.avPlayer.numberOfLoops = 100
                                    self.loading = false
                                } catch {
                                    self.error = true
                                }
                            }
                        }
                    } catch {
                        self.error = true
                    }
                } else {
                    self.error = true
                        
                }
            }
            task.resume()
        }
    }
    
    func playMusic() {
        avPlayer.play()
    }
    
    func stopMusic() {
        avPlayer.pause()
    }
}
