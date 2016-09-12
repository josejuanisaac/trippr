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
    `<div>
      <div className='col-md-12 commentList'>
        {this.state.comments.map(function(comment) {
          return <Comment key={comment.id} comment={comment}/>
          })}
      </div>
      <CommentForm event_id={this.props.event_id} post_id={this.props.post.id} creator_id={this.props.creator_id} handleNewComment={this.addComment} />
    </div>
    `
