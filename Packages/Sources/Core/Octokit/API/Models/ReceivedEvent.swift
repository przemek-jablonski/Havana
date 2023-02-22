// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let receivedEvent = try? JSONDecoder().decode([ReceivedEvent].self, from: jsonData)

import Foundation

// MARK: - ReceivedEvent
struct ReceivedEvent: Codable, Identifiable {
    let id: String
    let type: ReceivedEventType
    let actor: Actor
    let repo: Repo
    let payload: Payload
    let receivedEventPublic: Bool
    let createdAt: Date
    let org: Actor?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case actor = "actor"
        case repo = "repo"
        case payload = "payload"
        case receivedEventPublic = "public"
        case createdAt = "created_at"
        case org = "org"
    }
}

// MARK: - Actor
struct Actor: Codable {
    let id: Int
    let login: String
    let displayLogin: String?
    let gravatarID: String
    let url: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case login = "login"
        case displayLogin = "display_login"
        case gravatarID = "gravatar_id"
        case url = "url"
        case avatarURL = "avatar_url"
    }
}

// MARK: - Payload
struct Payload: Codable {
    let action: Action?
    let release: Release?
    let ref: JSONNull?
    let refType: String?
    let masterBranch: String?
    let description: String?
    let pusherType: String?
    let forkee: Forkee?
    
    enum CodingKeys: String, CodingKey {
        case action = "action"
        case release = "release"
        case ref = "ref"
        case refType = "ref_type"
        case masterBranch = "master_branch"
        case description = "description"
        case pusherType = "pusher_type"
        case forkee = "forkee"
    }
}

enum Action: String, Codable {
    case published = "published"
    case started = "started"
}

// MARK: - Forkee
struct Forkee: Codable {
    let id: Int
    let nodeID: String
    let name: String
    let fullName: String
    let forkeePrivate: Bool
    let owner: Owner
    let htmlURL: String
    let description: String
    let fork: Bool
    let url: String
    let forksURL: String
    let keysURL: String
    let collaboratorsURL: String
    let teamsURL: String
    let hooksURL: String
    let issueEventsURL: String
    let eventsURL: String
    let assigneesURL: String
    let branchesURL: String
    let tagsURL: String
    let blobsURL: String
    let gitTagsURL: String
    let gitRefsURL: String
    let treesURL: String
    let statusesURL: String
    let languagesURL: String
    let stargazersURL: String
    let contributorsURL: String
    let subscribersURL: String
    let subscriptionURL: String
    let commitsURL: String
    let gitCommitsURL: String
    let commentsURL: String
    let issueCommentURL: String
    let contentsURL: String
    let compareURL: String
    let mergesURL: String
    let archiveURL: String
    let downloadsURL: String
    let issuesURL: String
    let pullsURL: String
    let milestonesURL: String
    let notificationsURL: String
    let labelsURL: String
    let releasesURL: String
    let deploymentsURL: String
    let createdAt: Date
    let updatedAt: Date
    let pushedAt: Date
    let gitURL: String
    let sshURL: String
    let cloneURL: String
    let svnURL: String
    let homepage: String?
    let size: Int
    let stargazersCount: Int
    let watchersCount: Int
    let language: JSONNull?
    let hasIssues: Bool
    let hasProjects: Bool
    let hasDownloads: Bool
    let hasWiki: Bool
    let hasPages: Bool
    let hasDiscussions: Bool
    let forksCount: Int
    let mirrorURL: JSONNull?
    let archived: Bool
    let disabled: Bool
    let openIssuesCount: Int
    let license: License?
    let allowForking: Bool
    let isTemplate: Bool
    let webCommitSignoffRequired: Bool
    let topics: [JSONAny]
    let visibility: String
    let forks: Int
    let openIssues: Int
    let watchers: Int
    let defaultBranch: String
    let forkeePublic: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeID = "node_id"
        case name = "name"
        case fullName = "full_name"
        case forkeePrivate = "private"
        case owner = "owner"
        case htmlURL = "html_url"
        case description = "description"
        case fork = "fork"
        case url = "url"
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case gitURL = "git_url"
        case sshURL = "ssh_url"
        case cloneURL = "clone_url"
        case svnURL = "svn_url"
        case homepage = "homepage"
        case size = "size"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case language = "language"
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasDownloads = "has_downloads"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case hasDiscussions = "has_discussions"
        case forksCount = "forks_count"
        case mirrorURL = "mirror_url"
        case archived = "archived"
        case disabled = "disabled"
        case openIssuesCount = "open_issues_count"
        case license = "license"
        case allowForking = "allow_forking"
        case isTemplate = "is_template"
        case webCommitSignoffRequired = "web_commit_signoff_required"
        case topics = "topics"
        case visibility = "visibility"
        case forks = "forks"
        case openIssues = "open_issues"
        case watchers = "watchers"
        case defaultBranch = "default_branch"
        case forkeePublic = "public"
    }
}

