//
//  LargeContentCell.swift
//  PBKSPhotos
//
//  Created by Tanish Parmar on 04/06/24.
//

import SwiftUI

struct LargeContentCell: View {
    var date: String
    var headline: String
    var imageURL: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 15){
            AsyncImage(url: URL(string: imageURL)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 20, height: 200)
                    .cornerRadius(10)
            }
        placeholder: {
            ProgressView()
        }
            HStack(spacing: 0){
                Text(date)
                    .font(.custom(CustomFonts.ICCMonoFontBold.name, size: 12))
                    .foregroundColor(Theme.getColor(named: .red_ED1C24))
                Spacer()
            }
            HStack{
                Text(headline)
                    .lineLimit(2)
                    .font(.custom(CustomFonts.ICCMonoFontMedium.name, size: 16))
                Spacer()
            }
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
        .padding(.horizontal,10)
    }
}

