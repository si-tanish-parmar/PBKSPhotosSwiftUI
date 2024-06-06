//
//  CustomFonts.swift
//  PBKSPhotos
//
//  Created by Tanish Parmar on 04/06/24.
//

import Foundation

enum CustomFonts: String, CaseIterable {
    case ICCFontBold = "ICCFont-Bold" // 800
    case ICCFontBoldItalic = "ICCFont-BoldItalic"
    case ICCFontItalic = "ICCFont-Italic"
    case ICCFontLight = "ICCFont-Light" // 300
    case ICCFontLightItalic = "ICCFont-LightItalic"
    case ICCFontMedium = "ICCFont-Medium" // 600
    case ICCFontMediumItalic = "ICCFont-MediumItalic"
    case ICCFontRegular = "ICCFont-Regular" // 400
    case ICCMonoFontBold = "ICCMonoFont-Bold"
    case ICCMonoFontBoldItalic = "ICCMonoFont-BoldItalic"
    case ICCMonoFontItalic = "ICCMonoFont-Italic"
    case ICCMonoFontLight = "ICCMonoFont-Light"
    case ICCMonoFontMedium = "ICCMonoFont-Medium"
    case ICCMonoFontLightItalic = "ICCMonoFont-LightItalic"
    
    var name: String { self.rawValue }
}
