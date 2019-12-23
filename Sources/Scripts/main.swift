import SPMUtility
import Foundation

let arguments = Array(CommandLine.arguments.dropFirst())

let originParser = ArgumentParser(usage: "TODO: usage", overview: "My custom commands.")

class Options {
    var shouldPrintVersion: String?
}

let binder = ArgumentBinder<Options>()
binder.bind(
    option: originParser.add(option: "--version", kind: String.self),
    to: { $0.shouldPrintVersion = $1 }
)

originParser.add(subparser: "today", overview: "Print date of today")
originParser.add(subparser: "tomorrow", overview: "Print date of tomorrow")

func printToday() {
    let dateComponents = Calendar.autoupdatingCurrent.dateComponents([.year, .month, .day], from: Date())
    guard let year = dateComponents.year, let month = dateComponents.month, let day = dateComponents.day else { return }
    print(String(format: "Today is %04d%02d%02d !", year, month, day))
}

do {
    let result = try originParser.parse(arguments)

    if result.subparser(originParser) == "today" {
        printToday()
    }
    if result.subparser(originParser) == "tomorrow" {
        print("tomorrow")
    }
} catch {
    print(error)
}
