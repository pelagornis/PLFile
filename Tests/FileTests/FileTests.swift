import XCTest
@testable import File

final class FileTests: XCTestCase {
    private var folder: Folder!
    
    override func setUp() {
        super.setUp()
        folder = try! Folder(path: .home).createSubfolder(at: ".plfileTest")
        try! folder.empty()
    }
    
    override func tearDown() {
        try? folder.delete()
        super.tearDown()
    }
    
    func testingCreateFile() {
        let file = try! folder.createFile(at: "test.swift")
        XCTAssertEqual(file.name, "test.swift")
        XCTAssertEqual(file.store.path.rawValue, folder.store.path.rawValue + "test.swift")
        XCTAssertEqual(file.extension, "swift")
        
        try XCTAssertEqual(file.read(), Data())
    }
    
    func testingFileWrite() {
        let file = try? folder.createFile(at: "testWrite.swift")
        try? file?.write("print(1)")
        
        try XCTAssertEqual(String(data: file!.read(), encoding: .utf8), "print(1)")
    }
    
    func testingFileMove() {
        let originFolder = try? folder.createSubfolder(at: "folderA")
        let targetFolder = try? folder.createSubfolder(at: "folderB")
        
        try? originFolder?.move(to: targetFolder!)
        XCTAssertEqual(originFolder?.store.path.rawValue, folder.store.path.rawValue + "folderB/folderA/" )
    }
    
    func testingPathStringLiteralConvertible() {
        let user: Path = "/Users"
        let userPath = Path("/Users")
        XCTAssertEqual(user, userPath)
    }

    func testingPathRoot() {
        let root = Path.root
        let pathRoot: Path = "/"
        XCTAssertEqual(root, pathRoot)
    }

    func testingPathCurrent() {
        let oldCurrent: Path = .current
        let newCurrent: Path = .userTemporary
        XCTAssertNotEqual(oldCurrent, newCurrent)
    }
    
    func testingPathHome() {
        let home = Path.home
        XCTAssertEqual(home.rawValue, NSHomeDirectory())
    }

    func testingPathDocuments() {
        XCTAssertNotEqual(Path.documents, Path())
    }

    func testingPathLibrary() {
        XCTAssertNotEqual(Path.library, Path())
    }
}
