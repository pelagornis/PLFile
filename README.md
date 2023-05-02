# PLFile

![Swift](https://img.shields.io/badge/Swift-5.8-orange.svg)


Pelagornis File Management Library 📁

## Installation
PLFile was deployed as Swift Package Manager. Package to install in a project. Add as a dependent item within the swift manifest.
```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/Pelagornis/PLFile.git", from: "1.0.1")
    ],
    ...
)
```
Then import the PLFile from thr location you want to use.

```swift
import PLFile
```

## Using

Path Setting.
```swift
let path = Path("/Users/ji-hoonahn/Desktop/") // example
```

Easy access path.
```swift
Path.root
Path.home
Path.current
Path.temporary
```

Create, Write file and Folder!
```swift
let path = Path.home
let folder = try! PLFile.Folder(path: path)
let file = try! folder.createFile(at: Path("test.swift"))
try! file.write("print(1)")
```

And you can delete files and folders if you want.

```swift
try! file.delete()
try! folder.delete()
```

## License
**PLFile** is under MIT license. See the [LICENSE](LICENSE) file for more info.
