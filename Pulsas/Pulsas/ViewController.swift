//
//  ViewController.swift
//  Pulsas
//
//  Created by Graham Skeats on 10/2/18.
//  Copyright © 2018 Graham Skeats. All rights reserved.
//

import UIKit

var current_question=2

class ViewController: UIViewController {
    @IBOutlet weak var QuestionText: UILabel!

    override func viewDidLoad() {
        QuestionText.text=question_array[current_question].text
        super.viewDidLoad()
        
    }
    
    @IBAction func NegResponse(_ sender: Any) {
        QuestionText.text=question_array[0].text
    }
    
    @IBAction func PosRepsonse(_ sender: Any) {
        QuestionText.text=question_array[1].text
    }
}






