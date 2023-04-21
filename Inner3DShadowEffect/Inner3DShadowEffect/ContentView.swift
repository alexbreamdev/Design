//
//  ContentView.swift
//  Inner3DShadowEffect
//
//  Created by Oleksii Leshchenko on 21.04.2023.
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    private let motionMnager = CMMotionManager()
    
    @Published var x = 0.0
    @Published var y = 0.0
    
    init() {
        motionMnager.deviceMotionUpdateInterval = 1 / 15
        motionMnager.startDeviceMotionUpdates(to: .main) {[weak self] data, error in
            guard let motion = data?.attitude else { return }
            self?.x = motion.roll
            self?.y = motion.pitch
        }
        
    }
}

struct ContentView: View {
    @StateObject private var motion = MotionManager()
    var body: some View {
        VStack {
            Text("?")
            Image(systemName: "arrow.down.message.fill")
        }
        .foregroundStyle(.blue.gradient
            .shadow(.inner(color: .black, radius: 5, x: motion.x * -20, y: motion.y * -20))
        )
        .font(.system(size: 300).bold())
        .rotation3DEffect(.degrees(motion.x * 20), axis: (x: 0, y: 1 , z: 3 ))
        .rotation3DEffect(.degrees(motion.y * 20), axis: (x: -1, y: 0 , z: 0 ))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
