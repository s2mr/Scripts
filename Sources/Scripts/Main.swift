import ArgumentParser
import Foundation
import Cocoa

@main
struct Script: ParsableCommand {
    // Customize your command's help and subcommands by implementing the
    // `configuration` property.
    static var configuration = CommandConfiguration(
        // Optional abstracts and discussions are used for help output.
        abstract: "My custom commands",

        // Commands can define a version for automatic '--version' support.
        version: "1.0.0",

        // Pass an array to `subcommands` to set up a nested tree of subcommands.
        // With language support for type-level introspection, this could be
        // provided by automatically finding nested `ParsableCommand` types.
        subcommands: CommandList.allCases.map(\.command),

        // A default subcommand, when provided, is automatically selected if a
        // subcommand is not given on the command line.
        defaultSubcommand: nil
    )

    init() {
        NSApplication.shared.delegate = AppDelegate.shared
    }
}
