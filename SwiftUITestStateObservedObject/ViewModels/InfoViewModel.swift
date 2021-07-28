//
//  ContenViewModel.swift
//  SwiftUITestStateObservedObject
//
//  Created by Chee Ket Yung on 28/07/2021.
//

import Foundation
//

class InfoViewModel : ObservableObject {
    
    @Published var counter : Int = 0
    
    
    deinit {
        
        print("de.init.\(counter)")
    }

}

extension InfoViewModel {

    func increment() {
        
        counter += 1
    }

}
