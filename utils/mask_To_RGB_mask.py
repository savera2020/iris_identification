#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Aug  9 22:49:58 2019

@author: lord
"""

import cv2

import glob
import os


folder_in =  '/home/lord/PHD_work/segmentation/data/segnet_data/UBIRS_segnet_data/masks_train/'

folder_out = '/home/lord/PHD_work/segmentation/data/segnet_data/UBIRS_segnet_data/masks_train_rgb/'

images_list  = glob.glob(folder_in +'/*.png')
    
for image_name in images_list:
    
    img = cv2.imread(image_name)
    
    name = image_name.split('/')[-1]
    
    img[img[:,:,0]==255,0] =255 
    img[img[:,:,0]==255,1] =0 
    img[img[:,:,0]==255,2] =255
    
    cv2.imwrite(folder_out+name,img)
    print(name)