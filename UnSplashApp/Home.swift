//
//  Home.swift
//  UnSplashApp
//
//  Created by Alexander Römer on 01.02.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import SwiftUI

struct Home : View {
    
    @State private var tabs           = ["Nature","Animals","Fish","Flowers"]
    @State private var txt            = ""
    @State private var selectedTab    = "Nature"
    @State private var selectedData   = [["s11","s12"],["s21","s22"],["s31","s32"]]
    
    @State private var nature   = [["s11","s12"],["s21","s22"],["s31","s32"]]
    @State private var flowers  = [["f11","f12"],["f21","f22"],["f31","f32"]]
    @State private var fish     = [["m11","m12"],["m21","m22"],["m31","m32"]]
    @State private var animals  = [["a11","a12"],["a21","a22"],["a31","a32"]]
    
    var body: some View {
        
        VStack {
            
            HStack {
                Button(action: {
                }) {
                    Image("menu").renderingMode(.original)
                }
                Spacer()
            }
            .padding()
            .background(Color.white)
            .overlay(Image("logo").renderingMode(.original))
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 15) {
                    HStack{
                        Image("search")
                            .renderingMode(.original)
                        TextField("Search", text: self.$txt)
                    }
                    .padding(12)
                    .background(Color("Color"))
                    .clipShape(Capsule())
                    
                    ZStack(alignment: .bottomTrailing) {
                        
                        Image("main").resizable()
                            .frame(height: 350)
                        
                        HStack(spacing: 15) {
                            
                            Button(action: {
                            }) {
                                Image("add")
                                    .renderingMode(.original)
                            }
                            
                            Button(action: {
                            }) {
                                Image("heart")
                                    .renderingMode(.original)
                            }
                            
                            Button(action: {
                            }) {
                                Image("download")
                                    .renderingMode(.original)
                            }
                            
                        }
                        .padding()
                    }
                    
                    Text("Trending")
                        .font(.title)
                        .padding(.top)
                    
                    HStack(spacing: 15){
                        
                        ForEach(tabs ,id: \.self) { i in
                            
                            Button(action: {
                                
                                self.selectedTab = i
                                
                                if i == "Nature" {
                                    self.selectedData = self.nature
                                } else if i == "Fish" {
                                    self.selectedData = self.fish
                                } else if i == "Animals" {
                                    self.selectedData = self.animals
                                } else {
                                    self.selectedData = self.flowers
                                }
                                
                            }) {
                                VStack{
                                    Text(i)
                                        .foregroundColor(.black)
                                    Capsule()
                                        .fill(self.selectedTab == i ? Color.black : Color.clear)
                                        .frame(height: 6)
                                }
                            }
                        }
                        
                    }
                    .padding(.top)
                    
                    VStack(spacing: 18) {
                        ForEach(selectedData, id: \.self) { i in
                            HStack{
                                ForEach(i, id: \.self) { j in
                                    
                                    Image(j)
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 2 - 20, height: 180)
                                        .cornerRadius(15)
                                        .contextMenu{
                                            
                                            Button(action: {
                                                UIImageWriteToSavedPhotosAlbum(UIImage(named: j)!, nil, nil, nil)
                                            }) {
                                                HStack{
                                                    Text("Save")
                                                    Image(systemName: "arrow.down")
                                                        .resizable().frame(width: 15, height: 15)
                                                }
                                            }
                                    }
                                }
                            }
                        }
                        
                    }
                    .padding(.top)
                    
                }
                .padding()
            }
            
        }
        .background(Color("bg")
        .edgesIgnoringSafeArea(.bottom))
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
