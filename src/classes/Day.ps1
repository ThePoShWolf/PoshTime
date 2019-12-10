Class PoshTimeDay {
    [PoshTimeEntry[]]$Entries
    [datetime]$Day

    PoshTimeDay(
        [PoshTimeEntry[]]$Entries
    ){
        $this.Entries = $Entries
        $this.Day = (Get-Date).Date
    }

    PoshTimeDay(
        [PoshTimeEntry[]]$Entries,
        [datetime]$Date
    ){
        $this.Entries = $Entries
        $this.Day = (Get-Date $Date).Date
    }

    [timespan] TotalTime(){
        $totals = foreach ($entry in $this.Entries) {
            $entry.Time()
        }
        $secondSum = $totals | Measure-Object -Property Seconds -Sum
        Return (New-TimeSpan -Seconds $secondSum)
    }
}