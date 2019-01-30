//
//  ViewController.swift
//  Pulsas
//
//  Created by Graham Skeats on 10/2/18.
//  Copyright © 2018 Graham Skeats. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var SimpleQuestionText: UILabel!
    
    var current_question=consciousness_check

    
    override func viewDidLoad() {
        SimpleQuestionText.text=current_question.view_text
        super.viewDidLoad()
    }
    
    
    @IBAction func negResponse(_ sender: Any) {
        
    }
    
    @IBAction func posRepsonse(_ sender: Any) {

    }
    
    @IBAction func ReturnAxiom(_ sender: Any) {
        
    }
    @IBAction func AxiomDisplay(_ sender: Any) {
        
    }
}






