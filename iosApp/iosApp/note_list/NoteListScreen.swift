//
//  NoteListScreen.swift
//  iosApp
//
//  Created by Nimesh Vasani on 2023-04-03.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

struct NoteListScreen: View {
    private var noteDao: NoteDao
    @StateObject var viewModel = NoteListViewModel(noteDao: nil)
    
    @State private var isNoteSelected = false
    @State private var selectedNoteId: Int64? = nil
    
    init(noteDao: NoteDao) {
        self.noteDao = noteDao
    }
    
    var body: some View {
        VStack{
            ZStack{
                NavigationLink(destination:NoteDetailScreen(noteDao: self.noteDao,noteId: selectedNoteId) , isActive: $isNoteSelected){
                    EmptyView()
                }
                .hidden()
                HideableSearchTextField<NoteDetailScreen>(onSearchToggled: {viewModel.toggleSearchActive()},
                                                          destinationProvider: {
                                                                NoteDetailScreen(noteDao: noteDao, noteId: selectedNoteId
                                                        )},
                                                          isSearchActive: viewModel.isSearchActive,
                                                          searchText: $viewModel.searchText)
                .frame(maxWidth : .infinity,minHeight: 40.0)
                .padding()
                
                if !viewModel.isSearchActive{
                    Text("All Notes")
                        .font(.title2)
                }
            }
            
            List{
                ForEach(viewModel.filteredNotes, id: \.self.id){ note in
                    Button(action:{
                        isNoteSelected = true
                        selectedNoteId = note.id?.int64Value
                    }){
                        NoteItem(note: note, onDeleteCick: {
                            viewModel.deleteNoteById(id: note.id?.int64Value)
                        })
                    }
                }
            }.onAppear{
                viewModel.loadNotes()
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)

        }.onAppear{
            viewModel.setNoteDao(noteDao: noteDao)
        }
    }
    
    struct NoteListScreen_Previews : PreviewProvider{
        static var previews: some View{
            EmptyView()
        }
    }
    
}
