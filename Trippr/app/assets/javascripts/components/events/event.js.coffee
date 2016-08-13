@Event = React.createClass
    getInitialState: ->
      event: @props.event
    getDefaultProps: ->
      event: []
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
