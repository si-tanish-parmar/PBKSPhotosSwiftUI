//
//  ContentView.swift
//  PBKSPhotos
//
//  Created by Tanish Parmar on 04/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PhotosViewModel()
    let baseURL = "https://www.punjabkingsipl.in/static-assets/waf-images/{image_path}/{image_name}?v=1.04"


    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 250)
                    .clipped()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    if let items = viewModel.photos?.content?.items {
                        ForEach(Array(items.enumerated()), id: \.element.assetID) { index, item in
                            if index % 3 == 0 {
                                if let imagePath = item.imagePath, let imageName = item.imageFileName {
                                    let imageURL = constructImageURL(baseURL: baseURL, imagePath: imagePath, imageName: imageName)
                                    LargeContentCell(date: formatDateString(item.publishedDate ?? ""), headline: item.assetTitle ?? "", imageURL: imageURL)
                                }
                            } else {
                                if let imagePath = item.imagePath, let imageName = item.imageFileName {
                                    let imageURL = constructImageURL(baseURL: baseURL, imagePath: imagePath, imageName: imageName)
                                    SmallContentCell(date: formatDateString(item.publishedDate ?? ""), headline: item.assetTitle ?? "", imageURL: imageURL)
                                }
                            }
                        }
                    }
                else {
                    Text("No items available")
                        .foregroundColor(.white)
                    }
                }
                .padding(.top, 100)
                .padding([.horizontal, .bottom], 10)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchUser()
            }
        }
    }
}
