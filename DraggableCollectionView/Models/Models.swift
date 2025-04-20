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
    Profile(name: "Hostile", imageName: "placeholder"),
    Profile(name: "Disconnected", imageName: "placeholder"),
    Profile(name: "Deflective", imageName: "placeholder"),
    Profile(name: "Hypercritical", imageName: "placeholder"),
    Profile(name: "Controlling", imageName: "placeholder"),
    Profile(name: "Lies", imageName: "placeholder"),
    Profile(name: "Empathy", imageName: "placeholder"),
    Profile(name: "Communicates", imageName: "placeholder"),
    Profile(name: "Reciprocity", imageName: "placeholder"),
    Profile(name: "Supportive", imageName: "placeholder"),
    Profile(name: "Consistent with Words/Actions", imageName: "placeholder"),
    Profile(name: "Gives and takes feedback", imageName: "placeholder"),
    Profile(name: "Repairs after Conflict", imageName: "placeholder"),
    Profile(name: "Dependable", imageName: "placeholder"),
    Profile(name: "Honest", imageName: "placeholder"),
    Profile(name: "Respects boundaries", imageName: "placeholder"),
    Profile(name: "Transparent", imageName: "placeholder"),
    Profile(name: "Takes responsibility", imageName: "placeholder"),
    Profile(name: "Patient", imageName: "placeholder"),
    Profile(name: "Kind", imageName: "placeholder"),
    Profile(name: "Keeps confidences", imageName: "placeholder"),
    Profile(name: "Reliable", imageName: "placeholder"),
    Profile(name: "Validates feelings", imageName: "placeholder"),
    Profile(name: "Nonjudgmental", imageName: "placeholder"),
    Profile(name: "Considers others", imageName: "placeholder"),
    Profile(name: "Uplifting", imageName: "placeholder"),
    Profile(name: "Shows gratitude", imageName: "placeholder"),
    Profile(name: "Balances own needs with others", imageName: "placeholder"),
    Profile(name: "Shows Empathy", imageName: "placeholder"),
    Profile(name: "Is Introspective", imageName: "placeholder"),
    Profile(name: "Able to compromise", imageName: "placeholder"),
    Profile(name: "Active Listening", imageName: "placeholder"),
    Profile(name: "Tries to be fair", imageName: "placeholder"),
    Profile(name: "Occasionally withdraws", imageName: "placeholder"),
    Profile(name: "Needs prompting to share", imageName: "placeholder"),
    Profile(name: "Offers help when asked", imageName: "placeholder"),
    Profile(name: "Open but hesitant", imageName: "placeholder"),
    Profile(name: "Apologizes when prompted", imageName: "placeholder"),
    Profile(name: "Respects some boundaries", imageName: "placeholder"),
    Profile(name: "Present but distracted", imageName: "placeholder"),
    Profile(name: "Generally kind", imageName: "placeholder"),
    Profile(name: "Sometimes self-aware", imageName: "placeholder"),
    Profile(name: "Limited follow-through", imageName: "placeholder"),
    Profile(name: "Surface-level sharing", imageName: "placeholder"),
    Profile(name: "Reactive but regrets", imageName: "placeholder"),
    Profile(name: "Avoids conflict", imageName: "placeholder"),
    Profile(name: "Depends on mood", imageName: "placeholder"),
    Profile(name: "Over familiar", imageName: "placeholder"),
    Profile(name: "Not thoughtful", imageName: "placeholder"),
    Profile(name: "Isn't self-reflective", imageName: "placeholder"),
    Profile(name: "Avoids tough topics", imageName: "placeholder"),
    Profile(name: "Overpromises", imageName: "placeholder"),
    Profile(name: "Defensive", imageName: "placeholder"),
    Profile(name: "Inconsistent", imageName: "placeholder"),
    Profile(name: "Emotionally immature", imageName: "placeholder"),
    Profile(name: "Needs reminders for basic respect", imageName: "placeholder"),
    Profile(name: "Ignores subtle boundaries", imageName: "placeholder"),
    Profile(name: "Minimizes feelings", imageName: "placeholder"),
    Profile(name: "Distracted during conversations", imageName: "placeholder"),
    Profile(name: "Appears sincere but avoids depth", imageName: "placeholder"),
    Profile(name: "Over-apologizes without change", imageName: "placeholder"),
    Profile(name: "Needs control to feel secure", imageName: "placeholder"),
    Profile(name: "Rarely initiates repair", imageName: "placeholder"),
    Profile(name: "Gossips occasionally", imageName: "placeholder"),
    Profile(name: "Resents feedback", imageName: "placeholder"),
    Profile(name: "One-Sided", imageName: "placeholder"),
    Profile(name: "Gaslighting", imageName: "placeholder"),
    Profile(name: "Violates boundaries", imageName: "placeholder"),
    Profile(name: "Betrays confidences", imageName: "placeholder"),
    Profile(name: "Manipulative", imageName: "placeholder"),
    Profile(name: "Blames others", imageName: "placeholder"),
    Profile(name: "Intimidating", imageName: "placeholder"),
    Profile(name: "Dismissive", imageName: "placeholder"),
    Profile(name: "Two-faced", imageName: "placeholder"),
    Profile(name: "Jealous", imageName: "placeholder"),
    Profile(name: "Always the victim", imageName: "placeholder"),
    Profile(name: "Undermining", imageName: "placeholder"),
    Profile(name: "Shifts blame", imageName: "placeholder"),
    Profile(name: "Breaks promises", imageName: "placeholder"),
    Profile(name: "Publicly shames", imageName: "placeholder"),
    Profile(name: "Emotionally explosive", imageName: "placeholder")
]


