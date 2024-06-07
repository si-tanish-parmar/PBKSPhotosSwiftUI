//
//  PhotosViewModel.swift
//  PBKSPhotos
//
//  Created by Tanish Parmar on 04/06/24.
//

import Foundation

@MainActor
class PhotosViewModel: ObservableObject {
    @Published var photos: SIFeedsListingModel?
    @Published var photosDetail: SIFeedsDetailModel?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    let serviceManager = ServiceManager()
    
    func fetchList() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedPhotos = try await serviceManager.fetchListingData()
            photos = fetchedPhotos
        } catch {
            errorMessage = "Failed to fetch user data: \(error.localizedDescription)"
        }
        isLoading = false
    }
    
    func fetchDetail(detailURL: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedPhotosDetail = try await serviceManager.fetchDetailData(detailURL: detailURL)
            photosDetail = fetchedPhotosDetail
        } catch {
            errorMessage = "Failed to fetch user data: \(error.localizedDescription)"
        }
        isLoading = false
    }
}

