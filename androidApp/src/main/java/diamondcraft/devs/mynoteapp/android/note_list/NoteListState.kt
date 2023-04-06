package diamondcraft.devs.mynoteapp.android.note_list

import diamondcraft.devs.mynoteapp.domain.note.Note

data class NoteListState(
    val notes: List<Note> = emptyList(),
    val searchText: String = "",
    val isSearchActive: Boolean = false

)

