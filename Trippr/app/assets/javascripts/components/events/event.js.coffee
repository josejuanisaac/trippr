@Event = React.createClass
    getInitialState: ->
      event: @props.event
    getDefaultProps: ->
      event: []
    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.event.title
        React.DOM.td null, @props.event.description
        React.DOM.td null,
          React.DOM.a
            className: "btn btn-info"
            href: '/events/'+@state.event.id
            'View'
