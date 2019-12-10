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
        $this.Date = Get-Date "$((Get-Date).ToShortDateString()) 00:00:00"
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
}