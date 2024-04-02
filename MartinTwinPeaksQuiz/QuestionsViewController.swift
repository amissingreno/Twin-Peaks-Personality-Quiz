//
//  QuestionsViewController.swift
//  MartinTwinPeaksQuiz
//
//  Created by user200123 on 10/24/21.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    var questions: [Question] =
        [Question(text: "You are headed to the Double R Diner, what to you plan on doing there?",
                  answers: [Answer(text: "Ordering a cup of black coffee and some pie", answerType: .cooper),
                            Answer(text: "Order a big dinner, but really just there to spend time with the waitstaff", answerType: .ed),
                            Answer(text: "Pick up food to deliver for the Meals on Wheels Program", answerType: .laura),
                            Answer(text: "Listen to what my log has to say", answerType: .log)]),
         Question(text: "You are packing for a trip, what item do you absolutely HAVE to bring?",
                  answers: [Answer(text: "A flannel shirt", answerType: .ed),
                            Answer(text: "Your diary", answerType: .laura),
                            Answer(text: "Your log", answerType: .log),
                            Answer(text: "A tape recorder", answerType: .cooper)]),
         Question(text: "What's your idea of a fun Friday night?",
                  answers: [Answer(text: "Going to the Roadhouse and finding some people that really like to party.", answerType: .laura),
                            Answer(text: "Reading about the history of Washington State", answerType: .cooper),
                            Answer(text: "Channel messages from the dead", answerType: .log),
                            Answer(text: "Work on a car engine", answerType: .ed)]),
         Question(text: "What's your favorite flavor of gum?",
                  answers: [Answer(text: "Spicy pine", answerType: .log),
                            Answer(text: "Cherry", answerType: .ed),
                            Answer(text: "Black licorice", answerType: .cooper),
                            Answer(text: "Hot cinnamon", answerType: .laura)]),
         Question(text: "Are the owls what they seem?",
                  answers: [Answer(text: "I am unsure but determied to find out.", answerType: .cooper),
                            Answer(text: "Absolutely not.", answerType: .log),
                            Answer(text: "Who cares?", answerType: .laura),
                            Answer(text: "I don't know!", answerType: .ed)])
        ]
    
    var questionIndex = 0;
    var answerChosen: [Answer] = [];

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI();
        // Do any additional setup after loading the view.
    }

    func updateUI() {
        let currentQuestion = questions[questionIndex]
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)";
        questionProgressView.setProgress(totalProgress, animated: true)
        
        questionLabel.text = currentQuestion.text
        answer1Button.setTitle(questions[questionIndex].answers[0].text, for: .normal)
        answer2Button.setTitle(questions[questionIndex].answers[1].text, for: .normal)
        answer3Button.setTitle(questions[questionIndex].answers[2].text, for: .normal)
        answer4Button.setTitle(questions[questionIndex].answers[3].text, for: .normal)
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers;
        switch sender {
        case answer1Button:
            answerChosen.append(currentAnswer[0])
        case answer2Button:
            answerChosen.append(currentAnswer[1])
        case answer3Button:
            answerChosen.append(currentAnswer[2])
        case answer4Button:
            answerChosen.append(currentAnswer[3])
        default:
            break;
        }
        
        nextQuestion()
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answerChosen);
    }
    
}
