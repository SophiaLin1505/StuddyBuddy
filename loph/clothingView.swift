//
//  clothingView.swift
//  loph
//
//  Created by 90309356 on 4/11/23.
//

import SwiftUI

let green = Color(red: 0.808, green: 0.847, blue: 0.78)


struct clothingView: View {

    
    @ObservedObject var birds = clothingItem()
    @State private var showingAlert = false
    @EnvironmentObject var min : testing
    @Environment(\.dismiss) private var dismiss
    
    
        var body: some View {
        NavigationView {
            ZStack{
                green
                    .ignoresSafeArea()
                //put a background image here
                ScrollView {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    //Text("Pick Your Study Buddy!")
                        //.font(.system(.title2, design: .monospaced))
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 3){
                        ForEach(birds.types, id: \.self) { item in
                            VStack {
                                
                                Button(action: {
                                    min.imageString = item.image
                                    showingAlert = true
                                    dismiss()
                                }) {
                                 Image(item.image)
                                 } //.alert
                                 
                                
                                 
                        
                            }//vstack
                        }//ForEach
                        
                    }.coordinateSpace(name: "scroll")
                    
                }.environmentObject(testing()) // ScrollView
                .overlay(
                ZStack{
                    Color.clear
                        .background(.ultraThinMaterial)
                        .blur(radius: 10)
                        
                    
                    Text ("Pick Your Study Buddy!")
                        .font(.largeTitle.weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading , 20)
                }.frame (height: 60)
                    .frame(maxHeight: .infinity, alignment: .top)
                )
                
            }//ZStack
        }//.navigationTitle("Pick Your Study Buddy!")
                //.foregroundColor(green)
            //NavigationView
    }//var:body
    
}//struct:clothingView



struct clothingView_Previews: PreviewProvider {
    static var previews: some View {
        clothingView()
            .environmentObject(testing())
            
        
    }
}
