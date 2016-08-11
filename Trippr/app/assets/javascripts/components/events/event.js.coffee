@Event = React.createClass
    getInitialState: ->
      event: @props.events
    getdefaultProps: ->
      event: []
    addPost: (event) ->
      events = @state.events.slice()
      events.push event
      @setState events: events
    handleView: (e) ->
      e.preventDefault()
      $.ajax
        method: "GET"
        url: "/events/#{@props.event.id}"
        dataType: 'JSON'
        success: ()=>
          @props.handleViewEvent @props.event
    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.event.title
        React.DOM.td null, @props.event.description
        React.DOM.td null,
          React.DOM.a
            className: "btn btn-info"
            onClick: @handleView
            'View'
           React.DOM.div
            className: "container"
            React.DOM.div
              className: "row"
              React.DOM.div
                className: "col-md-12 text-primary text-left"
                React.DOM.h1 null, @props.event.title
                React.DOM.p null, @props.event.description
            React.DOM.div
              className: "row"
              React.DOM.div
                className: "col-md-12 text-danger text-left"
                React.DOM.h3 null, 'Posts'
                React.DOM.p null, ''
