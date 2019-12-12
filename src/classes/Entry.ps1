Class PoshTimeEntry {
    [datetime]$Date
    [timespan]$Start
    [timespan]$End

    #region constructors
    PoshTimeEntry(
        [string]$Start,
        [string]$End
    ){
        $timeRegex = '^(?<hour>\d\d)\:?(?<minute>\d\d)\:?(?<seconds>\d\d)?$'
        $this.Date = (Get-Date).Date
        if ($start -match $timeRegex) {
            $this.Start = New-TimeSpan -Hours $Matches.hour -Minutes $Matches.minute
        } else {
            Throw 'Unexpected start time format'
        }
        if ($end -match $timeRegex) {
            $this.End = New-TimeSpan -Hours $Matches.hour -Minutes $Matches.minute
        } else {
            Throw 'Unexpected start time format'
        }

    }
    #endregion

    [timespan] Time(){
        Return ($this.End - $this.Start)
    }
    
    [string] ToJson(){
        return [ordered]@{
            Date = $this.Date.ToShortDateString()
            Start = "$($this.Start.Hours.ToString().PadLeft(2,'0'))$($this.Start.Minutes.ToString().PadLeft(2,'0'))"
            End = "$($this.End.Hours.ToString().PadLeft(2,'0'))$($this.End.Minutes.ToString().PadLeft(2,'0'))"
        } | ConvertTo-Json
    }
}