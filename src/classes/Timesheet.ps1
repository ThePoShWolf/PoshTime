Class PoshTimeTimesheet {
    [PoshTimePayPeriod[]]$PayPeriods
    [string]$Path

    PoshTimeTimesheet(
        [PoshTimePayPeriod[]]$PayPeriods
    ){
        $this.PayPeriods = $PayPeriods
    }

    PoshTimeTimesheet(
        [PoshTimePayPeriod[]]$PayPeriods,
        [string]$Path
    ){
        $this.PayPeriods = $PayPeriods
        $this.Path = $Path
        if (Test-Path $Path) {
            $this.SaveFile = Get-Item $Path
        }
    }

    Save(){
        if ($null -ne $this.Path) {
            $this.ToJson() | Out-File $this.Path
        }
    }

    Load(){
        # TODO
    }

    [System.Collections.Specialized.OrderedDictionary] ToJsonObject(){
        return [ordered]@{
            PayPeriods = $this.PayPeriods | Where-Object {$null -ne $_} | ForEach-Object {$_.ToJsonObject()}
        }
    }

    [string] ToJson(){
        return $This.ToJsonObject() | ConvertTo-Json -Depth 8
    }
}