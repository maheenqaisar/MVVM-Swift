//
//  QuestionModel.swift
//  MVVM-Swift
//
//  Created by Maheen on 07/05/2023.
//

import Foundation

struct DataModel: Codable {
    var data: QuestionModel?
}

struct QuestionModel: Codable {
    var questions: [Questions]?
}

struct Questions: Codable {
    var question: String?
    var answer: String?
}
