//
//  MainView.swift
//  FullFunc
//
//  Created by Pengkhieng Kim on 5/3/25.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    private let fixedColumn = [
        GridItem(),
        GridItem(),
        GridItem()
    ]
    private let screenView: [ListScreen] = [
        ListScreen(view: AnyView(ContentView()), title: "Content"),
        ListScreen(view: AnyView(HomeView()), title: "Home"),
        ListScreen(view: AnyView(LoginView()), title: "Login")
    ]
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: fixedColumn, spacing: 20) {
                    ForEach(screenView.indices, id: \.self) { index in
                        NavigationLink(destination: screenView[index].view) {
                            Text(screenView[index].title)
                                .frame(maxWidth: .infinity, minHeight: 50)
                                .background(AppColors.descPrimary)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Full Func")
        }
    }
}

//#Preview {
//    MainView()
//}
