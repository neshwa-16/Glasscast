//
//  AuthView.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//

import SwiftUI

struct AuthView: View {
    @StateObject private var viewModel = AuthViewModel()
    @FocusState private var focusedField: Field?

    enum Field {
        case email
        case password
    }

    private var isEnabled: Bool {
        viewModel.isFormValid && !viewModel.isLoading
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 28) {

                    // Header icon
                    VStack(spacing: 16) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue.opacity(0.12))
                            .frame(width: 88, height: 88)
                            .overlay {
                                Image(systemName: "cloud.fill")
                                    .font(.system(size: 38))
                                    .foregroundStyle(.blue)
                            }

                        Text("Welcome Back")
                            .font(.title.bold())

                        Text("Access your synced cities and local weather.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.top, 40)

                    // Form
                    VStack(spacing: 20) {

                        // Email
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Email")
                                .font(.subheadline.weight(.medium))

                            TextField("", text: $viewModel.email)
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .focused($focusedField, equals: .email)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(Color.gray.opacity(0.3))
                                )
                        }

                        // Password
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Password")
                                .font(.subheadline.weight(.medium))

                            SecureField("", text: $viewModel.password)
                                .focused($focusedField, equals: .password)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(Color.gray.opacity(0.3))
                                )
                        }

                        // Forgot password
                        HStack {
                            Spacer()
                            Button("Forgot Password?") {
                                // TODO: Forgot password flow
                            }
                            .font(.footnote)
                        }
                    }

                    // Error message
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .font(.footnote)
                            .foregroundStyle(.red)
                            .multilineTextAlignment(.center)
                    }

                    // Login button
                    Button {
                        focusedField = nil
                        Task {
                            await viewModel.login()
                        }
                    } label: {
                        ZStack {
                            if viewModel.isLoading {
                                ProgressView()
                                    .tint(.white)
                            } else {
                                Text("Login")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(isEnabled ? Color.blue : Color.blue.opacity(0.4))
                    )
                    .disabled(!isEnabled)

                    // OR divider
                    HStack(spacing: 12) {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.gray.opacity(0.3))
                        Text("OR")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(.gray.opacity(0.3))
                    }

                    // Continue with Apple
                    Button {
                        // TODO: Sign in with Apple
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "envelope")
                            Text("Continue with Apple")
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .strokeBorder(Color.gray.opacity(0.3))
                        )
                    }
                    .foregroundStyle(.primary)

                    // Footer
                    VStack(spacing: 12) {
                        HStack(spacing: 4) {
                            Text("Don't have an account?")
                            Button("Sign Up") {
                                // TODO: Navigate to signup
                            }
                            .fontWeight(.semibold)
                        }
                        .font(.footnote)

                        HStack(spacing: 6) {
                            Image(systemName: "lock.fill")
                            Text("SECURED BY SUPABASE")
                        }
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                    }
                    .padding(.top, 10)

                }
                .padding(.horizontal, 24)
            }
            .navigationTitle("Sign In")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AuthView()
}
