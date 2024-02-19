//
//  MovieData.swift
//  URLSession-Practice
//
//  Created by EUNJU on 2/19/24.
//

import Foundation

struct MovieInformation: Decodable {
    let movieInformationResult: MovieInformationResult
}

struct MovieInformationResult: Decodable {
    let detailMovieInformation: DetailMovieInformation
    let source: String
}

struct DetailMovieInformation: Decodable {
    let movieCode: String
    let movieName: String
    let movieEnglishName: String
    let movieOriginalName: String
    let showTime: String
    let productYear: String
    let openDate: String
    let productStatus: String
    let typeName: String
    let nations: [Nation]
    let genres: [Genre]
    let directors: [Director]
    let actors: [Actor]
    let showTypes: [ShowType]
    let companys: [Company]
    let audits: [Audit]
    let staffs: [Staff]
}

struct Actor: Decodable {
    let name: String
    let englishName: String
    let cast: String
    let englishCast: String
}

struct Audit: Decodable {
    let auditNumber: String
    let watchGrade: String
}

struct Company: Decodable {
    let code: String
    let name: String
    let englishName: String
    let partName: String
}

struct Director: Decodable {
    let name: String
    let englishName: String
}

struct Genre: Decodable {
    let name: String
}

struct Nation: Decodable {
    let name: String
}

struct ShowType: Decodable {
    let groupName: String
    let name: String
}

struct Staff: Decodable {
    let name: String
    let englishName: String
    let roleName: String
}

// MARK: - Codingkeys
extension MovieInformation {
    enum CodingKeys: String, CodingKey {
        case movieInformationResult = "movieInfoResult"
    }
}

extension MovieInformationResult {
    enum CodingKeys: String, CodingKey {
        case detailMovieInformation = "movieInfo"
        case source
    }
}

extension DetailMovieInformation {
    enum CodingKeys: String, CodingKey {
        case movieCode = "movieCd"
        case movieName = "movieNm"
        case movieEnglishName = "movieNmEn"
        case movieOriginalName = "movieNmOg"
        case showTime = "showTm"
        case productYear = "prdtYear"
        case openDate = "openDt"
        case productStatus = "prdtStatNm"
        case typeName = "typeNm"
        case nations, genres, directors, actors, showTypes, companys, audits, staffs
    }
}

extension Actor {
    enum CodingKeys: String, CodingKey {
        case name = "peopleNm"
        case englishName = "peopleNmEn"
        case englishCast = "castEn"
        case cast
    }
}

extension Audit {
    enum CodingKeys: String, CodingKey {
        case auditNumber = "auditNo"
        case watchGrade = "watchGradeNm"
    }
}

extension Company {
    enum CodingKeys: String, CodingKey {
        case code = "companyCd"
        case name = "companyNm"
        case englishName = "companyNmEn"
        case partName = "companyPartNm"
    }
}

extension Director {
    enum CodingKeys: String, CodingKey {
        case name = "peopleNm"
        case englishName = "peopleNmEn"
    }
}

extension Genre {
    enum CodingKeys: String, CodingKey {
        case name = "genreNm"
    }
}

extension Nation {
    enum CodingKeys: String, CodingKey {
        case name = "nationNm"
    }
}

extension ShowType {
    enum CodingKeys: String, CodingKey {
        case groupName = "showTypeGroupNm"
        case name = "showTypeNm"
    }
}

extension Staff {
    enum CodingKeys: String, CodingKey {
        case name = "peopleNm"
        case englishName = "peopleNmEn"
        case roleName = "staffRoleNm"
    }
}
