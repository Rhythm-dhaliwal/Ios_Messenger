//
//  Chat_CtrlViewController.swift
//  Messenger
//
//  Created by Rhythm Dhaliwal on 11/11/24.
//

import MessageKit
import UIKit

struct Message: MessageType {
    var sender: any MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind
}

struct Sender: SenderType{
    var PhotoURL: String
    var senderId: String
    var displayName: String
}

class Chat_Ctrl: MessagesViewController {
    
    private var messages = [Message]()
    private let selfSender = Sender(PhotoURL: ""
                                    , senderId: "1"
                                    , displayName: "Samiksha")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        messages.append(Message(sender: selfSender
                                , messageId: "1"
                                , sentDate: Date()
                                , kind: .text("Hello world")))
        
        messages.append(Message(sender: selfSender
                                , messageId: "1"
                                , sentDate: Date()
                                , kind: .text("Hey rhythm im so sorry for what i did can we have a fresh start as i started to fall for you now.")))
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self

    }

}

extension Chat_Ctrl: MessagesDataSource,MessagesLayoutDelegate,MessagesDisplayDelegate{
    func currentSender() -> any MessageKit.SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> any MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}