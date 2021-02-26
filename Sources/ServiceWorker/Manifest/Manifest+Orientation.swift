//
//  Manifest+Orientation.swift
//  ServiceWorker
//
//  Created by Mihael Isaev on 22.02.2021.
//

extension Manifest {
    public enum Orientation: String, Codable {
        case any
        case natural
        case landscape
        case landscapePrimary = "landscape-primary"
        case landscapeSecondary = "landscape-secondary"
        case portrait
        case portraitPrimary = "portrait-primary"
        case portraitSecondary = "portrait-secondary"
    }
}
