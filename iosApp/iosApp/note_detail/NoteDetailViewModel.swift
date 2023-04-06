//
//  NoteDetailViewModel.swift
//  iosApp
//
//  Created by Nimesh Vasani on 2023-04-05.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import shared

extension NoteDetailScreen{
    @MainActor class NoteDetailViewModel : ObservableObject{
        private var noteDao : NoteDao?
        
        private var noteId: Int64? = nil
        
        @Published var noteTitle = ""
        @Published var noteContent = ""
        @Published private(set) var noteColor = Note.Companion().generateRandomColor()
        
        init(noteDao : NoteDao? = nil){
            self.noteDao = noteDao
        }
        
        func loadNoteIfExist(id : Int64?){
            if id != nil{
                self.noteId = id
                noteDao?.getNoteById(id: id!, completionHandler: {note, error in
                    self.noteTitle = note?.title ?? ""
                    self.noteContent = note?.content ?? ""
                    self.noteColor = note?.colorHex ?? Note.Companion().generateRandomColor()
                    
                })
            }
        }
        
        func saveNote(onSave : @escaping() -> Void){
            noteDao?.insertNote(note: Note(id: noteId == nil ? nil :KotlinLong(value: noteId!), title: self.noteTitle, content: self.noteContent, colorHex: self.noteColor, createdAt: DateTimeSupport().now()), completionHandler: {error in
                onSave()
                
            })
        }
        
        func saveParamsAndLoadNotes(notedDao :NoteDao , noteId : Int64?){
            self.noteDao = notedDao
            loadNoteIfExist(id: noteId)
        }
    }
}
