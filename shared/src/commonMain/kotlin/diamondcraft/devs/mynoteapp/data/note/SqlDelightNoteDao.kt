package diamondcraft.devs.mynoteapp.data.note

import diamondcraft.devs.mynoteapp.database.NoteDatabase
import diamondcraft.devs.mynoteapp.domain.note.Note
import diamondcraft.devs.mynoteapp.domain.note.NoteDao
import diamondcraft.devs.mynoteapp.domain.time.DateTimeSupport
import kotlinx.datetime.LocalDateTime

class SqlDelightNoteDao(
    noteDb: NoteDatabase
) : NoteDao {
    private val queries = noteDb.noteQueries
    override suspend fun insertNote(note: Note) {
        queries.addNote(
            id = note.id,
            title = note.title,
            content = note.content,
            colorHex = note.colorHex,
            created = DateTimeSupport.toEpochMilli(note.createdAt)
        )
    }

    override suspend fun getNoteById(id: Long): Note? {
        return queries
            .getNotesById(id)
            .executeAsOneOrNull()
            ?.toNote()

    }

    override suspend fun getAllNotes(): List<Note> {
        return queries
            .getAllNotes()
            .executeAsList()
            .map {
                it.toNote()
            }
    }

    override suspend fun deleteNote(id: Long) {
        queries.deleteNote(id)
    }
}