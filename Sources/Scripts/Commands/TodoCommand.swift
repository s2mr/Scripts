import Foundation

struct TodoCommand: Commands {
    func execute() {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = ["vi"]
        task.launch()
        task.waitUntilExit()
    }
}
