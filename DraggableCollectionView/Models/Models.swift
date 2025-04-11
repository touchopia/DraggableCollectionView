//
//  Models.swift
//  TinderSwiper
//
//  Created by Phil Wright on 4/7/25.
//

import UIKit

struct Profile {
    let name: String
    let imageName: String
}

let sampleProfiles = [
    Profile(name: "Hostile", imageName: "profile1"),
    Profile(name: "Disconnected", imageName: "profile2"),
    Profile(name: "Deflective", imageName: "profile3"),
    Profile(name: "Hypercritical", imageName: "profile4"),
    Profile(name: "Controlling", imageName: "profile5"),
    Profile(name: "Lies", imageName: "profile6"),
    Profile(name: "Empathy", imageName: "profile7"),
    Profile(name: "Communicates", imageName: "profile8"),
    Profile(name: "Reciprocity", imageName: "profile9"),
    Profile(name: "Supportive", imageName: "profile10")
]

var trusts = [
    "Consistent with Words/Actions",
    "Supportive",
    "Reciprocity",
    "Gives and takes feedback",
    "Repairs after Conflict",
    "Shows Empathy",
    "Is Introspective",
    "Able to compromise",
    "Communicates",
    "Active Listening",
    "Over familiar",
    "Disconnected",
    "Deflective",
    "Not thoughtful",
    "Isn't self-relective",
    "Hypercritical",
    "Hostile",
    "Controlling",
    "One-Sided",
    "Lies"
]


let cards: [TrustCard] = [
    TrustCard(
        title: "Honesty",
        description: "Honesty means consistently telling the truth and avoiding deception. Honest individuals communicate truthfully and transparently, even when it's difficult.",
        color: UIColor(red: 0.26, green: 0.6, blue: 0.88, alpha: 1.0)
    ),
    TrustCard(
        title: "Reliability",
        description: "Reliability is about being dependable and consistent. Reliable people fulfill their commitments and can be counted on to do what they say they will do.",
        color: UIColor(red: 0.28, green: 0.73, blue: 0.47, alpha: 1.0)
    ),
    TrustCard(
        title: "Competence",
        description: "Competence refers to having the skills, knowledge, and ability to perform tasks effectively. Competent individuals demonstrate capability in their area of expertise.",
        color: UIColor(red: 0.93, green: 0.54, blue: 0.21, alpha: 1.0)
    ),
    TrustCard(
        title: "Integrity",
        description: "Integrity involves adhering to strong moral principles and ethical standards. People with integrity act in accordance with their values even when no one is watching.",
        color: UIColor(red: 0.62, green: 0.48, blue: 0.92, alpha: 1.0)
    ),
    TrustCard(
        title: "Accountability",
        description: "Accountability means taking responsibility for one's actions and their consequences. Accountable individuals admit mistakes and work to make things right.",
        color: UIColor(red: 0.96, green: 0.4, blue: 0.4, alpha: 1.0)
    )
]
