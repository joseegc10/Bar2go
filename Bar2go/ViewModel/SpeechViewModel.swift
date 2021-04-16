//
//  SpeechViewModel.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 5/4/21.
//

import AVFoundation


class SpeechViewModel: ObservableObject {
    var synthesizer = AVSpeechSynthesizer()
    var utterance: AVSpeechUtterance? = nil
    
    func speak(speech: String){
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, mode: .default, options: .defaultToSpeaker)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }

        let utterance = AVSpeechUtterance(string: speech)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-ES")

        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)

        do {
            disableAVSession()
        }
    }
    
    private func disableAVSession() {
        do {
            try AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't disable.")
        }
    }
}



