//
//  Menu.swift
//  GIFMaker
//
//  Created by csuftitan on 6/21/22.
//

import SwiftUI

struct Menu: View {
    
    @State var showMenu: Bool = false
    
    var body: some View {
        // Navigation View
        NavigationView {
            HStack(spacing : 0){
                
                //Slide Menu
                
            }
            //No Navbar Title
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
