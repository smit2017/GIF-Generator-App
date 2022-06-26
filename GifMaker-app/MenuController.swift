//
//  MenuController.swift
//  GIFMaker
//
//  Created by csuftitan on 6/21/22.
//

import Foundation
import SwiftUI

class MenuController: ObservableObject {
    let openPercent = 0.5
    
    @Published var offset: CGFloat = 0
    @Published var isOpen: Bool = false
    @Published var SelectedPage: Int = 0
    
    func open() {
        withAnimation(.spring()) {
            offset = UIScreen.main.bounds.width * openPercent
        }
        isOpen = true
    }
    
    func close() {
        withAnimation(.spring()) {
            offset = 0
        }
        isOpen = false
    }
    
    var button: some View {
        Button(action: {
            if self.isOpen{
                self.close()
            }else{
                self.open()
            }
        }, label: {
            Image(systemName: isOpen ? "xmark" : "text.justify")
        })
    }
    
}
