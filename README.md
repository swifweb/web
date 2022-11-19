[![SwifWeb](https://user-images.githubusercontent.com/1272610/111916973-f5e3b300-8a96-11eb-8ab3-ac8e3a6b9f6f.png)](http://swifweb.com)

<p align="center">
    <a href="LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://swift.org">
        <img src="https://img.shields.io/badge/swift-5.3-brightgreen.svg" alt="Swift 5.7">
    </a>
    <a href="https://discord.gg/q5wCPYv">
        <img src="https://img.shields.io/discord/612561840765141005" alt="Swift.Stream">
    </a>
</p>

This library provides DOM, CSS and all possible web APIs beautifully wrapped into Swift ❤️

With it you will easily build your awesome reactive web app in beloved Swift ❤️

# Installation

Go to [webber](https://github.com/swifweb/webber) repository and install it.

# Usage

Clone [spa](https://github.com/swifweb/spa-template) or [pwa](https://github.com/swifweb/pwa-template) template

Go to the project folder and open `Package.swift` to explore the code.

Then execute `webber serve` or `webber serve -t pwa -s Service` for the pwa app to debug your project in the browser.

Then take a look at the hidden `.webber` folder, you will find the `entrypoint/dev` folder where webber just generated entry files, you could edit these files if swift is not enough, e.g. to make you custom loading bar.

To release the project just call `webber release` or `webber release -t pwa -s Service` for pwa, and then grab production files from `.webber/release` folder.

# Optimization

Lighthouse gives it **100 points** and search engine crawlers works well with it too!

![Lighthouse](https://user-images.githubusercontent.com/1272610/111917255-735bf300-8a98-11eb-87a2-ca45e16d0711.gif)

// TODO: to be continued soon
