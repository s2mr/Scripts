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

let todayParser = originParser.add(subparser: "today", overview: "sub command overview")

func printToday() {
    let dateComponents = Calendar.autoupdatingCurrent.dateComponents([.year, .month, .day], from: Date())
    guard let year = dateComponents.year, let month = dateComponents.month, let day = dateComponents.day else { return }
    print(String(format: "Today is %04d%02d%02d", year, month, day))
}

do {
    let result = try originParser.parse(arguments)

    var options = Options()
    try binder.fill(parseResult: result, into: &options)
    print(options.shouldPrintVersion ?? "None")

    if let _ = result.subparser(todayParser) {
        printToday()
    }
    else {
        print("Nothing to show.")
    }
} catch {
    print(error)
}
