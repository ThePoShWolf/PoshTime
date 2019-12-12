Function New-PtTimeSheet {
    [cmdletbinding()]
    Param (
        [PoshTimePayPeriod[]]$PayPeriods
    )
    [PoshTimeTimesheet]::new($PayPeriods)
}