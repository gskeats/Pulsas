//
//  Questions.swift
//  Pulsas
//
//  Created by Graham Skeats on 10/2/18.
//  Copyright © 2018 Graham Skeats. All rights reserved.
//

import Foundation


let emerg_exit=TextOnly(text_init: "Based on the information you have entered this is most likely a medical emergency.\n \n Dial 911 IMMEDIATLEY.\n \n \n Failure to do so in a timely manner may result in a loss of life.")
let non_emerg_exit=TextOnly(text_init: "Based on the information you have entered the application has not recognized this as a medical emergency. \n This application is not indended to replace the advice of a physician, use common sense and seek further assistance if neccesary. \n If the individual in question insists that they need emergency care listen to them, they are most likely right! \nIf symptoms do not abate then contact your physician for follow up care.")
//let breathing_check=Assessment_with_Axiom(text: "Are they having difficulty breathing?", pos_arg: emerg_exit, neg_arg: trauma_check, axiom_info:breathing_axiom, last:nil)
let breathing_check=Basic_Question(text_init: "Are they breathing?", pos_arg: emerg_exit, neg_arg: non_emerg_exit)
let consciousness_check=Basic_Question(text_init: "Are they awake?", pos_arg: emerg_exit, neg_arg: breathing_check)

