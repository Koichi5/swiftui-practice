import Foundation

struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    //    var attendees: [String]
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [Attendee], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    static var emptyScrum: DailyScrum {
        DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
    }
    
    static let sampleData: [DailyScrum] = [
        DailyScrum(title: "Design",
                   attendees: [Attendee(name: "Bob"), Attendee(name: "Sum"), Attendee(name: "Tim"), Attendee(name: "Smith"), ],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(title: "App Dev",
                   attendees: [Attendee(name: "Katie"), Attendee(name: "Gray"), Attendee(name: "Euna"), Attendee(name: "Luis"), Attendee(name: "Darla")],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   attendees: [Attendee(name: "Chella"), Attendee(name: "Chris"), Attendee(name: "Christina"), Attendee(name: "Eden"), Attendee(name: "Karla"), Attendee(name: "Lindsey"), Attendee(name: "Aga"), Attendee(name: "Chad"), Attendee(name: "Jenn"), Attendee(name: "Sarah")],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
}
