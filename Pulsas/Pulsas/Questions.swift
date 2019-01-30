//
//  Questions.swift
//  Pulsas
//
//  Created by Graham Skeats on 10/2/18.
//  Copyright © 2018 Graham Skeats. All rights reserved.
//

// lets just do three different objects with pointers between each, no inheritence

import Foundation

//base class since all views must display some information
class Display{
    var view_text:String
    var return_segue:Display
    init(text:String) {
        view_text=text
    }
}

//information for yes or no assesment view
class Assessment_Display {
    var pos_response:Any
    var neg_response:Any
    var view_text:String
    
    init(text: String,pos_arg:Assessment_Display, neg_arg: Assessment_Display) {
        pos_response=pos_arg
        neg_response=neg_arg
        var view_text=text
    }
    func get_neg()->Any{
        return self.neg_response
    }
    func get_pos()->Any{
        return self.pos_response
    }
    
}

class Assessment_with_Axiom:Assessment_Display{
    let axiom:Axiom_Display
    init(text: String, pos_arg: Assessment_Display, neg_arg: Assessment_Display,axiom_info:Axiom_Display) {
        axiom=axiom_info
        super.init(text: text, pos_arg: pos_arg, neg_arg: neg_arg)
    }

}
//class for information display only views
class Axiom_Display {
    var return_information:Assessment_Display
    var view_text:String
    
    init(text: String, exit:Assessment_Display) {
        view_text=text
        return_information=exit

    }
}

let emerg_exit=Display(text: "Based on the information you have entered this is most likely a medical emergency.       Dial 911 IMMEDIATLEY.         Failure to do so in a timely manner may result in a loss of life.")
let non_emerg_exit=Display(text: "Based on the information you have entered the application has not recognized this as a medical emergency.                This application is not indended to replace the advice of a physician, use common sense and seek further assistance if neccesary.              If the individual in question insists that they need emergency care listen to them, they are most likely right!              If symptoms do not abate then contact your physician for follow up care.")

let seizure_check=Assessment_Display(text: "Did they have a seizure?", pos_arg: , notsure_arg: false, neg_arg: non_emerg_exit)

let csm_check=Assessment_Display(text: "Can they feel and move all of their fingers and toes?", pos_arg: seizure_check, neg_arg: non_emerg_exit, notsure_arg: false)
let tenderness_deformity_check=Assessment_Display(text: "Do they have any tenderness or deformity in their head, neck, or back?", pos_arg: csm_check, neg_arg: non_emerg_exit, notsure_arg: false)
let drugs_alochol_check=Assessment_Display(text: "Have they ingested any drugs or alcohol?", pos_arg: tenderness_deformity_check, neg_arg: non_emerg_exit, notsure_arg: false)
let head_neck_back_check=Assessment_Display(text: "Do they have any pain in their head neck or back?", pos_arg: drugs_alochol_check, neg_arg: non_emerg_exit, notsure_arg: false)
let trauma_alert_check=Assessment_Display(text: "Are they completely alert?", pos_arg: csm_check, neg_arg: non_emerg_exit, notsure_arg: true)
let head_injury_check=Assessment_Display(text: "Did they inure their head?", pos_arg: trauma_alert_check, neg_arg: non_emerg_exit, notsure_arg: false)
let fall_greater_10ft_check=Assessment_Display(text: "Was the fall greater than 10ft?", pos_arg: head_injury_check, neg_arg: non_emerg_exit, notsure_arg: false)
let fall_check=Assessment_Display(text: "Did they fall?", pos_arg: fall_greater_10ft_check, neg_arg: non_emerg_exit, notsure_arg: false)
let behaving_abnormally_check=Assessment_Display(text: "Are they behaving abnormally?", pos_arg: fall_check, neg_arg: non_emerg_exit, notsure_arg: false)
let slurring_speech_check=Assessment_Display(text: "Are thye slurring their speech?", pos_arg: behaving_abnormally_check, neg_arg: non_emerg_exit, notsure_arg: false)
let hx_diabetes_check=Assessment_Display(text: "Do they have any history of diabetes?", pos_arg: slurring_speech_check, neg_arg: emerg_exit, notsure_arg: false)
let faint_check=Assessment_Display(text: "Do they feel faint or like they might faint?", pos_arg: hx_diabetes_check, neg_arg: non_emerg_exit, notsure_arg: false)
let nausea_check=Assessment_Display(text: "Do they feel naseous?", pos_arg: emerg_exit, neg_arg: faint_check, notsure_arg: false)
let clammy_coldsweats_check=Assessment_Display(text: "Are they clammy or experiencing cold sweats?", pos_arg: nausea_check, neg_arg: non_emerg_exit, notsure_arg: false)
let hx_cardiac_check=Assessment_Display(text: "Do they have any history of heart problems?", pos_arg: clammy_coldsweats_check, neg_arg: emerg_exit, notsure_arg: false)
let female_age_check=Assessment_Display(text: "Are they a female and 45 years or older?", pos_arg: hx_cardiac_check, neg_arg: non_emerg_exit, notsure_arg: false)
let male_age_check=Assessment_Display(text: "Are they a male and 35 years old or older?", pos_arg: female_age_check, neg_arg: non_emerg_exit, notsure_arg: false)
let hx_stroke_check=Assessment_Display(text: "Do they have any history of stroke?", pos_arg: male_age_check, neg_arg: non_emerg_exit, notsure_arg: false)
let pain_above_navel_check=Assessment_Display(text: "Is the pain above or below the belly button?", pos_arg: hx_stroke_check, neg_arg: non_emerg_exit, notsure_arg: false)
let chest_pain_check=Assessment_Display(text: "Are they complaining of any chest pain?", pos_arg: pain_above_navel_check, neg_arg: non_emerg_exit, notsure_arg: false)
let first_alert_check=Assessment_Display(text: "Are they alert?", pos_arg: chest_pain_check, neg_arg: emerg_exit, notsure_arg: true)
let serious_hemhorrage_check=Assessment_Display(text: "Is there serious bleeding?", pos_arg: chest_pain_check, neg_arg: emerg_exit, notsure_arg: false)
let trauma_check=Assessment_Display(text: "Did they suffer an injury?", pos_arg: serious_hemhorrage_check, neg_arg: non_emerg_exit, notsure_arg: false)
let breathing_check=Assessment_Display(text: "Are they having trouble catching their breath?", pos_arg: trauma_check, neg_arg: non_emerg_exit, notsure_arg: true)
let consciousness_check=Assessment_Display(text: "Are they awake?", pos_arg: breathing_check, neg_arg: emerg_exit, notsure_arg: true)
