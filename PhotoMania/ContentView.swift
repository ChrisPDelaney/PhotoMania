//
//  ContentView.swift
//  PhotoMania
//
//  Created by Christopher Delaney on 11/3/21.
//

import SwiftUI

class ViewModel: ObservableObject{
    @Published var image: Image?

    func fetchNewImage(){
        print("hello")
        guard let url = URL(string:"http://random.imagecdn.app/500/500")else{
            return
        }
        //testing hjhj
        //retrieves the data
        let task = URLSession.shared.dataTask(with: url){ data, _, _ in
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                guard let uiImage = UIImage(data: data) else{
                    print("not loading")
                    return
                }
                self.image = Image(uiImage: uiImage)
            }
        }
        
        task.resume()
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                
                Spacer()
                
                if let image = viewModel.image {
                    image
                        .resizable()
                        .foregroundColor(Color.pink)
                        .frame(width: 200, height: 200)
                        .padding()
                }else{
                    Image(systemName: "photo")
                        .resizable()
                        .foregroundColor(Color.pink)
                        .frame(width: 200, height: 200)
                        .padding()
                }
                
                //Image we are going to randomly generate
            
                
                //Space between our image and button
                Spacer()
                
                Button(action: {
                    viewModel.fetchNewImage()
                },label:{
                    Text("New Image")
                        .bold()
                        .frame(width: 250, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding()
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


