//
//  Theme.swift
//  PBKSPhotos
//
//  Created by Tanish Parmar on 04/06/24.
//

import Foundation
import SwiftUI


class Theme{
    static var currentBundle: Bundle? = Bundle(identifier: "net.sportzinteractive.PBKSPhotos")
    
    static func getColor(named colorName: AppColors) -> Color {
        return Color(colorName.name, bundle: currentBundle)
    }
    
//    static func getImage(named imageName: CFSDKImageName) -> Image? {
//        return Image(imageName.name, bundle: currentBundle)
//    }
//    
//    static func getImage(named imageName: String) -> UIImage? {
//        return UIImage(named: imageName, in: currentBundle, compatibleWith: nil)
//    }
}
