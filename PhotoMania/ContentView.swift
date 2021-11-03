//
//  ContentView.swift
//  PhotoMania
//
//  Created by Christopher Delaney on 11/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "photo")
                    .resizable()
                    .foregroundColor(Color.pink)
                    .frame(width: 300, height: 300)
                
                Button(action: {
                    
                },label:{
                    Text("New Image")
                })
                
                
            }
            .navigationTitle("Photo Mania")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


