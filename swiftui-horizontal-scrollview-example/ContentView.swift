//
//  ContentView.swift
//  swiftui-horizontal-scrollview-example
//
//  Created by Arif Hossen on 25/5/20.
//  Copyright © 2020 Arif Hossen. All rights reserved.
//

import SwiftUI

struct RowView: View{
    
    var gallery_name:String = ""
    var number:Int = 0
    init(gallery:String,index: Int)
    {
        self.gallery_name = gallery
        self.number = index
    }
    
    var body: some View{
        
        ZStack(alignment: .bottomLeading){
            
            Image("\(self.gallery_name)_image\(self.number)")
                .resizable()  // resizable image
                .frame(width: 200, height: 180) // image frame
                // create outer view with border (color, width)
                .border(Color.gray.opacity(0.5), width: 0.5)
                // apply cornerRadius to hide visible cut out
                .cornerRadius(8)
            
               Text("Picture Title")
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80, maxHeight: .infinity, alignment: .bottom)
                .padding()
            
        }
        
    }
    
}

struct ContentView: View {
    var body: some View {
        
        VStack{
            
            VStack(alignment:.center){
                Image("swiftui-logo")
                
                Text("Horizontal ScrollView Example")
                    .foregroundColor(.green)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
            }
            Spacer().frame(height:25)
            
            VStack(alignment:.leading){
                
                List{
                    
                    Text("Darjeeling")
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .multilineTextAlignment(.leading)
 
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(1..<6) { i in
                                RowView(gallery: "gallery1",index: i)
                            }
                        }
                    }
                    .frame(height: 180)
                    
                    
                    Text("Saint Martin Island")
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .multilineTextAlignment(.leading)
                    
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(1..<6) { i in
                                RowView(gallery: "gallery2",index: i)
                            }
                        }
                    }
                    .frame(height: 180)
                    
                                        
                    Text("Bandarban")
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .multilineTextAlignment(.leading)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(1..<6) { i in
                                RowView(gallery: "gallery3",index: i)
                            }
                        }
                    }
                    .frame(height: 180)
                    
                    
                }
                .onAppear {
                    UITableView.appearance().separatorStyle = .none
                    UITableView.appearance().showsVerticalScrollIndicator = false
                    
                }
                Spacer()
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
