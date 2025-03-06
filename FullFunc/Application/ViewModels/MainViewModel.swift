//
//  MainViewModel.swift
//  FullFunc
//
//  Created by Pengkhieng Kim on 6/3/25.
//

import Foundation

class MainViewModel : ObservableObject {
    
    @Published var listScreen: [String] = ["Home", "Login", "SignUp"];
}
