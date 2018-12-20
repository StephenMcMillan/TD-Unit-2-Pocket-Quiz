//
//  Question.swift
//  EnhanceQuizStarter
//
//  Created by Stephen McMillan on 18/12/2018.
//  Copyright © 2018 Treehouse. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answers: [String]
    
    let correctAnswer: String
}

struct QuestionProvider {
    let generalKnowledgeQuestions = [
        Question(question: "This was the only US President to serve more than two consecutive terms.",
                 answers: ["George Washington", "Franklin D. Roosevelt", "Woodrow Wilson", "Andrew Jackson"],
                 correctAnswer: "Franklin D. Roosevelt"),
        
        Question(question: "Which of the following countries has the most residents?",
                 answers:["Nigeria", "Russia", "Iran", "Vietnam"],
                 correctAnswer: "Nigeria"),
        
        Question(question: "In what year was the United Nations founded?",
                 answers: ["1918", "1919", "1945", "1954"],
                 correctAnswer: "1945"),
        
        Question(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
                 answers: ["Paris", "Washington D.C.", "New York City", "Boston"],
                 correctAnswer: "New York City"),
        
        Question(question: "Which nation produces the most oil?",
                 answers: ["Iran", "Iraq", "Brazil", "Canadav"],
                 correctAnswer: "Iraq"),
        
        Question(question: "Which country has most recently won consecutive World Cups in Soccer?",
                 answers: ["Italy", "Brazil", "Argetina", "Spain"],
                 correctAnswer: "Brazil"),
        
        Question(question: "Which of the following rivers is longest?",
                 answers: ["Yangtze", "Mississippi", "Congo", "Mekong"],
                 correctAnswer: "Mississippi"),
        
        Question(question: "Which city is the oldest?",
                 answers: ["Mexico City", "Cape Town", "San Juan", "Sydney"],
                 correctAnswer: "Mexico City"),
        
        Question(question: "Which country was the first to allow women to vote in national elections?",
                 answers: ["Poland", "United States", "Sweden", "Senegal"],
                 correctAnswer: "Poland"),
        
        Question(question: "Which of these countries won the most medals in the 2012 Summer Games?",
                 answers: ["France", "Germany", "Japan", "Great Britian"],
                 correctAnswer: "Great Britian")].shuffled() // Shuffle the array every time it is created for randomness.
    
    let aviationQuestions = [
        Question(question: "What are the four forces of flight?",
                 answers: ["Air law, trust, drag, heavy", "Crew, aircraft, luggage, passengers", "Lift, thrust, drag, weight"],
                 correctAnswer: "Lift, thrust, drag, weight"),
        
        Question(question: "Where did the Wright Brothers' historic flight take place?",
                 answers: ["Kitty Hawk, N. C.", "The English Channel", "The Golden Gate Bridge", "Fargo, N. D."],
                 correctAnswer: "Kitty Hawk, N. C."),
        
        Question(question: "Altitude in aviation is measured in?",
                 answers: ["Feet", "Metres", "Kilometres", "Decimetres"],
                 correctAnswer: "Feet"),
        
        Question(question: "What is the ICAO code for London Heathrow airport?",
                 answers: ["EGKK", "EGCC", "EGAA", "EGLL"],
                 correctAnswer: "EGLL"),
        
        Question(question: "Which of these airlines is the largest?", answers: ["Southwest", "Lufthansa"], correctAnswer: "Lufthansa"),
        
        Question(question: "What is the ICAO code for Dubai airport?",
                 answers: ["KJFK", "EGLL", "OMDB", "CYYZ"],
                 correctAnswer: "OMDB"),
        
        Question(question: "What is speed in aviation measured in?",
                 answers: ["MPH", "KM/H", "M/S", "Knots"],
                 correctAnswer: "Knots"),
        
        Question(question: "Which of these airliners is the largest?",
                 answers: ["Airbus A320", "Boeing 757", "Cessna 152", "Boeing 747"],
                 correctAnswer: "Boeing 747"),
        
        Question(question: "How many engines does an A340 have in total?",
                 answers: ["2", "4"],
                 correctAnswer: "4")].shuffled()
}


