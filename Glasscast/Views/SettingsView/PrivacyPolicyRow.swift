//
//  PrivacyPolicyRow.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct PrivacyPolicyRow: View {
    var body: some View {
        HStack(spacing: 16) {
            // Icon
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 56, height: 56)
                
                Image(systemName: "shield.checkered")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            
            // Label
            Text("Privacy Policy")
                .font(.body)
            
            Spacer()
            
            // External Link Icon
            Image(systemName: "arrow.up.right.square")
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .contentShape(Rectangle())
        .onTapGesture {
            if let url = URL(string: "https://example.com/privacy") {
                UIApplication.shared.open(url)
            }
        }
    }
}