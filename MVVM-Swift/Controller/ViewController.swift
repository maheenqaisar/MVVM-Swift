//
//  ViewController.swift
//  MVVM-Swift
//
//  Created by Maheen on 07/05/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var viewModel = QuestionViewModel()
    var questionData: DataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.GetAllTheQuestions {
            self.questionData = self.viewModel.questionModel
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionData?.data?.questions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = questionData?.data?.questions?[indexPath.row].question
        cell?.detailTextLabel?.text = questionData?.data?.questions?[indexPath.row].answer
        return cell!
    }

}

