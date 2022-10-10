//
//  TaskTableViewCell.swift
//  ToDoList
//
//  Created by Anderson Sales on 09/10/22.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func setDescription(description: String) {
        self.descriptionLabel.text = description
    }
    
    public func setDate(date: String) {
        self.dateLabel.text = date
    }
    
    public func setTime(time: String) {
        self.timeLabel.text = time
    }

}
