//
//  ServiceManager.swift
//  LinioChallenge
//
//  Created by Pablo Ramirez on 6/25/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

public class ServiceManager{
    
    func performFavoritesService(completion: @escaping (_ error:
        ServiceError, _ responseModel: [Favorite]?) -> Void) {
        
        let urlrequest = "https://gist.githubusercontent.com/egteja/98ad43f47d40b0868d8a954385b5f83a/raw/5c00958f81f81d6ba0bb1b1469c905270e8cdfed/wishlist.json"
        
        //let model = RequestModel(.......)
        let body = ""//Mapper().toJSONString(model) ?? ""
        
        ServiceUtils.defaultManager.request(ServiceUtils.createRequest(urlString: urlrequest, body: body)).responseJSON { (response) in
            
            print(response.result.value ?? "")
            var serviceError = ServiceError()
            
            if let error = response.result.error as? AFError {
                serviceError = ServiceError(httpCode: response.response?.statusCode ?? 0, exception:error.localizedDescription, message:error.errorDescription ?? "", cveDiagnostic: "")
            }
            
            if response.result.isSuccess {
                if let value = response.result.value as? [[String:Any]] {
                    if let resp = Mapper<Favorite>().mapArray(JSONObject: value) {
                        
                        completion(serviceError, resp)
                    }
                    else {
                        serviceError.message = "Ocurrio un error al convertir JSON"
                        completion(serviceError , nil)
                    }
                }
            }
            else {
                completion(serviceError, nil)
            }
            
        }
    }
}
