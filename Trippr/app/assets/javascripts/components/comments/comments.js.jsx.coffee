@Comments = React.createClass
  getInitialState: ->
    comments: @props.post.comments
  getDefaultProps: ->
    comments: []
  addComment: (comment) ->
    comments = @state.comments.slice()
    comments.push comment
    @setState comments: comments
  render: ->
    `<div className='col-md-12 commentList'>
      {this.state.comments.map(function(comment) {
        return <Comment key={comment.id} comment={comment}/>
        })}
    </div>`
