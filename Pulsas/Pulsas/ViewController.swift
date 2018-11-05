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
    
    
    func getNext(flag:Bool)->Int{
        let next_assesor:Int
        if (flag){
            next_assesor=question_array[current_question].pos_response
            return next_assesor
        }else{
            next_assesor=question_array[current_question].neg_response
            return next_assesor
        }
    
    }
    
    @IBAction func negResponse(_ sender: Any) {
        print(getNext(flag: false))
        QuestionText.text=question_array[getNext(flag:false)].text
    }
    
    @IBAction func posRepsonse(_ sender: Any) {
        QuestionText.text=question_array[getNext(flag:true)].text
    }
}






