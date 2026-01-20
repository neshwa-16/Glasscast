//
//  SearchBarView.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var isSearchFocused: FocusState<Bool>.Binding
    let onCancel: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            // Search Field
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                
                TextField("Search cities", text: $searchText)
                    .focused(isSearchFocused)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(10)
            
            // Cancel Button
            if !searchText.isEmpty {
                Button("Cancel") {
                    onCancel()
                    isSearchFocused.wrappedValue = false
                }
                .font(.body)
                .foregroundStyle(.blue)
            }
        }
    }
}