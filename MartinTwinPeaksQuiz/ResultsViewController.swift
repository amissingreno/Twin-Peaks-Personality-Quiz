//
//  ResultsViewController.swift
//  MartinTwinPeaksQuiz
//
//  Created by user200123 on 10/24/21.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Answer];

    @IBOutlet weak var resultsAnswerLabel: UILabel!
    @IBOutlet weak var resultsDefinitionLabel: UILabel!
    @IBOutlet weak var resultsImage: UIImageView!
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses;
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true;
        calculateResults()
    }
    
    func calculateResults() {
        let frequencyOfAnswers = responses.reduce(into: [TwinPeaksCharacter: Int]()) {
            (counts, answer)  in
            if let existingCount  = counts[answer.answerType] {
                counts[answer.answerType] = existingCount + 1
            } else {
                counts[answer.answerType] = 1
            }
        }
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) in return pair1.value > pair2.value});
        let mostCommonAnswer = frequentAnswersSorted.sorted {$0.1 > $1.1}.first!.key;
        
        resultsAnswerLabel.text = "\(mostCommonAnswer.rawValue)!";
        resultsImage.image = UIImage(named: mostCommonAnswer.rawValue)
        resultsDefinitionLabel.text = mostCommonAnswer.definition;
    }

}
