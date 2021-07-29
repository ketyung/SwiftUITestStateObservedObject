//
//  InfoView.swift
//  SwiftUITestStateObservedObject
//
//  Created by Chee Ket Yung on 28/07/2021.
//

import SwiftUI

struct InfoView : View {
    
    // @StateObject private var infoViewModel = InfoViewModel()

    @ObservedObject private var infoViewModel = InfoViewModel()
   
    @Binding var viewType : ContentView.ViewType
    
    var body : some View {
        
        NavigationView {
       
            VStack(spacing:30) {
            
                Text("Info View @ObservedObject Counter is : \(infoViewModel.counter)")
                .onAppear{
                    
                    infoViewModel.increment()
                }
                
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
