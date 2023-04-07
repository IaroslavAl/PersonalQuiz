//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Iaroslav Beldin on 07.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var smileLabel: UILabel!
    @IBOutlet var animalNameLabel: UILabel!
    
    var answersChosen: [Answer] = []
    
    private var animalCount: [Animal: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        smileLabel.text = identifyWhichAnimal().0
        animalNameLabel.text = identifyWhichAnimal().1
        
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
    }
    
    private func identifyWhichAnimal() -> (String, String) {
        let animal: Animal
        let animalLabel: (String, String)
        
        for answer in answersChosen {
            animalCount[answer.animal, default: 0] += 1
        }
        
        animal = animalCount.filter { $0.value == animalCount.values.max() }.keys.first!
        
        switch animal {
        case .dog:
            animalLabel = ("Вы - 🐶!", animal.definition)
        case .cat:
            animalLabel = ("Вы - 🐱!", animal.definition)
        case .rabbit:
            animalLabel = ("Вы - 🐰!", animal.definition)
        case .turtle:
            animalLabel = ("Вы - 🐢!", animal.definition)
        }
        
        return animalLabel
    }
}
