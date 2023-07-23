import Foundation

// MARK: - ContentTree
public struct ContentTree: Codable {

  /**
   Name of the root content (name of the file / directory that is inspected. Eg. `Package.swift`.
   */
  public let name: String

  /**
   Full path of the root content relative to the root of the repository. Eg. `Examples/TicTacToe/tic-tac-toe/Package.swift`.
   */
  public let path: String

  /**
   Root content sha. Eg. `059458f91eba6588c70a3418e7695f7ed444ea23`.
   */
  public let sha: String

  /**
   Type of content at the root. May be either `dir` or `file`.
   */
  public let type: String

  /**
   Size of root content in bytes. Usually non-`0` for `file`s and `0` for `dir` type.
   */
  public let size: Int

  /**
   Content of the root (children). Contains list of child entities if `dir` is being inspected.
   Otherwise (If `file` is being inspected) then this property will be nil.
   */
  public let entries: [Entry]?

  /**
   Optional content of inspected entity (if `file` is inspected).
   */
  public let content: String?

  /**
   Optional encoding type of inspected entity (if `file` is inspected).
   */
  public let encoding: String?

  public let downloadUrl: String?
  public let gitUrl: String?
  public let htmlUrl: String?
  public let url: String?

  enum CodingKeys: String, CodingKey {
    case links = "_links"
    case downloadUrl = "download_url"
    case entries = "entries"
    case gitUrl = "git_url"
    case htmlUrl = "html_url"
    case name = "name"
    case path = "path"
    case sha = "sha"
    case size = "size"
    case type = "type"
    case url = "url"
    case content = "content"
    case encoding = "encoding"
  }
}

// MARK: - Entry
public struct Entry: Codable {
  public let links: EntryLinks
  public let content: String?
  public let downloadUrl: String?
  public let gitUrl: String?
  public let htmlUrl: String?
  public let name: String
  public let path: String
  public let sha: String
  public let size: Int
  public let type: String
  public let url: String

  enum CodingKeys: String, CodingKey {
    case links = "_links"
    case content = "content"
    case downloadUrl = "download_url"
    case gitUrl = "git_url"
    case htmlUrl = "html_url"
    case name = "name"
    case path = "path"
    case sha = "sha"
    case size = "size"
    case type = "type"
    case url = "url"
  }
}
