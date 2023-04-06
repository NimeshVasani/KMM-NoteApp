//
//  NoteListViewModel.swift
//  iosApp
//
//  Created by Nimesh Vasani on 2023-04-03.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import shared

extension NoteListScreen{
    @MainActor class NoteListViewModel:ObservableObject{
        
        private var noteDao: NoteDao? = nil
        
        private let searchNotes = SearchInNotes()
        private var notes = [Note]()
        @Published private (set) var filteredNotes = [Note]()
        @Published  var searchText = ""{
            didSet{
                self.filteredNotes = searchNotes.execute(notes: self.notes, query: searchText)
            }
        }
        
        @Published private (set) var isSearchActive = false
        
        init(noteDao: NoteDao? = nil){
            self.noteDao = noteDao
        }
        
        func loadNotes(){
            noteDao?.getAllNotes(completionHandler: { notes, error in
                self.notes = notes ?? []
                self.filteredNotes = self.notes
            })
        }
        
        func deleteNoteById(id:Int64?){
            if id != nil{
                noteDao?.deleteNote(id: id!, completionHandler: { error in
                    self.loadNotes()
                    
                })
            }
        }
        
        func toggleSearchActive(){
            isSearchActive = !isSearchActive
            if !isSearchActive {
                searchText = ""
            }
        }
        
        func setNoteDao(noteDao: NoteDao){
            self.noteDao = noteDao
        }
    }
}
