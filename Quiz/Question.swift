//
//  Question.swift
//  Quiz
//
//  Created by Ainur on 9/26/17.
//  Copyright © 2017 Ainur. All rights reserved.
//

import Foundation

class Question
{
    var questionText = ""
    var choiceList = [String]()
    var correctAnswer = ""
    
    public init(questionText:String, choiceList:[String], correctAnswer : String)
    {
        self.questionText = questionText
        self.choiceList = choiceList
        self.correctAnswer = correctAnswer
    }
}
