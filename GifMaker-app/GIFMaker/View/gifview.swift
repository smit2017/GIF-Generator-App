//
//  gifview.swift
//  GIFMaker
//
//  Created by csuftitan on 6/23/22.
//

import SwiftUI

var images : [UIImage]! = [UIImage(named: "wallpaper")!, UIImage(named: "wallpaper2")!]

let animatedImage = UIImage.animatedImage(with: images, duration: 1.0)

struct workoutAnimation: UIViewRepresentable {
    let imageSize: CGSize
    
    func makeUIView(context: Self.Context) -> UIView {
        let someView = UIView(frame: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        let someImage = UIImageView(frame: CGRect(x: 15, y: 100, width: imageSize.width, height: imageSize.height))
        someImage.clipsToBounds = true
        someImage.autoresizesSubviews = true
        someImage.contentMode = UIView.ContentMode.scaleAspectFill
        someImage.image = animatedImage
        someView.addSubview(someImage)
        return someView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<workoutAnimation>) {

    }
}

struct gifview: View {
    
    @State var second: Float = 0
    
    var body: some View {
        VStack (alignment: HorizontalAlignment.center, spacing: 0) {
            workoutAnimation(imageSize: CGSize(width: 400, height: 225))
            
            Text("Seconds :")
                .font(.title2)
            Text(
                String(format: "%.1f", second)
            )
            .font(.title3.bold())
            Slider(value: $second, in: 0.5...3.0, step: 0.5)
                .padding(.vertical, 50)
                .frame(width: 350, height: 100)
                .accentColor(Color("CherryRed"))
            
            
            
            Button(action: {
                
            }, label: {
                Image(systemName: "tray.and.arrow.down.fill")
                    .foregroundColor(Color("CherryRed"))
                Text("Downlaod".uppercased())
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("CherryRed"))
                    
            })
            .background(
                Color(.white)
            )
            .padding()
            .padding(.horizontal, 95)
            .padding(.vertical, 5)
            .border(Color("CherryRed"), width: 2)
                }
        
            
    }
}

struct gifview_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            gifview()
                
        }
    }
}
