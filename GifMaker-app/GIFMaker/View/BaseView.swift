//
//  BaseView.swift
//  GIFMaker
//
//  Created by csuftitan on 6/21/22.
//

import SwiftUI
import CoreMedia

struct BaseView: View {
    
    @State var showMenu: Bool = false
    
    //Drag Gesture Offset
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        
        // Navigation View
        NavigationView {
            HStack(spacing : 0){
                
                //Slide Menu
                SideMenu(showMenu: $showMenu)
                
            }
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset > 0 ? offset : 0)
            //Drag Gesture
            .gesture(
                
                DragGesture()
                    .updating($gestureOffset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded(onEnd(value:))
                
            )
            
            //No Navbar Title
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu) { newVaule in
            
            //Preview issues
            if showMenu && offset == 0 {
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            
            if !showMenu && offset == sideBarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onChange()
            
        }
    }
    
    func onChange() {
        let sideBarWidth = getRect().width - 90
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sideBarWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }

    func onEnd(value : DragGesture.Value){
        let sideBarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation{
            //Checking
            if translation > 0 {
                if translation > (sideBarWidth / 2) {
                    //showing Menu
                    offset = sideBarWidth
                    showMenu = true
                }
                else {
                    
                    //Extra Case
                    if offset == sideBarWidth {
                        return
                    }
                    
                    
                    offset = 0
                    showMenu = false
                }
            } else {
                if -translation > (sideBarWidth / 2){
                    offset = 0
                    showMenu = false
                }else {
                    
                    if offset == 0 || !showMenu {
                        return
                    }
                    
                    offset = sideBarWidth
                    showMenu = true
                }
                
            }
            
        }
        
        //Storing Last Offset
        lastStoredOffset = offset
        
    }
    
}



struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

