# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

# Authors of this page : Beatriz Kanzki & Victor Dupuy


#!/usr/bin/Python-2.7.11

from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
from django.db import connection # Used to connect with the database

#--- Pandas ---#
import pandas as pandas
import numpy as numpy

#--- Regex ---#
import re as regex

#--- CSV reader ---#
import csv

#--- JSON ---#
import json

import urllib2

def adamGenomeViewer(request, chromosome, position, rsid, userWidth, userHeight):
    print request, chromosome, position, rsid

    params = "rsid=" + rsid + "&chromosome=" + chromosome + "&position=" + position;

    data = urllib2.urlopen("http://ec2-52-35-68-107.us-west-2.compute.amazonaws.com:8000/matching?" + params).read()

    rsidArray = []
    rsidArray.append(json.loads(data))#[o['rsid'] for o in data]

    chrBoundaries = getChromosomeBoundaries()

    rsidArray = json.dumps(rsidArray, ensure_ascii=False, encoding="utf-8").replace("\\", "")

    response = json.dumps({
            'data' : {
                'jsonChrBoundaries' : chrBoundaries,
                'jsonValidRsids' : rsidArray
            }
        },
        sort_keys=True,
        indent=4,
        separators=(',', ': ')
    )

    return HttpResponse(response)

def sqlGenomeViewer(data):

    rsidArray = data

    chrBoundaries = getChromosomeBoundaries()
    validRsids = fetchValidRsids(rsidArray)


    print "validRsids"
    print validRsids

    response = json.dumps({
            'data' : {
                'jsonChrBoundaries' : chrBoundaries,
                'jsonValidRsids' : validRsids
            }
        },
        sort_keys=True,
        indent=4,
        separators=(',', ': ')
    )

    return HttpResponse(response)

def getChromosomeBoundaries():
    chr_bounderies_dict={'chromosome':[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22],          #dictionnary with chromosome bounderies
                'min':[0,0,0,0,0,0,0,0,0,0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0,0],
                'max':[248956422,242193529,198295559,190214555,181538259,170805979,159345973,145138636,138394717,133797422,135086622,133275309,114364328,107043718,101991189,90338345,83257441, 80373285,58617616,64444167,46709983,50818468]
                }
    chrBoundaries=pandas.DataFrame(chr_bounderies_dict) # transform to pandas
    return buildJsonData(chrBoundaries)

def fetchValidRsids(rows):  # TO BE REPLACED
    #This code was used back when we only searched for matching rsids (no position or chromosome).
    #print "rsids"
    #print rsids
    #print ','.join(map(str, rsids))
    #We query all rows where we have a data match
    #sqlQuery = 'SELECT * FROM marqueurs WHERE nom in ("' + '","'.join(map(str, rsids)) + '");'
    #validRsids = connect.fetchData(sqlQuery)

    validRsids = []

    for row in rows:
        sqlQuery = 'SELECT * FROM marqueurs WHERE nom="' + row['rsid'] + '" AND position=' + row['position'] + ' AND chromosome=' + row['chromosome'] + ';'
        match = connect.fetchData(sqlQuery)

        # We do [1:-1] because it extracts the data from stringified-array. The data being a string, it removes the first and last characters : [ and ].
        j = buildJsonData(match)[1:-1]
        # If no result was returned, the data was "[]" which both chars were stripped. So.. empty string.
        if j != "":
            validRsids.append(json.loads(j))

    print "validRsids"
    print validRsids

    return json.dumps(validRsids)

def buildJsonData(data):
    jsonData = data.to_json(orient='records')#json table
    return jsonData

def uploadFile(request):
    return HttpResponse()

def extractHeader(request):
    f = request.FILES['file']
    reader = csv.reader(f)
    headers = reader.next()
    response = json.dumps({'headers': headers})
    f.close()
    return HttpResponse(response)

def fileGenomeViewer(request):
    f = request.FILES['file']
    reader = csv.DictReader(f)
    data = json.dumps([ row for row in reader ])
    f.close()

    output = []

    for row in json.loads(data):
        output.append({
            'rsid': row[request.POST['rsid_header']],
            'position': row[request.POST['position_header']],
            'chromosome': row[request.POST['chromosome_header']]
        })

    return sqlGenomeViewer(output)
