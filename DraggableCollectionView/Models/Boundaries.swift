import UIKit

struct Boundary {
    enum BoundaryType: String {
        case emotional = "Emotional"
        case time = "Time"
        case intellectual = "Intellectual"
        case physical = "Physical"
        case material = "Material"
        case sexual = "Sexual"
        case relationalSocial = "Relational/Social"
    }
    
    let type: BoundaryType
    let description: String
    var status: String?
}

struct BoundaryData {
    static let boundaries: [Boundary] = [
        // Emotional Boundaries
        Boundary(type: .emotional,
                 description: "I can say 'I’m not ready to talk about that.'",
                 status: nil),
        Boundary(type: .emotional,
                 description: "I don’t owe emotional access to anyone who has harmed me.",
                 status: nil),
        Boundary(type: .emotional,
                 description: "I can express emotions without defending them.", status: nil),
        Boundary(type: .emotional,
                 description: "I can disconnect emotionally from toxic relationships.", status: nil),
        Boundary(type: .emotional,
                 description: "I can prioritize healing over someone else’s discomfort.", status: nil),

        // Time Boundaries
        Boundary(type: .time,
                 description: "I don’t have to answer calls or texts right away.",
                 status: nil),
        Boundary(type: .time,
                 description: "I can say no to time-intensive requests.", status: nil),
        Boundary(type: .time,
                 description: "I can schedule rest or alone time without guilt.",
                 status: nil),
        Boundary(type: .time,
                 description: "I can decline last-minute plans.",
                 status: nil),
        Boundary(type: .time,
                 description: "I can prioritize tasks that align with my values.",
                 status: nil),

        // Intellectual Boundaries
        Boundary(type: .intellectual,
                 description: "I don’t have to debate my beliefs.",
                 status: nil),
        Boundary(type: .intellectual,
                 description: "I can end a conversation when it becomes disrespectful.",
                 status: nil),
        Boundary(type: .intellectual,
                 description: "I can disengage from unsafe conversations.",
                 status: nil),
        Boundary(type: .intellectual,
                 description: "I can withhold personal thoughts when I don’t feel safe.",
                 status: nil),
        Boundary(type: .intellectual,
                 description: "I don’t have to accept unsolicited feedback.",
                 status: nil),

        // Physical Boundaries
        Boundary(type: .physical,
                 description: "I can say no to physical contact.",
                 status: nil),
        Boundary(type: .physical,
                 description: "I can move away if I feel unsafe.",
                 status: nil),
        Boundary(type: .physical,
                 description: "I decide who enters my personal space.",
                 status: nil),
        Boundary(type: .physical,
                 description: "I can dress how I want without explanation.",
                 status: nil),
        Boundary(type: .physical,
                 description: "I don’t have to tolerate yelling or aggression.",
                 status: nil),

        // Material Boundaries
        Boundary(type: .material,
                 description: "I can say no to lending money or belongings.",
                 status: nil),
        Boundary(type: .material,
                 description: "I can protect my possessions and resources.",
                 status: nil),
        Boundary(type: .material,
                 description: "I don’t have to justify my spending.",
                 status: nil),
        Boundary(type: .material,
                 description: "I decide how I want to give, if at all.",
                 status: nil),
        Boundary(type: .material,
                 description: "I don’t owe financial support to anyone.",
                 status: nil),

        // Sexual Boundaries
        Boundary(type: .sexual,
                 description: "I can say no at any point, for any reason.",
                 status: nil),
        Boundary(type: .sexual,
                 description: "I can change my mind, even after saying yes.",
                 status: nil),
        Boundary(type: .sexual,
                 description: "I can communicate what I need for safety.",
                 status: nil),
        Boundary(type: .sexual,
                 description: "I don’t owe sex to anyone.",
                 status: nil),
        Boundary(type: .sexual,
                 description: "I decide what kind of intimacy is right for me.",
                 status: nil),

        // Relational/Social Boundaries
        Boundary(type: .relationalSocial,
                 description: "I choose who I allow into my life.",
                 status: nil),
        Boundary(type: .relationalSocial,
                 description: "I can limit access to my personal life.",
                 status: nil),
        Boundary(type: .relationalSocial,
                 description: "I can end conversations that feel draining.",
                 status: nil),
        Boundary(type: .relationalSocial,
                 description: "I don’t have to maintain toxic relationships.",
                 status: nil),
        Boundary(type: .relationalSocial,
                 description: "I can keep relationships private if I choose.",
                 status: nil)
    ]
}
