//
//  Login_Ctrl.swift
//  Messenger
//
//  Created by Rhythm Dhaliwal on 24/07/24.
//

import UIKit

class Login_Ctrl: UIViewController {
    private let background_img:UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "background"))
        return imageview
    }()
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
        field.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.black.cgColor
        let placeholder = NSAttributedString(string: "Username or email address", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        field.attributedPlaceholder = placeholder
        field.textColor = .lightGray
        return field
    }()
    
    //password input
    private let passwordField : UITextField = {
       let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .done
        let placeholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor:UIColor.lightGray])
        field.attributedPlaceholder = placeholder
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.black.cgColor
        field.returnKeyType = .continue
        field.isSecureTextEntry = true
        field.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        field.textColor = .lightGray
        
        return field
    }()
    
    private let Login_button: UIButton = {
      let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private let Rights:UIImageView = {
       let image = UIImageView(image: UIImage(named: "git_logo"))
        image.backgroundColor = .white
        image.layer.cornerRadius = 15
        return image
    }()
    
    private let footer: UILabel = {
        let text = UILabel()
        text.text = " © 2024 Rhythm-dhaliwal, Inc.All rights reserved."
        text.font = UIFont.systemFont(ofSize: 14)
        text.textColor = UIColor.systemGray
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //View controller background
        view.backgroundColor = .white
        title = "Log In"
        //register button
       let barButton = UIBarButtonItem(title: "Register",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        
        barButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        
        
        self.navigationItem.rightBarButtonItem = barButton
        
        Login_button.addTarget(self, action: #selector(LoginButtonTapped), for: .touchUpInside)
        
        emailField.delegate = self
        passwordField.delegate = self
        
        scrollView.contentSize = CGSize(width: view.width, height: 1000)
        
        //Add SubViews
        view.addSubview(background_img)
        view.bringSubviewToFront(background_img)
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(Login_button)
        scrollView.addSubview(Rights)
        scrollView.addSubview(footer)
        scrollView.frame = view.bounds
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.width/2
        
        imageView.frame = CGRect(x: (view.width-size)/2,
                                 y: 20,
                                 width: size,
                                 height: size)
        
        scrollView.frame = CGRect(x: 0,
                                  y: 90,
                                  width: view.width,
                                  height: view.height)
        
        emailField.frame = CGRect(x: 30,
                                  y: imageView.bottom+50,
                                  width: scrollView.width-60,
                                  height: 52)
        
        passwordField.frame = CGRect(x: 30,
                                y: emailField.bottom+10,
                                width: scrollView.width-60,
                                height: 52)
        
        Login_button.frame = CGRect(x: 30,
                                     y: passwordField.bottom+60,
                                     width: scrollView.width-60,
                                     height: 52)
        
        Rights.frame = CGRect(x: (scrollView.width-40)/2,
                              y: 700,
                              width: 40,
                              height: 40)
        
        footer.frame = CGRect(x: scrollView.width/10, y: Rights.bottom+20, width: scrollView.width-60, height: 40)
    }
    
    //Login Button
    @objc private func LoginButtonTapped(){
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder() 
        guard let email = emailField.text, let password = passwordField.text,
              !email.isEmpty,!password.isEmpty,password.count >= 6 else {
                AlertLogin()
            return
        }
    
    }
    
    //FireBase Code here--
    
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

extension Login_Ctrl :UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            LoginButtonTapped()
            textField.resignFirstResponder()
        }
        return true
    }
    
}
