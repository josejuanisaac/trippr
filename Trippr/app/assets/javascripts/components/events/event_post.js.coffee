@EventPost = React.createClass
  getInitialState: ->
    posts: @props.posts
  getDefaultProps: ->
    posts: []
  render: ->
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
          className: "col-md-10 col-md-offset-1 text-danger text-left"
          React.DOM.h3 null, 'Posts'
          React.DOM.p null,
            for post in @state.posts
              React.createElement EventPost, key: event.id, event: event




