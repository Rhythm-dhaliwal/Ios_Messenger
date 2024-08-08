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
    
    //Email Address
    private let EmailField : UITextField = {
        let email = UITextField()
        email.autocapitalizationType = .none
        email.autocorrectionType = .no
        email.layer.cornerRadius = 12
        email.layer.borderWidth = 0.5
        email.layer.borderColor = UIColor.black.cgColor
        let placeholder = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        email.attributedPlaceholder = placeholder
        email.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha:   0.4)
        email.textColor = .lightGray
        return email
    }()
    
    private let UsernameField: UITextField = {
       let username = UITextField()
        username.placeholder = "Username"
        username.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        username.textColor = .lightGray
        let placeholdertext = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        username.attributedPlaceholder = placeholdertext
        username.layer.cornerRadius = 12
        username.layer.masksToBounds = true
        username.autocapitalizationType = .none
        username.autocorrectionType = .no
        username.layer.borderWidth = 0.5
        username.layer.borderColor = UIColor.black.cgColor
        return username
    }()
    
    private let passwordField: UITextField = {
        let password = UITextField()
        password.autocorrectionType = .no
        password.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        password.autocapitalizationType = . none
        password.layer.cornerRadius = 12
        password.layer.masksToBounds = true
        password.layer.borderColor = UIColor.black.cgColor
        password.textColor = .lightGray
        password.layer.borderWidth = 0.5
        password.isSecureTextEntry = true
        let placeholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        password.attributedPlaceholder = placeholder
        return password
    }()
    
    private let Ca_button: UIButton = {
       let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        
        EmailField.delegate = self
        UsernameField.delegate = self
        passwordField.delegate = self
        
        Ca_button.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        //Add SubViews
        
        view.frame = view.bounds
        view.addSubview(imageView)
        view.addSubview(background)
        view.sendSubviewToBack(background)
        view.addSubview(EmailField)
        view.addSubview(UsernameField)
        view.addSubview(passwordField)
        view.addSubview(Ca_button)
    }
    
    @objc func createAccountButtonTapped(){
        guard let email = EmailField.text , let username = UsernameField.text
                ,let password = passwordField.text,!email.isEmpty,!username.isEmpty,!password.isEmpty,password.count>=6 else{
            return CreateAccAlert()
        }
    }
    
    func CreateAccAlert(){
        let alert = UIAlertController(title: "Test", message: "Under development testing alert", preferredStyle: .alert)
        present(alert,animated: true)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
    }
    override func viewDidLayoutSubviews(){
        let size = view.width/2
        imageView.frame = CGRect(x: (view.width)/4, y: 120, width: size, height: size)
        background.frame = view.bounds
        
        EmailField.frame = CGRect(x: 30,
                                  y: imageView.bottom+10,
                                  width: view.width-60,
                                  height: 52)
        
        UsernameField.frame = CGRect(x: 30,
                                     y: EmailField.bottom+10,
                                     width: view.width-60,
                                     height: 52)
        
        passwordField.frame = CGRect(x: 30, 
                                     y: UsernameField.bottom+10,
                                     width: view.width-60,
                                     height: 52)
        
        Ca_button.frame = CGRect(x: 30, 
                                 y: passwordField.bottom+20,
                                 width: view.width-60,
                                 height: 52)
        
   }
}
extension Register_Ctrl: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == EmailField {
            UsernameField.becomeFirstResponder()
        }
        else if textField == UsernameField{
            passwordField.becomeFirstResponder()
        }
        return true
    }
}
