//
//  RegionalMapSection.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct RegionalMapSection: View {
    var body: some View {
        VStack(spacing: 12) {
            // Map placeholder
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.opacity(0.3))
                    .frame(height: 200)
                    .overlay {
                        // Simple map lines pattern
                        GeometryReader { geometry in
                            Path { path in
                                let width = geometry.size.width
                                let height = geometry.size.height
                                
                                // Horizontal lines
                                for i in 0..<8 {
                                    let y = CGFloat(i) * height / 8
                                    path.move(to: CGPoint(x: 0, y: y))
                                    path.addLine(to: CGPoint(x: width, y: y))
                                }
                                
                                // Vertical lines
                                for i in 0..<8 {
                                    let x = CGFloat(i) * width / 8
                                    path.move(to: CGPoint(x: x, y: 0))
                                    path.addLine(to: CGPoint(x: x, y: height))
                                }
                            }
                            .stroke(.white.opacity(0.2), lineWidth: 1)
                        }
                    }
                
                // Map label
                HStack(spacing: 8) {
                    Image(systemName: "map.fill")
                        .font(.subheadline)
                    Text("REGIONAL MAP")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .tracking(1)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(.ultraThinMaterial)
                .cornerRadius(25)
            }
        }
    }
}