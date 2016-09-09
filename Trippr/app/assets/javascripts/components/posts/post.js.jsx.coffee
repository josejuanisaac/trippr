@Post = React.createClass
  render: ->
    `<div className="post">
      <p>
        {this.props.post.body}
      </p>
      <Comments post={this.props.post}/>
      <CommentForm/>
    </div>`
