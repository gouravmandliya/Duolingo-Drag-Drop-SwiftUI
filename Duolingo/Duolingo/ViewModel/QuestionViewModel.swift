//
//  QuestionViewModel.swift
//  Duolingo
//
//  Created by GOURAVM on 22/08/22.
//

import SwiftUI

class QuestionViewModel:NSObject, ObservableObject {
    
    @Published var progress : CGFloat = 0
    @Published var characters: [Word] = [Word(value: "Vijay"),
               Word(value: "is"),
               Word(value: "playing"),
               Word(value: "football"),
               Word(value: "since"),
               Word(value: "morning.")]
    
    @Published var shuffledRows: [[Word]] = []
    @Published var rows: [[Word]] = []
    
    @Published var animateWrongText = false
    @Published var droppedCount: CGFloat = 0
 
    func generateGrid() -> [[Word]] {
        for item in  characters.enumerated() {
            let textSize = textSize(character: item.element)
            characters[item.offset].textSize = textSize
        }
        var gridArray: [[Word]] = []
        var tempArray: [Word] = []
        var currentWidth: CGFloat = 0
        let totalScreenWidth:CGFloat = CGFloat(UIScreen.main.bounds.width - 30)
        
        for character in characters {
            currentWidth += character.textSize
            
            if currentWidth < totalScreenWidth {
                tempArray.append(character)
                
            }else {
                gridArray.append(tempArray)
                tempArray = []
                currentWidth = character.textSize
                tempArray.append(character)
            }
        }
        
        if !tempArray.isEmpty {
            gridArray.append(tempArray)
        }
        
        return gridArray
        
    }
    func textSize(character:Word) -> CGFloat {
        let font = UIFont.systemFont(ofSize: character.fontSize)
        let attributes = [NSAttributedString.Key.font : font]
        let size = (character.value as NSString).size(withAttributes: attributes)
        
        return size.width + (character.padding * 2) + 15
    }
    
    func shuffleArray() {
        if rows.isEmpty {
            rows =  generateGrid()
            characters =  characters.shuffled()
            shuffledRows =  generateGrid()
        }
    }
    
    func updateSuffledArray(character:Word) {
        for index in shuffledRows.indices {
            for subIndex in shuffledRows[index].indices {
                if shuffledRows[index][subIndex].id == character.id {
                    shuffledRows[index][subIndex].isShowing = true
                }
            }
        }
    }
}