var trusts = [
    "Consistent with Words/Actions",
    "Supportive",
    "Reciprocity",
    "Gives and takes feedback",
    "Repairs after Conflict",
    "Dependable",
    "Honest",
    "Respects boundaries",
    "Transparent",
    "Takes responsibility",
    "Patient",
    "Kind",
    "Keeps confidences",
    "Reliable",
    "Validates feelings",
    "Nonjudgmental",
    "Considers others",
    "Uplifting",
    "Shows gratitude",
    "Balances own needs with others",

    // Semi-Trustworthy
    "Shows Empathy",
    "Is Introspective",
    "Able to compromise",
    "Communicates",
    "Active Listening",
    "Tries to be fair",
    "Occasionally withdraws",
    "Needs prompting to share",
    "Offers help when asked",
    "Open but hesitant",
    "Apologizes when prompted",
    "Respects some boundaries",
    "Present but distracted",
    "Generally kind",
    "Sometimes self-aware",
    "Limited follow-through",
    "Surface-level sharing",
    "Reactive but regrets",
    "Avoids conflict",
    "Depends on mood",

    // Semi-Untrustworthy
    "Over familiar",
    "Disconnected",
    "Deflective",
    "Not thoughtful",
    "Isn't self-reflective",
    "Avoids tough topics",
    "Overpromises",
    "Defensive",
    "Inconsistent",
    "Emotionally immature",
    "Needs reminders for basic respect",
    "Ignores subtle boundaries",
    "Minimizes feelings",
    "Distracted during conversations",
    "Appears sincere but avoids depth",
    "Over-apologizes without change",
    "Needs control to feel secure",
    "Rarely initiates repair",
    "Gossips occasionally",
    "Resents feedback",

    // Untrustworthy
    "Hypercritical",
    "Hostile",
    "Controlling",
    "One-Sided",
    "Lies",
    "Gaslighting",
    "Violates boundaries",
    "Betrays confidences",
    "Manipulative",
    "Blames others",
    "Intimidating",
    "Dismissive",
    "Two-faced",
    "Jealous",
    "Always the victim",
    "Undermining",
    "Shifts blame",
    "Breaks promises",
    "Publicly shames",
    "Emotionally explosive"
]

