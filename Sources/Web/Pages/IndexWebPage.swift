//
//  IndexWebPage.swift
//  
//
//  Created by Mihael Isaev on 06.07.2020.
//

//import Foundation
//import WebCore
//
//class IndexWebPage: WebPage {
//    override var endpoint: String { super.endpoint }
//    override var page: Page {
//        Page {
//            DocType()
//            Html {
//                Head {
//                    Style {
//                        Element(.element("a") => .hover) {
//                            Background(color: .css(.red))
//                        }
//                    }
//                }
//                Body {
//                    A {
//                        Attributes {
//                            Href("http://google.com")
//                        }
//                        "Link to Google"
//                    }
//                    Input {
//                        Attributes {
//                            Type(.text)
//                            Disabled()
//                        }
//                    }
//                    Div { "hello world" }
//                    Div {
//                        Attributes {
//                            Id("mikeGreetings")
//                            StyleAttribute {
//                                Position(.absolute)
//                                Color(.css(.brown))
//                                FontWeight(.bold)
//                            }
//                        }
//                        "hello Mike"
//                    }
//                }
//            }
//        }
//    }
//}
