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
    let example: String
    var status: String?
}

struct BoundaryData {
    static let boundaries: [Boundary] = [
        // Emotional Boundaries
        Boundary(type: .emotional, example: "I can say 'I’m not ready to talk about that.'", status: nil),
        Boundary(type: .emotional, example: "I don’t owe emotional access to anyone who has harmed me.", status: nil),
        Boundary(type: .emotional, example: "I can express emotions without defending them.", status: nil),
        Boundary(type: .emotional, example: "I can disconnect emotionally from toxic relationships.", status: nil),
        Boundary(type: .emotional, example: "I can prioritize healing over someone else’s discomfort.", status: nil),

        // Time Boundaries
        Boundary(type: .time, example: "I don’t have to answer calls or texts right away.", status: nil),
        Boundary(type: .time, example: "I can say no to time-intensive requests.", status: nil),
        Boundary(type: .time, example: "I can schedule rest or alone time without guilt.", status: nil),
        Boundary(type: .time, example: "I can decline last-minute plans.", status: nil),
        Boundary(type: .time, example: "I can prioritize tasks that align with my values.", status: nil),

        // Intellectual Boundaries
        Boundary(type: .intellectual, example: "I don’t have to debate my beliefs.", status: nil),
        Boundary(type: .intellectual, example: "I can end a conversation when it becomes disrespectful.", status: nil),
        Boundary(type: .intellectual, example: "I can disengage from unsafe conversations.", status: nil),
        Boundary(type: .intellectual, example: "I can withhold personal thoughts when I don’t feel safe.", status: nil),
        Boundary(type: .intellectual, example: "I don’t have to accept unsolicited feedback.", status: nil),

        // Physical Boundaries
        Boundary(type: .physical, example: "I can say no to physical contact.", status: nil),
        Boundary(type: .physical, example: "I can move away if I feel unsafe.", status: nil),
        Boundary(type: .physical, example: "I decide who enters my personal space.", status: nil),
        Boundary(type: .physical, example: "I can dress how I want without explanation.", status: nil),
        Boundary(type: .physical, example: "I don’t have to tolerate yelling or aggression.", status: nil),

        // Material Boundaries
        Boundary(type: .material, example: "I can say no to lending money or belongings.", status: nil),
        Boundary(type: .material, example: "I can protect my possessions and resources.", status: nil),
        Boundary(type: .material, example: "I don’t have to justify my spending.", status: nil),
        Boundary(type: .material, example: "I decide how I want to give, if at all.", status: nil),
        Boundary(type: .material, example: "I don’t owe financial support to anyone.", status: nil),

        // Sexual Boundaries
        Boundary(type: .sexual, example: "I can say no at any point, for any reason.", status: nil),
        Boundary(type: .sexual, example: "I can change my mind, even after saying yes.", status: nil),
        Boundary(type: .sexual, example: "I can communicate what I need for safety.", status: nil),
        Boundary(type: .sexual, example: "I don’t owe sex to anyone.", status: nil),
        Boundary(type: .sexual, example: "I decide what kind of intimacy is right for me.", status: nil),

        // Relational/Social Boundaries
        Boundary(type: .relationalSocial, example: "I choose who I allow into my life.", status: nil),
        Boundary(type: .relationalSocial, example: "I can limit access to my personal life.", status: nil),
        Boundary(type: .relationalSocial, example: "I can end conversations that feel draining.", status: nil),
        Boundary(type: .relationalSocial, example: "I don’t have to maintain toxic relationships.", status: nil),
        Boundary(type: .relationalSocial, example: "I can keep relationships private if I choose.", status: nil)
    ]
}
