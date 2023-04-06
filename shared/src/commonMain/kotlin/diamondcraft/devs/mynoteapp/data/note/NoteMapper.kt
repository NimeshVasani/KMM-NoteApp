package diamondcraft.devs.mynoteapp.data.note

import database.NoteListTable
import diamondcraft.devs.mynoteapp.database.NoteDatabase
import diamondcraft.devs.mynoteapp.domain.note.Note
import kotlinx.datetime.Instant
import kotlinx.datetime.toLocalDateTime

fun NoteListTable.toNote(): Note {
    return Note(
        id = id,
        title = title,
        content = content,
        colorHex = colorHex,
        createdAt = Instant.fromEpochMilliseconds(created)
            .toLocalDateTime(kotlinx.datetime.TimeZone.currentSystemDefault())
    )
}