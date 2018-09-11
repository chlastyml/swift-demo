//
//  StorageHelper.swift
//  todo-app
//
//  Created by kacalek on 11/09/2018.
//  Copyright © 2018 kacalek. All rights reserved.
//

import UIKit

class StorageHelper: NSObject {
    let imageName = "weatherConditions.png"
    
    func saveImage(image: UIImage?) {
        if image == nil { return }
        do {
            let userDocumentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let imagePath = userDocumentsPath.appendingPathComponent(imageName)
            if let imageData = UIImagePNGRepresentation(image!) {
                try imageData.write(to: imagePath, options: .atomic)
            }
        } catch { }
    }
    
    func loadImage() -> UIImage? {
        let userDocumentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let imagePath = userDocumentsPath.appendingPathComponent(imageName).path
        
        if FileManager.default.fileExists(atPath: imagePath) {
            return UIImage(contentsOfFile: imagePath)
        }
        
        return nil
    }
}
