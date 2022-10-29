//
//  KakaoTalkViewController.swift
//  testtable
//
//  Created by jinyong yun on 2022/10/26.
//

import UIKit
import Lottie
import SwiftReorder

class KakaoTalkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chattingRoomData.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let spacer = tableView.reorder.spacerCell(for: indexPath){
            return spacer
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KakaoTalkTableViewCell", for: indexPath) as? KakaoTalkTableViewCell else { return UITableViewCell() }
        
        
       

        
        cell.nameLabel.text = chattingRoomData[indexPath.row].name
        cell.profileImageView.image = chattingRoomData[indexPath.row].profileImage
        cell.lastMessageLabel.text = chattingRoomData[indexPath.row].lastMessage
        if let memberCount = chattingRoomData[indexPath.row].memberCount {
            cell.memberCountLabel.text = memberCount
        }else{
            
            cell.memberCountLabel.isHidden = true
            
        }
        cell.timeLabel.text = chattingRoomData[indexPath.row].time
        cell.messageCountLabel.text = chattingRoomData[indexPath.row].memberCount
        
        if indexPath.row == 0 {
            cell.backgroundColor = .red
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let readAction = UIContextualAction(style: .normal, title: "읽음", handler: {
            (action, view, completionHandler) in
            completionHandler(true)
        }
    )
    readAction.backgroundColor = .darkGray
    
    let exitAction = UIContextualAction(
        style: .destructive,
        title: "나가기",
        handler: {
            (action, view, completionHandler) in
            completionHandler(true)
        }
        )
        return UISwipeActionsConfiguration(actions: [exitAction, readAction])
        }
        
    @IBOutlet weak var kakaoTalkTableView: UITableView!
    let refreshControl = UIRefreshControl()
    
    lazy var lottieView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "refreshLottie")
            animationView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            let centerX = UIScreen.main.bounds.width / 2
            animationView.center = CGPoint(x: centerX, y: 40)
            animationView.contentMode = .scaleAspectFit
            animationView.stop()
            animationView.isHidden = true
            return animationView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kakaoTalkTableView.reorder.delegate = self
        setupTableView()
        initRefreshControl()
    }
    
    func setupTableView() {
            kakaoTalkTableView.delegate = self
            kakaoTalkTableView.dataSource = self
        }
    
    func initRefreshControl() {
          refreshControl.addSubview(lottieView)
          refreshControl.tintColor = .clear
          refreshControl.addTarget(
              self,
              action: #selector(refreshTableView(refreshControl:)),
              for: .valueChanged
          )
          
          kakaoTalkTableView.refreshControl = refreshControl
      }
      
      @objc func refreshTableView(refreshControl: UIRefreshControl) {
          print("새로고침!!")
          lottieView.isHidden = false
          lottieView.play()
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
              self.lottieView.isHidden = true
              self.lottieView.stop()
              self.kakaoTalkTableView.reloadData()
              refreshControl.endRefreshing()
          }
      }
    
  
    
    var chattingRoomData: [ChattingRoomDataModel] = [
    ChattingRoomDataModel(
        profileImage: UIImage(named: "swiftIcon"),
        name: "ios 단톡방",
        lastMessage: "사진을 보냈습니다.",
        memberCount: "200",
        time: "오전 1:05",
        messageCount: "61"
    ),
    ChattingRoomDataModel(
        profileImage: UIImage(named: "umcIcon"),
        name: "umc 4기 단톡방",
        lastMessage: "다들 미션 안해오시면...아시죠?",
        memberCount: "20",
        time: "오후 2:05",
        messageCount: "4"
    ),
    ChattingRoomDataModel(
        profileImage: UIImage(named: "dobbyIcon"),
        name: "도비",
        lastMessage: "나 화이팅",
        memberCount: nil,
        time: "오전 11:05",
        messageCount: "1"
    ),
    ChattingRoomDataModel(
        profileImage: UIImage(named: "defaultProfileIcon"),
        name: "익명1",
        lastMessage: "화이팅 해봥!!",
        memberCount: nil,
        time: "어제",
        messageCount: "1"
    ),
    ChattingRoomDataModel(
        profileImage: UIImage(named: "defaultProfileIcon"),
        name: "익명1",
        lastMessage: "화이팅 해qhdkdy!!",
        memberCount: nil,
        time: "어제",
        messageCount: "1"
    ),
    ChattingRoomDataModel(
        profileImage: UIImage(named: "defaultProfileIcon"),
        name: "익명1",
        lastMessage: "화이팅 하던가말던갘ㅋ!!",
        memberCount: nil,
        time: "어제",
        messageCount: "1"
    ),
    ChattingRoomDataModel(
        profileImage: UIImage(named: "defaultProfileIcon"),
        name: "익명2",
        lastMessage: "ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ!!",
        memberCount: nil,
        time: "어제",
        messageCount: "1"
    ),
    ChattingRoomDataModel(
        profileImage: UIImage(named: "defaultProfileIcon"),
        name: "익명3",
        lastMessage: "ㅎㅎ!!",
        memberCount: nil,
        time: "어제",
        messageCount: "1"
    ),
    ChattingRoomDataModel(
        profileImage: UIImage(named: "defaultProfileIcon"),
        name: "익명4",
        lastMessage: "ㅎㅎ!!",
        memberCount: nil,
        time: "어제",
        messageCount: "1"
    ),
    ChattingRoomDataModel(
        profileImage: UIImage(named: "defaultProfileIcon"),
        name: "익명5",
        lastMessage: "ㅎㅎ!!",
        memberCount: nil,
        time: "어제",
        messageCount: "1"
    ),
    ChattingRoomDataModel(
        profileImage: UIImage(named: "defaultProfileIcon"),
        name: "익63",
        lastMessage: "ㅎㅎ!!",
        memberCount: nil,
        time: "어제",
        messageCount: "1"
    ),
    ChattingRoomDataModel(
        profileImage: UIImage(named: "defaultProfileIcon"),
        name: "익명7",
        lastMessage: "ㅎㅎ!!",
        memberCount: nil,
        time: "어제",
        messageCount: "1"
    ),
    ]
}


struct ChattingRoomDataModel {
    let profileImage: UIImage?
    let name: String
    let lastMessage: String
    let memberCount: String?
    let time: String
    let messageCount: String
    
    
    
    
    
    
}


extension KakaoTalkViewController: TableViewReorderDelegate {
    
    func tableView(_ tableView: UITableView, reorderRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveCell = self.chattingRoomData[sourceIndexPath.row]
                self.chattingRoomData.remove(at: sourceIndexPath.row)
                self.chattingRoomData.insert(moveCell, at: destinationIndexPath.row)
      }
    
}
