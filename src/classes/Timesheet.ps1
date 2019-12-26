Class PoshTimeTimesheet {
    [PoshTimePayPeriod[]]$PayPeriods
    [ValidatePattern('\.json$')]
    [string]$Path

    PoshTimeTimesheet(){}

    PoshTimeTimesheet(
        [string]$Path
    ){
        $this.Path = $Path
    }

    PoshTimeTimesheet(
        [PoshTimePayPeriod[]]$PayPeriods
    ){
        $this.PayPeriods = $PayPeriods
    }

    PoshTimeTimesheet(
        [PoshTimePayPeriod[]]$PayPeriods,
        [string]$Path
    ){
        $this.PayPeriods = $PayPeriods
        $this.Path = $Path
        if (Test-Path $Path) {
            $this.SaveFile = Get-Item $Path
        }
    }

    Save(){
        if ($null -ne $this.Path) {
            $this.ToJson() | Out-File $this.Path
        } else {
            Throw 'Unable to save. Path is null.'
        }
    }

    Load(){
        # TODO
        $weekdays = 'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'
        if ($null -ne $this.Path) {
            $json = Get-Content $this.Path | ConvertFrom-Json -Depth 8
            $this.PayPeriods = foreach ($payperiod in $json.PayPeriods) {
                $week1 = & {
                    $weekHash = @{}
                        foreach ($weekDay in $weekDays) {
                            $day = $payperiod.Week1."$weekDay"
                            $entries = foreach ($entry in $day.Entries) {
                                [PoshTimeEntry]::new($entry.Start,$entry.End,$entry.Date)
                            }
                            if ($entries.Count -ge 1){
                                $weekHash[$weekDay] = [PoshTimeDay]::new($entries,[datetime]$($day.Day))
                            }
                        }
                    [PoshTimeWeek]::new($weekHash['Sunday'],$weekHash['Monday'],$weekHash['Tuesday'],$weekHash['Wednesday'],$weekHash['Thursday'],$weekHash['Friday'],$weekHash['Saturday'])
                }
                $week2 = & {
                    $weekHash = @{}
                        foreach ($weekDay in $weekDays) {
                            $day = $payperiod.Week2."$weekDay"
                            $entries = foreach ($entry in $day.Entries) {
                                [PoshTimeEntry]::new($entry.Start,$entry.End,$entry.Date)
                            }
                            if ($entries.Count -ge 1){
                                $weekHash[$weekDay] = [PoshTimeDay]::new($entries,[datetime]$($day.Day))
                            }
                        }
                    [PoshTimeWeek]::new($weekHash['Sunday'],$weekHash['Monday'],$weekHash['Tuesday'],$weekHash['Wednesday'],$weekHash['Thursday'],$weekHash['Friday'],$weekHash['Saturday'])
                }
                [PoshTimePayPeriod]::new($week1,$week2)
            }
        } else {
            Throw 'Unable to load. Path is null.'
        }
    }

    [System.Collections.Specialized.OrderedDictionary] ToJsonObject(){
        return [ordered]@{
            PayPeriods = $this.PayPeriods | Where-Object {$null -ne $_} | ForEach-Object {$_.ToJsonObject()}
        }
    }

    [string] ToJson(){
        return $This.ToJsonObject() | ConvertTo-Json -Depth 8
    }
}