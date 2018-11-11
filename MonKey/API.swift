//  This file was automatically generated and should not be edited.

import Apollo

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

public final class CreateAccountMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation createAccount($name: String!, $balance: Float!) {\n  createAccount(name: $name, balance: $balance) {\n    __typename\n    name\n  }\n}"

  public var name: String
  public var balance: Double

  public init(name: String, balance: Double) {
    self.name = name
    self.balance = balance
  }

  public var variables: GraphQLMap? {
    return ["name": name, "balance": balance]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createAccount", arguments: ["name": GraphQLVariable("name"), "balance": GraphQLVariable("balance")], type: .nonNull(.object(CreateAccount.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createAccount: CreateAccount) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createAccount": createAccount.resultMap])
    }

    public var createAccount: CreateAccount {
      get {
        return CreateAccount(unsafeResultMap: resultMap["createAccount"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createAccount")
      }
    }

    public struct CreateAccount: GraphQLSelectionSet {
      public static let possibleTypes = ["Account"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String) {
        self.init(unsafeResultMap: ["__typename": "Account", "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class DeleteAccountMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation deleteAccount($id: ID!) {\n  deleteAccount(id: $id) {\n    __typename\n    id\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteAccount", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(DeleteAccount.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteAccount: DeleteAccount) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteAccount": deleteAccount.resultMap])
    }

    public var deleteAccount: DeleteAccount {
      get {
        return DeleteAccount(unsafeResultMap: resultMap["deleteAccount"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "deleteAccount")
      }
    }

    public struct DeleteAccount: GraphQLSelectionSet {
      public static let possibleTypes = ["Account"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Account", "id": id])
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
    }
  }
}

public final class UpdateAccountMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation updateAccount($id: ID!, $name: String!) {\n  updateAccount(id: $id, name: $name) {\n    __typename\n    id\n    name\n  }\n}"

  public var id: GraphQLID
  public var name: String

  public init(id: GraphQLID, name: String) {
    self.id = id
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["id": id, "name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateAccount", arguments: ["id": GraphQLVariable("id"), "name": GraphQLVariable("name")], type: .nonNull(.object(UpdateAccount.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateAccount: UpdateAccount) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateAccount": updateAccount.resultMap])
    }

    public var updateAccount: UpdateAccount {
      get {
        return UpdateAccount(unsafeResultMap: resultMap["updateAccount"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateAccount")
      }
    }

    public struct UpdateAccount: GraphQLSelectionSet {
      public static let possibleTypes = ["Account"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "Account", "id": id, "name": name])
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

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class UpdateProfileMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation updateProfile($name: String!) {\n  updateProfile(name: $name) {\n    __typename\n    name\n  }\n}"

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateProfile", arguments: ["name": GraphQLVariable("name")], type: .nonNull(.object(UpdateProfile.selections))),
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
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "name": name])
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
    }
  }
}

public final class CreateExpenseMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation createExpense($amount: Float!, $accountId: ID!, $date: DateTime, $comment: String, $payee: String, $categoryId: ID) {\n  createExpense(amount: $amount, accountId: $accountId, date: $date, comment: $comment, payee: $payee, categoryId: $categoryId) {\n    __typename\n    amount\n    comment\n  }\n}"

  public var amount: Double
  public var accountId: GraphQLID
  public var date: String?
  public var comment: String?
  public var payee: String?
  public var categoryId: GraphQLID?

  public init(amount: Double, accountId: GraphQLID, date: String? = nil, comment: String? = nil, payee: String? = nil, categoryId: GraphQLID? = nil) {
    self.amount = amount
    self.accountId = accountId
    self.date = date
    self.comment = comment
    self.payee = payee
    self.categoryId = categoryId
  }

  public var variables: GraphQLMap? {
    return ["amount": amount, "accountId": accountId, "date": date, "comment": comment, "payee": payee, "categoryId": categoryId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createExpense", arguments: ["amount": GraphQLVariable("amount"), "accountId": GraphQLVariable("accountId"), "date": GraphQLVariable("date"), "comment": GraphQLVariable("comment"), "payee": GraphQLVariable("payee"), "categoryId": GraphQLVariable("categoryId")], type: .nonNull(.object(CreateExpense.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createExpense: CreateExpense) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createExpense": createExpense.resultMap])
    }

    public var createExpense: CreateExpense {
      get {
        return CreateExpense(unsafeResultMap: resultMap["createExpense"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createExpense")
      }
    }

    public struct CreateExpense: GraphQLSelectionSet {
      public static let possibleTypes = ["Expense"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
        GraphQLField("comment", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(amount: Double, comment: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Expense", "amount": amount, "comment": comment])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var amount: Double {
        get {
          return resultMap["amount"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var comment: String? {
        get {
          return resultMap["comment"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "comment")
        }
      }
    }
  }
}

public final class DeleteFinanceOperationMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation deleteFinanceOperation($id: ID!) {\n  deleteFinanceOperation(id: $id) {\n    __typename\n    id\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteFinanceOperation", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(DeleteFinanceOperation.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteFinanceOperation: DeleteFinanceOperation) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteFinanceOperation": deleteFinanceOperation.resultMap])
    }

    public var deleteFinanceOperation: DeleteFinanceOperation {
      get {
        return DeleteFinanceOperation(unsafeResultMap: resultMap["deleteFinanceOperation"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "deleteFinanceOperation")
      }
    }

    public struct DeleteFinanceOperation: GraphQLSelectionSet {
      public static let possibleTypes = ["Expense", "Income", "Transfer"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeExpense(id: GraphQLID) -> DeleteFinanceOperation {
        return DeleteFinanceOperation(unsafeResultMap: ["__typename": "Expense", "id": id])
      }

      public static func makeIncome(id: GraphQLID) -> DeleteFinanceOperation {
        return DeleteFinanceOperation(unsafeResultMap: ["__typename": "Income", "id": id])
      }

      public static func makeTransfer(id: GraphQLID) -> DeleteFinanceOperation {
        return DeleteFinanceOperation(unsafeResultMap: ["__typename": "Transfer", "id": id])
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
    }
  }
}

public final class GetOperationsQuery: GraphQLQuery {
  public let operationDefinition =
    "query getOperations {\n  financeOperations {\n    __typename\n    id\n    amount\n    date\n    comment\n    account {\n      __typename\n      name\n      balance\n    }\n    ... on Expense {\n      payee\n      category {\n        __typename\n        id\n        name\n        public\n      }\n    }\n    ... on Income {\n      place\n      category {\n        __typename\n        id\n        name\n        public\n      }\n    }\n    ... on Transfer {\n      toAccount {\n        __typename\n        id\n        name\n        balance\n      }\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("financeOperations", type: .nonNull(.list(.nonNull(.object(FinanceOperation.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(financeOperations: [FinanceOperation]) {
      self.init(unsafeResultMap: ["__typename": "Query", "financeOperations": financeOperations.map { (value: FinanceOperation) -> ResultMap in value.resultMap }])
    }

    public var financeOperations: [FinanceOperation] {
      get {
        return (resultMap["financeOperations"] as! [ResultMap]).map { (value: ResultMap) -> FinanceOperation in FinanceOperation(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: FinanceOperation) -> ResultMap in value.resultMap }, forKey: "financeOperations")
      }
    }

    public struct FinanceOperation: GraphQLSelectionSet {
      public static let possibleTypes = ["Expense", "Income", "Transfer"]

      public static let selections: [GraphQLSelection] = [
        GraphQLTypeCase(
          variants: ["Expense": AsExpense.selections, "Income": AsIncome.selections, "Transfer": AsTransfer.selections],
          default: [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
            GraphQLField("date", type: .nonNull(.scalar(String.self))),
            GraphQLField("comment", type: .scalar(String.self)),
            GraphQLField("account", type: .nonNull(.object(Account.selections))),
          ]
        )
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeExpense(id: GraphQLID, amount: Double, date: String, comment: String? = nil, account: AsExpense.Account, payee: String? = nil, category: AsExpense.Category? = nil) -> FinanceOperation {
        return FinanceOperation(unsafeResultMap: ["__typename": "Expense", "id": id, "amount": amount, "date": date, "comment": comment, "account": account.resultMap, "payee": payee, "category": category.flatMap { (value: AsExpense.Category) -> ResultMap in value.resultMap }])
      }

      public static func makeIncome(id: GraphQLID, amount: Double, date: String, comment: String? = nil, account: AsIncome.Account, place: String? = nil, category: AsIncome.Category? = nil) -> FinanceOperation {
        return FinanceOperation(unsafeResultMap: ["__typename": "Income", "id": id, "amount": amount, "date": date, "comment": comment, "account": account.resultMap, "place": place, "category": category.flatMap { (value: AsIncome.Category) -> ResultMap in value.resultMap }])
      }

      public static func makeTransfer(id: GraphQLID, amount: Double, date: String, comment: String? = nil, account: AsTransfer.Account, toAccount: AsTransfer.ToAccount) -> FinanceOperation {
        return FinanceOperation(unsafeResultMap: ["__typename": "Transfer", "id": id, "amount": amount, "date": date, "comment": comment, "account": account.resultMap, "toAccount": toAccount.resultMap])
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

      public var amount: Double {
        get {
          return resultMap["amount"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var date: String {
        get {
          return resultMap["date"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "date")
        }
      }

      public var comment: String? {
        get {
          return resultMap["comment"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "comment")
        }
      }

      public var account: Account {
        get {
          return Account(unsafeResultMap: resultMap["account"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "account")
        }
      }

      public struct Account: GraphQLSelectionSet {
        public static let possibleTypes = ["Account"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("balance", type: .nonNull(.scalar(Double.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, balance: Double) {
          self.init(unsafeResultMap: ["__typename": "Account", "name": name, "balance": balance])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var balance: Double {
          get {
            return resultMap["balance"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "balance")
          }
        }
      }

      public var asExpense: AsExpense? {
        get {
          if !AsExpense.possibleTypes.contains(__typename) { return nil }
          return AsExpense(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsExpense: GraphQLSelectionSet {
        public static let possibleTypes = ["Expense"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("date", type: .nonNull(.scalar(String.self))),
          GraphQLField("comment", type: .scalar(String.self)),
          GraphQLField("account", type: .nonNull(.object(Account.selections))),
          GraphQLField("payee", type: .scalar(String.self)),
          GraphQLField("category", type: .object(Category.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, amount: Double, date: String, comment: String? = nil, account: Account, payee: String? = nil, category: Category? = nil) {
          self.init(unsafeResultMap: ["__typename": "Expense", "id": id, "amount": amount, "date": date, "comment": comment, "account": account.resultMap, "payee": payee, "category": category.flatMap { (value: Category) -> ResultMap in value.resultMap }])
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

        public var amount: Double {
          get {
            return resultMap["amount"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }

        public var date: String {
          get {
            return resultMap["date"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "date")
          }
        }

        public var comment: String? {
          get {
            return resultMap["comment"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "comment")
          }
        }

        public var account: Account {
          get {
            return Account(unsafeResultMap: resultMap["account"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "account")
          }
        }

        public var payee: String? {
          get {
            return resultMap["payee"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "payee")
          }
        }

        public var category: Category? {
          get {
            return (resultMap["category"] as? ResultMap).flatMap { Category(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "category")
          }
        }

        public struct Account: GraphQLSelectionSet {
          public static let possibleTypes = ["Account"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("balance", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, balance: Double) {
            self.init(unsafeResultMap: ["__typename": "Account", "name": name, "balance": balance])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var balance: Double {
            get {
              return resultMap["balance"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "balance")
            }
          }
        }

        public struct Category: GraphQLSelectionSet {
          public static let possibleTypes = ["ExpenseCategory"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("public", type: .nonNull(.scalar(Bool.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, `public`: Bool) {
            self.init(unsafeResultMap: ["__typename": "ExpenseCategory", "id": id, "name": name, "public": `public`])
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

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var `public`: Bool {
            get {
              return resultMap["public"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "public")
            }
          }
        }
      }

      public var asIncome: AsIncome? {
        get {
          if !AsIncome.possibleTypes.contains(__typename) { return nil }
          return AsIncome(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsIncome: GraphQLSelectionSet {
        public static let possibleTypes = ["Income"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("date", type: .nonNull(.scalar(String.self))),
          GraphQLField("comment", type: .scalar(String.self)),
          GraphQLField("account", type: .nonNull(.object(Account.selections))),
          GraphQLField("place", type: .scalar(String.self)),
          GraphQLField("category", type: .object(Category.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, amount: Double, date: String, comment: String? = nil, account: Account, place: String? = nil, category: Category? = nil) {
          self.init(unsafeResultMap: ["__typename": "Income", "id": id, "amount": amount, "date": date, "comment": comment, "account": account.resultMap, "place": place, "category": category.flatMap { (value: Category) -> ResultMap in value.resultMap }])
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

        public var amount: Double {
          get {
            return resultMap["amount"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }

        public var date: String {
          get {
            return resultMap["date"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "date")
          }
        }

        public var comment: String? {
          get {
            return resultMap["comment"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "comment")
          }
        }

        public var account: Account {
          get {
            return Account(unsafeResultMap: resultMap["account"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "account")
          }
        }

        public var place: String? {
          get {
            return resultMap["place"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "place")
          }
        }

        public var category: Category? {
          get {
            return (resultMap["category"] as? ResultMap).flatMap { Category(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "category")
          }
        }

        public struct Account: GraphQLSelectionSet {
          public static let possibleTypes = ["Account"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("balance", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, balance: Double) {
            self.init(unsafeResultMap: ["__typename": "Account", "name": name, "balance": balance])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var balance: Double {
            get {
              return resultMap["balance"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "balance")
            }
          }
        }

        public struct Category: GraphQLSelectionSet {
          public static let possibleTypes = ["IncomeCategory"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("public", type: .nonNull(.scalar(Bool.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, `public`: Bool) {
            self.init(unsafeResultMap: ["__typename": "IncomeCategory", "id": id, "name": name, "public": `public`])
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

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var `public`: Bool {
            get {
              return resultMap["public"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "public")
            }
          }
        }
      }

      public var asTransfer: AsTransfer? {
        get {
          if !AsTransfer.possibleTypes.contains(__typename) { return nil }
          return AsTransfer(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsTransfer: GraphQLSelectionSet {
        public static let possibleTypes = ["Transfer"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("date", type: .nonNull(.scalar(String.self))),
          GraphQLField("comment", type: .scalar(String.self)),
          GraphQLField("account", type: .nonNull(.object(Account.selections))),
          GraphQLField("toAccount", type: .nonNull(.object(ToAccount.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, amount: Double, date: String, comment: String? = nil, account: Account, toAccount: ToAccount) {
          self.init(unsafeResultMap: ["__typename": "Transfer", "id": id, "amount": amount, "date": date, "comment": comment, "account": account.resultMap, "toAccount": toAccount.resultMap])
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

        public var amount: Double {
          get {
            return resultMap["amount"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "amount")
          }
        }

        public var date: String {
          get {
            return resultMap["date"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "date")
          }
        }

        public var comment: String? {
          get {
            return resultMap["comment"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "comment")
          }
        }

        public var account: Account {
          get {
            return Account(unsafeResultMap: resultMap["account"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "account")
          }
        }

        public var toAccount: ToAccount {
          get {
            return ToAccount(unsafeResultMap: resultMap["toAccount"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "toAccount")
          }
        }

        public struct Account: GraphQLSelectionSet {
          public static let possibleTypes = ["Account"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("balance", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, balance: Double) {
            self.init(unsafeResultMap: ["__typename": "Account", "name": name, "balance": balance])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var balance: Double {
            get {
              return resultMap["balance"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "balance")
            }
          }
        }

        public struct ToAccount: GraphQLSelectionSet {
          public static let possibleTypes = ["Account"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("balance", type: .nonNull(.scalar(Double.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, balance: Double) {
            self.init(unsafeResultMap: ["__typename": "Account", "id": id, "name": name, "balance": balance])
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

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var balance: Double {
            get {
              return resultMap["balance"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "balance")
            }
          }
        }
      }
    }
  }
}

public final class AccountsQuery: GraphQLQuery {
  public let operationDefinition =
    "query accounts {\n  accounts {\n    __typename\n    id\n    name\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("accounts", type: .nonNull(.list(.nonNull(.object(Account.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(accounts: [Account]) {
      self.init(unsafeResultMap: ["__typename": "Query", "accounts": accounts.map { (value: Account) -> ResultMap in value.resultMap }])
    }

    public var accounts: [Account] {
      get {
        return (resultMap["accounts"] as! [ResultMap]).map { (value: ResultMap) -> Account in Account(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Account) -> ResultMap in value.resultMap }, forKey: "accounts")
      }
    }

    public struct Account: GraphQLSelectionSet {
      public static let possibleTypes = ["Account"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "Account", "id": id, "name": name])
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

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class MeQuery: GraphQLQuery {
  public let operationDefinition =
    "query me {\n  me {\n    __typename\n    id\n    phone\n    name\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("me", type: .object(Me.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("phone", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, phone: String, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "phone": phone, "name": name])
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

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}