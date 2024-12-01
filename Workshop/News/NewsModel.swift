//
//  NewsModel.swift
//  Workshop
//
//  Created by Анна on 13.11.2024.
//

import Foundation

// MARK: - SeldonNews
struct SeldonNews: Codable {
    let event: [Event]

//    let newsTotalCount, userNewsLeft: Int
//    let requestId: String
//    let isRubricSubscribed: Bool

//    enum CodingKeys: String, CodingKey {
//        case newsSecondaryData, news, smartEvents, event, popularObject, newsTotalCount, userNewsLeft, tags, mainRubric, linkedArticles
//        case subscriptionId = "subscriptionId"
//        case requestId = "requestId"
//        case topWIdgetInfo, bottomWIdgetInfo, isRubricSubscribed
//    }
}



// MARK: - BrentGraph
struct BrentGraph: Codable {
    let value: Double
    let date: String
}

// MARK: - GraphDatum
struct GraphDatum: Codable {
    let forecastValue, value: Double?
    let date: String
}

// MARK: - Event
struct Event: Codable {
    let id: Int
    let title: String
    let description, backgroundLarge, backgroundSmall: String
    let img: String
    let creationDate: String
    let backgroundColor, jsonFilter: String
    let groupByStory, isMain: Bool
    let state, type: Int
    let rubricId: Int?

    
}


// MARK: - Img
struct Img: Codable {
    let isRemote: Bool
    let wIdth, height, brightness: Int
    let url: String
}



enum NameEnum: String, Codable {
    case география = "География"
    case компании = "Компании"
    case люди = "Люди"
    case медиа = "Медиа"
    case продукты = "Продукты"
}



// MARK: - MediaRating
struct MediaRating: Codable {
    let current, mediaRatingDynamic: Int

    enum CodingKeys: String, CodingKey {
        case current
        case mediaRatingDynamic = "dynamic"
    }
}

// MARK: - Object
struct Object: Codable {
    let Id, objectType: Int
    let type2, fakeType, count: Int
    let url: String
    let name: [NameElement]
    let publishDate: String
    let publishHour: Int
}

// MARK: - NameElement
struct NameElement: Codable {
    let value, lang: String
}

// MARK: - Popularity
struct Popularity: Codable {
    let date: String
    let popularity: Int
}

// MARK: - TreeStat
struct TreeStat: Codable {
    let Id, type, count: Int
}


