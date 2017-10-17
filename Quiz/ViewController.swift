//
//  ViewController.swift
//  Quiz
//
//  Created by Ainur on 9/12/17.
//  Copyright © 2017 Ainur. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView
class ViewController: UIViewController, GoBackDelegate {
    
    @IBOutlet weak var label: UILabel!
    var a : Int = 0
    var indexOfQuestion: Int = 0
    var result: String = ""
    var correct : Int = 0
    var button = UIButton()
    let mySingleObject = Quiz.sharedInstance
     var newList: Array<Question> = []
    //var activity : UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            questFromAPI()
        
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
    
    func questFromAPI(){
        
        let activityIndicator = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height/2,width: 60, height: 60), type: .ballClipRotate , color: UIColor.red, padding: 0)
        
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        APIManager.goToGoogle() {
            (data) -> Void in
            do{
                let allQuestions = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
                if let arrJSON = allQuestions["questionList"] as? [[String: Any]] {
                    print(arrJSON)
                    for item in arrJSON{
                         self.newList.append(Question(questionText: (item["questionText"] as! String),choiceList: (item["choiceList"] as! [String]),  correctAnswer: (item["correctAnswer"] as! String)))
                    }
                    for _ in 0..<5{
                        let randomNum = Int(arc4random_uniform(7))
                        self.mySingleObject.questionList.append(self.newList[randomNum])
                    }
                }
            }
            catch{
                print("Some error")
            }
                    activityIndicator.stopAnimating()
                    self.loadQuestions()
            
        }
    }
    func buttonClicked(_ sender:UIButton) {
        
        result = (sender.titleLabel?.text!)!
        mySingleObject.resultArray.append(result)
        if (result == mySingleObject.questionList[indexOfQuestion].correctAnswer ){
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

