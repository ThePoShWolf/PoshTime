Function New-PtWeek {
    [cmdletbinding()]
    Param (
        [PoshTimeDay]$Sunday,
        [PoshTimeDay]$Monday,
        [PoshTimeDay]$Tuesday,
        [PoshTimeDay]$Wednesday,
        [PoshTimeDay]$Thursday,
        [PoshTimeDay]$Friday,
        [PoshTimeDay]$Saturday,
        [int]$NormalHours = 40
    )
    [PoshTimeWeek]::new($Sunday,$Monday,$Tuesday,$Wednesday,$Thursday,$Friday,$Saturday,$NormalHours)
}