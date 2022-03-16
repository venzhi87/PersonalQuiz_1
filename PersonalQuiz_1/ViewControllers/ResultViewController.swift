//
//  ResultViewController.swift
//  PersonalQuiz_1
//
//  Created by Pavel Kuzovlev on 15.03.2022.
//

import UIKit



class ResultViewController: UIViewController {
    
    // 1. Передать массив с ответами на экран с результатами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соответствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    private func updateResult() {
        var countOfAnimals: [Animal: Int] = [:]
        let animals = responses.map { $0.animal}
        
        
        for animal in animals {
            countOfAnimals[animal] = (countOfAnimals[animal] ?? 0) + 1
        }
        let sortedCountOfAnimals = countOfAnimals.sorted { $0.value > $1.value }
        guard let mostCountAnimal = sortedCountOfAnimals.first?.key else { return }
        
    }
    
    private func updateUI(with animal: Animal) {
        resultAnswerLabel.text = "Ты - \(animal.rawValue)"
        resultDefinitionLabel.text = "\(animal.definition)"
    }
    
}