// MARK: - License
struct License: Codable {
    let key: String
    let name: String
    let spdxID: String
    let url: String
    let nodeID: String
    
    enum CodingKeys: String, CodingKey {
        case key = "key"
        case name = "name"
        case spdxID = "spdx_id"
        case url = "url"
        case nodeID = "node_id"
    }
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url: String
    let htmlURL: String
    let followersURL: String
    let followingURL: String
    let gistsURL: String
    let starredURL: String
    let subscriptionsURL: String
    let organizationsURL: String
    let reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: OwnerType
    let siteAdmin: Bool
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url = "url"
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type = "type"
        case siteAdmin = "site_admin"
    }
}

enum OwnerType: String, Codable {
    case user = "User"
}

// MARK: - Release
struct Release: Codable {
    let url: String
    let assetsURL: String
    let uploadURL: String
    let htmlURL: String
    let id: Int
    let author: Owner
    let nodeID: String
    let tagName: String
    let targetCommitish: TargetCommitish
    let name: String
    let draft: Bool
    let prerelease: Bool
    let createdAt: Date
    let publishedAt: Date
    let assets: [Asset]
    let tarballURL: String
    let zipballURL: String
    let body: String
    let mentionsCount: Int?
    let mentions: [Mention]?
    let shortDescriptionHTML: String
    let isShortDescriptionHTMLTruncated: Bool
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case assetsURL = "assets_url"
        case uploadURL = "upload_url"
        case htmlURL = "html_url"
        case id = "id"
        case author = "author"
        case nodeID = "node_id"
        case tagName = "tag_name"
        case targetCommitish = "target_commitish"
        case name = "name"
        case draft = "draft"
        case prerelease = "prerelease"
        case createdAt = "created_at"
        case publishedAt = "published_at"
        case assets = "assets"
        case tarballURL = "tarball_url"
        case zipballURL = "zipball_url"
        case body = "body"
        case mentionsCount = "mentions_count"
        case mentions = "mentions"
        case shortDescriptionHTML = "short_description_html"
        case isShortDescriptionHTMLTruncated = "is_short_description_html_truncated"
    }
}

// MARK: - Asset
struct Asset: Codable {
    let url: String
    let id: Int
    let nodeID: String
    let name: String
    let label: JSONNull?
    let uploader: Owner
    let contentType: String
    let state: String
    let size: Int
    let downloadCount: Int
    let createdAt: Date
    let updatedAt: Date
    let browserDownloadURL: String
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case nodeID = "node_id"
        case name = "name"
        case label = "label"
        case uploader = "uploader"
        case contentType = "content_type"
        case state = "state"
        case size = "size"
        case downloadCount = "download_count"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case browserDownloadURL = "browser_download_url"
    }
}

// MARK: - Mention
struct Mention: Codable {
    let avatarURL: String
    let login: String
    let profileName: String
    let profileURL: String
    let avatarUserActor: Bool
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case login = "login"
        case profileName = "profile_name"
        case profileURL = "profile_url"
        case avatarUserActor = "avatar_user_actor"
    }
}

enum TargetCommitish: String, Codable {
    case main = "main"
    case master = "master"
}

// MARK: - Repo
struct Repo: Codable {
    let id: Int
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case url = "url"
    }
}

enum ReceivedEventType: String, Codable {
    case createEvent = "CreateEvent"
    case forkEvent = "ForkEvent"
    case publicEvent = "PublicEvent"
    case releaseEvent = "ReleaseEvent"
    case watchEvent = "WatchEvent"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
