//
//  Profile_Ctrl.swift
//  Messenger
//
//  Created by Rhythm Dhaliwal on 24/07/24.
//

import UIKit
import FirebaseAuth
class Profile_Ctrl: UIViewController {

    @IBOutlet var tableView: UITableView!
    let data = ["Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
     
    }
}
extension Profile_Ctrl : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .red
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let  actionSheet = UIAlertController(title: "Are you sure you want to logout?"
                                             , message: "you save your credintials, so logging back in will be easy. you can change that setting from the login screen"
                                             , preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Logout"
                                            , style: .destructive,
                                            handler: {[weak self]_ in
            guard let Strongself = self else{
                return
            }
            
            do{
                try FirebaseAuth.Auth.auth().signOut()
                let vc = Login_Ctrl()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                Strongself.present(nav, animated: true)
            }
            catch{
                print("Failed to logout");
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
        
        
    }
}

