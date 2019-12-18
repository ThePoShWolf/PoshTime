Function New-PtEntry {
    [cmdletbinding()]
    Param (
        [Parameter(
            Position = 0
        )]
        [string]$Start,
        [Parameter(
            Position = 1
        )]
        [string]$End,
        [Parameter()]
        $Date
    )
    if ($PSBoundParameters.Keys -contains 'Date'){
        [PoshTimeEntry]::New($Start,$End,$Date)    
    } else {
        [PoshTimeEntry]::New($Start,$End)
    }
}