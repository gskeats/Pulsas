//
//  QuestionClasses.swift
//  Pulsas
//
//  Created by Graham Skeats on 9/22/19.
//  Copyright © 2019 Graham Skeats. All rights reserved.
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
