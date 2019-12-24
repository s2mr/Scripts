import Foundation

struct TodoCommand: Commands {
    func execute() {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = ["echo Makefile | xargs vi"]
        task.launch()
        task.waitUntilExit()
    }
}
