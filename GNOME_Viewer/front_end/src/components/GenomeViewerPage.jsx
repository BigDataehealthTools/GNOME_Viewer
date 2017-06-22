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

// Author of the file : Raphael Papillon
// mail : raph_p444@hotmail.com

//Dependencies
require("amcharts3-export");
var React = require('react');
var ReactDOM = require('react-dom');
var ASTable = require('./Tables/ASTable.jsx');
var AmCharts = require("amcharts3-react");

//Sub-Components

//Component
var GenomeViewerPage = React.createClass({

  showAll : function(e) {
    var chart = AmCharts.charts[0]

    for (var i=1, iLen=chart.graphs.length; i<iLen; i++) {
      console.log(i);
      chart.showGraph(chart.graphs[i]);
    }
  },

  hideAll : function(e) {
    var chart = AmCharts.charts[0]

    for (var i=1, iLen=chart.graphs.length; i<iLen; i++) {
      chart.hideGraph(chart.graphs[i]);
    }
  },

  render : function() {

    var jsonChrBoundaries = JSON.parse(this.props.data.jsonChrBoundaries);
    var jsonValidRsids = JSON.parse(this.props.data.jsonValidRsids);

    var data = [];

    for (var i=0; i<jsonChrBoundaries.length; i++) {
      data.push({
        "chromosome": jsonChrBoundaries[i].chromosome,
        "min": jsonChrBoundaries[i].min,
        "max": jsonChrBoundaries[i].max
      });
    }

    var graphs = [{
      "colorField": "color",
      "fillAlphas": 0.8,
      "lineColor": "#00bfff",
      "openField": "min",
      "type": "column",
      "valueField": "max",
      "showBalloon": false
    }];

    for (var i=0; i<jsonValidRsids.length; i++) {
      var validRsid = jsonValidRsids[i];

      data[validRsid.chromosome][validRsid.nom] = validRsid.position;

      graphs.push({
          "title": validRsid.nom,
          "bullet": "square",
          "bulletColor": "#ff1144",
          "bulletSize": "15",
          "valueField": validRsid.nom,
          "balloonText":
            "nom : " + validRsid.nom + "\n" +
            "chromosome : " + validRsid.chromosome + "\n" +
            "position : " + validRsid.position + "\n" +
            "gene_before : " + validRsid.gene_before + "\n" +
            "gene_after : " + validRsid.gene_after + "\n" +
            "idgenes : " + validRsid.idgenes + "\n" +
            "idmarqueurs : " + validRsid.idmarqueurs,
          "phenotypeLegendText" : validRsid.phenotype,
          "mutationLegendText" : validRsid.mutation
      });
    }

    function onInit (e) {

      var chart = e.chart,
          graphs = chart.graphs,
          createLegend = function (id, property) {
            var element = document.getElementById(id),
                itemElement,
                textElement,
                matchingGraphs = [],
                referenceItems = {},
                legendReference,
                graph,
                value,
                legendText;

            for (var i = 0, iLen = graphs.length; i < iLen; i++) {

              graph = graphs[i];
              value = graph[[property, "LegendText"].join("")];
              legendText = graph[[property, "LegendText"].join("")];

              if (value && legendText) {
                matchingGraphs.push(graph);
                legendReference = [property, value].join("-");

                if (!chart.customLegends[legendReference])
                  chart.customLegends[legendReference] = [];

                // Keep the graph reference per property name
                chart.customLegends[legendReference].push(graph);

                // Don't add to the DOM again if the item is already there
                if (!referenceItems[value]) {

                  // Keep reference that is item is already added
                  referenceItems[value] = true;

                  itemElement = document.createElement("div");
                  textElement = document.createElement("span");

                  textElement.innerText = legendText;

                  itemElement.appendChild(textElement);
                  element.appendChild(itemElement);

                  // Add the propery name to identify this item on click
                  itemElement.legendReference = legendReference;

                  itemElement.addEventListener("click", onLegendClick, false)
                }
              }
            }
          };

      // Leave a reference to the legend items in the chart object
      chart.customLegends = {};

      // Pass the legend's element id and which property to look for and group by
      createLegend("phenotypeslegend", "phenotype");

      // Pass the legend's element id and which property to look for and group by
      createLegend("mutationslegend", "mutation");
    }

    function onLegendClick (e) {
      console.log(e);
      var target = e.currentTarget,
          legendReference = target.legendReference,
          chart = AmCharts.charts[0],
          selectedGraphs = chart.customLegends[legendReference];

      for (var i = 0, iLen = selectedGraphs.length; i < iLen; i++) {

        if (selectedGraphs[i].hidden)
          chart.showGraph(selectedGraphs[i]);
        else
          chart.hideGraph(selectedGraphs[i]);
      }
    }





    var config = {
      "type": "serial",
      "theme": "light",
      "thousandsSeparator": " ",
      "sequencedAnimation": false,
      "startDuration": 1,

      "dataProvider": data,

      "valueAxes": [ {
         "axisAlpha": 0,
         "gridAlpha": 0.1,
         "position": "left"
       } ],
      "graphs": graphs,
      "columnWidth": 0.4,

      "categoryField": "chromosome",
      "categoryAxis": {
        "gridPosition": "start",
        "gridAlpha": 0,
        "gridAlpha": 0.1
      },
      "export": {
        "enabled": true
      },
      "listeners": [{
        "event": "init",
        "method": onInit
      }]
    };

    return (
      <div className="container">
        <div className="col-md-10" style={{height:'500px', backgroundColor:"white"}}><AmCharts.React {...config} /></div>
        <div className="col-md-2" style={{backgroundColor:"white", height:"500px"}}>
          <br/>
          <strong>Phenotypes Legend</strong>
          <div id="phenotypeslegend" className="custom-legend"></div>
          <br/>
          <strong>Mutations Legend</strong>
          <div id="mutationslegend" className="custom-legend"></div>
          <br/>
          <button id="showAll" onClick={this.showAll} className="btn btn-primary">Show all</button>
          <button id="hideAll" onClick={this.hideAll} className="btn btn-primary">Hide all</button>
        </div>
      </div>
    );
  }
});

module.exports = GenomeViewerPage;
