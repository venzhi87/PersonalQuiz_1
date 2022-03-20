//
//  ResultViewController.swift
//  PersonalQuiz_1
//
//  Created by Pavel Kuzovlev on 15.03.2022.
//

import UIKit



class ResultViewController: UIViewController {
    
    @IBOutlet var resultTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    private func updateResult() {
        var frequencyOfAnimals: [Animal: Int] = [:]
//        var animals: [Animal] = []
//        for answer in answers {
//            animals.append(answer.animal)
//        }
        let animals = answers.map { $0.animal}
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: Animal?) {
        resultTypeLabel.text = "Ты - \(animal?.rawValue ?? "🐶")!"
        descriptionLabel.text = animal?.definition ?? ""
    }
    
}
