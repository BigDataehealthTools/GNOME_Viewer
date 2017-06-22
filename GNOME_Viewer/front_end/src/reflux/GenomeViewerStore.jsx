/*Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.*/

// Author of the file : Victor Dupuy
// mail : victor.dupuy@hei.fr

var Reflux = require('reflux');
var GenomeViewerActions = require('./GenomeViewerActions.jsx');

var GenomeViewerStore = Reflux.createStore({
  listenables : [GenomeViewerActions],
  fireUpdate : function(){
    //We trigger this function when we want to refresh the data
    this.trigger('adamGenomeViewer', [
      this.data,
      {
        rsid : this.rsid,
        chromosome : this.chromosome,
        position : this.position
      }
    ]);
  },

  sendHeaders : function(headers){
    this.trigger('sendHeaders', [
        headers[0],
        headers[1],
        headers[2]
    ]);
  },

  queryParams : function(){
    var store = this;

    store.trigger('genomeViewerQueryParams', store.phenotypes);

    /*var xhr = new XMLHttpRequest();
    xhr.open('GET', encodeURI("/phenotypes", true));
    xhr.onload = function(){
      if(xhr.status==200){
         store.phenotypes = JSON.parse(xhr.responseText);
         store.trigger('genomeViewerQueryParams', store.phenotypes);
      }else{
        console.error("GOAT here : We couldn't get your data. Check the route, or your connection");
      }
    };
    xhr.send();*/
  },
  adamGenomeViewer : function(chromosome, position, rsid){
    // console.log(chromosome, position, phenotype);
    this.trigger('wait');
    this.position = position;
    this.chromosome = chromosome;
    this.rsid = rsid;
    var store = this;
    var xhr = new XMLHttpRequest();
    width = Math.floor($('#application').width()*0.9);
    height = Math.max(Math.floor($('#application').height()*0.9), 750);
    if(height>=1000){
      height = 1000;
    }
    xhr.open('GET', encodeURI("/adamGenomeViewer/"+chromosome+"/"+position+"/"+rsid+"/"+width+"/"+height), true);
    xhr.onload = function(){
      if(xhr.status==200){
         result = JSON.parse(xhr.responseText);
         //store.script = result.script;
         //store.div = result.div;
         store.data = result.data;
         console.log('Data received :)');
         store.fireUpdate();
      }else{
        store.trigger('noData')
        console.error("GOAT here : We couldn't get your data. Check the route, or your connection");
      };
    };
    xhr.send();
  },
  uploadFile : function(){
      var store = this;
      var xhr = new XMLHttpRequest();
      xhr.open('GET', encodeURI("/uploadFile", true));
      xhr.onload = function(){
        if(xhr.status==200){
            store.trigger('uploadFile');
        } else {
          console.error("GOAT here : We couldn't get your data. Check the route, or your connection");
        };
      };
      xhr.send();
  },

  extractHeader : function(file) {
      var store = this;
      var xhr = new XMLHttpRequest();

      var data = new FormData();
      data.append('file', file);

      xhr.open('POST', encodeURI("/extractHeader/"), true);
      xhr.onload = function() {
        if (xhr.status==200) {
            var json = JSON.parse(xhr.responseText);
            store.sendHeaders(json.headers);
        } else {
          console.error("GOAT here : We couldn't get your data. Check the route, or your connection");
        }
      };
      xhr.send(data);
  },

  fileGenomeViewer : function(file, rsid_header, chromosome_header, position_header) {
      var store = this;
      var xhr = new XMLHttpRequest();

      var data = new FormData();
      data.append('file', file);
      data.append('rsid_header', rsid_header);
      data.append('chromosome_header', chromosome_header);
      data.append('position_header', position_header);

      xhr.open('POST', encodeURI("/fileGenomeViewer/"), true);
      xhr.onload = function() {
        if (xhr.status==200) {
            result = JSON.parse(xhr.responseText);
            store.data = result.data;
            store.fireUpdate();

        } else {
          console.error("GOAT here : We couldn't get your data. Check the route, or your connection");
        }
      };
      xhr.send(data);
  }

});

module.exports = GenomeViewerStore;
