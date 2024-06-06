//
//  CommonUtilities.swift
//  PBKSPhotos
//
//  Created by Tanish Parmar on 05/06/24.
//

import Foundation

func formatDateString(_ dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    if let date = dateFormatter.date(from: dateString) {
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: date)
    }
    return dateString
}

func constructImageURL(baseURL: String, imagePath: String, imageName: String) -> String {
    let updatedURL = baseURL.replacingOccurrences(of: "{image_path}", with: imagePath)
        .replacingOccurrences(of: "{image_name}", with: imageName)
    return updatedURL
}
