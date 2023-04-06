package diamondcraft.devs.mynoteapp.di

import diamondcraft.devs.mynoteapp.data.factories.DbDriverFactory
import diamondcraft.devs.mynoteapp.data.note.SqlDelightNoteDao
import diamondcraft.devs.mynoteapp.database.NoteDatabase
import diamondcraft.devs.mynoteapp.domain.note.NoteDao

class DatabaseModule {

    private val factory by lazy { DbDriverFactory() }
     val noteDao: NoteDao by lazy {
        SqlDelightNoteDao(NoteDatabase(factory.createDriver()))
    }

}