//
//  NotesTableViewCell.swift
//  LIsts
//
//  Created by Tiko on 6/21/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    @IBOutlet  weak var titleLabel: UILabel!
    @IBOutlet  weak var picture: UIImageView!
    
    let noteList: NoteList
    
    required init?(coder: NSCoder) {
        noteList = NoteList()
        super.init(coder: coder)
    }
    
    func setInicilazer(at indexPath: Int) {
//        self.picture.image = UIImage(named: noteList.note[indexPath].picture)
//        self.titleLabel.text = noteList.note[indexPath].title
        self.picture.image = UIImage(named: "image\((1...10).randomElement() ?? 1)")
        self.titleLabel.text = "Flower"
    }
}
