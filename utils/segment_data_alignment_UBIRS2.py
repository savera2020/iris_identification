#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Aug 12 14:37:23 2019

@author: lord
"""

import cv2 
import numpy as np
import glob
import os

path_input_images =  '/home/lord/PHD_work/segmentation/data/data_base/UBIRIS2/CLASSES_400_300_Part1/'
path_input_mask = '/home/lord/PHD_work/segmentation/data/mask_data_sets/ubiris/'


path_out_img_test =  '/home/lord/PHD_work/segmentation/data/segnet_data/UBIRS_segnet_data/img_test/'
path_out_mask_test =  '/home/lord/PHD_work/segmentation/data/segnet_data/UBIRS_segnet_data/masks_test/'

path_out_img_train =  '/home/lord/PHD_work/segmentation/data/segnet_data/UBIRS_segnet_data/img_train/'
path_out_mask_train =  '/home/lord/PHD_work/segmentation/data/segnet_data/UBIRS_segnet_data/masks_train/'  



### read the list dir 
   
    
mask_list  = glob.glob(path_input_mask +'/*.tiff')

count = 0
    
for mask_name in mask_list:
        
    name1  = mask_name.split('/')[-1].split('.')[0].split('_')[1:]
    name = name1[0]+'_'+name1[1]+'_'+name1[2]
    print(name)
       
    image_name = path_input_images + name +'.tiff'
         
        #print(mask_name)
    img = cv2.imread(image_name)
    mask = cv2.imread(mask_name)
    
    if(count%15 ==0):
        
        cv2.imwrite(path_out_img_test + 'frame' + '_'+name+'.png',img)
        cv2.imwrite(path_out_mask_test + 'frame' + '_'+name+'.png',mask)
    else:    
        
        cv2.imwrite(path_out_img_train + 'frame' + '_'+name+'.png',img)
        cv2.imwrite(path_out_mask_train + 'frame' + '_'+name+'.png',mask)
    
    count = count+1