//
//  Friend.swift
//  MoodTracker-starter
//
//  Created by Carlos Diez on 11/4/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import Foundation

enum Mood: String {
    case happy = "😁"
    case medium = "😐"
    case angry = "😤"
}

class Friend {
    let name: String
    var mood: Mood
    
    init(name: String, mood: Mood) {
        self.name = name
        self.mood = mood
    }
    
    static func getDescription(mood: Mood) -> String {
        switch mood {
        case .happy:
            return "Great day!"
        case .medium:
            return "Meh."
        case .angry:
            return "Get off my lawn!!!"
        }
    }
}
