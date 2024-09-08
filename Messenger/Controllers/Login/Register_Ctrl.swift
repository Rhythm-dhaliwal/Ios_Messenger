//
//  Register_Ctrl.swift
//  Messenger
//
//  Created by Rhythm Dhaliwal on 24/07/24.
//

import UIKit

class Register_Ctrl: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.clipsToBounds = true
        
       return scrollview
    }()
    
    private let imageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(systemName:"person.crop.circle"))
        imageView.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        imageView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        imageView.layer.cornerRadius = 76
        imageView.layer.masksToBounds = true
        // imageView.layer.borderWidth = 2
        // imageView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        
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
    
    //Username
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
    
    //Password
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
    //Create Account button
    private let Ca_button: UIButton = {
       let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private let Rights: UIImageView = {
        let image = UIImageView(image: UIImage(named: "git_logo"))
        image.backgroundColor = .white
        image.layer.cornerRadius = 15
        return image
    }()
    
    private let footer: UILabel = {
       let text = UILabel()
        text.text = "© 2024 Rhythm-dhaliwal, Inc.All rights reserved."
        text.font = UIFont.systemFont(ofSize: 14)
        text.textColor = .systemGray
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Account"
        
        EmailField.delegate = self
        UsernameField.delegate = self
        passwordField.delegate = self
        
        Ca_button.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1000)
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backbutton))
        backButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.black], for: .normal)
        self.navigationItem.leftBarButtonItem = backButton
        //Add SubViews
        view.frame = view.bounds
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        view.addSubview(background)
        view.sendSubviewToBack(background)
        scrollView.addSubview(EmailField)
        scrollView.addSubview(UsernameField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(Ca_button)
        scrollView.addSubview(Rights)
        scrollView.addSubview(footer)
        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
        let guesture = UITapGestureRecognizer(target: self, action: #selector(ProfilePicButton))
        imageView.addGestureRecognizer(guesture)
        
    }
    
    @objc private func ProfilePicButton(){
       presentPhotoActionSheet()
    }
    
    @objc func backbutton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func createAccountButtonTapped(){
        
        EmailField.resignFirstResponder()
        UsernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
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
       
        imageView.frame = CGRect(x: (view.width)/3, y: 10, width: 150, height: 150)
        background.frame = view.bounds
        
        EmailField.frame = CGRect(x: 30,
                                  y: imageView.bottom+50,
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
                                 y: passwordField.bottom+60,
                                 width: view.width-60,
                                 height: 52)
        
        scrollView.frame = CGRect(x: 0, 
                                  y: 90,
                                  width: view.width,
                                  height: view.height)
        
        Rights.frame = CGRect(x: (scrollView.width-40)/2,
                              y: 700,
                              width: 40,
                              height: 40)
        
        footer.frame = CGRect(x: scrollView.width/10,
                              y: Rights.bottom+20,
                              width: scrollView.width-60,
                              height: 20)
        
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
        else if textField == passwordField{
            createAccountButtonTapped()
        }
        return true
    }
}
extension Register_Ctrl: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    // func for the alert that occur when we select input for profile picture
    func presentPhotoActionSheet(){
        let Actionsheet = UIAlertController(title: "Profile Picture", message: "Please select from below", preferredStyle: .alert)
        
        Actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        Actionsheet.addAction(UIAlertAction(title: "Select from Photos", style: .default, handler: {[weak self] _ in
            self?.presentPhotoPicker()
            
        }))
        
        Actionsheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {[weak self] _ in
            self?.presentCamera()
            
        }))
        
        
        present(Actionsheet,animated: true)
    }
    func presentCamera (){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
    }
    
    func presentPhotoPicker(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc,animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true,completion: nil)
        
        guard let selectedPic = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        self.imageView.image = selectedPic
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
    }
}
