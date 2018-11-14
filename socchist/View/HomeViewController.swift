//
//  HomeViewController.swift
//  socchist
//
//  Created by Sakhavat Suleymanli on 10/24/18.
//  Copyright © 2018 sakhapps. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var searchBtn: UIBarButtonItem!
    
    @IBOutlet weak var allPlayersTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        allPlayersTableView.delegate = self
        allPlayersTableView.dataSource = self
        
        sideMenus()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell") as? PlayerCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
    func sideMenus() {
        
        if revealViewController() != nil {
            
            menuBtn.target = revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 275
            revealViewController()?.rightViewRevealWidth = 350
            
            searchBtn.target = revealViewController()
            searchBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
        view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
            
            
            
        }
        
    }
    
}
