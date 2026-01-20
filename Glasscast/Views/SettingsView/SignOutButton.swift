//
//  SignOutButton.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct SignOutButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: "arrow.right.square")
                    .font(.body.weight(.semibold))
                
                Text("Sign Out")
                    .font(.body)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.red)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.red.opacity(0.1))
            .cornerRadius(12)
        }
        .padding(.horizontal, 16)
    }
}