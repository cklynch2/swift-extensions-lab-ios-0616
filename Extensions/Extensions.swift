//
//  Extensions.swift
//  Extensions
//
//  Created by Flatiron School on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

extension String {
    func whisper() -> String {
        return self.lowercaseString
    }
    
    func shout() -> String {
        return self.uppercaseString
    }
    
    // Note: This doesn't deal with punctuation!
    var pigLatin : String {
        let words = self.componentsSeparatedByString(" ")
        var pigLatinResult = ""
        
        for word in words {
            
            // For words containing mutliple letters, do the pig latin translation:
            if word.characters.count > 1 {
                var pigLatinWord = word
                
                // Account for capitalized words by turning into lowercase and then capitalizing again once the first letter has been moved to the back:
                if word == word.capitalizedString {
                    pigLatinWord = word.lowercaseString
                    let firstLetter = pigLatinWord.removeAtIndex(pigLatinWord.startIndex)
                    pigLatinWord = pigLatinWord.capitalizedString
                    pigLatinWord.appendContentsOf("\(firstLetter)ay")
                    pigLatinResult.appendContentsOf("\(pigLatinWord) ")
                
                } else {
                    let firstLetter = pigLatinWord.removeAtIndex(pigLatinWord.startIndex)
                    pigLatinWord.appendContentsOf("\(firstLetter)ay")
                    pigLatinResult.appendContentsOf("\(pigLatinWord) ")
                }
            
            // For words of a single letter, do nothing:
            } else {
                pigLatinResult.appendContentsOf("\(word) ")
            }
        }
        return pigLatinResult
    }
    
    /*
    Create an Int extension computed property for the String class called points:
        Should calculate the amount of points a given string has
        1 point for consonants and 2 points for vowels
        Ignores spaces and numbers, returns zero for empty strings
    */
    
    
    // This does NOT count y's properly. Y should only be counted as a vowel if there are no other vowels in the word. However, the tests are written in a way that doesn't make this distinction.
    var points : Int {
        let noLetters = NSCharacterSet.alphanumericCharacterSet().invertedSet
        let justLetters = self.componentsSeparatedByCharactersInSet(noLetters).joinWithSeparator("")
        
        var points = 0
        
        for letter in justLetters.characters {
            switch letter {
            case "A", "E", "I", "O", "U", "Y", "a", "e", "i", "o", "u", "y":
                points += 2
            default:
                points += 1
            }
        }
        return points
    }
    
    var unicornLevel : String {
        var characterCount = 0
        var unicorns = ""
        let noSpaces = self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).joinWithSeparator("")
        
        while characterCount < noSpaces.characters.count {
            unicorns.appendContentsOf("\u{1f984}")
            characterCount += 1
        }
        return unicorns
    }
}

extension Int {
    func half() -> Int {
        return self/2
    }
    
    func isDivisibleBy(number: Int) -> Bool {
        return self % number == 0
    }
    
    var squared : Int {
        return self * self
    }
    
    var halved : Int {
        return self.half()
    }
    
}