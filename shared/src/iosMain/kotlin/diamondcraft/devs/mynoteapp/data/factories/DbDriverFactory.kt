package diamondcraft.devs.mynoteapp.data.factories

import com.squareup.sqldelight.db.SqlDriver
import com.squareup.sqldelight.drivers.native.NativeSqliteDriver
import diamondcraft.devs.mynoteapp.database.NoteDatabase

actual class DbDriverFactory {
    actual fun createDriver(): SqlDriver {
      return NativeSqliteDriver(NoteDatabase.Schema,"note.db")
    }
}