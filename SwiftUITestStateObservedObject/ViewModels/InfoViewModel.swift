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
    
    @Published var firstName : String = ""
    
    @Published var lastName : String = ""
    
    
    
    deinit {
        
        print("de.init.\(counter)")
    }

}

extension InfoViewModel {

    func increment() {
        
        counter += 1
    }

}
