Class PoshTimeTimesheet {
    [PoshTimePayPeriod[]]$PayPeriods

    PoshTimeTimesheet(
        [PoshTimePayPeriod[]]$PayPeriods
    ){
        $this.PayPeriods = $PayPeriods
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