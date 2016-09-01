@Post = React.createClass
  render: ->
    `<div className="post">
      <p>
        {this.props.post.body}
      </p>
      <Comments comments={this.props.comments}/>
      <CommentForm/>
    </div>`
