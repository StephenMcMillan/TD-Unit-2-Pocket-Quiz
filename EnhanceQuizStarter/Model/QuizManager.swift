//
//  QuizManager.swift
//  EnhanceQuizStarter
//
//  Created by Stephen McMillan on 18/12/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

/* The Process:
    - Load the view and create a new quiz manager. (DONE)
    - Quiz Manager can be created with x number of questions. (DONE)
- Quiz set will contain twice the amount of required questions so the likelyhood of repeats is reduced. 
    - View controller will call a fucntion that should serve up a new question at random, remove it from the active question bank and then wait for further response from vc.
    ** It will be up for the view controller to determine how many answers the specific question has.
 
    - View controller can call up with a question and answer, pass out true or false depending on whether question is correct or not.
 
    - Quiz manager will track the score for the current round.
 
    - QuizManager can be reset using a special reset() function so the user can playAgain.
 
 
    How to ensure that each question is random...
    - Select a random index from the questions array.
    - Could have a 'lastQuestion' object which has all the data about the last question that was presented to the user.
    - Last question could be referenced when checking for the correct answer.
 
 
*/
class QuizManager {
    
    let questionProvider: QuestionProvider
    
    // Start this at -1 so that the first call of getQuestion() will return the first item in the quiz set @ index 0
    var currentQuestionIndex: Int = -1
    var numberOfCorrectAnswers: Int = 0
    
    var quizSet: ArraySlice<Question>
    /// Initialises a new Quiz Manager with x amount of questions. If the number passed in exceeds the maximum number of questions available then all questions will be returned.
    init(numberOfQuestions: Int) {
                
        self.questionProvider = QuestionProvider()
        
        // Array 'prefix' method can be used to select x number of elements from the start of the array. This will work given that the questions are shuffled before using this method. Otherwise, the same questions will be returned each time and the last questions will always be forgotten if outside the number of questions required.
        
        // 'prefix' returns an 'Array Slice' which doesn't allocate new memory and instead gives a view into the array. This would be beneficial for performance in this case if there was a large amount of quiz questions?
        
        self.quizSet = questionProvider.aviationQuestions.prefix(numberOfQuestions)
    }
    
    /// Returns the current question based on the currentQuestionIndex
    /// If the function returns Nil then the player has answered all the questions and the game is over. The function will return a final score.
    func getQuestion() -> (question: Question?, finalScore: Int?) {
        
        currentQuestionIndex += 1
        
        // Ensure there is a question available to return.
        if currentQuestionIndex <= (quizSet.count-1) {
            return (quizSet[currentQuestionIndex], nil)
        } else {
            // The game is finished. The player has answered all the questions.
            return (nil, numberOfCorrectAnswers)
        }
    }
    
    /// Checks the supplied string against the answer to the current question.
    /// If the supplied value was not correct then the correct answer is returned
    func checkAnswer(_ answer: String) -> (correct: Bool, correctAnswer: String?) {
        if answer == quizSet[currentQuestionIndex].correctAnswer {
            numberOfCorrectAnswers += 1
            return (true, nil)
        } else {
            return (false, quizSet[currentQuestionIndex].correctAnswer)
        }
    }

}
