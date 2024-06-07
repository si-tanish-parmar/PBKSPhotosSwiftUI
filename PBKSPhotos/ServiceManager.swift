//
//  ServiceManager.swift
//  PBKSPhotos
//
//  Created by Tanish Parmar on 04/06/24.
//

import Foundation

enum APIServiceError: Error {
    case invalidURL
    case badServerResponse(String)
    case decodingError(String)
}

private let listingURL = "https://www.punjabkingsipl.in/apiv3/listing?entities=4,2&otherent=&exclent=9362&pgnum=1&inum=10&pgsize=10"

import Foundation

class ServiceManager {
    static let shared = ServiceManager()
    private let session: URLSession
    
    init() {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.waitsForConnectivity = true
        sessionConfig.allowsConstrainedNetworkAccess = true
        sessionConfig.allowsCellularAccess = true
        session = URLSession(configuration: sessionConfig)
    }
    
    func fetchListingData() async throws -> SIFeedsListingModel {
        let userAPIEndpoint = URL(string: listingURL)!
        var request = URLRequest(url: userAPIEndpoint)
        request.httpMethod = "GET"
        
        let (data, response) = try await session.data(for: request)
        try validateResponse(response)
        return try decodeResponse(data: data)
    }
    
    func fetchDetailData(detailURL: String) async throws -> SIFeedsDetailModel {
        let userAPIEndpoint = URL(string: detailURL)!
        var request = URLRequest(url: userAPIEndpoint)
        request.httpMethod = "GET"
        
        let (data, response) = try await session.data(for: request)
        try validateResponse(response)
        return try decodeDetailResponse(data: data)
    }

    private func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIServiceError.badServerResponse("Invalid response")
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            break
        case 400...499:
            throw APIServiceError.badServerResponse("Client error: \(httpResponse.statusCode)")
        case 500...599:
            throw APIServiceError.badServerResponse("Server error: \(httpResponse.statusCode)")
        default:
            throw APIServiceError.badServerResponse("Unexpected response code: \(httpResponse.statusCode)")
        }
    }
    
    private func decodeResponse(data: Data) throws -> SIFeedsListingModel {
        let decoder = JSONDecoder()
        return try decoder.decode(SIFeedsListingModel.self, from: data)
    }
    
    private func decodeDetailResponse(data: Data) throws -> SIFeedsDetailModel {
        let decoder = JSONDecoder()
        return try decoder.decode(SIFeedsDetailModel.self, from: data)
    }
}
