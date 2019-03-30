//
//  ViewController.swift
//  Pulsas
//
//  Created by Graham Skeats on 10/2/18.
//  Copyright © 2018 Graham Skeats. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var scenetext: UILabel!
    
    var passed_scene:Axiom_Display?
    var current_scene=consciousness_check as Axiom_Display

    
    override func viewDidLoad() {
        if passed_scene==nil {
            scenetext.text=current_scene.view_text
        } else{
            scenetext.text=passed_scene?.view_text
            current_scene=passed_scene!
        }
        
        super.viewDidLoad()
    }
    
    @IBAction func negResponse(_ sender: Any) {
        let next_scene=current_scene.get_neg()
        let segue_name=current_scene.get_segue_identifier(object: next_scene)
        segue_programmatically(name: segue_name,next:next_scene)
    }
    
    @IBAction func posRepsonse(_ sender: Any) {
        let next_scene=current_scene.get_pos()
        let segue_name=current_scene.get_segue_identifier(object: next_scene)
        segue_programmatically(name: segue_name,next:next_scene)
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        let next_scene=current_scene.return_information
        let segue_name=current_scene.get_segue_identifier(object: next_scene!)
        segue_programmatically(name: segue_name, next: next_scene!)
    }
    
    func segue_programmatically(name:String,next:Axiom_Display){
        if name=="noSegue"{
            current_scene=next
            scenetext.text=current_scene.view_text
            return
        }
        performSegue(withIdentifier: name, sender: next)
    }


    @IBAction func axiomButton(_ sender: Any) {
        print("got here")
        let downcast=current_scene as! Assessment_with_Axiom
        let next_scene=downcast.axiom
        let segue_name=current_scene.get_segue_identifier(object: next_scene)
        segue_programmatically(name: segue_name, next: next_scene)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination=segue.destination as? ViewController
        destination?.passed_scene=(sender as? Axiom_Display)!
    }
}

