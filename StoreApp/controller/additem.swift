//
//  additem.swift
//  StoreApp
//
//  Created by pop on 12/9/19.
//  Copyright © 2019 pop. All rights reserved.
//

import UIKit
import CoreData
class additem: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var txtnameitem: UITextField!
    @IBOutlet weak var pkstoretype: UIPickerView!
    @IBOutlet weak var lbimage: UIImageView!
    var listStoreType = [StoreType]()
    var imagePiker : UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStore()
        pkstoretype.delegate = self
        pkstoretype.dataSource = self
        imagePiker = UIImagePickerController()
        imagePiker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pkstoretype.reloadAllComponents()
        pkstoretype.reloadComponent(0)
    }

    @IBAction func backbtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    //implement image

    @IBAction func selectimgBTN(_ sender: Any) {
        present(imagePiker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image1 = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            lbimage.image = image1
        }
        imagePiker.dismiss(animated: true, completion: nil)
    }
    
    //endimage
    @IBAction func savebtn(_ sender: Any) {
        let newItem = Items(context: context)
        newItem.item_name = txtnameitem.text
        //newItem.date_add = NSData()
        newItem.image = lbimage.image
        newItem.toStore = listStoreType[pkstoretype.selectedRow(inComponent: 0)]
        do{
            try context.save()
            print("save done")
            txtnameitem.text = ""
        }catch{
            print("error")
        }
    }
    
    func loadStore(){
        let fetchrequest = NSFetchRequest<StoreType>(entityName: "StoreType")
        do{
            try listStoreType = context.fetch(fetchrequest)
            print("fetch done")
        }catch{
            print("Error")
        }
    }
    
    

}
extension additem:UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listStoreType.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let item = listStoreType[row]
        return item.name
    }
    
}











