//
//  ImagenViewModel.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 11/4/21.
//

import Foundation
import Firebase

class ImagenViewModel: ObservableObject {
    @Published var data : Data? = nil
    @Published var imageURL : String
    
    init(imageURL: String) {
        self.imageURL = imageURL
    }
    
    func load(){
        let storageImage = Storage.storage().reference(forURL: imageURL)
        storageImage.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error?.localizedDescription {
                print("error al obtener la imagen", error)
            }else{
                print("imagen obtenida correctamente")
                self.data = data
            }
        }
    }
    
}
