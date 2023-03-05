import Foundation

// MARK: - User
public struct User {
  public let avatarUrl: String
  public let bio: String?
  public let blog: String?
  public let businessPlus: Bool?
  public let collaborators: Int?
  public let company: String?
  public let createdAt: Date
  public let diskUsage: Int?
  public let email: String?
  public let eventsUrl: String
  public let followers: Int
  public let followersUrl: String
  public let following: Int
  public let followingUrl: String
  public let gistsUrl: String
  public let gravatarId: String?
  public let hireable: Bool?
  public let htmlUrl: String
  public let id: Int
  public let ldapDn: String?
  public let location: String?
  public let login: String
  public let name: String?
  public let nodeId: String
  public let organizationsUrl: String
  public let ownedPrivateRepos: Int?
  public let plan: Plan?
  public let privateGists: Int?
  public let publicGists: Int
  public let publicRepos: Int
  public let receivedEventsUrl: String
  public let reposUrl: String
  public let siteAdmin: Bool
  public let starredUrl: String
  public let subscriptionsUrl: String
  public let suspendedAt: Date?
  public let totalPrivateRepos: Int?
  public let twitterUsername: String?
  public let twoFactorAuthentication: Bool?
  public let type: String
  public let updatedAt: Date
  public let url: String
}

// MARK: - Plan
public struct Plan {
  public let collaborators: Int
  public let name: String
  public let privateRepos: Int
  public let space: Int
}

// MARK: - User + ModelProtocol
import Casimir

extension User: ModelProtocol {
  public static var random: User {
    User(
      avatarUrl: .random,
      bio: .random,
      blog: .random,
      businessPlus: .random,
      collaborators: .random,
      company: .random,
      createdAt: .random,
      diskUsage: .random,
      email: .random,
      eventsUrl: .random,
      followers: .random,
      followersUrl: .random,
      following: .random,
      followingUrl: .random,
      gistsUrl: .random,
      gravatarId: .random,
      hireable: .random,
      htmlUrl: .random,
      id: .random,
      ldapDn: .random,
      location: .random,
      login: .random,
      name: .random,
      nodeId: .random,
      organizationsUrl: .random,
      ownedPrivateRepos: .random,
      plan: .random,
      privateGists: .random,
      publicGists: .random,
      publicRepos: .random,
      receivedEventsUrl: .random,
      reposUrl: .random,
      siteAdmin: .random,
      starredUrl: .random,
      subscriptionsUrl: .random,
      suspendedAt: .random,
      totalPrivateRepos: .random,
      twitterUsername: .random,
      twoFactorAuthentication: .random,
      type: .random,
      updatedAt: .random,
      url: .random
    )
  }
}

extension Plan: ModelProtocol {
  public var id: String {
    name
  }
  
  public static var random: Plan {
    Plan(
      collaborators: .random,
      name: .random,
      privateRepos: .random,
      space: .random
    )
  }
}
