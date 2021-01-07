//
//  ViewController.swift
//  share
//
//  Created by 松島優希 on 2021/01/02.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var checkPermission = CheckPermission()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPermission.checkCamera()
    }
    @IBAction func camera(_ sender: Any) {
        let sourceType:UIImagePickerController.SourceType = .camera
        createImagePicker(sourceType: sourceType)
        
    }
    
    @IBAction func album(_ sender: Any) {
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        createImagePicker(sourceType: sourceType)
        
    }
    
    @IBAction func share(_ sender: Any) {
        let text = "iOS共有テスタ"
        let image = imageView.image?.jpegData(compressionQuality: 0.50)
        let item = [text,image as Any]
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    func createImagePicker(sourceType:UIImagePickerController.SourceType){
        
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = sourceType
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true
        self.present(cameraPicker, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[.editedImage] as? UIImage{
            
            imageView.image = pickerImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    
}

