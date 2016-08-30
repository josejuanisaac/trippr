@Post = React.createClass
  render: ->
    `<div>
      <p>
        {this.props.post.body}
      </p>
        {this.props.comments.map(function(comment) {
          return <Comment key={comment.id} comment={comment}/>
        })}
        <CommentForm/>
    </div>`
