//
//  NoteItem.swift
//  iosApp
//
//  Created by Nimesh Vasani on 2023-04-03.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared
struct NoteItem: View {
    var note:Note
    var onDeleteCick: () -> Void
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(note.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Button(action :onDeleteCick){
                    Image(systemName: "xmark").foregroundColor(.black)
                }
            }.padding(.bottom,3)
            
            Text(note.content)
                .fontWeight(.light)
                .padding(.bottom, 3)
            HStack{
                Spacer()
                Text(DateTimeSupport().formatNoteDate(dateTime: note.createdAt))
                    .font(.footnote)
                    .fontWeight(.light)
            }
        }.padding()
            .background(Color(hex: note.colorHex))
            .clipShape(RoundedRectangle(cornerRadius: 5.0))
    }
}

struct NoteItem_Previews: PreviewProvider {
    static var previews: some View {
        NoteItem(
            note : Note(id: nil, title: "My Note", content: "Note Content", colorHex: 0xFF2341, createdAt:DateTimeSupport().now()), onDeleteCick: {}
        )
    }
}
