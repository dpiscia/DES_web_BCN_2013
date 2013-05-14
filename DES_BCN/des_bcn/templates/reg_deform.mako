<%inherit file="base.mako"/>
<%block name="main_container">

<link rel="stylesheet" href="/deform_static/css/form.css"      type="text/css"
            />
% if form:
  ${form|n}

% endif


</%block>