Given CollectionProcessor receives an amount from 0-25
Then it should add a tier 1 service fee of 2
And pass the total to the service


Given CollectionProcessor receives an amount from 26-100
Then it should add a tier 2 service fee of 4
And pass the total to the service

Given CollectionProcessor receives an amount greatert than 100
Then it should add a tier 3 service fee of 8
And pass the total to the service
