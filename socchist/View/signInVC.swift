//
//  ViewController.swift
//  socchist
//
//  Created by armud on 10/15/18.
//  Copyright © 2018 sakhapps. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FirebaseAuth

class signInVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func skipBtnTapped(_ sender: Any) {
        
    }
    
    
    @IBAction func signInWithFacebookButtonTapped(_ sender: Any) {
        
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .email], viewController: self) { (result) in
            switch result {
                
            case .success(grantedPermissions: _, declinedPermissions: _, token: _):
                self.signIntoFirebase()
                self.performSegue(withIdentifier: "toMain", sender: nil)
                UserDefaults.standard.set(Auth.auth().currentUser?.displayName, forKey: "rememberedUser")
                
            case .failed(let err):
                let alert = UIAlertController(title: "Error", message: err.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            case .cancelled:
                let alert = UIAlertController(title: "Cancelled", message: "Log In cancelled", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            }
            }
        
    }
    
     func signIntoFirebase() {
        
        guard let authenticationToken = AccessToken.current?.authenticationToken else {return}
        let credintial = FacebookAuthProvider.credential(withAccessToken: authenticationToken)
        Auth.auth().signInAndRetrieveData(with: credintial) { (userdata, err) in
            if err != nil {
                self.dismiss(animated: true, completion: nil)
                return
            } else {
                
                UserDefaults.standard.set(Auth.auth().currentUser?.displayName, forKey: "rememberedUser")
                UserDefaults.standard.synchronize()
        }
        
    }
    }

}
