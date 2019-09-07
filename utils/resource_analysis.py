#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Sep  3 23:01:08 2019

@author: lord
"""

import pandas as pd
import numpy as np



data_path = '/home/lord/cloud1.csv'

bid_amount = 180
number_of_bidder =  10
small_bidding_fees = 1 

spot_init_price  = 110

amt_inr = .1


max_bidding_amount = 70

data  = pd.read_csv(data_path,low_memory=False)
data.head(2)


demand_matrix = data['DR']

demand_range  = demand_matrix.as_matrix()


for i in range(1,len(demand_range)):
    
    DR = demand_range[i]
    if(DR > .8):
        
        rev = number_of_bidder * small_bidding_fees + bid_amount
        
    elif((DR < .8) & (DR > .3)):
        
        rev = spot_init_price + 60*amt_inr
    else:
        
        rev  = max_bidding_amount
        

    print(rev)        
#demand_range = data_matrix[:,7]


#dmand_range 