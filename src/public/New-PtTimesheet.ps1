Function New-PtTimeSheet {
    [cmdletbinding(
        DefaultParameterSetName = 'Fresh'
    )]
    Param (
        [Parameter(
            ParameterSetName = 'Existing'
        )]
        [PoshTimePayPeriod[]]$PayPeriods
    )
    if ($PSCmdlet.ParameterSetName -eq 'Existing') {
        [PoshTimeTimesheet]::new($PayPeriods)
    } elseif ($PSCmdlet.ParameterSetName -eq 'Fresh') {
        
    }
}