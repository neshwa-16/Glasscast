//
//  SettingsView.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(UIColor.systemGroupedBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 32) {
                        // General Preferences
                        GeneralPreferencesSection(viewModel: viewModel)
                        
                        // Account & Syncing
                        AccountSyncingSection(viewModel: viewModel)
                        
                        // Information
                        InformationSection()
                        
                        // Sign Out Button
                        SignOutButton {
                            Task {
                                await viewModel.signOut()
                            }
                        }
                        
                        // Footer
                        FooterView()
                    }
                    .padding(.top, 24)
                    .padding(.bottom, 40)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button(action: { dismiss() }) {
//                        Image(systemName: "chevron.left")
//                            .font(.body.weight(.semibold))
//                            .foregroundStyle(.primary)
//                    }
//                }
//            }
            .task {
                await viewModel.loadSettings()
            }
            .alert("Sign Out", isPresented: $viewModel.showSignOutConfirmation) {
                Button("Cancel", role: .cancel) { }
                Button("Sign Out", role: .destructive) {
                    Task {
                        await viewModel.confirmSignOut()
                    }
                }
            } message: {
                Text("Are you sure you want to sign out?")
            }
        }
    }
}

#Preview {
    SettingsView()
}
