//
//  SpeakerModel.swift
//  TextToSpeech
//
//  Created by Vlad Munteanu on 3/6/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import AVFoundation

public class SpeakerModel {
    
    static var speakerVoice = "en-GB"
    
    class func speak(stringToSpeak: String) {
        
        let utterance = AVSpeechUtterance(string: stringToSpeak)
        utterance.voice = AVSpeechSynthesisVoice(language: speakerVoice)
        
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
    
    class func setVoice(name: String) {
        
        if name.contains("Karen") {
            speakerVoice = "en-AU"
        } else if name.contains("Dan") {
            speakerVoice = "en-GB"
        } else if name.contains("Moi") {
            speakerVoice = "en-IE"
        } else if name.contains("Siri") {
            speakerVoice = "en-US"
        } else if name.contains("Tessa") {
            speakerVoice = "en-ZA"
        }
        //en-AU: Karen (Australia)
        //en-GB: Daniel (UK)
        //en-IE: Moira (Ireland)
        //en-US: Siri (US)
        //en-ZA: Tessa (South Africa)

    }
    
}
