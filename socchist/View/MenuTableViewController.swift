//
//  MenuTableViewController.swift
//  socchist
//
//  Created by Sakhavat Suleymanli on 10/30/18.
//  Copyright © 2018 sakhapps. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FirebaseAuth
import Firebase

class MenuTableViewController: UITableViewController {

    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var signOutBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        userNameLbl.text = Auth.auth().currentUser?.displayName
        
        let userNameData = UserDefaults.standard.string(forKey: "rememberedUser")

        if userNameData == nil {
            signOutBtn.isHidden = true
            signInBtn.isHidden = false
            userNameLbl.text = "user not log in yet"
        } else {
            signOutBtn.isHidden = false
            signInBtn.isHidden = true
            userNameLbl.text = Auth.auth().currentUser?.displayName
        }
    }
    
    
    @IBAction func signOutBtnTapped(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "rememberedUser")
        UserDefaults.standard.synchronize()
        
        let signIn = self.storyboard?.instantiateViewController(withIdentifier: "signInVC") as? signInVC
        let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        delegate.window?.rootViewController = signIn
        
        do {
            try Auth.auth().signOut()
        } catch  {
            print(error)
        }
    }
    
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        
        let signIn = self.storyboard?.instantiateViewController(withIdentifier: "signInVC") as? signInVC
        
        let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        delegate.window?.rootViewController = signIn
    }
    
}
