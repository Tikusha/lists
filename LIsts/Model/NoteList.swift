//
//  NoteList.swift
//  LIsts
//
//  Created by Tiko on 6/21/20.
//  Copyright © 2020 Tiko. All rights reserved.
//

import Foundation

class NoteList {
    var edit = false
    
    var note: [NoteModel] = [ NoteModel(picture: "image\((1...10).randomElement() ?? 1)", title: "image\((1...10).randomElement() ?? 1)"),
                              NoteModel(picture: "image\((1...10).randomElement() ?? 1)", title: "image\((1...10).randomElement() ?? 1)"),
                              NoteModel(picture: "image\((1...10).randomElement() ?? 1)", title: "image\((1...10).randomElement() ?? 1)"),
                              NoteModel(picture: "image\((1...10).randomElement() ?? 1)", title: "image\((1...10).randomElement() ?? 1)"),
                              NoteModel(picture: "image\((1...10).randomElement() ?? 1)", title: "image\((1...10).randomElement() ?? 1)"),
                              NoteModel(picture: "image\((1...10).randomElement() ?? 1)", title: "image\((1...10).randomElement() ?? 1)"),
                              NoteModel(picture: "image\((1...10).randomElement() ?? 1)", title: "image\((1...10).randomElement() ?? 1)"),
                              NoteModel(picture: "image\((1...10).randomElement() ?? 1)", title: "image\((1...10).randomElement() ?? 1)")
    ]
    
    func addNote(at indextPath: Int) {
        self.note.insert(NoteModel(picture: "image3", title: "New"), at: indextPath)
    }
   
    func addNote() -> NoteModel {
        var note = NoteModel()
        note.picture = "image7"
        note.title = "Image"
        self.note.append(note)
        return note
    }
}
