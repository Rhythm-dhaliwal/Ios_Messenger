//
//  Login_Ctrl.swift
//  Messenger
//
//  Created by Rhythm Dhaliwal on 24/07/24.
//

import UIKit
import FirebaseAuth
import JGProgressHUD
import GoogleSignIn
import Firebase

class Login_Ctrl: UIViewController {
    
    private let spinner = JGProgressHUD(style : .light)
    
    
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
    
    //Google signIn
    private let googleSignInButton : UIButton = {
        let button = UIButton()
        //button.translatesAutoresizingMaskIntoConstraints = true
        button.layer.cornerRadius = 12
        button.backgroundColor = .white
        button.setTitle("Sign In with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = true
        return button
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
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1000)
        
        setupUI()
       // setupGoogleSignIn()
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
        scrollView.addSubview(googleSignInButton)
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
        
        emailField.frame = CGRect(x: 10,
                                  y: imageView.bottom+50,
                                  width: scrollView.width-20,
                                  height: 45)
        
        passwordField.frame = CGRect(x: 10,
                                y: emailField.bottom+10,
                                width: scrollView.width-20,
                                height: 45)
        
        Login_button.frame = CGRect(x: 10,
                                     y: passwordField.bottom+60,
                                     width: scrollView.width-20,
                                     height: 45)
        
        googleSignInButton.frame = CGRect(x: 10,
                                          y: Login_button.bottom+10,
                                          width: scrollView.width-20,
                                          height: 45)
        
        Rights.frame = CGRect(x: (scrollView.width-40)/2,
                              y: 700,
                              width: 40,
                              height: 40)
        
        footer.frame = CGRect(x: scrollView.width/10,
                              y: Rights.bottom+20,
                              width: scrollView.width-60,
                              height: 40)
        
        
        
    }
    
    private func setupUI(){
        
        googleSignInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    private func setupGoogleSignIn(){
        //configure GIDsignIn
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: "905822023549-0ou13nu0701s44dnnp6scg4ttuiammjf.apps.googleusercontent.com")
    }
    
    @objc private func signInButtonTapped() {
           signIn()
       }
    
    private func signIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [weak self] result, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                print("Error: Missing user or token")
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            // Sign in with Firebase
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    print("Firebase sign in error: \(error.localizedDescription)")
                    return
                }
                
                // User is signed in
                // Navigate to your app's main screen
                self.handleSuccessfulSignIn()
            }
        }
    }
       
        func handleSuccessfulSignIn() {
           // Handle successful sign in - e.g., navigate to main screen
//           let mainVC = Convo_Ctrl() // Your main view controller
//            let nav = UINavigationController(rootViewController: mainVC)
//           nav.modalPresentationStyle = .fullScreen
//           present(nav, animated: true)
            navigationController?.dismiss(animated: true)
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
        
        spinner.show(in: view)
        //FireBase Code here--
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] AuthDataResult, error in
            
            guard let strongSelf = self else{
                return
            }
           
            DispatchQueue.main.async {
                strongSelf.spinner.dismiss()
            }
            
            guard let result = AuthDataResult , error == nil else {
                print("failed to login with email: \(email)")
                strongSelf.AlertLogin()
                return
            }
            let user = result.user
            print("Logged in with user: \(user)")
            
            strongSelf.navigationController?.dismiss(animated: true)
        })
    
    }
    
   
    //Login Alert
    func AlertLogin(){
        let alert = UIAlertController(title: "Wrong password", message: "The Username or Password you have entered is wrong. Please try again.", preferredStyle: .alert)
        
        present(alert,animated: true)
        alert.addAction(UIAlertAction(title: "Close", style: .destructive, handler: nil))
       
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
