# $MinutesRunTime = (Get-CimInstance win32_battery).EstimatedRunTime
$shutdown= (Get-Date).AddMinutes($MinutesRunTime).tostring('yyyy, HH:mm Uhr')
echo "Shut down at $shutdown"



$Start = [datetime]"12/01/2020"
$End = [datetime]"12/31/2020"

# $sum = 0
$out = for ($d = $start ; $d -le $end; $d = $d.AddDays(1)) {
    $excludeHol = 24, 25
    $excludeHol += 28..31
    
    $timeDiff = 1, 2 
    if ($d.DayOfWeek -notmatch "Sunday|Saturday" -and $excludeHol -notcontains $d.day ) {
        if ($timeDiff -notcontains $d.day) {
            $startdate = [datetime]$d.addhours(8).AddMinutes(5)
            $enddate = [datetime]$d.addhours(17)
        }
        else {
            $startdate = [datetime]$d.addhours(8).AddMinutes(30)
            $enddate = [datetime]$d.addhours(16).AddMinutes(15)
        }
        # .ToString('dddd, dd.MM.yyyy HH:mm')
        $worktime = (NEW-TIMESPAN -start $startdate.AddMinutes(45) -end $enddate)
        
        $sum += [TimeSpan]$worktime

        $break = '45 Min.'

        [PSCustomObject]@{
            # $dayofweek=$d.DayOfWeek
            # $base=$d
            startdate   = $startdate.ToString('dddd, dd.MM.yyyy HH:mm')
            enddate     = $enddate.tostring('HH:mm')
            arbeitszeit = $worktime.tostring().substring(0, 5)
            # .tostring('HH:mm')
            break       = $break
            # $base=$d
            kumuliert   = $sum
        }

    }
}

$output = 'Arbeitszeiterfassung Timo Körner'

$out = $out | Select-Object @{n = "Start"; e = { $_.startdate + ' Uhr' } }, @{n = 'Ende'; e = { $_.enddate + ' Uhr' } }, @{n = 'Pause'; e = { $_.break } }, @{n = 'Arbeitszeit'; e = { $_.arbeitszeit + ' Min.' } }, @{n = 'Kumuliert'; e = { $_.kumuliert + 'Min.' } }
# $out | more

# $output+=$out

# $out|Export-excel -Path 'file.xlsx'
# $out|Export-Csv -Path 'file.csv';Get-Content 'file.csv'