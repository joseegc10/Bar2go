//
//  ImagePicker.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 11/4/21.
//

import Foundation
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var show : Bool
    @Binding var image : Data
    var source : UIImagePickerController.SourceType
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator(conexion: self)
    }
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.allowsEditing = true
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var conexion : ImagePicker
        
        init(conexion: ImagePicker){
            self.conexion = conexion
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print("Se ha cancelado la seleccion de imagen")
            self.conexion.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            var image : UIImage!

            if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            {
                image = img

            }
            else if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
                image = img
            }

            let data = image.jpegData(compressionQuality: 0.100)
            self.conexion.image = data!
            self.conexion.show.toggle()
            
            picker.dismiss(animated: true,completion: nil)
        }
        
    }
    
}

