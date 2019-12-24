import SPMUtility
import Foundation
import Cocoa

let originParser = ArgumentParser(usage: "TODO: usage", overview: "My custom commands.")
let version = originParser.add(option: "--version", kind: Bool.self, usage: "Print current scripts version")

CommandList.allCases.forEach { command in
    originParser.add(subparser: command.rawValue, overview: command.overview)
}

do {
    let arguments = Array(CommandLine.arguments.dropFirst())
    let result = try originParser.parse(arguments)

    if let _ = result.get(version) {
        print("0.0.1")
    }

    CommandList.allCases.forEach { command in
        if result.subparser(originParser) == command.rawValue {
            command.command.init().execute()
        }
    }
} catch {
    print(error)
}

let delegate = AppDelegate()
let app = NSApplication.shared
app.delegate = delegate
app.run()
