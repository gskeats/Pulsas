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


let emerg_exit=Axiom_Display(text: "Based on the information you have entered this is most likely a medical emergency.       Dial 911 IMMEDIATLEY.         Failure to do so in a timely manner may result in a loss of life.",last:nil)
let non_emerg_exit=Axiom_Display(text: "Based on the information you have entered the application has not recognized this as a medical emergency.                This application is not indended to replace the advice of a physician, use common sense and seek further assistance if neccesary.              If the individual in question insists that they need emergency care listen to them, they are most likely right!              If symptoms do not abate then contact your physician for follow up care.", last: nil)



let trauma_check=Assessment_with_Axiom(text: "Are they injured?", pos_arg: emerg_exit, neg_arg: non_emerg_exit, axiom_info: sternum, last:nil)
let sternum=Axiom_Display(text: "Rub their sternum motherfucker", last: trauma_check2)
let trauma_check2=Assessment_Display(text_init: "Are they injured?", pos_arg: emerg_exit, neg_arg: non_emerg_exit,last:nil)


let breathing_check=Assessment_Display(text_init: "Are they having difficulty breathng?", pos_arg: emerg_exit, neg_arg: trauma_check,last:nil)

let consciousness_check=Assessment_Display(text_init: "Are they awake?", pos_arg: breathing_check , neg_arg: emerg_exit,last:nil)

