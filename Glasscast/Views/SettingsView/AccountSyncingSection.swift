//
//  AccountSyncingSection.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct AccountSyncingSection: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Account & Syncing")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal, 16)
            
            VStack(spacing: 0) {
                // Account Info
                AccountInfoRow(
                    email: viewModel.userEmail,
                    authStatus: viewModel.authStatus
                )
                
                Divider()
                    .padding(.leading, 72)
                
                // City Syncing
                CitySyncingRow(
                    lastSyncTime: viewModel.lastSyncTime
                )
            }
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(12)
            .padding(.horizontal, 16)
        }
    }
}