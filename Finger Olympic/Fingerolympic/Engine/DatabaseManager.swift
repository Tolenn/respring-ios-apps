import Foundation
import SQLite3

public struct RecordItem {
    public let id: Int
    public let name: String
    public let score: Double
    public let disciplineId: Int
}

public struct CountryItem {
    public let id: Int
    public let name: String
}

public struct PlayerProfile {
    public var playerName: String
    public var countryId: Int
    public var inAppPurchase: Bool
    public var wonDisciplines: [Bool]
    public var disciplineScores: [Double]
}

public final class DatabaseManager {
    public static let shared = DatabaseManager()
    private var db: OpaquePointer?
    
    private init() {
        bootstrapDatabase()
        openDatabase()
    }
    
    deinit {
        if db != nil {
            sqlite3_close(db)
        }
    }
    
    private func databasePath() -> URL {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return docs.appendingPathComponent("foDB14.sqlite")
    }
    
    private func bootstrapDatabase() {
        let dest = databasePath()
        if !FileManager.default.fileExists(atPath: dest.path) {
            if let bundleDB = Bundle.main.url(forResource: "foDB14", withExtension: "sqlite") {
                do {
                    try FileManager.default.copyItem(at: bundleDB, to: dest)
                    print("[DatabaseManager] Bootstrapped foDB14.sqlite to Documents")
                } catch {
                    print("[DatabaseManager] Failed to copy database: \(error)")
                }
            } else {
                print("[DatabaseManager] foDB14.sqlite not found in bundle")
            }
        }
    }
    
    private func openDatabase() {
        let path = databasePath().path
        if sqlite3_open(path, &db) != SQLITE_OK {
            print("[DatabaseManager] Error opening database at \(path)")
        } else {
            print("[DatabaseManager] Database opened successfully")
        }
    }
    
    public func getCountries() -> [CountryItem] {
        var items: [CountryItem] = []
        let query = "SELECT id, name FROM countries ORDER BY id ASC;"
        var stmt: OpaquePointer?
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK {
            while sqlite3_step(stmt) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(stmt, 0))
                let nameStr = String(cString: sqlite3_column_text(stmt, 1))
                items.append(CountryItem(id: id, name: nameStr))
            }
        }
        sqlite3_finalize(stmt)
        return items
    }
    
    public func getRecords(forDiscipline disciplineId: Int) -> [RecordItem] {
        var records: [RecordItem] = []
        let query = "SELECT idrecord, name, time, IDdiscipline FROM recordsTable WHERE IDdiscipline = ? ORDER BY time ASC;"
        var stmt: OpaquePointer?
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK {
            sqlite3_bind_int(stmt, 1, Int32(disciplineId))
            while sqlite3_step(stmt) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(stmt, 0))
                let name = String(cString: sqlite3_column_text(stmt, 1))
                let time = sqlite3_column_double(stmt, 2)
                let discId = Int(sqlite3_column_int(stmt, 3))
                records.append(RecordItem(id: id, name: name, score: time, disciplineId: discId))
            }
        }
        sqlite3_finalize(stmt)
        return records
    }
    
    public func addRecord(name: String, score: Double, disciplineId: Int) {
        let query = "INSERT INTO recordsTable (name, time, IDdiscipline) VALUES (?, ?, ?);"
        var stmt: OpaquePointer?
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK {
            sqlite3_bind_text(stmt, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_double(stmt, 2, score)
            sqlite3_bind_int(stmt, 3, Int32(disciplineId))
            if sqlite3_step(stmt) != SQLITE_DONE {
                print("[DatabaseManager] Error inserting record")
            }
        }
        sqlite3_finalize(stmt)
    }
    
    public func isDisciplineUnlocked(disciplineId: Int) -> Bool {
        if disciplineId == 1 { return true }
        let query = "SELECT enabled FROM disciplines WHERE IDdiscipline = ? LIMIT 1;"
        var stmt: OpaquePointer?
        var unlocked = false
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK {
            sqlite3_bind_int(stmt, 1, Int32(disciplineId))
            if sqlite3_step(stmt) == SQLITE_ROW {
                unlocked = sqlite3_column_int(stmt, 0) != 0
            }
        }
        sqlite3_finalize(stmt)
        return unlocked
    }
    
    public func unlockDiscipline(disciplineId: Int) {
        let query = "UPDATE disciplines SET enabled = 1 WHERE IDdiscipline = ?;"
        var stmt: OpaquePointer?
        if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK {
            sqlite3_bind_int(stmt, 1, Int32(disciplineId))
            _ = sqlite3_step(stmt)
        }
        sqlite3_finalize(stmt)
    }
}

