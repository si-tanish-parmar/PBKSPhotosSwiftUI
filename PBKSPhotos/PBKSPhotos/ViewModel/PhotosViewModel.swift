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
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    let serviceManager = ServiceManager()
    
    func fetchUser() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedPhotos = try await serviceManager.fetchUserData()
            photos = fetchedPhotos
        } catch {
            errorMessage = "Failed to fetch user data: \(error.localizedDescription)"
        }
        isLoading = false
    }
}

