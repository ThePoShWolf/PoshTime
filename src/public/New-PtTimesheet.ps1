Function New-PtTimeSheet {
    [cmdletbinding(
        DefaultParameterSetName = 'Fresh'
    )]
    Param (
        [Parameter(
            ParameterSetName = 'Existing'
        )]
        [PoshTimePayPeriod[]]$PayPeriods,
        [Parameter(
            ParameterSetName = 'Fresh'
        )]
        [string]$Path
    )
    if ($PSCmdlet.ParameterSetName -eq 'Existing') {
        [PoshTimeTimesheet]::new($PayPeriods)
    } elseif ($PSCmdlet.ParameterSetName -eq 'Fresh') {
        [PoshTimeTimesheet]::new($Path)
    }
}