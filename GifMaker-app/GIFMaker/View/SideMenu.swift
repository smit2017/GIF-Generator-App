//
//  SideMenu.swift
//  GIFMaker
//
//  Created by csuftitan on 6/21/22.
//

import SwiftUI
import Firebase

struct SideMenu: View {
    
    @Binding var showMenu: Bool
    
    //Login Status
    @AppStorage("log_status") var logStatus: Bool = false
    
    //Note: FaceID Properties
    @AppStorage("use_face_id") var useFaceID: Bool = false
    @AppStorage("use_face_email") var faceIDEmail: String = ""
    @AppStorage("use_face_password") var faceIDPassword: String = ""

    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            VStack(alignment: .leading, spacing: 14){
                
                Text("Menu")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
                
                Divider()
                
            }
            .padding(.horizontal)
            .padding(.leading)
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(alignment: .leading, spacing: 0){
                    
                    //Tab Button
                    Button(action: {
                        
                    }){
                        Image(systemName: "house")
                            .padding()
                        Text("Home")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                    .padding()
                    
                    
                    Button(action: {
                        try? Auth.auth().signOut()
                        logStatus = false
                    }){
                        Image(systemName: "power")
                            .padding()
                        Text("Logout")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                    .padding()
                    
                }
            }
            
        }
        //Max Width
        .frame(width : getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    @ViewBuilder
    func TabButton(title: String, image: String) -> some View{
        
        Button{
            
        } label: {
            HStack(spacing: 14){
                
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
                Text("Home")
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
    
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Extending View to Get Screen Rect

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
