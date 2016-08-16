@Post = React.createClass
    getInitialState: ->
      post: @props.post
    getDefaultProps: ->
      post: []
    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.post.body
