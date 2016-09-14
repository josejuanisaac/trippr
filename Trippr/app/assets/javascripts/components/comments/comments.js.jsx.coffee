@Comments = React.createClass
  getInitialState: ->
    comments: @props.post.comments.splice(0)
  getDefaultProps: ->
    comments: []
  addComment: (comment) ->
    comments = @state.comments.slice()
    comments.push comment
    @setState comments: comments
  deleteComment: (comment) ->
    comments = this.state.comments
    comments.splice(comments.indexOf(comment),1)
    console.log('deleted')
    @setState comments: comments
  render: ->
    that = this
    `<div>
      <div className='col-md-12 commentList'>
        {this.state.comments.map(function(comment) {
          return <Comment key={comment.id} handleDelete={that.deleteComment.bind(null, comment)} comment={comment}/>
          })}
      </div>
      <CommentForm event_id={this.props.event_id} post_id={this.props.post.id} creator_id={this.props.creator_id} handleNewComment={this.addComment} />
    </div>
    `
