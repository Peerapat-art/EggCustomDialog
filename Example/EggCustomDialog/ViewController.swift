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
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    @IBAction func showTitleOnly(_ sender: Any) {
        let content = EggCustomDialogViewController.CustomDialogTheme(sTitle: "Title", sMessage: "", styleDialog: .noImage, styleLabel: .title)
        self.showDialog(content: content)
    }
    
    @IBAction func showMessageOnly(_ sender: Any) {
        let content = EggCustomDialogViewController.CustomDialogTheme(sTitle: "", sMessage: "Message test for show custom egg dialog", styleDialog: .noImage, styleLabel: .message)
        self.showDialog(content: content)
    }
    
    @IBAction func showTitleMessage(_ sender: Any) {
        let content = EggCustomDialogViewController.CustomDialogTheme(sTitle: "Title", sMessage: "Message test for show custom egg dialog", styleDialog: .noImage, styleLabel: .titleMessage)
        self.showDialog(content: content)
    }
    
    @IBAction func showSmallImage(_ sender: Any) {
        let content = EggCustomDialogViewController.CustomDialogTheme(sTitle: "", sMessage: "", img: UIImage(named: "1")!, styleDialog: .withImageSmall)
        self.showDialog(content: content)
    }
    
    @IBAction func showLargeImage(_ sender: Any) {
        let content = EggCustomDialogViewController.CustomDialogTheme(sTitle: "", sMessage: "", img: UIImage(named: "2")!, styleDialog: .withImageLarge)
        self.showDialog(content: content)
    }
    
    @IBAction func showLargeImageWithTitleMessage(_ sender: Any) {
        let content = EggCustomDialogViewController.CustomDialogTheme(sTitle: "Title", sMessage: "Message test for show custom egg dialog", img: UIImage(named: "2")!, styleDialog: .withImageLarge, styleLabel: .titleMessage)
        self.showDialog(content: content)
    }
    
    @IBAction func showSmallImageWithTitleMessage(_ sender: Any) {
        let content = EggCustomDialogViewController.CustomDialogTheme(sTitle: "Title", sMessage: "Message test for show custom egg dialog", img: UIImage(named: "1")!, styleDialog: .withImageSmall, styleLabel: .titleMessage)
        self.showDialog(content: content)
    }
    
    @IBAction func showOneButton(_ sender: Any) {
        let content = EggCustomDialogViewController.CustomDialogTheme(sTitle: "Title", sMessage: "Message test for show custom egg dialog", img: UIImage(named: "1")!, styleDialog: .withImageSmall, styleButton: .single, styleLabel: .titleMessage)
        self.showDialog(content: content)
    }
    
    // MARK: - Private Methods
    private func showDialog(content: EggCustomDialogViewController.CustomDialogTheme) {
        let bundle = Bundle(for: EggCustomDialogViewController.self)
        let eggCustomVC = EggCustomDialogViewController(nibName:"EggCustomDialogViewController" , bundle: bundle)
        eggCustomVC.delegate = self
        eggCustomVC.content = content
        eggCustomVC.showDialog()
    }
}

// MARK: - EggCustomDialogDelegate
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
