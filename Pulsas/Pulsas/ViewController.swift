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
    
    override func viewDidLoad() {
        let basic_view=BasicView(text_init: "Hello")
        basic_view.instantiate_view(view_controller: self)
        super.viewDidLoad()
    }
    
    @IBAction func negResponse(_ sender: Any) {
        //current_scene=current_scene.get_neg() as! Basic_Question
    }
    
    @IBAction func posRepsonse(_ sender: Any) {
        //current_scene=current_scene.get_pos() as! Basic_Question
        
    }
}

class PulsasView{
    let button_blue=UIColor(red: 194/255, green: 232/255, blue: 255/255, alpha:1.0)
    let pulsas_blue=UIColor(red: 110/255, green: 214/255, blue: 255/255, alpha:1.0)
    let screen_width=UIScreen.main.bounds.width
    let screen_height=UIScreen.main.bounds.height
    var label_text:String = ""
    init(text_init: String){
        label_text=text_init
    }
    func instantiate_view(view_controller:ViewController){
        view_controller.view.backgroundColor=pulsas_blue
    }
    func get_neg()->PulsasView{
        return self
    }
    
    func get_pos()->PulsasView{
        return self
    }
    
}

class TextOnly:PulsasView{
    
    override init(text_init: String){
        super.init(text_init: text_init)
    }
    
    override func instantiate_view()->ViewController{
        let view_controller=ViewController()
        let label = UILabel()
        label.frame = CGRect(x: screen_width/3, y: screen_height/3, width: 200, height: 20)
        label.text = "Are they awake?"
        label.textColor = .black
        view_controller.view.backgroundColor=pulsas_blue
        view_controller.view.addSubview(label)
        return view_controller
    }

}

class Basic_Question:TextOnly{
    var pos_response:PulsasView
    var neg_response:PulsasView
    
    init(text_init: String,pos_arg:PulsasView, neg_arg: PulsasView) {
        self.pos_response=pos_arg
        self.neg_response=neg_arg
        super.init(text_init: text_init)
    }
    
    override func instantiate_view()->ViewController{
        let view_controller=ViewController()
        let button_font = UIFont(name: "button_font", size: 40)

        let yes_button=UIButton()
        yes_button.setTitle("Yes", for: .normal)
        yes_button.frame=CGRect(x: self.screen_width/9, y: self.screen_height*2/3, width: self.screen_width/3, height: self.screen_width/6)
        yes_button.backgroundColor = self.button_blue
        yes_button.titleLabel?.font=button_font
        yes_button.setTitleColor(.black, for: .normal)
        yes_button.layer.cornerRadius=18
        yes_button.showsTouchWhenHighlighted=true



        let no_button=UIButton()
        no_button.frame=CGRect(x: self.screen_width*5/9, y: self.screen_height*2/3, width: self.screen_width/3, height: self.screen_width/6)
        no_button.backgroundColor = self.button_blue
        no_button.setTitle("No", for: .normal)
        no_button.setTitleColor(.black, for: .normal)
        no_button.layer.cornerRadius=18
        no_button.showsTouchWhenHighlighted=true
        no_button.addTarget(view_controller, action: #selector(view_controller.negResponse(_:)), for: .touchUpInside)
        
    
        
        view_controller.view.addSubview(yes_button)
        view_controller.view.addSubview(no_button)
        return view_controller
    }
    
    override func get_neg()->PulsasView{
        return self.neg_response
    }
    
    override func get_pos()->PulsasView{
        return self.pos_response
    }
    
}
