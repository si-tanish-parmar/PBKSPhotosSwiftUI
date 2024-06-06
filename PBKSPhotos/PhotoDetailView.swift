//
//  PhotoDetailView.swift
//  PBKSPhotos
//
//  Created by Tanish Parmar on 06/06/24.
//

import SwiftUI

struct PhotoDetailView: View {
    var date: String
    var headline: String
    @StateObject private var viewModel = PhotosViewModel()
    let baseURL = "https://www.punjabkingsipl.in/static-assets/waf-images/{image_path}/{image_name}?v=1.04"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(spacing: 15) {
            HStack(alignment: .center, spacing: 0) {
                Button("Back") {
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
            Image("dummyImage3")
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 30, height: 225)
            
            VStack(spacing: 10) {
                HStack {
                    Text(date)
                        .foregroundColor(Theme.getColor(named: .grey_616161))
                        .font(.custom(CustomFonts.ICCMonoFontMedium.name, size: 12))
                    Spacer()
                }
                HStack {
                    Text(headline)
                        .foregroundColor(Theme.getColor(named: .black_212121))
                        .font(.custom(CustomFonts.ICCMonoFontBold.name, size: 16))
                    Spacer()
                }
                HStack {
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
                
                HStack {
                    Text("Coaching Moments")
                        .foregroundColor(Theme.getColor(named: .black_212121))
                        .font(.custom(CustomFonts.ICCMonoFontBold.name, size: 18))
                    Spacer()
                }
                Image("divider")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 4)
                ScrollView {
                    VStack(spacing: 15){
                        if let items = viewModel.photos?.content?.items {
                            ForEach(Array(items.enumerated()), id: \.element.assetID) { index, item in
                                if let imagePath = item.imagePath, let imageName = item.imageFileName {
                                    let imageURL = constructImageURL(baseURL: baseURL, imagePath: imagePath, imageName: imageName)
                                    SmallContentCell(date: formatDateString(item.publishedDate ?? ""),
                                                     headline: item.assetTitle ?? "",
                                                     imageURL: imageURL)
                                }
                            }
                        }
                    }
                    .onAppear {
                        Task {
                            await viewModel.fetchUser()
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    PhotoDetailView(date: "13 Dec, 2023", headline: "Shikhar Dhawan achieves incredible feat, becomes third batter to slam 50 half-centuries")
}
