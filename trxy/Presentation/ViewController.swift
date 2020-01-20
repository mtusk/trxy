//
//  ViewController.swift
//  trxy
//
//  Created by Adam Anderson on 1/17/20.
//  Copyright © 2020 mtusk. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    // references:
    //   https://www.raywenderlich.com/830-macos-nstableview-tutorial

    @IBOutlet var arrayController: NSArrayController!
    @IBOutlet weak var tableView: NSTableView!
    
    weak var document: Document? {
        if let docRepresentedObject = representedObject as? Document {
            return docRepresentedObject
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
