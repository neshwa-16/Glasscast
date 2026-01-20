//
//  SyncingStatusView.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct SyncingStatusView: View {
    var body: some View {
        VStack(spacing: 16) {
            // Sync Icon
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.1))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.system(size: 40))
                    .foregroundStyle(.blue)
                    .rotationEffect(.degrees(0))
            }
            
            VStack(spacing: 8) {
                Text("Syncing with Supabase")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("Your cities are backed up and synced across all devices")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
            }
        }
        .padding(.vertical, 32)
    }
}

#Preview {
    SyncingStatusView()
}