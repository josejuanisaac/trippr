@Comments = React.createClass
  getInitialState: ->
    comments: @props.comments
  getDefaultProps: ->
    comments: []
  addComment: (comment) ->
    comments = @state.comments.slice()
    comments.push comment
    @setState comments: comments
  render: ->
    `<div className='col-md-12 commentList'>
      {this.props.comments[this.props.post.id].map(function(comment) {
        return <Comment key={comment.id} comment={comment}/>
        })}
    </div>`
