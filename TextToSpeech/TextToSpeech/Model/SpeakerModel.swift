//
//  SpeakerModel.swift
//  TextToSpeech
//
//  Created by Vlad Munteanu on 3/6/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import AVFoundation

func speak() {
    let string = "Hello, World!"
    let utterance = AVSpeechUtterance(string: string)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
    
    let synth = AVSpeechSynthesizer()
    synth.speak(utterance)
}
