//
//  File.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 24.02.2021.
//

import Foundation
import JavaScriptKit

/// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/File/File)
public class File: Blob {
    /// Returns the last modified time of the file,
    /// in millisecond since the UNIX epoch (January 1st, 1970 at Midnight).
    public let lastModified: TimeInterval
    
    /// Returns the last modified Date of the file referenced by the File object.
    public let lastModifiedDate: Date
    
    /// Returns the name of the file referenced by the File object.
    public let name: String
	
    /// Returns the path the URL of the File is relative to.
    public let webkitRelativePath: String
    
    public override init (_ object: JSValue) {
        lastModified = TimeInterval(object.lastModified.number ?? 0)
        lastModifiedDate = Date(timeIntervalSince1970: TimeInterval(_JSDate(object.lastModifiedDate).getTime() / 1_000))
        name = object.name.string ?? ""
		webkitRelativePath = object.webkitRelativePath.string ?? ""
        super.init(object)
    }
	
	public override var description: String {
		"File( \nname: \(name), \nsize: \(size), \ntype: \(type), \nlastModifiedDate: \(lastModifiedDate)\n)"
	}
}

/// [More info →](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date)
class _JSDate {
    let object: JSValue
    
    /// Returns the milliseconds since the UTC epoch
    func getTime() -> Int64 {
		Int64(object.getUTCSeconds.function?.callAsFunction(optionalThis: object.object)?.number ?? 0)
    }
    
    public init (_ object: JSValue) {
        self.object = object
    }
}
