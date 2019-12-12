Class PoshTimePayPeriod {
    [PoshTimeWeek]$Week1
    [PoshTimeWeek]$Week2

    PoshTimePayPeriod(){}

    PoshTimePayPeriod(
        [PoshTimeWeek]$Week1,
        [PoshTimeWeek]$Week2
    ){
        $this.Week1 = $Week1
        $this.Week2 = $Week2
    }

    [timespan]TotalTime(){
        return $this.Week1.TotalTime() + $this.week2.TotalTime()
    }

    [timespan]TotalOverTime(){
        return $this.Week1.Overtime() + $this.Week2.Overtime()
    }
}