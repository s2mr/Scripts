enum CommandList: String, CaseIterable {
    case today, todo, window

    var overview: String {
        switch self {
        case .today:
            return "Print date of today"

        case .todo:
            return "Create todo"

        case .window:
            return "Show window"
        }
    }

    var command: Commands.Type {
        switch self {
        case .today:
            return TodayCommand.self

        case .todo:
            return TodoCommand.self

        case .window:
            return WindowCommand.self
        }
    }
}
