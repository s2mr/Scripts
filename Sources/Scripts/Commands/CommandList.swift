enum CommandList: String, CaseIterable {
    case today, todo

    var overview: String {
        switch self {
        case .today:
            return "Print date of today"

        case .todo:
            return "Create todo"
        }
    }

    var command: Commands.Type {
        switch self {
        case .today:
            return TodayCommand.self

        case .todo:
            return TodoCommand.self
        }
    }
}
