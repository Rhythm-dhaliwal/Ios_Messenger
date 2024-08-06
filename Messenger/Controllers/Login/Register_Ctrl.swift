//
//  Register_Ctrl.swift
//  Messenger
//
//  Created by Rhythm Dhaliwal on 24/07/24.
//

import UIKit

class Register_Ctrl: UIViewController {
    
    private let imageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let background: UIImageView = {
        let background = UIImageView(image: UIImage(named: "background"))
        background.contentMode = .scaleAspectFill
        
        return background
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        //Add SubViews
        
        view.addSubview(imageView)
        view.addSubview(background)
        view.sendSubviewToBack(background)
       
    }
    override func viewDidLayoutSubviews(){
        let size = view.width/2
        imageView.frame = CGRect(x: (view.width)/4, y: 120, width: size, height: size)
        background.frame = self.view.bounds
        
        
        
   }
}
