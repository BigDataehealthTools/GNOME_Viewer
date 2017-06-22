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

//Dependencies
var React = require('react');
var Reflux = require('reflux');
var Dropzone = require('react-dropzone');
var GenomeViewerActions = require('../reflux/GenomeViewerActions.jsx');

//Component
var UploadFilePage = React.createClass({
    getInitialState:function() {
        return {
            rsid_header: 'rsid',
            chromosome_header: 'chr',
            position_header: 'position',
            dropzone_text: 'Drag and drop a file or click here to upload your file.',
            genomeViewerDisabled: true
        };
    },

    componentWillReceiveProps: function(nextProps){
        document.getElementById("dropdown_rsid").disabled = false;
        document.getElementById("dropdown_chromosome").disabled = false;
        document.getElementById("dropdown_position").disabled = false;

        this.setState({
            rsid_header: nextProps.rsid,
            chromosome_header: nextProps.chr,
            position_header: nextProps.pos,
            genomeViewerDisabled: false
        });
    },

    OnSelectRsidChange:function(e) {
        this.setState({ rsid_header:e.target.value });
    },

    OnSelectChromosomeChange:function(e) {
        this.setState({ chromosome_header:e.target.value });
    },

    OnSelectPositionChange:function(e) {
        this.setState({ position_header:e.target.value });
    },

    onDrop: function (files) {
        this.setState({
            file : files[0],
            dropzone_text : files[0].name
        });
    },

    onOpenClick: function () {
      this.refs.dropzone.open();
    },

    onSubmit : function(e) {
        e.preventDefault();
        GenomeViewerActions.extractHeader(this.state.file);
    },

    OnGenomeViewer : function(e) {
        e.preventDefault();

        GenomeViewerActions.fileGenomeViewer(
            this.state.file,
            this.state.rsid_header,
            this.state.chromosome_header,
            this.state.position_header
        );
    },

    render : function() {
        var divStyle = {
          padding: "15px",
          textAlign : "center"
        }

        var centerStyle = {
            display : "block",
            margin : "auto",
            textAlign : "center",
            fontSize : "1.5em"
        }

        var inputStyle={
          display : "block",
          width : "80%",
          height : "40px",
          margin : "auto",
          backgroundColor : "#fff"
        }

        var buttonStyle = {
          margin : "10px 10px"
        }

        return (
          <div className="panel col-xs-12 col-md-4 col-centered" style={divStyle}>
            <h1>Upload file</h1>
            <Dropzone className="form-control" style={{height:"70px"}} ref="dropzone"
                onDrop={this.onDrop}
                multiple={false}
                accept="text/csv">
                <p>{this.state.dropzone_text}</p>
            </Dropzone>

            <button className="btn btn-primary" style={buttonStyle} onClick={this.onOpenClick} type="button" >
                Upload
            </button>

            <button className="btn btn-primary" style={buttonStyle} onClick={this.onSubmit} type="submit" id="submitAS">Submit</button>

            <div className="form-group">
                <div style={centerStyle}>
                    <p>rsId</p>
                    <select disabled style={inputStyle} className="form-control" id="dropdown_rsid" value={this.state.rsid_header} onChange={this.OnSelectRsidChange}>
                        <option value={this.props.rsid}>{this.props.rsid}</option>
                        <option value={this.props.chr}>{this.props.chr}</option>
                        <option value={this.props.pos}>{this.props.pos}</option>
                    </select>
                </div>

                <div style={centerStyle}>
                    <p>chromosome</p>
                    <select disabled style={inputStyle} className="form-control" id="dropdown_chromosome" value={this.state.chromosome_header} onChange={this.OnSelectChromosomeChange}>
                        <option value={this.props.rsid}>{this.props.rsid}</option>
                        <option value={this.props.chr}>{this.props.chr}</option>
                        <option value={this.props.pos}>{this.props.pos}</option>
                    </select>
                </div>

                <div style={centerStyle}>
                    <p>position</p>
                    <select disabled style={inputStyle} className="form-control" id="dropdown_position" value={this.state.position_header} onChange={this.OnSelectPositionChange}>
                        <option value={this.props.rsid}>{this.props.rsid}</option>
                        <option value={this.props.chr}>{this.props.chr}</option>
                        <option value={this.props.pos}>{this.props.pos}</option>
                    </select>
                </div>
            </div>

            <p>
                <button disabled={this.state.genomeViewerDisabled} id="genomeViewer_button" className="btn btn-primary" type="button" onClick={this.OnGenomeViewer}>
                    Genome Viewer
                </button>
            </p>
          </div>
        );
    }
});

module.exports = UploadFilePage;
