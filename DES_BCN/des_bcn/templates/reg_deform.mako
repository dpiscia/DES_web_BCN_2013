<%inherit file="base.mako"/>
<%block name="main_container">

<link rel="stylesheet" href="/deform_static/css/form.css"      type="text/css" />
<script src="/deform_static/scripts/deform.js"></script>           
% if form:
  ${form|n}

% endif
% if values:
  ${values|n}

% endif

</%block>