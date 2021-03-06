//
//  Info2View.swift
//  SwiftUITestStateObservedObject
//
//  Created by Chee Ket Yung on 28/07/2021.
//

import SwiftUI


struct Info2View : View {
    
    // @StateObject private var infoViewModel = InfoViewModel()

    @StateObject private var infoViewModel = InfoViewModel()
   
    @Binding var viewType : ContentView.ViewType
    
    var body : some View {
        
        
        NavigationView {
        
            VStack(spacing:20) {
            
                Text("Info 2 @StateObject Counter is : \(infoViewModel.counter)")
                
                
                Button(action: {
                    
                    withAnimation{
                        
                        infoViewModel.increment()
                    }
                }){
                    
                    Text("Increment")
                }
                
                
                NavigationLink( destination: NextView(infoViewModel: infoViewModel)){
                    
                    Text("Go to Next View")
                    
                }
          
                Button(action: {
                    
                    withAnimation{
                        
                        viewType = .none
                    }
                }){
                    
                    Text("Close Me")
                }
          
            }
            .navigationBarHidden(true)
        }
        
        
    }
}
