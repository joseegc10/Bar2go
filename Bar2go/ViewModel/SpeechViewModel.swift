//
//  SpeechViewModel.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 5/4/21.
//

import AVFoundation

/// Clase para dictar el texto
class SpeechViewModel: ObservableObject {
    var synthesizer = AVSpeechSynthesizer()  /// Objeto para hablar
    var utterance: AVSpeechUtterance? = nil  /// Objeto que contiene las propiedades del texto a hablar
    
    
    /// Método para hablar
    /// - Parameter speech: texto a decir
    func speak(speech: String){
        // Establecemos las propiedades del Speech
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, mode: .default, options: .defaultToSpeaker)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Error al establecer las propiedades del Speech")
        }

        // Establecemos el texto a decir
        utterance = AVSpeechUtterance(string: speech)
        // Establecemos el idioma
        utterance!.voice = AVSpeechSynthesisVoice(language: "es-ES")

        // Hablamos
        synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance!)

        do {
            desactivaPropiedades()
        }
    }
    
    
    /// Método para desactivar las propiedades del Speech
    private func desactivaPropiedades() {
        do {
            try AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
        } catch {
            print("Error al desactivar las propiedades del speech")
        }
    }
}



