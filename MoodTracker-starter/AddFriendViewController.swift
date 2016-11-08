//
//  AddFriendViewController.swift
//  MoodTracker-starter
//
//  Created by Carlos Diez on 11/6/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {
    
    @IBOutlet weak var friendNameField: UITextField!
    @IBOutlet weak var moodSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Save" {
            let name = friendNameField.text
            let mood: Mood!
            
            switch moodSelector.selectedSegmentIndex {
            case 0: mood = .happy
            case 1: mood = .medium
            case 2: mood = .angry
            default: mood = .happy
            }
            
            let newFriend = Friend(name: name!, mood: mood)
            
            let friendsTableViewController = segue.destination as! FriendsTableViewController
            friendsTableViewController.friendArray.append(newFriend)
        }
    }
}
