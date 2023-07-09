import Foundation

public struct Client {
    public let name: String
    public let age: Int
    public let height: Int
    
    public init(name: String, age: Int, height: Int) {
        self.name = name
        self.age = age
        self.height = height
    }
}

extension Client: Hashable, Equatable {}
