//
//  QuestionViewModel.swift
//  MVVM-Swift
//
//  Created by Maheen on 07/05/2023.
//

import Foundation

class QuestionViewModel {
    
    private var sourceURL = URL(string:"https://samplequestionquiz-default-rtdb.firebaseio.com/QuestionSample.json")!
    
    var questionModel: DataModel?
    
    func GetAllTheQuestions(completion: @escaping () ->()) {
        URLSession.shared.dataTask(with: sourceURL) {
            [weak self] (data, response, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let finalModel = try! jsonDecoder.decode(DataModel.self, from: data)
                self?.questionModel = finalModel
                //print(finalModel)
                completion()
            }
        }.resume()
    }
}
