//
//  File.swift
//  
//
//  Created by Farbod Rahiminik on 7/19/24.
//

import Foundation

typealias ReaquestHeaders = [String: String]
typealias RequestParameters = [String: Any]
typealias RequestBody = [String: Any?]

enum RequestMethod: String { case get = "GET" }
enum RequestType { case data }
enum ResponseType { case json }

let baseUrl = "https://temper.works/api/v3/"

protocol RequestProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters? { get }
    var timeoutInterval: TimeInterval { get }
    var retryDelay: UInt64 { get }
}

extension RequestProtocol {
    var baseURL: String { baseUrl }
    var method: RequestMethod { .get }
    var requestType: RequestType { .data }
    var responseType: ResponseType { .json }
    var timeoutInterval: TimeInterval { 30.0 }
    var retryDelay: UInt64 { 1_000_000_000 }

    private var queryItems: [URLQueryItem]? {
        guard let parameters = parameters else {
            return nil
        }
        return parameters.map { (key: String, value: Any) -> URLQueryItem in
            let valueString = String(describing: value)
            return URLQueryItem(name: key, value: valueString)
        }
    }

    private func url() -> URL? {
        guard var urlComponents = URLComponents(string: baseURL) else {
            return nil
        }
        urlComponents.path = urlComponents.path + path
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }

    func urlRequest() -> URLRequest? {
        guard let url = url() else {
            return nil
        }
        var request = URLRequest(url: url, timeoutInterval: timeoutInterval)
        request.httpMethod = method.rawValue
        return request
    }

    func verifyResponse(data: Data, response: URLResponse) throws -> (Data, URLResponse) {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unknown
        }
        switch httpResponse.statusCode {
        case 200...299:
            return (data, response)
        case 401:
            throw APIError.authorizationError
        case 400...499:
            throw APIError.badRequest
        case 500...599:
            throw APIError.serverError
        default:
            throw APIError.unknown
        }
    }
}
