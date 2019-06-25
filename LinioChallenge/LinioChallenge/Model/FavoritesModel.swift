//
//  FavoritesModel.swift
//  LinioChallenge
//
//  Created by Pablo Ramirez on 6/25/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import Foundation
import ObjectMapper

public class Favorite: Mappable {
    public var id: Int?
    public var name: String?
    public var description: String?
    public var fDefault: Bool?
    public var owner: Owner?
    public var createdAt: Date?
    public var visibility: String?
    public var products: [String: Product]?
    
    init(){}
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        description <- map["description"]
        fDefault    <- map["default"]
        owner       <- map["owner"]
        createdAt   <- map["createdAt"]
        visibility  <- map["visibility"]
        products    <- map["products"]
    }
}

public class Owner: Mappable {
    public var name: String?
    public var email: String?
    public var linioId: String?

    init(){}
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        name    <- map["name"]
        email   <- map["email"]
        linioId <- map["linioId"]
    }
}

public class Product: Mappable {
    public var id: Int?
    public var name: String?
    public var wishListPrice: Int?
    public var slug: String?
    public var url: String?
    public var image: String?
    public var linioPlusLevel: Int?
    public var conditionType: String?
    public var freeShipping: Bool?
    public var imported: Bool?
    public var active: Bool?

    init(){}
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        id             <- map["id"]
        name           <- map["name"]
        wishListPrice  <- map["wishListPrice"]
        slug           <- map["slug"]
        url            <- map["url"]
        image          <- map["image"]
        linioPlusLevel <- map["linioPlusLevel"]
        conditionType  <- map["conditionType"]
        freeShipping   <- map["freeShipping"]
        imported       <- map["imported"]
        active         <- map["active"]
    }
}

// MARK: - Favorite
//class Favorite: Decodable {
//    let id: Int
//    let name: String
//    let description: String
//    let fDefault: Bool?
//    let owner: Owner
//    let createdAt: Date
//    let visibility: String
//    let products: [String: Product]
//
//    init(id: Int, name: String, description: String, fDefault: Bool, owner: Owner, createdAt: Date, visibility: String, products: [String: Product]) {
//        self.id = id
//        self.name = name
//        self.description = description
//        self.fDefault = fDefault
//        self.owner = owner
//        self.createdAt = createdAt
//        self.visibility = visibility
//        self.products = products
//    }
//}
//
//// MARK: - Owner
//class Owner: Decodable {
//    let name: String
//    let email: String
//    let linioId: String
//
//    init(name: String, email: String, linioId: String) {
//        self.name = name
//        self.email = email
//        self.linioId = linioId
//    }
//}
//
//// MARK: - Product
//class Product: Decodable {
//    let id: Int
//    let name: String
//    let wishListPrice: Int
//    let slug: String
//    let url: String
//    let image: String
//    let linioPlusLevel: Int
//    let conditionType: String
//    let freeShipping: Bool
//    let imported: Bool
//    let active: Bool
//
//    init(id: Int, name: String, wishListPrice: Int, slug: String, url: String, image: String, linioPlusLevel: Int, conditionType: String, freeShipping: Bool, imported: Bool, active: Bool) {
//        self.id = id
//        self.name = name
//        self.wishListPrice = wishListPrice
//        self.slug = slug
//        self.url = url
//        self.image = image
//        self.linioPlusLevel = linioPlusLevel
//        self.conditionType = conditionType
//        self.freeShipping = freeShipping
//        self.imported = imported
//        self.active = active
//    }
//}
//
//typealias Favorites = [Favorite]
