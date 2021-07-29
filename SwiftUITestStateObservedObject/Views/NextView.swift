//
//  NextView.swift
//  SwiftUITestStateObservedObject
//
//  Created by Chee Ket Yung on 29/07/2021.
//

import SwiftUI
import Kingfisher


struct NextView : View {
    
    @Environment(\.presentationMode) private var presentation

    
    @State var infoViewModel : InfoViewModel
    
    private let imageURLs = ["https://images.unsplash.com/photo-1548661710-7f540c9c56d6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80", "https://images.unsplash.com/photo-1490077476659-095159692ab5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1333&q=80","https://images.unsplash.com/photo-1447523264591-68112eb55c23?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1500111709600-7761aa8216c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1607605031104-dd3157233f47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1614044252073-ba5158b4609a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1448&q=80",
    "https://images.unsplash.com/photo-1418513110185-f0ec221e47b4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1353&q=80",
    "https://images.unsplash.com/photo-1621328895567-f909e923c9d1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1607098114111-f16e2ef19834?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1601031921170-b1a278375def?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80",
    "https://images.unsplash.com/photo-1612104425351-37d069305346?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1531825225561-5f89b02c992a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"]

    var body : some View {
        
            
        VStack {
            
            HStack {
            
                Button(action: {
                    
                    presentation.wrappedValue.dismiss()
                }){
                    
                    Image(systemName: "arrow.backward").resizable()
                    .frame(width: 30, height:24).aspectRatio(contentMode: .fit)
                    .padding(.leading, 10)
                     
                }
                
                Spacer()
      
            }
            
            Text("Count:: \(infoViewModel.counter)")
            
            kfImageViews()
            
            Form{
                
                TextField("First Name", text: $infoViewModel.firstName)
                
                TextField("Last Name", text: $infoViewModel.lastName)
                
            }.frame(height:160)
            
      
            itemListView()
          
            
            Spacer()
        }
        .navigationBarHidden(true)
       
    }
}


extension NextView {
    
    // Using the kingfisher package to load a remote image
    // for testing only
    
    @ViewBuilder
    private func kfImageViews() -> some View {
        
        let shuffledImages = imageURLs.shuffled()
        
        ScrollView(.vertical, showsIndicators:false) {
     
            VStack {
           
                ForEach(0..<shuffledImages.count){ idx in
                    
                    
                    HStack {
                 
                        Text("\(idx+1). ")
                        
                        let imageUrl = shuffledImages[ idx ]
                        KFImage( URL(string: imageUrl))
                        .resizable()
                        .loadDiskFileSynchronously()
                        .placeholder(placeHolderView)
                        .cacheOriginalImage()
                        .cacheMemoryOnly(false)
                        .fade(duration: 0.25)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                   
                        
                    }
                 
                }
            }
           
        }
        .frame(width:UIScreen.main.bounds.width - 20, height : 200)
        
     
    }
    
    
    private func placeHolderView() -> some View {
        
        Text("Loading...")
    }
    
    
    
    @ViewBuilder
    private func itemListView() -> some View {
        
        let max = 500 * (infoViewModel.counter + 1)
      
        VStack {
          
            Text("Number of Items :\(max)")

            List((0..<max)) { idx in
                
                HStack {
          
                    Text("Item :\(idx+1)")
              
                    Spacer()
                    
                    Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 10)
                     
                }
            }
            .id(UUID())
        }
    }

}
