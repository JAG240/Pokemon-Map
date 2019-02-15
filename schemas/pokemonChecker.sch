<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
  <pattern id="minMax">
      <rule context="lvl" role="error">
          <assert test="number(@min) le number(@max)">Pokemon team! The min value must be less than or equal to the max value.</assert>
          <report test="number(@max) gt 100">Pokemon team! The max value must NEVER be over 100!</report>
      </rule>
  </pattern>  
</schema>