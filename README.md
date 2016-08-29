# Perform

Easy dependency injection for storyboard segues.

```swift
import Perform

// ...

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: NSIndexPath) {
  let task = taskList[indexPath.row]
  perform(.showTaskDetails) { taskVC in
    taskVC.task = task
  }
}
```

## Usage

Configure your segues:

```swift
// Sources/Extensions/Segue.swift
import Perform

extension Segue {
  static var showTaskDetails: Segue<TaskDetailsViewController> {
    return .init(identifier: "ShowTaskDetails")
  }
}
```

And then use `perform(_:prepare:)` instead of `performSegue(withIdentifier:sender:)`.
That's it!

#### Type-safe segues

Perform checks the type of the destination view controller and casts it for you,
raising an error if your destination view controller is an unexpected type.

#### Still works if your view controller is embedded in a container

Ever written code like this?

```swift
guard let nav = segue.destinationViewController as? UINavigationController,
  let content = nav.rootViewController as? MyViewController
  else { return }

// ... finally! 😭
```

Perform takes care of this, searching the view controller hierarchy for a view
controller of the matching type!

#### No switch statements in `prepareForSegue(_:sender:)`

Multiple segues from one view controller? No problem, just prepare each
destination view controller right where you perform the segue. No more massive
switch statements.

## Installation

### [Carthage][carthage-home]

Add the following to your Cartfile:

```
github "thoughtbot/Perform"
```

Then run `carthage update Perform`.

Follow the instructions in [Carthage's README][carthage-readme] for up-to-date
installation instructions.

  [carthage-home]: https://github.com/Carthage/Carthage
  [carthage-readme]: https://github.com/Carthage/Carthage#adding-frameworks-to-an-application

## Contributing

See the [CONTRIBUTING][] document.

  [CONTRIBUTING]: CONTRIBUTING.md

## License

Perform is Copyright (c) 2016 thoughtbot, inc.
It is free software, and may be redistributed
under the terms specified in the [LICENSE] file.

  [LICENSE]: LICENSE

## About

![thoughtbot](https://thoughtbot.com/logo.png)

Perform is maintained and funded by thoughtbot, inc.
The names and logos for thoughtbot are trademarks of thoughtbot, inc.

We love open source software!
See [our other projects][community]
or [hire us][hire] to help build your product.

  [community]: https://thoughtbot.com/community?utm_source=github
  [hire]: https://thoughtbot.com/hire-us?utm_source=github
