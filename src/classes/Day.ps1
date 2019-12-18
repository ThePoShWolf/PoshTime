Class PoshTimeDay {
    [System.Collections.Generic.List[PoshTimeEntry]]$Entries
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

    [void] AddEntry(
        [PoshTimeEntry]$Entry
    ){
        if ($this.Entries.Count -lt 1) {
            $this.Entries = $Entry
        } else {
            $this.Entries.Add($Entry)
        }
    }

    [timespan] TotalTime(){
        $totals = foreach ($entry in $this.Entries) {
            $entry.Time()
        }
        $secondSum = $totals | Measure-Object -Property Seconds -Sum
        Return (New-TimeSpan -Seconds $secondSum)
    }

    [System.Collections.Specialized.OrderedDictionary] ToJsonObject(){
        if ($this.Entries.Count -gt 0){
            return [ordered]@{
                Day = $this.Day.ToShortDateString()
                Entries = $this.Entries | %{$_.ToJsonObject()}
            }
        } else {
            return [ordered]@{}
        }
    }
    
    [string] ToJson(){
        return $this.ToJsonObject() | ConvertTo-Json -Depth 5
    }
}