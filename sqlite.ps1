$db = 'C:\Users\User\tik9.github.io/guestbook.db'

Add-Type -Path 'C:\Program Files\System.Data.SQLite\2010\bin\System.Data.SQLite.dll'
  
Function createDataBase([string]$db, $table) {
    Try {
        If (!(Test-Path $db)) {
        
            $conn = New-Object -TypeName System.Data.SQLite.SQLiteconnection
  
            $conn.connectionString = "Data Source=$db"
            $conn.Open()
  
            $createTableQuery = "CREATE table $table (ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,date TEXT NULL);"
  
            $cmd = $conn.CreateCommand()
            $cmd.CommandText = $createTableQuery
            $cmd.ExecuteNonQuery()
  
            $cmd.Dispose()
            $conn.Close()
  
        }
        Else {
            Write-Output "DB Exists, table: $table"
        }
  
    }
    Catch {
        Write-Output "Could not create database: Error"
    }
}
# *** MAIN *****
  
# $db = "c:\db\test.sqlite"
$row = New-Object System.Collections.ArrayList
  
# $CDate = Get-Date -format "yyyy-MM-dd"
  
$row.Add(@{'name' = 't2' })
$row.Add(@{'mail' = 't@' })
$row.Add(@{'message' = 'hi' })
  
$table = 'guestbook'

# $Query = "Select * From $table"
# $Query = "delete From $table"
$Query="PRAGMA table_info($table)"
  
# createDataBase $db $table

Invoke-SqliteQuery -DataSource $db -Query $Query
# insertDatabase $db $table $row

# queryDatabase $db $Query


Function insertDatabase([string]$db, $table, [System.Collections.ArrayList]$row) {
  
    Try {
        If (Test-Path $db) {
        
            $conn = New-Object -TypeName System.Data.SQLite.SQLiteconnection
  
            $conn.connectionString = "Data Source=$db"
            $conn.Open()
  
            $cmd = $conn.CreateCommand()
            # ForEach ($row in $rows) {
        
                $sql = "INSERT OR REPLACE INTO $table (name,mail,message)"
                $sql += " VALUES (@name,@mail,@message);"
                 
                $cmd.Parameters.AddWithValue("@name", $row.name)
                $cmd.Parameters.AddWithValue("@mail", $row.mail)
                $cmd.Parameters.AddWithValue("@message", $row.message)
              
                Write-Output $sql
  
                $cmd.CommandText = $sql
                $cmd.ExecuteNonQuery()
            # }
  
            $cmd.Dispose()
            $conn.Close()
  
            Write-Output 'records successfully: Ok'
  
        }
  
    }
    Catch {
        Write-Output "Unable to insert into database: Error"
    }
}


Function queryDatabase([string]$db, [string]$sql) {
  
    Try {
        # If (Test-Path $db) {
  
        $conn = New-Object -TypeName System.Data.SQLite.SQLiteconnection
        $conn.connectionString = "Data Source=$db"
        $conn.Open()
  
        $cmd = $conn.CreateCommand()
        $cmd.CommandText = $sql
  
        $adapt = New-Object  -TypeName System.Data.SQLite.SQLiteDataAdapter $cmd
        $data = New-Object System.Data.DataSet
  
        $adapt.Fill($data)
  
        $table = $data.Tables
  
        ForEach ($t in $table) {
            Write-Output $t
        }
  
        $cmd.Dispose()
        $conn.Close()
    }
    Catch {
        Write-Output "Unable to query: Error"
    }
}
