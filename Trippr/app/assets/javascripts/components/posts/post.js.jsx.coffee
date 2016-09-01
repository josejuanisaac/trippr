@Post = React.createClass
  render: ->
    `<div className="post">
      <p>
        {this.props.post.body}
      </p>
      <Comments />
        <CommentForm/>
    </div>`
        # {this.props.comments.map(function(comment) {
        #   return <Comment key={comment.id} comment={comment}/>
        # })}
