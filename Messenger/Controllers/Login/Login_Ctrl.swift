//
//  Login_Ctrl.swift
//  Messenger
//
//  Created by Rhythm Dhaliwal on 24/07/24.
//

import UIKit

class Login_Ctrl: UIViewController {
    // Logo func
    private let imageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //scroll func
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    //email input
    private let emailField : UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.placeholder = "Email Address..."
        return field
    }()
    
    //password input
    private let passwordField : UITextField = {
       let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .done
        field.placeholder = "Password..."
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        field.returnKeyType = .continue
        field.isSecureTextEntry = true
        return field
    }()
    
    private let Login_button: UIButton = {
      let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //View controller background
        view.backgroundColor = .white
        title = "Log In"
        //register button
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        
        Login_button.addTarget(self, action: #selector(LoginButtonTapped), for: .touchUpInside)
        //emailField.delegate = self
        //passwordField.delegate = self
        //Add SubViews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(Login_button)
        scrollView.frame = view.bounds
        
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.width/2
        imageView.frame = CGRect(x: (view.width)/4,
                                 y: 20,
                                 width: size,
                                 height: size)
        
        emailField.frame = CGRect(x: 30,
                                  y: imageView.bottom+10,
                                  width: scrollView.width-60,
                                  height: 52)
        
        passwordField.frame = CGRect(x: 30,
                                y: emailField.bottom+10,
                                width: scrollView.width-60,
                                height: 52)
        
        Login_button.frame = CGRect(x: 30,
                                     y: passwordField.bottom+10,
                                     width: scrollView.width-60,
                                     height: 52)
        
    }
    
    //Login Button
    @objc private func LoginButtonTapped(){
        guard let email = emailField.text, let password = passwordField.text,
              !email.isEmpty,!password.isEmpty,password.count >= 6 else {
                AlertLogin()
            return
        }
    
    }
    
    //Login Alert
    func AlertLogin(){
        let alert = UIAlertController(title: "Wrong password", message: "The password you have entered is wrong. Please try again.", preferredStyle: .alert)
        
        present(alert,animated: true)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
       
    }
    //Register
    @objc private func didTapRegister(){
        let vc = Register_Ctrl()

        navigationController?.pushViewController(vc, animated: true)
    }
}

//extension Login_Ctrl :UITextFieldDelegate{
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == emailField{
//            passwordField.becomeFirstResponder()
//        }
//        else if textField == passwordField{
//            LoginButtonTapped()
//            textField.resignFirstResponder()
//        }
//        return true
//    }
//    
//}
