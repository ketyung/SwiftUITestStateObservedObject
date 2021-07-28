//
//  ContentView.swift
//  SwiftUITestStateObservedObject
//
//  Created by Chee Ket Yung on 28/07/2021.
//

import SwiftUI

struct ContentView: View {

    enum ViewType : Int {
        
        case none
        
        case info
        
        case info2
    }
    
    @State private var viewType : ViewType = .none
    
    var body: some View {
        
        switch(viewType){
            
            case .none :
                view()
                
            case .info :
                InfoView(viewType: $viewType)
         
            case .info2 :
                Info2View(viewType: $viewType)
     
        }
    }
}

extension ContentView {
    
    private func view() -> some View {
        
        
        VStack(spacing: 30)  {
       
            Button(action : {
                
                viewType = .info
            }){
                
                Text("Info View")
            }
            
            Button(action : {
                
                viewType = .info2
            }){
                
                Text("Info 2 View")
            }
        }
       
    }
}
