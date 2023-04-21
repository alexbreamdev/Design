//
//  ContentView.swift
//  GlassmorphismExample2
//
//  Created by Oleksii Leshchenko on 06.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.1), .white.opacity(0.0)]), startPoint: .top, endPoint: .bottom)
            
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), .purple.opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            ZStack {
                Circle()
                    .frame(width: 400, height: 400)
                    .offset(x: 150, y: -200)
                    .foregroundColor(.purple.opacity(0.6))
                    .blur(radius: 8)
                
                Circle()
                    .frame(width: 300, height: 300)
                    .offset(x: -50, y: -125)
                    .foregroundColor(Color("darkBlue").opacity(0.5))
                    .blur(radius: 8)
                
                PopupView()
            }
            
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PopupView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white.opacity(0.4)
                .frame(width: 300, height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.1),radius: 10, x: 0, y: 10)
                .blur(radius: 1)
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Glassmorphism")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .blur(radius: 0.7)
                
                Text("Wow, what a beautiful screen".uppercased())
                    .font(.caption)
                    .blur(radius: 0.3)
                
                Text("This could be your body text. If you are enjoing this view, like it.")
                    .font(.footnote)
                    .blur(radius: 0.3)
                
            }
            .foregroundColor(.black.opacity(0.8))
            .padding()
            .frame(width: 300, height: 400)
            
        }
    }
}
