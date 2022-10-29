//
//  ViewController.swift
//  ThisisDiaryalsomemo
//
//  Created by mac on 2022/10/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    
    var memos = [Memo]() {
        didSet {
            self.saveMemo()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadMemos()
    }
    
    @objc func doneButtonTap(){
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true)
        
    }


    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        guard !self.memos.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "오늘의 메모", message: "기록할 것이 있나요?", preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "쓰기", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else {return}
            let memo = Memo(title: title)
            self?.memos.append(memo)
            self?.tableView.reloadData()
        })
        let cancelButton = UIAlertAction(title: "안쓸래", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: {
            textField in
            textField.placeholder = "무엇을 기록하시나요?"
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveMemo() {
        let data = self.memos.map {
            [
                "title":$0.title
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "memos")
    }
    
    func loadMemos(){
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "memos") as? [[String: Any]] else {return}
        self.memos = data.compactMap {
            guard let title = $0["title"] as? String else { return nil }
            return Memo(title:title)
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let memo = self.memos[indexPath.row]
        cell.textLabel?.text = memo.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.memos.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if self.memos.isEmpty {
            self.doneButtonTap()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        
        var memos = self.memos
        let memo = memos[sourceIndexPath.row]
        memos.remove(at: sourceIndexPath.row)
        memos.insert(memo, at:destinationIndexPath.row)
        self.memos = memos
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memo = self.memos[indexPath.row]
        //무언가 할 일
        self.memos[indexPath.row] = memo
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
}
