Class PoshTimeWeek {
    [PoshTimeDay]$Sunday
    [PoshTimeDay]$Monday
    [PoshTimeDay]$Tuesday
    [PoshTimeDay]$Wednesday
    [PoshTimeDay]$Thursday
    [PoshTimeDay]$Friday
    [PoshTimeDay]$Saturday
    [int]$NormalHours = 40

    PoshTimeWeek(
        [PoshTimeDay]$Sunday,
        [PoshTimeDay]$Monday,
        [PoshTimeDay]$Tuesday,
        [PoshTimeDay]$Wednesday,
        [PoshTimeDay]$Thursday,
        [PoshTimeDay]$Friday,
        [PoshTimeDay]$Saturday
    ){
        $this.Sunday = $Sunday
        $this.Monday = $Monday
        $this.Tuesday = $Tuesday
        $this.Wednesday = $Wednesday
        $this.Thursday = $Thursday
        $this.Friday = $Friday
        $this.Saturday = $Saturday
    }

    PoshTimeWeek(
        [PoshTimeDay]$Sunday,
        [PoshTimeDay]$Monday,
        [PoshTimeDay]$Tuesday,
        [PoshTimeDay]$Wednesday,
        [PoshTimeDay]$Thursday,
        [PoshTimeDay]$Friday,
        [PoshTimeDay]$Saturday,
        [int]$NormalHours
    ){
        $this.Sunday = $Sunday
        $this.Monday = $Monday
        $this.Tuesday = $Tuesday
        $this.Wednesday = $Wednesday
        $this.Thursday = $Thursday
        $this.Friday = $Friday
        $this.Saturday = $Saturday
        $this.NormalHours = $NormalHours
    }

    [timespan]TotalTime(){
        return $this.Sunday.TotalTime() + $this.Monday.TotalTime() + $this.Tuesday.TotalTime() + $this.Wednesday.TotalTime() + $this.Thursday.TotalTime() + $this.Friday.TotalTime() + $this.Saturday.TotalTime()
    }
    
    [timespan]Overtime(){
        $ot = (New-TimeSpan -Hours $this.NormalHours) - $this.TotalTime()
        if($ot -gt (New-TimeSpan -Hours 0)) {
            return $ot
        } else {
            return New-TimeSpan -Hours 0
        }
        
    }
}