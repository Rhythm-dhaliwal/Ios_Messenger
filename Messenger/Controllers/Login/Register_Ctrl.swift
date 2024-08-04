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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        title = "Create Account"
        
        // SubViews
        
        view.addSubview(imageView)
        
    }
    override func viewDidLayoutSubviews(){
        let size = view.width/2
        imageView.frame = CGRect(x: (view.width)/4, y: 120, width: size, height: size)
        
        
   }
}
