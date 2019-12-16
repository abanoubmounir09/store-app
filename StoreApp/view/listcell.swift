//
//  listcell.swift
//  StoreApp
//
//  Created by pop on 12/9/19.
//  Copyright © 2019 pop. All rights reserved.
//

import UIKit

class listcell: UITableViewCell {

    @IBOutlet weak var labstorename: UILabel!
    @IBOutlet weak var labdate: UILabel!
    @IBOutlet weak var labitemname: UILabel!
    @IBOutlet weak var lbimage: UIImageView!
    
    func upgradecell(item : Items){
        self.labstorename.text = item.item_name
        self.labitemname.text = item.toStore?.name
        self.lbimage.image = item.image as? UIImage
    }
    //test static table
    func getcell(){
        labstorename.text = "number1test"
        labitemname.text = "number2test2"
    }
}
