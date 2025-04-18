//
//  AppIconView.swift
//  FullFunc
//
//  Created by PENGKHIENG-KIM on 18/4/25.
//

import SwiftUI

struct AppIconView: View {
    
    @AppStorage("selectedAppIcon") private var selectedAppIcon: String = "AppIcon"
    @State private var showToast = false
    @State private var message = "Something went wrong!"
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                ForEach(AppIcon.allCases) { icon in
                    Button(action: {
                        selectedAppIcon == icon.displayName
                        ? showAlreadySelectedToast()
                        : changeIcon(to: icon.iconName)
                    }) {
                        HStack {
                            Image(icon.displayName)
                                .resizable()
                                .frame(width: 48, height: 48)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.white, lineWidth: 4)
                                )
                                .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
                            
                            Text(icon.displayName)
                            Spacer()
                            if selectedAppIcon == icon.displayName {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                Spacer()
            }
            
            if showToast {
                ToastView(message: message)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(1)
            }
        }
        .animation(.easeInOut(duration: 0.8), value: showToast)
    }
    
    private func showAlreadySelectedToast() {
        guard !showToast else { return }
        
        withAnimation {
            message = "This icon has already been selected."
            showToast = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation { showToast = false }
        }
        
        UINotificationFeedbackGenerator().notificationOccurred(.warning)
    }
    
    private func changeIcon(to name: String?) {
        guard UIApplication.shared.supportsAlternateIcons else {
            message = "Alternate icons not supported."
            showToastWithAutoDismiss()
            print("Alternate icons not supported.")
            return
        }
        
        UIApplication.shared.setAlternateIconName(name) { error in
            if let error = error {
                message = "Error changing icon: \(error.localizedDescription)"
                showToastWithAutoDismiss()
                print("Error changing icon: \(error.localizedDescription)")
            } else {
                selectedAppIcon = name ?? "AppIcon"
                print("App icon changed to \(selectedAppIcon).")
            }
        }
    }
    
    private func showToastWithAutoDismiss() {
        guard !showToast else { return }
        
        withAnimation { showToast = true }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation { showToast = false }
        }
    }
}

#Preview {
    AppIconView()
}
