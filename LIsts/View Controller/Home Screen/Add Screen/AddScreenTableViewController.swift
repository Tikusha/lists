//
//  AddScreenViewController.swift
//  LIsts
//
//  Created by Tiko on 6/21/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit

protocol AddNoteDelegate: class {
    func addTextViewController(_ controller: AddScreenTableViewController,  addText: String)
    func editTextViewController(_ controller: AddScreenTableViewController, editText: String)
}

class AddScreenTableViewController: UITableViewController {
    
    @IBOutlet private weak var textField: UITextField!
    
    weak var delegate: AddNoteDelegate?
    var text: String?
    var textEdit: NoteModel?
    var addText: NoteList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInit()
        self.setBarButton()
    }
    
    func setBarButton() {
        if let text = self.text {
            self.textField.text = text
            self.tabBarItem.title = "Edit"
            self.tabBarItem.isEnabled = true
        }
    }
    
    func setInit() {
        self.textField.text = text
    }
    
    @IBAction func Done(_ sender: Any) {
        if var text = self.textEdit, let editText = self.textField.text {
            text.title = editText
            self.delegate?.editTextViewController(self, editText: text.title)
        } else {
            if var note = addText?.addNote() {
                if let textField = self.textField.text {
                    note.title = textField
                }
                self.delegate?.addTextViewController(self, addText: note.title)
            }
        }
        if let text = self.textField.text {
            let note = NoteModel(picture: "image1", title: text)
            self.delegate?.addTextViewController(self, addText: note.title)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
