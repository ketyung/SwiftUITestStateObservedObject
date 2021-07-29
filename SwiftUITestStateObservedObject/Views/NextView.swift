//
//  NextView.swift
//  SwiftUITestStateObservedObject
//
//  Created by Chee Ket Yung on 29/07/2021.
//

import SwiftUI


struct NextView : View {
    
    let infoViewModel : InfoViewModel
    
    var body : some View {
        
        VStack {
  
            Text("Count:: \(infoViewModel.counter)")
      
            let max = 500 * (infoViewModel.counter + 1)
            List((0..<max)) {
                idx in
                
                Text("Item :\(idx)")
            }
            .id(UUID())
        }
    }
}
