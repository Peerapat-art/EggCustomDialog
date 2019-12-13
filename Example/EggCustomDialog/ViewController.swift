//
//  ViewController.swift
//  EggCustomDialog
//
//  Created by Peerapat.Pro on 12/11/2019.
//  Copyright (c) 2019 Peerapat.Pro. All rights reserved.
//

import UIKit
import EggCustomDialog

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let bundle = Bundle(for: EggCustomDialogViewController.self)
        let newViewController = EggCustomDialogViewController(nibName:"EggCustomDialogViewController" , bundle: bundle)
        newViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        newViewController.content = EggCustomDialogViewController.CustomDialogTheme(sTitle: "test", sMessage: "jaa")
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
