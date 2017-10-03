 //
//  SecondViewController.swift
//  Quiz
//
//  Created by Ainur on 9/19/17.
//  Copyright © 2017 Ainur. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource , UITableViewDelegate  {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel2: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    var delegate:GoBackDelegate?
    var totalResult : String = ""
    var text : String = "Your answer: "
    var corAnswer : String = "Correct answer: "
    let mySingleObject = Quiz.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return   mySingleObject.resultArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UserTableViewCell
        cell.questionLabel.text = mySingleObject.questionList[indexPath.row].questionText
        cell.userVariantLabel.text = text + mySingleObject.resultArray[indexPath.row]
        cell.correctLabel.text = corAnswer + (mySingleObject.questionList[indexPath.row].correctAnswer as! String)
        if (mySingleObject.resultArray[indexPath.row] == (mySingleObject.questionList[indexPath.row].correctAnswer as! String)) {
            cell.backgroundColor = UIColor.green
        }
        else {
            cell.backgroundColor = UIColor.red
        }
        return cell
    }
    
    @IBAction func GoBackTapped(_ sender: Any) {
        delegate?.goBack()
        self.navigationController?.popViewController(animated: true)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
