Class PoshTimeTimesheet {
    [PoshTimePayPeriod[]]$PayPeriods

    PoshTimeTimesheet(
        [PoshTimePayPeriod[]]$PayPeriods
    ){
        $this.PayPeriods = $PayPeriods
    }
}