let cards: [TrustCard] = [
    // Trustworthy
    TrustCard(
        title: "Consistent with Words/Actions",
        description: "Ensures that actions align with words and commitments, building a strong foundation of trust.",
        color: UIColor(red: 0.26, green: 0.6, blue: 0.88, alpha: 1.0)
    ),
    TrustCard(
        title: "Supportive",
        description: "Provides encouragement and assistance, fostering a positive and dependable relationship.",
        color: UIColor(red: 0.28, green: 0.73, blue: 0.47, alpha: 1.0)
    ),
    TrustCard(
        title: "Reciprocity",
        description: "Engages in mutually beneficial exchanges, showing fairness and balance in relationships.",
        color: UIColor(red: 0.93, green: 0.54, blue: 0.21, alpha: 1.0)
    ),
    TrustCard(
        title: "Gives and takes feedback",
        description: "Willing to provide and accept constructive feedback, promoting growth and improvement.",
        color: UIColor(red: 0.62, green: 0.48, blue: 0.92, alpha: 1.0)
    ),
    TrustCard(
        title: "Repairs after Conflict",
        description: "Takes steps to address and resolve conflicts, showing a commitment to maintaining trust.",
        color: UIColor(red: 0.96, green: 0.4, blue: 0.4, alpha: 1.0)
    ),
    TrustCard(
        title: "Dependable",
        description: "Can be relied upon to keep promises and fulfill responsibilities.",
        color: UIColor(red: 0.34, green: 0.67, blue: 0.67, alpha: 1.0)
    ),
    TrustCard(
        title: "Honest",
        description: "Consistently tells the truth and avoids deception.",
        color: UIColor(red: 0.36, green: 0.55, blue: 0.88, alpha: 1.0)
    ),
    TrustCard(
        title: "Respects boundaries",
        description: "Acknowledges and upholds personal and emotional boundaries.",
        color: UIColor(red: 0.45, green: 0.76, blue: 0.55, alpha: 1.0)
    ),
    TrustCard(
        title: "Transparent",
        description: "Open and candid in communication, avoiding hidden motives.",
        color: UIColor(red: 0.41, green: 0.62, blue: 0.85, alpha: 1.0)
    ),
    TrustCard(
        title: "Takes responsibility",
        description: "Acknowledges mistakes and works to make amends.",
        color: UIColor(red: 0.96, green: 0.4, blue: 0.4, alpha: 1.0)
    ),
    TrustCard(
        title: "Patient",
        description: "Exhibits calmness and understanding, even in challenging situations.",
        color: UIColor(red: 0.75, green: 0.85, blue: 0.35, alpha: 1.0)
    ),
    TrustCard(
        title: "Kind",
        description: "Demonstrates compassion and care for others.",
        color: UIColor(red: 0.92, green: 0.5, blue: 0.62, alpha: 1.0)
    ),
    TrustCard(
        title: "Keeps confidences",
        description: "Maintains the privacy of shared information.",
        color: UIColor(red: 0.56, green: 0.72, blue: 0.89, alpha: 1.0)
    ),
    TrustCard(
        title: "Reliable",
        description: "Fulfills commitments and can be counted on.",
        color: UIColor(red: 0.28, green: 0.73, blue: 0.47, alpha: 1.0)
    ),
    TrustCard(
        title: "Validates feelings",
        description: "Acknowledges and respects the emotions of others.",
        color: UIColor(red: 0.54, green: 0.72, blue: 0.89, alpha: 1.0)
    ),
    TrustCard(
        title: "Nonjudgmental",
        description: "Refrains from making harsh judgments about others.",
        color: UIColor(red: 0.88, green: 0.64, blue: 0.36, alpha: 1.0)
    ),
    TrustCard(
        title: "Considers others",
        description: "Takes the feelings and needs of others into account.",
        color: UIColor(red: 0.45, green: 0.76, blue: 0.55, alpha: 1.0)
    ),
    TrustCard(
        title: "Uplifting",
        description: "Provides encouragement and positivity.",
        color: UIColor(red: 0.92, green: 0.5, blue: 0.62, alpha: 1.0)
    ),
    TrustCard(
        title: "Shows gratitude",
        description: "Expresses appreciation for others and their actions.",
        color: UIColor(red: 0.88, green: 0.64, blue: 0.36, alpha: 1.0)
    ),
    TrustCard(
        title: "Balances own needs with others",
        description: "Maintains a healthy balance between personal needs and considering others.",
        color: UIColor(red: 0.56, green: 0.72, blue: 0.89, alpha: 1.0)
    ),

    // Semi-Trustworthy
    TrustCard(
        title: "Shows Empathy",
        description: "Demonstrates understanding and compassion, but may not always act consistently.",
        color: UIColor(red: 0.87, green: 0.72, blue: 0.53, alpha: 1.0)
    ),
    TrustCard(
        title: "Is Introspective",
        description: "Occasionally reflects on their thoughts and actions, fostering personal growth.",
        color: UIColor(red: 0.72, green: 0.82, blue: 0.55, alpha: 1.0)
    ),
    TrustCard(
        title: "Able to compromise",
        description: "Willing to find middle ground, but may require external prompting at times.",
        color: UIColor(red: 0.56, green: 0.67, blue: 0.86, alpha: 1.0)
    ),
    // Add other Semi-Trustworthy attributes...

    // Semi-Untrustworthy
    TrustCard(
        title: "Over familiar",
        description: "Acts too casually or ignores boundaries, leading to discomfort or mistrust.",
        color: UIColor(red: 0.85, green: 0.65, blue: 0.65, alpha: 1.0)
    ),
    TrustCard(
        title: "Disconnected",
        description: "Appears detached or uninterested, making consistent trust harder to establish.",
        color: UIColor(red: 0.72, green: 0.61, blue: 0.85, alpha: 1.0)
    ),
    TrustCard(
        title: "Deflective",
        description: "Avoids addressing issues directly, which can hinder trust-building.",
        color: UIColor(red: 0.96, green: 0.78, blue: 0.4, alpha: 1.0)
    ),
    // Add other Semi-Untrustworthy attributes...

    // Untrustworthy
    TrustCard(
        title: "Hypercritical",
        description: "Excessively critical and judgmental, damaging trust and self-esteem.",
        color: UIColor(red: 0.9, green: 0.3, blue: 0.3, alpha: 1.0)
    ),
    TrustCard(
        title: "Hostile",
        description: "Expresses aggression or animosity, creating an unsafe and untrustworthy environment.",
        color: UIColor(red: 0.75, green: 0.22, blue: 0.35, alpha: 1.0)
    ),
    TrustCard(
        title: "Controlling",
        description: "Seeks to dominate or manipulate others, violating trust and autonomy.",
        color: UIColor(red: 0.6, green: 0.2, blue: 0.4, alpha: 1.0)
    ),
    // Add other Untrustworthy attributes...
]
