//
//  ContentView.swift
//  studyCat
//
//  Created by 90309356 on 2/3/23.
import SwiftUI
@MainActor class testing : ObservableObject{
    @Published var showingAlert = false
    @Published var isActive = false
    @Published var time: String = "30:00"
    //
    @Published var minutes: Float = 30.0{
        didSet{
            time = "\(Int(minutes)):00"
        }
    }
    
    @Published var imageString: String = "white bird"
    
}

//

let skyBlue = Color(red: 0.808, green: 0.847, blue: 0.78)



struct ContentView: View {

    @StateObject var min = testing()
    @State var shouldHide = true
    @State var isToDoListShowing = false
    
    var body: some View {
        
        
        NavigationView{
            ZStack {
                skyBlue
                    .ignoresSafeArea()
                VStack{
                    HStack {
                        //Spacer()
                        Button(action: {
                            isToDoListShowing = true
                        }) {
                            Image(systemName: "list.bullet.clipboard").resizable().frame(width: 50.0, height: 50.0)
                                .padding()
                        }.popover(isPresented: $isToDoListShowing) {
                            ToDoList()

                            
                        }
                        Spacer()
                     
                        NavigationLink {
                            clothingView()
                        } label: {
                            VStack {
                                Image(systemName: "bird").resizable().frame(width : 50.0, height: 50.0)
                                    .padding()
                                //Text("New Buddy")
                            }
                            
                           
                        }//label
                       // Spacer()
                    }//HStack
                    
                    Spacer()
                    Text("\(min.time)")
                        .font(.system(size: 70, weight: .medium, design: .rounded))
                        .padding()
                       
                    
                    Slider(value: $min.minutes, in: 1...60, step:1)
                        .disabled(min.isActive)
                        .frame(width: 250)
                        .animation(.easeInOut, value: min.minutes)
                    
                    
                    NavigationLink{
                        studyView()
                    } label: {
                        Text("Start Study Session")
                            .font(.system(.title2, design: .monospaced))
                            .padding()
                            .frame(width: 280)
                            .background(.thinMaterial)
                            .cornerRadius(20)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 4))
                    }//label
                    Spacer()
                    HStack {

                        Spacer()
                        Text("Let's start studying!")
                            .opacity(shouldHide ? 0 : 1)
                        Button(action: {
                            shouldHide = false
                        }) {
                            Image(min.imageString)
                                .padding()
                         //Text(item.category)
                         
                         }
                    }
                    
                    
                }
                
            }

        } .environmentObject(min)

            
    }//body
}//struct view
    

        
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                
        }
    }
                       

