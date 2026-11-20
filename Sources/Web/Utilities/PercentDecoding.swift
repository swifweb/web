//
//  PercentDecoding.swift
//
//
//  Created by Mihael Isaev on 23.09.2026.
//

func percentDecode(_ value: String) -> String? {
    var bytes: [UInt8] = []
    bytes.reserveCapacity(value.utf8.count)

    var iterator = value.utf8.makeIterator()
    while let byte = iterator.next() {
        guard byte == 0x25 else {
            bytes.append(byte)
            continue
        }
        guard let high = iterator.next(),
              let low = iterator.next(),
              let highValue = percentDecodedHexValue(high),
              let lowValue = percentDecodedHexValue(low) else {
            return nil
        }
        bytes.append((highValue << 4) | lowValue)
    }

    let decoded = String(decoding: bytes, as: UTF8.self)
    guard decoded.utf8.elementsEqual(bytes) else {
        return nil
    }
    return decoded
}

private func percentDecodedHexValue(_ byte: UInt8) -> UInt8? {
    switch byte {
    case 0x30...0x39:
        return byte - 0x30
    case 0x41...0x46:
        return byte - 0x41 + 10
    case 0x61...0x66:
        return byte - 0x61 + 10
    default:
        return nil
    }
}
