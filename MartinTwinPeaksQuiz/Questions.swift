//
//  Questions.swift
//  MartinTwinPeaksQuiz
//
//  Created by user200123 on 10/24/21.
//

import Foundation


struct Question {
    var text: String;
    var answers: [Answer];
}

struct Answer {
    var text: String;
    var answerType: TwinPeaksCharacter;
}

enum TwinPeaksCharacter: String {
    case cooper = "Agent Cooper", laura = "Laura Palmer", ed = "Big Ed Hurley", log = "The Log Lady"
    
    var definition: String {
        switch self {
        case .cooper:
            return "The simple things in life really appeal to you. You are intelligent and inquisitive, yet almost to a fault. That sort of fearlessness can lead you into some scary and perhaps, otherworldly, situations.";
        case .laura:
            return "During the day, you are a model citizen, helping where you can and excelling in all that you do. The lack of satisfaction that comes with that makes you seek out new experiences after dark... You are not afraid to try new things, even if there is a fair amount of danger involved!";
        case .ed:
            return "Your ideal job is working with your hands and owning your business. You have a big heart and care deeply for those you love. Unfortunately, guilt drives your decisions and that choice isn't always the best for anyone involved.";
        case .log:
            return "Mystery and vagueness surround you. People may think you're weird, but you are really just deeply attached to your past. You speak a language built for your understanding and expect others to be smart enough to make sense of it.";
        }
    }
}
