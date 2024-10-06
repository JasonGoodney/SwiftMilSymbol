# SwiftMilSymbol

SwiftMilsymbol brings [milsymbol](https://github.com/spatialillusions/milsymbol) to Swift!

![milsymbol](https://github.com/JasonGoodney/SwiftMilSymbol/blob/main/Resources/milsymbol.png?raw=true)

```swift
MilSymbol.shared.image("sfgpewrh--mt", options: [
  "size": 35,
  "quantity": 200,
  "staffComments": "for reinforcements".uppercased(),
  "additionalInformation": "added support for JJ".uppercased(),
  "direction": (750 * 360) / 6400,
  "type": "machine gun".uppercased(),
  "dtg": "30140000ZSEP97",
  "location": "0900000.0E570306.0N"
])
```

Compared to the reference figure from MIL-STD-2525C:

![Figure 13](https://github.com/JasonGoodney/SwiftMilSymbol/blob/main/Resources/figure13.png?raw=true)


## Installation
SwiftMilSymbol can be installed with Swift Package Manager:
```
https://github.com/JasonGoodney/SwiftMilSymbol.git
```

## Preview
<p align="center">
  <img src="Resources/options%20example.png" width=400 />
  <img src="Resources/collection%20example.gif" width=400 />
</p>

## Credits

Milsymbol is created and maintained by Måns Beckman

- http://www.spatialillusions.com to see more examples of what milsymbol can be used for
- https://twitter.com/spatialillusion for milsymbol and mapping/military related information

## Licensing

MIT, See [LICENSE](LICENSE) for details.
