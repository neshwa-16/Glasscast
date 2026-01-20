//
//  FooterView.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//


import SwiftUI

struct FooterView: View {
    var body: some View {
        Text("MINIMAL WEATHER")
            .font(.caption)
            .fontWeight(.medium)
            .foregroundStyle(.secondary)
            .tracking(2)
            .frame(maxWidth: .infinity)
            .padding(.top, 16)
    }
}

#Preview {
    FooterView()
}