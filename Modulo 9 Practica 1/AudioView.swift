//
//  AudioView.swift
//  Modulo 9 Practica 1
//
//  Created by Desarrollo on 25/06/24.
//

import SwiftUI

struct AudioView: View {
    @StateObject var vm = AudioViewModel()
    @State var playing = false
    
    var body: some View {
        if vm.loading {
            ProgressView("Cargando...")
        } else {
            if vm.error {
                ContentUnavailableView(
                    "File Error",
                    systemImage: "exclamationmark.triangle",
                    description: Text("An error with the file has ocurred.")
                )
            } else {
                VStack {
                    Spacer()
                    Image(systemName: "music.note")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Tap the button to play/pause the music.")
                    Spacer()
                    Button {
                        print("button pushed!")
                        if playing {
                            vm.avPlayer.stop()
                        } else {
                            vm.avPlayer.play()
                        }
                        playing = !playing
                    } label: {
                        Image(systemName: playing ? "pause.fill": "play.fill")
                            .imageScale(.large)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 50)
                    }
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    
                }
            }
        }
    }
}

#Preview {
    AudioView()
}
