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

```swift
var tintGenerator: ColorTint = ColorTint(baseColor: UIColor(red: 0.94, green: 0.25, blue: 0.54, alpha: 1.0))

ColorTint.tintForIndex(4) // => UIColor
```

> See ChromaDemo for more examples 

## License

[The MIT License](LICENSE)
