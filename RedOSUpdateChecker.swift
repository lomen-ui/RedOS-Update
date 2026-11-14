import Foundation

/// Sprawdza metadane wydania RedOS na GitHubie.
/// Nie instaluje aktualizacji i nie uruchamia pobranych plików.
struct RedOSUpdateManifest: Decodable {
    let product: String
    let version: String
    let channel: String
    let minimumRedOSVersion: String
    let releaseDate: String
    let releaseNotes: String
    let updateType: String
    let archive: String
}

enum RedOSUpdateError: Error {
    case invalidURL
    case badResponse
    case wrongProduct
}

final class RedOSUpdateChecker {
    // ZMIEŃ "TWOJ_LOGIN" i "TWOJE_REPO" na dane swojego repozytorium.
    private let manifestURL =
        URL(string: "https://raw.githubusercontent.com/TWOJ_LOGIN/TWOJE_REPO/main/Update/manifest.json")

    func checkForUpdate(
        currentVersion: String,
        completion: @escaping (Result<RedOSUpdateManifest?, Error>) -> Void
    ) {
        guard let url = manifestURL else {
            completion(.failure(RedOSUpdateError.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }

            guard
                let http = response as? HTTPURLResponse,
                (200...299).contains(http.statusCode),
                let data
            else {
                completion(.failure(RedOSUpdateError.badResponse))
                return
            }

            do {
                let manifest = try JSONDecoder().decode(
                    RedOSUpdateManifest.self,
                    from: data
                )

                guard manifest.product == "RedOS" else {
                    throw RedOSUpdateError.wrongProduct
                }

                let updateAvailable =
                    Self.compareVersions(manifest.version, currentVersion) == .orderedDescending

                completion(.success(updateAvailable ? manifest : nil))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    private static func compareVersions(
        _ lhs: String,
        _ rhs: String
    ) -> ComparisonResult {
        let left = lhs.split(separator: ".").compactMap { Int($0) }
        let right = rhs.split(separator: ".").compactMap { Int($0) }
        let count = max(left.count, right.count)

        for index in 0..<count {
            let a = index < left.count ? left[index] : 0
            let b = index < right.count ? right[index] : 0
            if a > b { return .orderedDescending }
            if a < b { return .orderedAscending }
        }
        return .orderedSame
    }
}
