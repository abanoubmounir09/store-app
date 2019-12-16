//
//  addstore.swift
//  StoreApp
//
//  Created by pop on 12/9/19.
//  Copyright © 2019 pop. All rights reserved.
//

import UIKit

class addstore: UIViewController {

    @IBOutlet weak var txtStoreName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func savebutton(_ sender: Any) {
        let storename1 = StoreType(context: context)
    storename1.name = txtStoreName.text!
        do{
            try
            context.save()
            print("save done")
        }catch{
            print("Error")
        }
    }
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
