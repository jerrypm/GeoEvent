//
//  Extension+UIImage.swift
//  GeoEventApp
//
//  Created by Jeri Purnama on 16/10/23.
//

import UIKit

extension UIImage {
    func imageScaled(toSize size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: size))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage!
    }
}
