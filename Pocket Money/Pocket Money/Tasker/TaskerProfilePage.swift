//
//  TaskerProfilePage.swift
//  Pocket Money
//
//  Created by Ayeeshi Poosarla on 2/21/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit

class TaskeeEditVC : UIViewController, UINavigationControllerDelegate {
    var imagePicker: UIImagePickerController?
    @IBOutlet var preveiwPFP: UIImageView!
    
    @IBAction func openCamera(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            imagePicker = UIImagePickerController()
            imagePicker?.delegate = self
            imagePicker?.sourceType = .camera
            imagePicker?.allowsEditing = false
            self.present(imagePicker!, animated: true, completion: nil)
        }
    }
}

extension TaskeeEditVC: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        preveiwPFP.image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
