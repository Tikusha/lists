//
//  HomeScreenViewController.swift
//  LIsts
//
//  Created by Tiko on 6/21/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import UIKit


class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let noteList: NoteList
    
    required init?(coder: NSCoder) {
        self.noteList = NoteList()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func editCell(at indexPath: IndexPath) {
        
        self.tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    func insert(at indexPath: IndexPath) {
        self.noteList.addNote(at: indexPath.row + 1)
        self.tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: indexPath.section)], with: .automatic)
    }
    
    func deleteCell(at indexPath: IndexPath) {
        self.noteList.note.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: indexPath.section)], with: .fade)
    }
    
    func editCell(at indexPath: IndexPath, text: String) {
        self.noteList.note[indexPath.row].title = "skmlsmlkfs"
        self.tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    func goToScreen(edit: Bool, text: String) {
        let storyboard = UIStoryboard(name: "AddScreen", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "AddScreenTableViewController") as AddScreenTableViewController
        vc.delegate = self
        vc.text = text
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        self.goToScreen(edit: false, text: "")
    }
    
    @IBAction func adit(_ sender: Any) {
        self.tableView.isEditing = true
    }
}

extension HomeScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.noteList.note.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? NoteCell
        cell?.picture.image = UIImage(named: noteList.note[indexPath.row].picture)
        cell?.titleLabel.text = noteList.note[indexPath.row].title
        return cell!
    }
}

extension HomeScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.insert(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return [
            UITableViewRowAction(style: .normal, title: "Delete") { (action, path) in
                self.deleteCell(at: path)
            },
            UITableViewRowAction(style: .normal, title: "Edit") { (action, path) in
                self.goToScreen(edit: true, text: self.noteList.note[indexPath.row].title)
                self.editCell(at: indexPath, text: "dfff")
            }
        ]
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let row = self.noteList.note.remove(at: sourceIndexPath.row)
        self.noteList.note.insert(row, at: destinationIndexPath.row)
    }
}

extension HomeScreenViewController: AddNoteDelegate {
    func editTextViewController(_ controller: AddScreenTableViewController, editText: String) {
//        let rowIndex = self.noteList.note.index(of
    }
    
    func addTextViewController(_ controller: AddScreenTableViewController, addText: String) {
        navigationController?.popViewController(animated: true)
        let rowIndex = self.noteList.note.count
        let indexPath = IndexPath(row: rowIndex, section: 0)
        self.noteList.note.append(NoteModel(picture: "image1", title: addText))
        self.tableView.insertRows(at: [indexPath], with: .fade)
    }
}
