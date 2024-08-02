//
//  Login_Ctrl.swift
//  Messenger
//
//  Created by Rhythm Dhaliwal on 24/07/24.
//

import UIKit

class Login_Ctrl: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let emailField : UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.placeholder = "Email Address..."
        return field
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = view.width/2
        // Logo Image
        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
        
        imageView.frame = CGRect(x: (view.width-size)/2,
                                 y: 20,
                                 width: size,
                                 height: size)
        
        //View controller background
        view.backgroundColor = .white
        title = "Log In"
        //register button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        //Add SubViews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.frame = view.bounds
        emailField.frame = CGRect(x: 30, y: imageView.bottom+10, width: scrollView.width-60, height: 52)
        }
   
    @objc private func didTapRegister(){
        let vc = Register_Ctrl()

        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
