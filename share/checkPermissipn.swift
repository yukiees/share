//
//  checkPermissipn.swift
//  share
//
//  Created by 松島優希 on 2021/01/07.
//

import Foundation
import Photos

class CheckPermission{
    func checkCamera(){
        //ユーザーに許可を促す
        PHPhotoLibrary.requestAuthorization { (status) in
            switch(status){
            
            case.authorized:
                print("authorized")
            case .notDetermined:
                print("notDetermined")
            case .restricted:
                print("restricted")
            case .denied:
                print("denied")
            case .limited:
                print("limited")
            @unknown default:
                break
            }
        }
    }
}
