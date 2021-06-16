Add-Type -Path 'C:\Program Files\System.Data.SQLite\2010\bin\System.Data.SQLite.dll'

function invoke_sqlitequery($query, $verbindungsstring) {
    # Select Funktion erstellen            
    $verbindung = New-Object -typename System.Data.SQLite.SQLiteConnection # SQLite Verbindungs-Objekt erstellen            
    $verbindung.ConnectionString = $verbindungsstring # # Verbindungsstring zum Datenbankfile mitgeben            
    $verbindung.open() # Verbindung zur Datenbank aufbauen            
            
    $befehl = $verbindung.CreateCommand() # Ein Befehls-Objekt erstellen            
    $befehl.CommandText = $query # Die SQLite Query mitgeben            
    $adap = New-Object -TypeName System.Data.SQLite.SQLiteDataAdapter $befehl # SQLite-Adapter-Objekt erstellen, welches als Brücke zwischen Datenbank & Dataset fungiert            
    # Ein SQLite DataAdapter kann von der DB lesen & ins Dataset schreiben, oder vom Dataset Änderungen zurück geben zur Quelle, etc.            
    $dataset = New-Object -TypeName System.Data.DataSet # Ein Dataset-Objekt erstellen            
    [void]$adap.Fill($dataset) # Mittels Void keinen Output erzeugen, aber es wird in Dataset geschrieben            
            
    $dataset.tables                    
}            
            
$db = 'C:\Users\User\tik9.github.io/guestbook.db'

$verbindungsstring = "data source=$db"
$query = "select * from guestbook"
$Query="PRAGMA table_info(guestbook)"

invoke_sqlitequery -query $query -verbindungsstring $verbindungsstring