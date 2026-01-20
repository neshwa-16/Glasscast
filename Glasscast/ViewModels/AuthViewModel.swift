//
//  AuthViewModel.swift
//  Glasscast
//
//  Created by Neshwa on 19/01/26.
//
import Combine

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    // Injected dependency (in production, this would be passed via init)
    private let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = AuthService.shared) {
        self.authService = authService
    }
    
    var isFormValid: Bool {
        !email.trimmingCharacters(in: .whitespaces).isEmpty &&
        email.contains("@") &&
        password.count >= 6
    }
    
    func login() async {
        guard isFormValid else {
            errorMessage = "Please enter valid credentials"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            try await authService.signIn(email: email, password: password)
            // Success - navigation would be handled by parent view observing auth state
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
