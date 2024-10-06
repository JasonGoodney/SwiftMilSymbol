# SwiftMilSymbol

SwiftMilsymbol brings [milsymbol](https://github.com/spatialillusions/milsymbol) to Swift!

![Figure 13](https://github.com/spatialillusions/milsymbol/blob/master/docs/images/milsymbol.png?raw=true)

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

Compared to reference figure from MIL-STD-2525C:

![Figure 13](https://github.com/spatialillusions/milsymbol/blob/master/docs/images/figure13.png?raw=true)

## Installation
SwiftMilSymbol can be installed with Swift Package Manager:
```
https://github.com/JasonGoodney/SwiftMilSymbol.git
```

## Credits

Milsymbol is created and maintained by Måns Beckman

- http://www.spatialillusions.com to see more examples of what milsymbol can be used for
- https://twitter.com/spatialillusion for milsymbol and mapping/military related information

## Licensing

MIT, See [LICENSE](LICENSE) for details.
