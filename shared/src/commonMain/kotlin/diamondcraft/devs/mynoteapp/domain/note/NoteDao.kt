package diamondcraft.devs.mynoteapp.domain.note

interface NoteDao {
    suspend fun  insertNote(note:Note)
    suspend fun getNoteById(id :Long) :Note?
    suspend fun getAllNotes() :List<Note>
    suspend fun deleteNote(id: Long)

}