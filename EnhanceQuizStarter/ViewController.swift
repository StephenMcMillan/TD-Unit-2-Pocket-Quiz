//
//  ViewController.swift
//  EnhanceQuizStarter
//
//  Created by Pasan Premaratne on 3/12/18.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var questionsPerRound: Int = 0
    
    var gameSound: SystemSoundID = 0
    
    // Quiz Manager Instance
    var quizManager: QuizManager!
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    @IBOutlet weak var quizActionButton: UIButton!
    @IBOutlet weak var celebrationLabel: UILabel!
    
    var answerButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerButtons = [answer1Button, answer2Button, answer3Button, answer4Button]
    
        loadGameStartSound()
        playGameStartSound()
        
        setupGame()
    }
    
    // MARK: - Helpers
    
    func setupGame() {
        quizManager = QuizManager(numberOfQuestions: 200)
        questionsPerRound = quizManager.quizSet.count
        
        hideButtons(false)
        celebrationLabel.isHidden = true
        
        displayQuestion()
    }
    
    func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func displayQuestion() {
        
        self.resetButtonStyling()
        
        let result = quizManager.getQuestion()
        
        guard let newQuestion = result.question else {
            
            if let finalScore = result.finalScore {
                displayScore(score: finalScore)
            }
            return
        }
        
        questionField.text = newQuestion.question

        // Set-up answer buttons
        for (index, answer) in newQuestion.answers.shuffled().enumerated() {
            switch index {
            case 0:
                answer1Button.setTitle(answer, for: UIControl.State.normal)
            case 1:
                answer2Button.setTitle(answer, for: UIControl.State.normal)
            case 2:
                answer3Button.setTitle(answer, for: UIControl.State.normal)
            case 3:
                answer4Button.setTitle(answer, for: UIControl.State.normal)
            default:
                break
            }
        }
        
        
        // Hide the 3rd and 4th answer buttons if there are not 3 or 4 answers to choose from.
        if newQuestion.answers.count < 4 {
            answer4Button.isHidden = true
        } else {
            answer4Button.isHidden = false
        }
        
        if newQuestion.answers.count < 3 {
            answer3Button.isHidden = true
        } else {
            answer3Button.isHidden = false
        }
        
        quizActionButton.isHidden = true
    }
    
    func displayScore(score: Int) {
        // Hide the answer buttons
        hideButtons(true)

        // Display play again button
        quizActionButton.isHidden = false
        celebrationLabel.isHidden = false

        // Change the end-game message depending on how well the player does.
        if score > questionsPerRound/2 {
            questionField.text = "Way to go!\nYou got \(score) out of \(questionsPerRound) correct!"
        } else {
            questionField.text = "You got \(score) out of \(questionsPerRound) correct! Better luck next time."
        }
    }
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.displayQuestion()
        }
    }
    
    // MARK: Button Styling Helpers
    enum ButtonStyling {
        case correct, incorrect, regular
        
    }
    
    func applyStyling(_ style: ButtonStyling, toButton button: UIButton) {
        switch style {
        case .correct:
            button.backgroundColor = UIColor(red: 45/255.0, green: 204/255.0, blue: 113/255.0, alpha: 1.0)
        case .incorrect:
            button.backgroundColor = UIColor(red: 231/255.0, green: 76/255.0, blue: 60/255.0, alpha: 1.0)
        case .regular:
            button.backgroundColor = UIColor(red: 12/255.0, green: 121/255.0, blue: 150/255.0, alpha: 1.0)
        }
    }
    
    func resetButtonStyling() {
        for button in answerButtons {
            applyStyling(.regular, toButton: button)
        }
    }
    
    func hideButtons(_ hidden: Bool) {
        for button in answerButtons {
            button.isHidden = hidden
        }
    }
    
    // MARK: - Actions
    
    @IBAction func answerSelected(_ sender: Any) {
        
        guard let buttonPressed = sender as? UIButton else { return }
        
        guard let answerFromButton = buttonPressed.currentTitle else { return }
        
        let result = quizManager.checkAnswer(answerFromButton)
        
        if result.correct{
            applyStyling(.correct, toButton: buttonPressed)
        } else {
            applyStyling(.incorrect, toButton: buttonPressed)
            
            // Alter the styling of the button which has the correct answer
            for button in answerButtons {
                if button.currentTitle == result.correctAnswer {
                    applyStyling(.correct, toButton: button)
                }
            }
            
        }
        
        loadNextRound(delay: 2)
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        setupGame()
    }
    
}

