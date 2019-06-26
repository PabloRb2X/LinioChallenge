//
//  ServiceViewModel.swift
//  LinioChallenge
//
//  Created by Pablo Ramirez on 6/25/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation

public class Service{
    
    public var onSuccessFavoritesService:((_ response: [Favorite]) -> ())?
    public var onServiceError: ((_ error: ServiceError)->())?
    
    private let manager = ServiceManager()

    public func performFavoritesService(){
        
        manager.performFavoritesService(completion: { ( _ error:
            ServiceError ,_ response: [Favorite]?) in
            
            if let response = response {
                
                self.onSuccessFavoritesService?(response)
            }else {
                
                self.onServiceError?(error)
            }
        })
    }
    
}
