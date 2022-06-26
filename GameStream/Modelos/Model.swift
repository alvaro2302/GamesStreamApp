//
//  Model.swift
//  GameStream
//
//  Created by Alvaro Cuiza on 8/6/22.
//

import Foundation



struct Games:Codable{
    var games:[Game]
}
//{
//    "title": "The Witcher 3: Wild Hunt",
//    "studio": "CD Project Red",
//    "contentRaiting": "M",
//    "publicationYear": "2015",
//    "description": "As war rages on throughout the Northern Realms, you take on the greatest contract of your life — tracking down the Child of Prophecy, a living weapon that can alter the shape of the world.",
//    "platforms": [
//      "PC",
//      "Playstation 4",
//      "Xbox One"
//    ],
//    "tags": [
//      "RPG",
//      "Action",
//      "Open World"
//    ],
//    "videosUrls": {
//      "mobile": "https://dl.dropboxusercontent.com/s/k6g0zwmsxt9qery/TheWitcher480.mp4",
//      "tablet": "https://dl.dropboxusercontent.com/s/9faic5dtebavp1o/TheWitcherMax.mp4"
//    },
//    "galleryImages": [
//      "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_107600c1337accc09104f7a8aa7f275f23cad096.600x338.jpg",
//      "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_ed23139c916fdb9f6dd23b2a6a01d0fbd2dd1a4f.600x338.jpg",
//      "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_908485cbb1401b1ebf42e3d21a860ddc53517b08.600x338.jpg"
//    ]
//}

struct Resultados:Codable{
    var results:[Game]
}
struct Game:Codable,Hashable{
    var title:String
    var studio:String
    var contentRaiting:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:VideoUrl
    var galleryImages:[String]
}

struct VideoUrl:Codable,Hashable{
    var mobile:String
    var tablet:String
}

struct Results:Codable,Hashable{
    var Games:[Game]
}
