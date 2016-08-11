@EventForm = React.createClass
    getInitialState: ->
      title: ""
      description: ""
      creator_id: @props.creator_id
    handleChange: (e) ->
      name = e.target.name
      @setState "#{ name }": e.target.value
    valid: ->
      @state.title && @state.description
    handleSubmit: (e) ->
      e.preventDefault()
      $.post '', { event: @state }, (data) =>
        console.log(data)
        @props.handleNewEvent data
        @setState @getInitialState()
      , 'JSON'
    render: ->
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Title'
            name: 'title'
            value: @state.title
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Description'
            name: 'description'
            value: @state.description
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'hidden'
            className: 'form-control'
            name: 'creator_id'
            value: @state.creator_id
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create Event'