//
//  Questions.swift
//  Pulsas
//
//  Created by Graham Skeats on 10/2/18.
//  Copyright © 2018 Graham Skeats. All rights reserved.
//

import Foundation

struct assessment {
    let text:String
    let pos_response:Int
    let neg_response:Int
    let not_sure:Int
}
let breathing_check:assessment=assessment(text: "Are they awake?", pos_response: 2, neg_response:0 , not_sure: 3)

let consiousness_check:assessment=assessment(text: "Are they having trouble breathing or catching their breath?", pos_response: 0, neg_response:4 , not_sure: 5)

let trauma_splitter:assessment=assessment(text:"Did they suffer an injury?", pos_response:6, neg_response:7, not_sure:-1)

let alert_check:assessment=assessment(text: "Are they alert?", pos_response: 8, neg_response: 0, not_sure: 9)

let serious_hemhorrage:assessment=assessment(text: "Is there serious bleeding?", pos_response: 0, neg_response: 1, not_sure: -1)

let chestpain_check:assessment=assessment(text: "Are they complaining of any chest pain?", pos_response:11 , neg_response: 12, not_sure: -1)

let navel_check:assessment=assessment(text: "Is the pain above or below the belly button?", pos_response:11 , neg_response: 12, not_sure: -1)



let question_array=[breathing_check,consiousness_check, trauma_splitter, alert_check, serious_hemhorrage, chestpain_check]

