//  This file was automatically generated and should not be edited.

import Apollo

public final class SendTokenMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation sendToken($accountkitAccessToken: String!) {\n  auth(accountkitAccessToken: $accountkitAccessToken) {\n    __typename\n    token\n    user {\n      __typename\n      id\n      phone\n    }\n  }\n}"

  public var accountkitAccessToken: String

  public init(accountkitAccessToken: String) {
    self.accountkitAccessToken = accountkitAccessToken
  }

  public var variables: GraphQLMap? {
    return ["accountkitAccessToken": accountkitAccessToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("auth", arguments: ["accountkitAccessToken": GraphQLVariable("accountkitAccessToken")], type: .nonNull(.object(Auth.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(auth: Auth) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "auth": auth.resultMap])
    }

    public var auth: Auth {
      get {
        return Auth(unsafeResultMap: resultMap["auth"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "auth")
      }
    }

    public struct Auth: GraphQLSelectionSet {
      public static let possibleTypes = ["AuthPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("token", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String, user: User) {
        self.init(unsafeResultMap: ["__typename": "AuthPayload", "token": token, "user": user.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var token: String {
        get {
          return resultMap["token"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("phone", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, phone: String) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "phone": phone])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var phone: String {
          get {
            return resultMap["phone"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }
      }
    }
  }
}

public final class SendNameMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation sendName($userName: String!) {\n  updateProfile(name: $userName) {\n    __typename\n    name\n    phone\n  }\n}"

  public var userName: String

  public init(userName: String) {
    self.userName = userName
  }

  public var variables: GraphQLMap? {
    return ["userName": userName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateProfile", arguments: ["name": GraphQLVariable("userName")], type: .nonNull(.object(UpdateProfile.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateProfile: UpdateProfile) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateProfile": updateProfile.resultMap])
    }

    public var updateProfile: UpdateProfile {
      get {
        return UpdateProfile(unsafeResultMap: resultMap["updateProfile"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateProfile")
      }
    }

    public struct UpdateProfile: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("phone", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, phone: String) {
        self.init(unsafeResultMap: ["__typename": "User", "name": name, "phone": phone])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var phone: String {
        get {
          return resultMap["phone"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "phone")
        }
      }
    }
  }
}