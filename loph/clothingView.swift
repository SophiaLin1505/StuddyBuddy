//
//  clothingView.swift
//  loph
//
//  Created by 90309356 on 4/11/23.
//

import SwiftUI

let green = Color(red: 0.808, green: 0.847, blue: 0.78)

let data = (1...100).map { "Item \($0)" }

let clothing = ["shoes", "collar", "high heels", "a", "b", "c" ]
//@State private var clothing = ["shoes", "collar", "high heels", "a", "b", "c" ]




struct clothingView: View {

    var body: some View {
        ZStack{
            green
                .ignoresSafeArea()
            //put a background image here
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 3){
                    ForEach(data, id: \.self) { item in
                        Text(item)
                    }
                }
            }.coordinateSpace(name: "scroll")
                /*
                .safeAreaInsert(edge: .top, content: {
                    Color.clear
                        .frame(height: 3)//idk what the hieght should be
                })
                 */
        }
    }
    /*
    var items: some View {
        ForEach(categories, id: \.self){ item in
            
            if let url = item.image, let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
                    .onTapGesture {
                        
                    }
                    .background(Image(systemName: "photo")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
                        .background(Color.gray))
                    .foregroundColor(.white)
            }
        }
    }
*/
}

struct clothingView_Previews: PreviewProvider {
    static var previews: some View {
        clothingView()
    }
}
