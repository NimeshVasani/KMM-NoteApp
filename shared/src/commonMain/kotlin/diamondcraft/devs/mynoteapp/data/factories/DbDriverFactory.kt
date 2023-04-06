package diamondcraft.devs.mynoteapp.data.factories

import com.squareup.sqldelight.db.SqlDriver

expect class DbDriverFactory {
    fun createDriver(): SqlDriver
}