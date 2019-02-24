//
//  TaskerProfilePage.swift
//  Pocket Money
//
//  Created by Avishi Goyal on 2/23/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//

import UIKit

class TaskerEditVC : UIViewController, UINavigationControllerDelegate {
    var taskerImagePicker: UIImagePickerController?
    @IBOutlet weak var taskerPreviewPFP: UIImageView!
    
    @IBAction func openCamera(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            taskerImagePicker = UIImagePickerController()
            taskerImagePicker?.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
            taskerImagePicker?.sourceType = .camera
            taskerImagePicker?.allowsEditing = false
            self.present(taskerImagePicker!, animated: true, completion: nil)
        }
    }
}

extension TaskerEditVC: UIImagePickerControllerDelegate {
    func taskerImagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        taskerPreviewPFP.image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

