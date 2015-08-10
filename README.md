Chroma
======

A Swift library for color generation and manipulation

## Installation

#### Carthage

```
github "fnky/Chroma" ~> 0.1.0
```

#### Manually

```
git clone https://github.com/fnky/Chroma.git
```

## Usage

#### ColorTint

You can either generate tints for a base color or generate tints between
two colors

```swift

// Generate tints from a base color
let baseColor = UIColor(red: 0.94, green: 0.25, blue: 0.54, alpha: 1.0)
let tintGenerator: ColorTint = ColorTint(baseColor: baseColor, amount: 20)

let fourthTint = tintGenerator.tintForIndex(4) // => UIColor

```

> See ChromaDemo for more examples

## License

[The MIT License](LICENSE)
