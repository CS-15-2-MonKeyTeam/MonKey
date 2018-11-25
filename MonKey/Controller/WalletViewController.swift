import UIKit
import Apollo

class WalletViewController: UIViewController {
    let cellID = "cell"
    var walletID = [GraphQLID]()
    var walletName = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        getAccountId()
        addSubviews()
        layout()
    }
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.OperationColor.categoryColor.cgColor
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(WalletCell.self, forCellReuseIdentifier: cellID)
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.separatorStyle = .none
        return view
    }()
    
    func getAccountId() {
        LoginManager.shared.apollo.fetch(query: AccountsQuery()) { (result, error) in
            if let error = error {
                print("\(error)")
            }

            guard let result = result?.data else { return }
            let id = result.accounts.compactMap{$0.id}
            let name = result.accounts.compactMap{$0.name}
            self.walletID.append(contentsOf: id)
            self.walletName.append(contentsOf: name)
            self.tableView.reloadData()
        }
    }
    
    func addSubviews() {
        view.addSubview(containerView)
    }
    
    func layout() {
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 5).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        containerView.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != containerView {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension WalletViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return walletName.count == 0 ? 1 : walletName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if walletName.count == 0 {
            cell.textLabel?.text = "Упс, здесь пусто"
        } else {
            cell.textLabel?.text = "\(walletName[indexPath.row])"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = walletID[indexPath.row]
        NewOperationViewController.accountId = id
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
