# -----------------------------------------------------------------------------
# Author: Alexander Kravets <alex@slatestudio.com>,
#         Slate Studio (http://www.slatestudio.com)
# -----------------------------------------------------------------------------
# INPUT INVERTER VERSION SELECT
# -----------------------------------------------------------------------------
class @InputInverterVersion extends InputSelect

  _create_el: ->
    @config.optionsHashFieldName = '_document_versions'
    @config.ignoreOnSubmission   = true
    @config.default              = 0
    @url                         = "#{ @config.path }/#{ @object._id }.json"

    @$el =$ "<div class='input-#{ @config.type } #{ @config.klass } #{ @config.klassName }'>"

  _add_input: ->
    @$input =$ """<select name='#{ @name }'></select>"""
    @$el.append @$input

    @$input.on 'change', (e) => @_load_version()

    @_add_options()

  _load_version: ->
    version = @$input.val()
    $.get @url, { version: version }, (object) ->
      chr.module.view.form.updateValues(object)

formagicInputs['inverter-version'] = InputInverterVersion
