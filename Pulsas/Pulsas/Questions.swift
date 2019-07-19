//
//  Questions.swift
//  Pulsas
//
//  Created by Graham Skeats on 10/2/18.
//  Copyright © 2018 Graham Skeats. All rights reserved.
//

import Foundation

//base class since all views must display some information

//lets do this classfully overriding, because there are only two possible segues from each scene if youre even performing a segue at all

//information for yes or no assesment view
//class for information display only views
class Axiom_Display {
    //var return_information:Assessment_Display
    var view_text:String
    var return_information:Axiom_Display?
    init(text: String, last: Axiom_Display?) {
        view_text=text
        return_information=last
    }
    func get_type(object:Axiom_Display)->Axiom_Display.Type{
        let object_type=type(of: object)
        return object_type
    }
    
    func get_segue_identifier(object:Axiom_Display)->String{
        switch object {
        case is Assessment_Display:
            return "toSimpleFromDisplay"
        case is Assessment_with_Axiom:
            return "toAxiomfromDisplay"
        default:
            return "noSegue"
        }
    }
    
    func get_neg()->Axiom_Display{
        return self
    }
    
    func get_pos()->Axiom_Display{
        return self
    }
}

class Assessment_Display:Axiom_Display{
    var pos_response:Axiom_Display
    var neg_response:Axiom_Display
    
    init(text_init: String,pos_arg:Axiom_Display, neg_arg: Axiom_Display, last: Axiom_Display?) {
        pos_response=pos_arg
        neg_response=neg_arg
        super.init(text: text_init,last: last)
    }
    
    override func get_neg()->Axiom_Display{
        let next_question=self.neg_response
        return next_question
    }
    
    override func get_pos()->Axiom_Display{
        let next_question=self.pos_response
        return next_question

    }
    
    override func get_segue_identifier(object: Axiom_Display) -> String {
        switch object {
        case is Assessment_with_Axiom:
            return "toAxiomFromSimple"
        case is Assessment_Display:
            return "noSegue"
        default:
            return "toDisplayfromSimple"
        }
    }
    
}

class Assessment_with_Axiom:Assessment_Display{
    let axiom:Axiom_Display
    init(text: String, pos_arg: Axiom_Display, neg_arg: Axiom_Display,axiom_info:Axiom_Display,last:Axiom_Display?) {
        axiom=axiom_info
        super.init(text_init: text, pos_arg: pos_arg, neg_arg: neg_arg,last:last)
    }
    override func get_segue_identifier(object: Axiom_Display) -> String {
            switch object {
            case is Assessment_with_Axiom:
                return "noSegue"
            case is Assessment_Display:
                return "toSimplefromAxiom"
            default:
                return "fromAxiomtoDisplay"
            }
    }

}


