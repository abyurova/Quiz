//
//  ViewController.swift
//  Quiz
//
//  Created by Ainur on 9/12/17.
//  Copyright © 2017 Ainur. All rights reserved.
//

import UIKit
//var resultArray : [String] = []
class ViewController: UIViewController, GoBackDelegate {
    
    @IBOutlet weak var label: UILabel!
    var a : Int = 0
    var indexOfQuestion: Int = 0
    var result: String = ""
    var correct : Int = 0
    var button = UIButton()
    let mySingleObject = Quiz.sharedInstance
    
   /* var arrOfQuestions: [Dictionary<String,Any>] = [["question":"2+2?","answer": ["2","4", "10", "7"], "correct": "4"], ["question":"2+3?","answer":["2","5","10"], "correct": "5"], ["question":"2+4?","answer":["3","6","15"], "correct": "6"]]*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestions()
    }

    func loadQuestions(){
        for i in mySingleObject.questionList[indexOfQuestion].choiceList  {
            button = UIButton(frame: CGRect(x: 16, y: 60*a+120, width: Int(UIScreen.main.bounds.size.width-32), height: 45))
            button.backgroundColor = UIColor.purple
            button.setTitle(i, for: UIControlState.normal)
            button.addTarget(self, action:#selector(buttonClicked(_:)), for: .touchUpInside)
            self.view.addSubview(button)
            a += 1
        }
        label.text = mySingleObject.questionList[indexOfQuestion].questionText
        a=0
    }

    func buttonClicked(_ sender:UIButton) {
        result = (sender.titleLabel?.text!)!
        mySingleObject.resultArray.append(result)
        if (result == mySingleObject.questionList[indexOfQuestion].correctAnswer as! String){
            correct+=1
        }
        clearView()
        indexOfQuestion += 1
        if (indexOfQuestion == mySingleObject.questionList.count) {
           let vc = self.storyboard?.instantiateViewController(withIdentifier: "secondController") as! SecondViewController
            vc.delegate = self
            
            self.navigationController?.pushViewController(vc, animated: true)
            vc.totalResult = String(correct)
            indexOfQuestion = 0
            clearView()
        }
        loadQuestions()
    }
    

    func clearView()  {
        for item in view.subviews{
            if item is UIButton {
                item.removeFromSuperview()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mySingleObject.resultArray = []
    }
    func goBack() {
        loadQuestions()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

