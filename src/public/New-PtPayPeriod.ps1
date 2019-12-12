Function New-PtPayPeriod {
    [cmdletbinding()]
    Param (
        [PoshTimeWeek]$Week1,
        [PoshTimeWeek]$Week2
    )
    [PoshTimePayPeriod]::new($Week1,$Week2)
}