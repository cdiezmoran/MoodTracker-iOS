//
//  FriendsTableViewController.swift
//  MoodTracker-starter
//
//  Created by Nikolas Burk on 02/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friendArray = [
        Friend(name: "Pam", mood: .happy),
        Friend(name: "Peps", mood: .angry),
        Friend(name: "Galder", mood: .medium),
        Friend(name: "Amaya", mood: .happy)
        ] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendTableViewCell") as! FriendTableViewCell
        
        let friend = friendArray[indexPath.row]
        
        cell.nameLabel.text = friend.name
        cell.moodDescriptionLabel.text = Friend.getDescription(mood: friend.mood)
        cell.moodButton.setTitle(friend.mood.rawValue, for: .normal)
        
        cell.moodButton.addTarget(self, action: #selector(FriendsTableViewController.updateMood), for: .touchUpInside)
        cell.moodButton.tag = indexPath.row
        
        return cell
    }
    
    func updateMood(sender: UIButton) {
        let friendToUpdate = friendArray[sender.tag]
        let mood = friendToUpdate.mood
        var nextMood: Mood!
        
        switch mood {
        case .happy:
            nextMood = Mood.medium
        case .medium:
            nextMood = Mood.angry
        case .angry:
            nextMood = Mood.happy
        }
        
        friendToUpdate.mood = nextMood
        
        
        tableView.reloadData()
    }
    
    @IBAction func unwindToFriendsViewController(_ segue: UIStoryboardSegue) {
        
    }
}
