#!/usr/bin/python
# -*- coding: utf8 -*-
import base64
import json
import requests
import sys
import time
import os
import thread

reload(sys)
sys.setdefaultencoding("utf-8")

# matrix service address
IP = "192.168.2.228"
RestfulPort = 7450
ServiceRestful = "http://" + IP + ":" + str(RestfulPort) + "/rec/image"

def start_restful(filename):
    # load the features of dg_faces
    post_json_data = {"Context":{"SessionId": "test123","Type":2,"Functions":[200,201,202,203,204,205],"Params":{"detect_mode":"2"}},"Image":{"Data":{"URI":""}}}
    fo=open(filename,'r')
    for line in fo.readlines():
        line = line.replace('\n', '')
        post_json_data["Image"]["Data"]["URI"]=line.split(' ')[0]
        post_data = json.dumps(post_json_data)
        resp = requests.post(ServiceRestful, data = post_data)
        resp_dict = json.loads(resp.content)
        resp_file = open('./resu/'+filename+'.txt', 'a')
        if resp_dict["Result"].has_key('Faces'):
            resp_file.write(line+" "+str(resp_dict["Result"]["Faces"][0]["AlignResult"]["Scores"]["local_is_face"]))
        else:
            resp_file.write('NULL')
        resp_file.write('\n')
        resp_file.close()
    fo.close()

if __name__ == "__main__":
    start_restful('url.txt')
