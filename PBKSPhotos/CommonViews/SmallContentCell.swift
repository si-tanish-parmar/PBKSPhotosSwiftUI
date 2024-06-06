//
//  SmallContentCell.swift
//  PBKSPhotos
//
//  Created by Tanish Parmar on 04/06/24.
//

import SwiftUI

struct SmallContentCell: View {
    var date: String
    var headline: String
    var imageURL: String

    var body: some View {
        HStack(spacing: 15){
            AsyncImage(url: URL(string: imageURL)) { image in
            image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 168, height: 95)
                    .clipped()
                    .cornerRadius(3)
            } placeholder: {
                ProgressView()
            }
                
            VStack(alignment: .leading){
                HStack{
                    Text(date)
                        .font(.custom(CustomFonts.ICCMonoFontBold.name, size: 12))
                        .foregroundColor(Theme.getColor(named: .red_ED1C24))
                    Spacer()
                }
                Text(headline)
                    .lineLimit(2)
                    .font(.custom(CustomFonts.ICCMonoFontMedium.name, size: 14))
                HStack{
                    Button(action: {
                        print("Share button tapped!")
                    }) {
                        Image("share")
                            .frame(height: 30)
                    }
                    Spacer()
                    Button(action: {
                        print("Like button tapped!")
                    }) {
                        Image("like")
                            .frame(height: 30)
                    }
                }
            }
        }
        .padding(.horizontal,10)
    }
}

