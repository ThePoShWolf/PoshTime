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
        [string]$End
    )
    [PoshTimeEntry]::New($Start,$End)
}