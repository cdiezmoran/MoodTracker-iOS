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
        didSet { //This is an observer and waits for the array to change and when it changes it runs whatever we put inside here.
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
        
        // Add a target to the mood button that waits for an action to happen on the button in this case if it is touched (for: .touchUpInside) and when that happens it runs an action in this case the updateMood function from FriendsTableViewController.
        cell.moodButton.addTarget(self, action: #selector(FriendsTableViewController.updateMood), for: .touchUpInside)
        
        // Set the button's tag to the index of the friend. The tag property is like an identifier.
        cell.moodButton.tag = indexPath.row
        
        return cell
    }
    
    func updateMood(sender: UIButton) {
        // Get the friend to update using the tag property we set earlier.
        let friendToUpdate = friendArray[sender.tag]
        
        // Get current mood.
        let mood = friendToUpdate.mood
        var nextMood: Mood!
        
        // Get next mood based on the previous one.
        switch mood {
        case .happy:
            nextMood = Mood.medium
        case .medium:
            nextMood = Mood.angry
        case .angry:
            nextMood = Mood.happy
        }
        
        //Update the model.
        friendToUpdate.mood = nextMood
        
        //update the view.
        tableView.reloadData()
    }
    
    @IBAction func unwindToFriendsViewController(_ segue: UIStoryboardSegue) {
        
    }
}
