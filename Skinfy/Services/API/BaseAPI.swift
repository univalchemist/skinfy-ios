//
//  BaseAPI.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/7/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation
import Alamofire

enum APIResponseResult<Value> {
    case success(Value)
    case error(BaseErrorModel)
}

class BaseRequest<T: ParametersInput, R> {
    let request: URLRequest
    init(request: URLRequest) {
        self.request = request
    }
}

struct DummyInputParam: Codable, ParametersInput { }

class BaseRequestSingle<R>: BaseRequest<DummyInputParam, R> { }

class BaseServiceFactory {
    func urlRequest(path: String, method: HTTPMethod) -> URLRequest {
        let url = URL(string: Constants.Api.baseUrl)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}

class BaseAPI {
    
    func run<T: ParametersInput, R: Codable>(request: BaseRequest<T, R>, input: T? = nil, completion: @escaping (APIResponseResult<R>) -> Void) -> Void {
        
        var executableRequest: URLRequest
        if let input = input, let httpMethod = HTTPMethod(rawValue: request.request.httpMethod ?? "") {
            
            do {
                switch httpMethod {
                case .get:
                    let queryEncoding = URLEncoding(destination: .queryString, arrayEncoding: .noBrackets)
                    executableRequest = try queryEncoding.encode(request.request, with: input.toJSON())
                case .connect, .delete, .head, .options, .patch, .post, .put, .trace:
                    executableRequest = try Alamofire.JSONEncoding.default.encode(request.request, with: input.toJSON())
                }
            } catch {
                executableRequest = request.request
            }
            
        } else {
            executableRequest = request.request
        }
        
        //TOKEN
        if let token = UserDataManager().userToken() {
            executableRequest.addValue(token, forHTTPHeaderField: "x-access-token")
        }
        
        Alamofire.request(executableRequest).responseJSON { [weak self]response in
            var apiResult: APIResponseResult<R>
            //when data is nil
            guard let data = response.data else {
                apiResult = .error(BaseErrorModel.defaultError)
                return completion(apiResult)
            }
            
            if let error = self?.parsedError(data: data) {
                apiResult = .error(error)
            } else {
                do {
                    let decoder = JSONDecoder()
                    let output = try decoder.decode(R.self, from: data)
                    apiResult = .success(output)
                } catch {
                    apiResult = .error(BaseErrorModel.defaultError)
                }
            }
            completion(apiResult)
        }
    }
    
    private func parsedError(data: Data?) -> BaseErrorModel? {
        guard let data = data else {
            return nil
        }
        do {
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                if let _ = jsonObject["error"] as? String, let message = jsonObject["message"] as? String {
                    return BaseErrorModel(errorString: message)
                }
            }
            return nil
        } catch {
            return nil
        }
    }
}

class PrivateManagerAPI: BaseAPI {
    static let shared = PrivateManagerAPI()
}
