
import Foundation
import CommonCrypto

public class SecureStorage {
    private let secretsFile = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0].appendingPathComponent("Secrets.plist")

    public static let shared = SecureStorage()

    /// Encrypts and stores a secret securely in `Secrets.plist`
    public func storeSecret(key: String, value: String) throws {
        var secrets = loadSecrets()

        if let encryptedValue = encrypt(value) {
            secrets[key] = encryptedValue
        } else {
            throw NSError(domain: "SecureStorage", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to encrypt API key."])
        }

        let data = try PropertyListSerialization.data(fromPropertyList: secrets, format: .xml, options: 0)
        try data.write(to: secretsFile)
    }

    /// Retrieves and decrypts a secret from `Secrets.plist`
    public func retrieveSecret(key: String) throws -> String {
        let secrets = loadSecrets()
        guard let encryptedValue = secrets[key] else {
            throw NSError(domain: "SecureStorage", code: 2, userInfo: [NSLocalizedDescriptionKey: "API key not found."])
        }

        guard let decryptedValue = decrypt(encryptedValue) else {
            throw NSError(domain: "SecureStorage", code: 3, userInfo: [NSLocalizedDescriptionKey: "Failed to decrypt API key."])
        }

        return decryptedValue
    }

    /// Loads secrets from the encrypted `.plist` file
    private func loadSecrets() -> [String: String] {
        guard let data = try? Data(contentsOf: secretsFile),
              let secrets = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: String] else {
            return [:]
        }
        return secrets
    }

    /// Encrypts a string using AES-256 encryption
    private func encrypt(_ value: String) -> String? {
        guard let data = value.data(using: .utf8) else { return nil }
        let key = getEncryptionKey()
        
        var buffer = Data(count: data.count + kCCBlockSizeAES128)
        var numBytesEncrypted: size_t = 0

        let cryptStatus = CCCrypt(
            CCOperation(kCCEncrypt),
            CCAlgorithm(kCCAlgorithmAES),
            CCOptions(kCCOptionPKCS7Padding),
            key, kCCKeySizeAES256,
            nil,
            data as NSData, data.count,
            buffer.mutableBytes, buffer.count,
            &numBytesEncrypted
        )

        guard cryptStatus == kCCSuccess else { return nil }
        return buffer.base64EncodedString()
    }

    /// Decrypts a string using AES-256 decryption
    private func decrypt(_ value: String) -> String? {
        guard let data = Data(base64Encoded: value) else { return nil }
        let key = getEncryptionKey()

        var buffer = Data(count: data.count + kCCBlockSizeAES128)
        var numBytesDecrypted: size_t = 0

        let cryptStatus = CCCrypt(
            CCOperation(kCCDecrypt),
            CCAlgorithm(kCCAlgorithmAES),
            CCOptions(kCCOptionPKCS7Padding),
            key, kCCKeySizeAES256,
            nil,
            data as NSData, data.count,
            buffer.mutableBytes, buffer.count,
            &numBytesDecrypted
        )

        guard cryptStatus == kCCSuccess else { return nil }
        return String(data: buffer, encoding: .utf8)
    }

    /// Generates an AES-256 encryption key (for demo purposes, use Secure Enclave in production)
    private func getEncryptionKey() -> Data {
        return "your-secure-encryption-key-your-secure-encryption".data(using: .utf8)!
    }
}
