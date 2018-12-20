//
//  SoundManager.swift
//  Pocket Quiz
//
//  Created by Stephen McMillan on 20/12/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation
import AudioToolbox

class SoundManager {
    
    var gameSound: SystemSoundID
    var correctAnswerSound: SystemSoundID
    var incorrectAnswerSound: SystemSoundID
    
    /// Creates a new sound manager with common game sounds.
    init() {
        self.gameSound = 0
        self.correctAnswerSound = 1
        self.incorrectAnswerSound = 2
        
        let gameSoundUrl = URL(fileURLWithPath: Sounds.gameSoundPath!)
        let correctAnswerUrl = URL(fileURLWithPath: Sounds.correctAnswerSoundPath!)
        let incorrectAnswerUrl = URL(fileURLWithPath: Sounds.incorrectAnswerSoundPath!)
        
        AudioServicesCreateSystemSoundID(gameSoundUrl as CFURL, &gameSound)
        AudioServicesCreateSystemSoundID(correctAnswerUrl as CFURL, &correctAnswerSound)
        AudioServicesCreateSystemSoundID(incorrectAnswerUrl as CFURL, &incorrectAnswerSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    func playCorrectAnswerSound() {
        AudioServicesPlaySystemSound(correctAnswerSound)
    }
    func playIncorrectAnswerSound() {
        AudioServicesPlaySystemSound(incorrectAnswerSound)
    }
}
