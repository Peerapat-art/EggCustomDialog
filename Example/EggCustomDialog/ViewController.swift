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
        super.viewDidAppear(true)
        let bundle = Bundle(for: EggCustomDialogViewController.self)
        let eggCustomVC: EggCustomDialogViewController = EggCustomDialogViewController(nibName:"EggCustomDialogViewController" , bundle: bundle)
        eggCustomVC.content = EggCustomDialogViewController.CustomDialogTheme(sTitle: "Title", sMessage: "Message test for show custom egg dialog dialog", img: UIImage(named: "3")!, styleDialog: .withImageSmall)
        eggCustomVC.delegate = self
        eggCustomVC.showDialog()
    }
}

extension ViewController: EggCustomDialogDelegate {
    func didTapLeftButton() {
        // delegate tap left button
          print("Did Tap Left Button")
    }
    
    func didTapRightButton() {
         // delegate tap right button
         print("Did Tap Right Button")
    }
}
