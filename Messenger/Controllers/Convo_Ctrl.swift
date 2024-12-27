//
//  ViewController.swift
//  Messenger
//
//  Created by Rhythm Dhaliwal on 24/07/24.
//

import UIKit
import FirebaseAuth
import JGProgressHUD
class Convo_Ctrl: UIViewController{
   
    private let spinner = JGProgressHUD(style: .dark)
    
    private let TableView: UITableView = {
        let Table = UITableView()
        Table.isHidden = true
        Table.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        
        return Table
    }()
    
    private let noConversationLabel: UILabel = {
        let label = UILabel()
        label.text = "No Conversations!"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(didTapComposeButton))
        
        view.addSubview(TableView)
        view.addSubview(noConversationLabel)
        setupTableView()
        fetchConversations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        validate();
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TableView.frame = view.bounds
    }
    
    @objc private func didTapComposeButton(){
        let vc = NewConvo_Ctrl()
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
        return
    }
    
    private func validate(){
        if(FirebaseAuth.Auth.auth().currentUser == nil){
            let vc = Login_Ctrl()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }
    private func fetchConversations(){
        TableView.isHidden = false
    }
    
    private func setupTableView(){
        TableView.delegate = self
        TableView.dataSource = self
    }

}

extension Convo_Ctrl: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "Test"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TableView.deselectRow(at: indexPath, animated: true)
        let vc = Chat_Ctrl()
        vc.title = "Rhythm Dhaliwal"
        vc.navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
