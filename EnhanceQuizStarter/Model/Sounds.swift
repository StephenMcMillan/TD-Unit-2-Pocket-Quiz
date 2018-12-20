//
//  Sounds.swift
//  Pocket Quiz
//
//  Created by Stephen McMillan on 20/12/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

struct Sounds {
   static let gameSoundPath = Bundle.main.path(forResource: "GameSound", ofType: "wav")

    static let correctAnswerSoundPath = Bundle.main.path(forResource: "correctAnswer", ofType: "wav")

    static let incorrectAnswerSoundPath = Bundle.main.path(forResource: "incorrectAnswer", ofType: "wav")
}
