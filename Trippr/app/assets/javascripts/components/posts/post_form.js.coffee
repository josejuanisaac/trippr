@PostForm = React.createClass
    getInitialState: ->
      body: ""
      creator_id: @props.creator_id
    handleChange: (e) ->
      name = e.target.body
      @setState "#{ body }": e.target.value
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
            placeholder: 'What happened here?'
            name: 'body'
            value: @state.body
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
          'Post'