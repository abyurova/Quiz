//
//  Quiz.swift
//  Quiz
//
//  Created by Ainur on 9/26/17.
//  Copyright © 2017 Ainur. All rights reserved.
//

import Foundation

class Quiz :NSObject
{
    static let sharedInstance = Quiz()
    var questionList = [Question]()
    var resultArray = [String]()
    
    override init() {
        let questionOne = Question(questionText: "2+2?", choiceList: ["2","4","5"], correctAnswer : "4")
        let questionTwo = Question(questionText: "2+3?", choiceList: ["2","5","6"], correctAnswer : "5")
        let questionThree = Question(questionText: "2+6?", choiceList: ["2","5","6"], correctAnswer : "6")
        let questionFour = Question(questionText: "10+4?", choiceList: ["20","18","14"], correctAnswer : "14")
        let questionSix = Question(questionText: "2+40?", choiceList: ["42","8","6"], correctAnswer : "42")
        let questionSeven = Question(questionText: "3+40?", choiceList: ["42","43","6"], correctAnswer : "43")
        let questionEight = Question(questionText: "5+40?", choiceList: ["42","8","45"], correctAnswer : "45")
        let questionNine = Question(questionText: "6+40?", choiceList: ["42","8","46"], correctAnswer : "46")
        let questionTen = Question(questionText: "7+40?", choiceList: ["42","47","6"], correctAnswer : "47")
        
        let arrayOfQuestions = [questionOne, questionTwo, questionThree, questionFour, questionSix, questionSeven, questionEight, questionNine, questionTen]
        for i in 0..<5{
            let randomNum = Int(arc4random_uniform(9))
            questionList.append(arrayOfQuestions[randomNum])
        }
        
        
    }
    
}
