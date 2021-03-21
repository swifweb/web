//
//  RequestCache.swift
//  FetchAPI
//
//  Created by Mihael Isaev on 19.03.2021.
//

public enum RequestCache: String {
    /// The browser looks for a matching request in its HTTP cache.
    ///
    /// If there is a match and it is fresh, it will be returned from the cache.
    ///
    /// If there is a match but it is stale, the browser will make a conditional request to the remote server.
    /// If the server indicates that the resource has not changed, it will be returned from the cache.
    /// Otherwise the resource will be downloaded from the server and the cache will be updated.
    ///
    /// If there is no match, the browser will make a normal request, and will update the cache with the downloaded resource.
    case `default`
    
    /// The browser fetches the resource from the remote server without first looking in the cache,
    /// and will not update the cache with the downloaded resource.
    case noStore = "no-store"
    
    /// The browser fetches the resource from the remote server without first looking in the cache,
    /// but then will update the cache with the downloaded resource.
    case reload
    /// The browser looks for a matching request in its HTTP cache.
    ///
    /// If there is a match, fresh or stale, the browser will make a conditional request to the remote server.
    /// If the server indicates that the resource has not changed, it will be returned from the cache.
    /// Otherwise the resource will be downloaded from the server and the cache will be updated.
    ///
    /// If there is no match, the browser will make a normal request, and will update the cache with the downloaded resource.
    case noCache = "no-cache"
    
    /// The browser looks for a matching request in its HTTP cache.
    ///
    /// If there is a match, fresh or stale, it will be returned from the cache.
    ///
    /// If there is no match, the browser will make a normal request, and will update the cache with the downloaded resource.
    case forceCache = "force-cache"
    
    /// The browser looks for a matching request in its HTTP cache.
    ///
    /// If there is a match, fresh or stale, it will be returned from the cache.
    ///
    /// If there is no match, the browser will respond with a 504 Gateway timeout status.
    ///
    /// The `only-if-cached` mode can only be used if the request's mode is `same-origin`.
    /// Cached redirects will be followed if the request's redirect property is `follow` and the redirects do not violate the `same-origin` mode.
    case onlyIfCached = "only-if-cached"
}
