//
//  InformationSection.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct InformationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Information")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal, 16)
            
            VStack(spacing: 0) {
                // Privacy Policy
                PrivacyPolicyRow()
                
                Divider()
                    .padding(.leading, 72)
                
                // Version
                VersionRow()
            }
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(12)
            .padding(.horizontal, 16)
        }
    }
}