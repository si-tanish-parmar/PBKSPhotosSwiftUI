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

class ServiceManager{
    private let userAPIEndpointString = "https://www.punjabkingsipl.in/apiv3/listing?entities=4,2&otherent=&exclent=9362&pgnum=1&inum=10&pgsize=10"
    
    func fetchUserData() async throws -> SIFeedsListingModel {
        guard let userAPIEndpoint = URL(string: userAPIEndpointString) else {
            throw APIServiceError.invalidURL
        }
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.waitsForConnectivity = true
        sessionConfig.allowsConstrainedNetworkAccess = true
        sessionConfig.allowsCellularAccess = true
        
        let session = URLSession(configuration: sessionConfig)
        
        do {
            let request = URLRequest(url: userAPIEndpoint)
            request.httpMethod
            let (data, response) = try await session.data(for: request)
            try validateResponse(response)
            let user = try decodeResponse(data: data)
            return user
        } catch {
            print("Error occurred: \(error.localizedDescription)")
            throw error
        }
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
        do {
            return try decoder.decode(SIFeedsListingModel.self, from: data)
        } catch {
            let decodingError = "Decoding error: \(error.localizedDescription)"
            print(decodingError)
            throw APIServiceError.decodingError(decodingError)
        }
    }
}


