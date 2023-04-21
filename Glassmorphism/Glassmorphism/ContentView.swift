//
//  ContentView.swift
//  Glassmorphism
//
//  Created by Oleksii Leshchenko on 31.03.2023.
//

import SwiftUI
// 1. Use dynamic fonts, provided by Apple (accesability and consistancy)
// 2. HIG Apple font families: Sanfancisco SF, New York NY
// 3. Use SF Symbols software to design icons

struct ContentView: View {
    @State private var show: Bool = false
    var body: some View {
        ZStack {
            background
                .ignoresSafeArea()
            
            content
        }
    }
    
    private var background: some View {
       ZStack {
            AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9098039216, green: 0.2705882353, blue: 0.2705882353, alpha: 1)), Color(#colorLiteral(red: 0.908000111579895, green: 0.43921566009521484, blue: 0.9843137264251709, alpha: 1)), Color(#colorLiteral(red: 0.7019608020782471, green: 0.9843137264251709, blue: 0.9673725366592407, alpha: 1)), Color(#colorLiteral(red: 0.9791666269302368, green: 0.9342881441116333, blue: 0.5303819179534912, alpha: 1)), Color(#colorLiteral(red: 0.9098039216, green: 0.2705882353, blue: 0.2705882353, alpha: 1))]), center: .center, angle: .degrees(120))
            
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.white.opacity(1)]), startPoint: .bottom, endPoint: .top)
            
            Image(uiImage: #imageLiteral(resourceName: "Blob 3"))
            Image(uiImage: #imageLiteral(resourceName: "Blob 2"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 320)
            Image(uiImage: #imageLiteral(resourceName: "Blob 1"))
                .offset(x: 0, y: 200)
            Image(uiImage: #imageLiteral(resourceName: "Blob 6"))
                .offset(x: 100, y: 200)
            Image(uiImage: #imageLiteral(resourceName: "Blob 4"))
                .offset(x: show ? 100 : 200, y: show ? -100 : -200)
        }
        .hueRotation(.degrees(show ? -90 : 0))
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image("avatar")
                .resizable()
                .scaledToFit()
                .frame(width: 26, height: 26)
            Text("Meng To".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
            Text("I teach designers code and developers design")
                .font(.title).bold()
            Text("Awarded 10 certificates since September 2020")
                .font(.footnote)
            HStack {
                Image("twitter")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.yellow)
                    .frame(width: 16, height: 16)
                Image(systemName: "link") // sf symbol is font so it uses font modifiers
                Text("designcode.io")
            }
            .font(.footnote)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
