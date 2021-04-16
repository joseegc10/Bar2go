//
//  ImagenStorageView.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 11/4/21.
//

import SwiftUI

struct ImagenStorageView: View {
    let imagenAlternativa = UIImage(named: "bar")
    @StateObject var imageLoader: ImagenViewModel = ImagenViewModel(imageURL: "")
    let imageURL: String
    let anchura: CGFloat
    let altura: CGFloat
    
    var body: some View {
        if imageURL != "" {
            Image(uiImage: imageLoader.data.flatMap(UIImage.init) ?? imagenAlternativa!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: anchura, height: altura)
                .onAppear{
                    imageLoader.imageURL = imageURL
                    imageLoader.load()
                }
        }
    }
}
