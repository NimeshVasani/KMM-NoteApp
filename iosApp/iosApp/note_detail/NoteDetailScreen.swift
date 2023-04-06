//
//  NoteDetailScreen.swift
//  iosApp
//
//  Created by Nimesh Vasani on 2023-04-05.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

struct NoteDetailScreen: View {
    private var noteDao :NoteDao
    private var noteId :Int64? = nil
    
    @StateObject var viewModel = NoteDetailViewModel(noteDao : nil)
    
    @Environment(\.presentationMode) var presentation
    
    init(noteDao: NoteDao, noteId: Int64? = nil) {
        self.noteDao = noteDao
        self.noteId = noteId
    }
    
    var body: some View {
        VStack(alignment: .leading){
            TextField("Enter a Title.. ", text :$viewModel.noteTitle)
                .font(.title)
            TextField("Enter Some Content...", text: $viewModel.noteContent)
                .font(.title3)
            Spacer()
        }.toolbar(content: {
            Button(action: {
                viewModel.saveNote {
                    self.presentation.wrappedValue.dismiss()
                }
            }){
                Image(systemName: "checkmark")
            }
        })
        .padding()
        .background(Color(hex: viewModel.noteColor))
        .onAppear{
            viewModel.saveParamsAndLoadNotes(notedDao: noteDao, noteId: noteId)
        }
    }
    
}

struct NoteDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
