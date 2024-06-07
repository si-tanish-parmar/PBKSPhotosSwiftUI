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
    var titleAlias: String
    @EnvironmentObject var viewModel: PhotosViewModel
    let baseURL = "https://www.punjabkingsipl.in/static-assets/waf-images/{image_path}/{image_name}?v=1.04"
    let detailBaseURL = "https://www.punjabkingsipl.in/apiv3/photo/{title_alias}?is_app=1"
    @Environment(\.presentationMode) var presentationMode
    
    private var detailURL: String {
        constructDetailURL(baseDetailURL: detailBaseURL, titleAlias: titleAlias)
    }
    
    
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(alignment: .center, spacing: 0) {
                Button("Back") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(Theme.getColor(named: .white_FFFFFF))
                Spacer()
            }
            .background(Theme.getColor(named: .red_C10004))
            if let images = viewModel.photosDetail?.content?.data?.images {
                TabView {
                    ForEach(images, id: \.data?.imageID) { image in
                        if let imagePath = image.data?.imagePath, let imageName = image.data?.imageName {
                            let imageURL = constructImageURL(baseURL: baseURL, imagePath: imagePath, imageName: imageName)
                            AsyncImage(url: URL(string: imageURL)) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width, height: 225)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: 225)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .onAppear {
                    UIPageControl.appearance().currentPageIndicatorTintColor = .red
                }
            } else {
                HStack{
                    ProgressView()
                }
                .frame(width: UIScreen.main.bounds.width, height: 225)
            }

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
                    Text(viewModel.photos?.content?.items?.first?.secondaryEntityName ?? "")
                        .foregroundColor(Theme.getColor(named: .black_212121))
                        .font(.custom(CustomFonts.ICCMonoFontBold.name, size: 18))
                    Spacer()
                }
                Image("divider")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 4)
                ScrollView {
                    VStack(spacing: 15) {
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
                            await viewModel.fetchList()
                            await viewModel.fetchDetail(detailURL: detailURL)
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
    PhotoDetailView(date: "13 Dec, 2023", headline: "Shikhar Dhawan achieves incredible feat, becomes third batter to slam 50 half-centuries", titleAlias: "hello-world")
}
