#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Aug  4 11:29:51 2019

@author: lord
"""

import cv2 
import numpy as np
import glob
import os

path_input_images =  '/home/lord/PHD_work/segmentation/data/IITD_Database/'
path_input_mask = '/home/lord/PHD_work/segmentation/data/mask_data_sets/iitd/'


path_out_img =  '/home/lord/PHD_work/segmentation/data/IITD_segnet_data/frames/'
path_out_mask =  '/home/lord/PHD_work/segmentation/data/IITD_segnet_data/masks/'  



### read the list dir 

folder_name_list = np.sort(os.listdir(path_input_images))

for folder_name in folder_name_list:
    
    
    images_list  = glob.glob(path_input_images +folder_name +'/*.bmp')
    
    for image_name in images_list:
        
        name  = image_name.split('/')[-1].split('.')[0]
        
        if (int(name) <6):
            mask_name = path_input_mask + 'OperatorA_' + folder_name + '-A_' + name +'.tiff'
        else:
            mask_name = path_input_mask + 'OperatorA_' + folder_name + '-B_' + name +'.tiff'    
        #print(mask_name)
        img = cv2.imread(image_name)
        mask = cv2.imread(mask_name)
        
        cv2.imwrite(path_out_img + 'frame' + '_'+folder_name+'_'+name+'.png',img)
        cv2.imwrite(path_out_mask + 'frame' + '_'+folder_name+'_'+name+'.png',mask)
        
        
