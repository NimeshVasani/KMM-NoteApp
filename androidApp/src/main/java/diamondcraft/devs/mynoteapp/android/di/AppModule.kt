package diamondcraft.devs.mynoteapp.android.di

import android.app.Application
import com.squareup.sqldelight.db.SqlDriver
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import diamondcraft.devs.mynoteapp.data.factories.DbDriverFactory
import diamondcraft.devs.mynoteapp.data.note.SqlDelightNoteDao
import diamondcraft.devs.mynoteapp.database.NoteDatabase
import diamondcraft.devs.mynoteapp.domain.note.NoteDao
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object AppModule {

    @Provides
    @Singleton
    fun provideSqlDriver(app: Application): SqlDriver {
        return DbDriverFactory(app).createDriver()
    }


    @Provides
    @Singleton
    fun providesNoteDao(driver: SqlDriver): NoteDao {
        return SqlDelightNoteDao(NoteDatabase(driver))
    }
}