Function New-PtDay {
    [cmdletbinding()]
    Param (
        [PoshTimeEntry[]]$Entries,
        [datetime]$Date = (Get-Date)
    )
    [PoshTimeDay]::new($Entries,$Date)
}