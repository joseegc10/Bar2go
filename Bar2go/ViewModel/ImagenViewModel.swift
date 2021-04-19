//
//  ImagenViewModel.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 11/4/21.
//

import Foundation
import Firebase


/// Clase para obtener la imagen desde Storage de Firebase
class ImagenViewModel: ObservableObject {
    @Published var data : Data? = nil   /// Imagen
    @Published var imageURL : String    /// URL de la imagen
    
    /// Almacenamos la dirección de la imagen
    init(imageURL: String) {
        self.imageURL = imageURL
    }
    
    /// Obtenemos la imagen
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
