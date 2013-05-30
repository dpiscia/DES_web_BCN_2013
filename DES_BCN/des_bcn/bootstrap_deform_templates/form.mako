<form
  id="${field.formid}"
  class="deform ${field.bootstrap_form_style | 'form-horizontal'}
         ${field.css_class}"
  action="${field.action}"
  method="${field.method}"
  enctype="multipart/form-data"
  accept-charset="utf-8"
  i18n:domain="deform"
  tal:define="inline getattr(field, 'bootstrap_form_style', None) == 'form-inline';
              autocomplete autocomplete|field.autocomplete;"
  tal:attributes="autocomplete autocomplete">
  
  <fieldset>

    <legend tal:condition="field.title">${field.title}</legend>

    <input type="hidden" name="_charset_" />
    <input type="hidden" name="__formid__" value="${field.formid}"/>

    <div class="alert alert-block alert-error" tal:condition="field.error">
      <span class="errorMsgLbl" i18n:translate="">
        There was a problem with your submission
      </span>
      <br />
      <span class="errorMsg" i18n:translate="">
        Errors have been highlighted below
      </span>
      <p class="errorMsg">${field.errormsg}</p>
    </div>

    <div
        tal:define="rndr field.renderer;
                    tmpl field.widget.item_template"
        tal:repeat="f field.children"
        tal:replace="structure
                     rndr(tmpl,field=f,cstruct=cstruct.get(f.name, null))" />

    <div tal:condition="field.buttons" tal:omit-tag="inline" class="form-actions">
      <tal:block repeat="button field.buttons">
        <button
            tal:attributes="disabled button.disabled"
            id="${field.formid+button.name}"
            name="${button.name}"
            type="${button.type}"
            class="btn ${repeat.button.start and 'btn-primary' or ''} ${button.css_class}"
            value="${button.value}">
          <i tal:condition="hasattr(button, 'icon') and button.icon"
                     class="${button.icon}"></i>
          ${button.title}
        </button>
      </tal:block>
    </div>

  </fieldset>

  <script type="text/javascript" tal:condition="field.use_ajax">
    deform.addCallback(
       '${field.formid}',
       function(oid) {
         var options = {
           target: '#' + oid,
           replaceTarget: true,
           success: function() {
             deform.processCallbacks();
             deform.focusFirstInput();
           }
         };
         var extra_options = ${field.ajax_options} || {};
         $('#' + oid).ajaxForm($.extend(options, extra_options));
       }
    );
  </script>
  
</form>