let emerg_exit=Axiom_Display(text: "Based on the information you have entered this is most likely a medical emergency.\n \n Dial 911 IMMEDIATLEY.\n \n \n Failure to do so in a timely manner may result in a loss of life.",last:nil)
let non_emerg_exit=Axiom_Display(text: "Based on the information you have entered the application has not recognized this as a medical emergency. \n This application is not indended to replace the advice of a physician, use common sense and seek further assistance if neccesary. \n If the individual in question insists that they need emergency care listen to them, they are most likely right! \nIf symptoms do not abate then contact your physician for follow up care.", last: nil)
let pain=Assessment_Display(text_init: "Is the persons pain greater than a 7 on a scale from 1-10 with 1 being low, 10 being the worst pain theyve ever experiences?", pos_arg: emerg_exit, neg_arg: non_emerg_exit, last: nil)
let loc=Assessment_Display(text_init: "Did the person lose consciousness at any point?", pos_arg: emerg_exit, neg_arg: pain, last: nil)
let drugs_alcohol_check=Assessment_Display(text_init: "Have they ingested any drugs or alcohol?", pos_arg: emerg_exit, neg_arg: loc, last: nil)
let tenderness=Assessment_Display(text_init: "Do they have any tenderness or deformity to their back or neck?", pos_arg: emerg_exit, neg_arg: drugs_alcohol_check, last: nil)
let numbness_paralysis=Assessment_Display(text_init: "Does they person have any nu,bness or paralysis in any extremity or part of their body?", pos_arg: emerg_exit, neg_arg: tenderness, last: nil)
let neck_head_pain=Assessment_Display(text_init: "Do they have any pain in their head, neck, or back?", pos_arg: numbness_paralysis, neg_arg: loc, last: nil)
let alert_check2=Assessment_Display(text_init: "Is the person completely alert?", pos_arg: neck_head_pain, neg_arg: emerg_exit, last: nil)
let head_trauma=Assessment_Display(text_init: "Did the victim injure their head?", pos_arg: emerg_exit, neg_arg: alert_check2, last: nil)
let height_check=Assessment_Display(text_init:"Was the fall greater than 10 ft?", pos_arg: emerg_exit, neg_arg: head_trauma, last: nil)
let fall=Assessment_Display(text_init: "Did they fall?", pos_arg: height_check, neg_arg: head_trauma, last: nil)
let hemhorrage=Assessment_Display(text_init: "Is there serious bleeding?", pos_arg: emerg_exit, neg_arg: fall, last: nil)
let scene_safe=Assessment_Display(text_init: "Are they a danger to themselves or others?", pos_arg: emerg_exit, neg_arg: non_emerg_exit, last: nil)
let acute_change=Assessment_Display(text_init: "Was there a sudden change in their appearance or behavior?", pos_arg: emerg_exit, neg_arg: scene_safe, last: nil)
let cyanosis=Assessment_Display(text_init: "Are they changing color?", pos_arg: emerg_exit, neg_arg: acute_change, last: nil)
//fix this add an axiom that gives the poison control number
let overdose=Assessment_Display(text_init: "Have they consumed any alcohol, drugs, or harmful substances?", pos_arg: non_emerg_exit, neg_arg: cyanosis, last: nil)
//fix this so that it doesnt dead end this branch
let swelling=Assessment_Display(text_init: "Is there any swelling of the face, neck, throat, or tongue?", pos_arg: emerg_exit, neg_arg: non_emerg_exit, last: nil)
let diff_talking=Assessment_Display(text_init: "Are they having difficulty talking or swallowing?", pos_arg: emerg_exit, neg_arg: swelling, last: nil)
let hx_allergies=Assessment_Display(text_init: "Do they have any history of severe allergic reaction?", pos_arg: emerg_exit, neg_arg: diff_talking, last: nil)
let allergic_reaction=Assessment_Display(text_init: "Are they having an allergic reaction?", pos_arg: hx_allergies, neg_arg: overdose, last: nil)
let seizure=Assessment_Display(text_init: "Did they have a seizure?", pos_arg: emerg_exit, neg_arg: allergic_reaction, last: nil)
let slurring_speech2=Assessment_Display(text_init: "Are they slurring their speech?", pos_arg: emerg_exit, neg_arg: seizure, last: nil)
let abnormal_behavior=Assessment_Display(text_init: "Are they behaving abnormally?", pos_arg: emerg_exit, neg_arg: slurring_speech2, last: nil)
let diabetes=Assessment_Display(text_init: "Do they have any history of diabetes?", pos_arg: seizure, neg_arg: abnormal_behavior, last: nil)
let hand_squeeze=Assessment_Display(text_init: "Have them take your hands in each of theirs, then tell them to squeeze as hard as they can, if the pressure on your hands is unequal, select NO.", pos_arg: diabetes, neg_arg: emerg_exit, last: nil)
let slurring=Assessment_Display(text_init: "Are they slurring their speech?", pos_arg: emerg_exit, neg_arg: hand_squeeze, last: nil)
let CSMs=Assessment_Display(text_init: "Are they complaining of any numbness or paralysis?", pos_arg: emerg_exit, neg_arg: slurring, last: nil)
let hx_stroke=Assessment_Display(text_init: "Do they have any history of stroke?", pos_arg: CSMs, neg_arg: diabetes, last: nil)
let fainting=Assessment_Display(text_init: "Did they faint or nearly faint?", pos_arg: emerg_exit, neg_arg: hx_stroke, last: nil)
let nausea_check=Assessment_Display(text_init: "Do they feel nauseous or like they need to throw up?", pos_arg: emerg_exit, neg_arg: fainting, last: nil)
let skin_check=Assessment_Display(text_init: "Are they clammy or having cold sweats?", pos_arg: emerg_exit, neg_arg: nausea_check, last: nil)
let hx_cardiac=Assessment_Display(text_init: "Do they have any history of cardiac problems?", pos_arg: emerg_exit, neg_arg: skin_check, last: nil)
let female_age=Assessment_Display(text_init: "Is the victim female and 45 years old or older?", pos_arg: emerg_exit, neg_arg: hx_cardiac, last: nil)
let tripleA=Assessment_Display(text_init: "Do they have any history or risk of triple A? (Abdominal Aortic Aneurysm?)", pos_arg: emerg_exit, neg_arg: hx_stroke, last: nil)
let male_age=Assessment_Display(text_init: "Is the victim male and over the age of 35?", pos_arg: emerg_exit, neg_arg: female_age, last: nil)
let navel=Assessment_Display(text_init: "Is the pain above or below their belly button?", pos_arg: male_age, neg_arg: tripleA, last: nil)
let chest_pain=Assessment_Display(text_init: "Are they complaning of any chest pain?", pos_arg: navel, neg_arg: hx_stroke, last: nil)
let alert_check=Assessment_Display(text_init: "Are they alert?", pos_arg: chest_pain, neg_arg: emerg_exit, last: nil)
let trauma_check=Assessment_with_Axiom(text: "Are they injured?", pos_arg: hemhorrage, neg_arg: alert_check, axiom_info: sternum, last:nil)
let sternum=Axiom_Display(text: "Make a fist and rub their breastbone vigorously, as if you were giving someone a noogie.", last: trauma_check2)
let trauma_check2=Assessment_Display(text_init: "Are they injured?", pos_arg: hemhorrage, neg_arg: alert_check,last:nil)
let breathing_check2=Assessment_Display(text_init: "Are they having difficulty breathng?", pos_arg: emerg_exit, neg_arg: trauma_check, last: nil)
let breathing_axiom=Axiom_Display(text: "Try the following:\n\n -Look at their chest, is it moving up and down? \n\n -Put your ear next to their mouth, can you hear air moving or feel their breath on your cheek?\n\n -If they are gasping for breath or breathing extremely shallowly and making strange noises then they are not breathing.", last: breathing_check2)
let breathing_check=Assessment_with_Axiom(text: "Are they having difficulty breathing?", pos_arg: emerg_exit, neg_arg: trauma_check, axiom_info:breathing_axiom, last:nil)
let consciousness_check=Assessment_Display(text_init: "Are they awake?", pos_arg: breathing_check , neg_arg: emerg_exit,last:nil)

